SUMMARY = "Arduino BSP device trees"
DESCRIPTION = "Arduino BSP device trees available from within layer"
SECTION = "bsp"
LICENSE = "GPL-2.0-only"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0-only;md5=801f80980d171dd6425610833a22dbe6"

FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

inherit devicetree

PROVIDES = "virtual/dtb"

include recipes-bsp/device-tree/arduino-device-tree.inc

# This is necessary since devicetree bbclass is building dts files in the workdir,
# ignoring everything else
do_move_dts_files() {
    bbdebug 2 "Moving dts files for MACHINE=${MACHINE}"
    cp ${WORKDIR}/${MACHINE}/*.dts ${WORKDIR}/
    cp ${WORKDIR}/${MACHINE}/overlays/*.dts ${WORKDIR}/
}

python () {
    bb.build.addtask('do_move_dts_files', 'do_configure', 'do_patch', d)
}

# Beware /boot is overridden by rpi-bootfiles package
# when p1 partition is mounted in /boot by default /etc/fstab
do_install:append:raspberrypi4-64() {
    for DTB_FILE in `ls *.dtb *.dtbo`; do
        install -Dm 0644 ${B}/${DTB_FILE} ${D}/boot/devicetree/${DTB_FILE}
    done
}

FILES:${PN}:append: = " \
    /boot/devicetree \
"

