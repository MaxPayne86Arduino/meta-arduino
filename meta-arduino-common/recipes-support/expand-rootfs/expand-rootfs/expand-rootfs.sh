#!/bin/sh
set -e

export PATH="/sbin:/usr/sbin:/bin:/usr/bin:$PATH"

STAMP_FILE="/var/lib/expand-rootfs-done"

if [ -f "$STAMP_FILE" ]; then
    echo "Rootfs expansion already completed."
    exit 0
fi

# Resolve root device node (e.g. /dev/mmcblk0p67, /dev/sda1)
ROOT_SRC=$(findmnt -n -o SOURCE / 2>/dev/null || true)
if [ -z "$ROOT_SRC" ]; then
    echo "Failed to determine rootfs partition source."
    exit 1
fi

REAL_DEV=$(readlink -f "$ROOT_SRC" 2>/dev/null || echo "$ROOT_SRC")
DEV_NAME=$(basename "$REAL_DEV")

# Check if DEV_NAME is a partition
if [ ! -f "/sys/class/block/$DEV_NAME/partition" ]; then
    echo "Rootfs device $DEV_NAME is not a partition. Skipping expansion."
    touch "$STAMP_FILE"
    exit 0
fi

PART_NUM=$(cat "/sys/class/block/$DEV_NAME/partition")
PARENT_SYS=$(readlink -f "/sys/class/block/$DEV_NAME/..")
DISK_NAME=$(basename "$PARENT_SYS")
DISK_DEV="/dev/$DISK_NAME"

if [ ! -b "$DISK_DEV" ]; then
    echo "Disk device $DISK_DEV does not exist."
    exit 1
fi

echo "Expanding rootfs partition $PART_NUM on $DISK_DEV ($REAL_DEV)..."

# Resize partition table entry using sfdisk
# --no-reread prevents sfdisk from failing on a mounted partition
echo ", +" | sfdisk --no-reread --force -N "$PART_NUM" "$DISK_DEV" || true

# Update kernel partition table
partx -u "$DISK_DEV" 2>/dev/null || true
if command -v partprobe >/dev/null 2>&1; then
    partprobe "$DISK_DEV" 2>/dev/null || true
fi

# Resize ext4 filesystem
if command -v resize2fs >/dev/null 2>&1; then
    resize2fs "$REAL_DEV"
else
    echo "ERROR: resize2fs is not available."
    exit 1
fi

touch "$STAMP_FILE"
echo "Rootfs expansion completed successfully."
