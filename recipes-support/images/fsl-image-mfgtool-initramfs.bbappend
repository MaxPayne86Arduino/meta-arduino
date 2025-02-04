include recipes-support/images/arduino-image.inc

inherit systemd
# @TODO: disabling following services since we're in a initramfs image
SYSTEMD_DISABLE_SERVICES += "proc-fs-nfsd.mount"
SYSTEMD_DISABLE_SERVICES += "systemd-remount-fs.service"
