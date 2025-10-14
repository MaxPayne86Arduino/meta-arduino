include recipes-bsp/device-tree/arduino-device-tree.inc

# This is necessary since devicetree bbclass is building dts files in the workdir,
# ignoring everything else
do_move_dts_files() {
    bbdebug 2 "Moving dts files for MACHINE=${MACHINE}"
    cp ${WORKDIR}/${MACHINE}/*.dts* ${WORKDIR}/
    if [ -d "${WORKDIR}/${MACHINE}/overlays" ]; then
        cp ${WORKDIR}/${MACHINE}/overlays/*.dts ${WORKDIR}/
    fi
}

addtask do_move_dts_files after do_patch before do_configure

FILES:${PN} += " \
    /boot/devicetree \
"

# NOTE: below rpi-specific
# Since /boot is overridden by rpi-bootfiles package
# when p1 partition is mounted in /boot by default /etc/fstab
do_install:append:raspberrypi4-64() {
    for DTB_FILE in `ls *.dtb *.dtbo`; do
        install -Dm 0644 ${B}/${DTB_FILE} ${D}/boot2/devicetree/${DTB_FILE}
    done
}

FILES:${PN}:raspberrypi4-64 += " \
    /boot2/devicetree \
"
