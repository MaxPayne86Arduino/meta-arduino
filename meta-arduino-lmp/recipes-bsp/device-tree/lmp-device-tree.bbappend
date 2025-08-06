include recipes-bsp/device-tree/arduino-device-tree.inc

do_move_files() {
    cp ${WORKDIR}/${MACHINE}/*.dts ${WORKDIR}/
    cp ${WORKDIR}/${MACHINE}/overlays/*.dts ${WORKDIR}/
}

python () {
    bb.build.addtask('do_move_files', 'do_configure', 'do_patch', d)
}

FILES:${PN} += " \
    /boot/devicetree \
"

FILES:${PN}:raspberrypi4-64 += " \
    /boot2/devicetree \
"

# NOTE: below rpi-specific
# Since /boot is overridden by rpi-bootfiles package
# when p1 partition is mounted in /boot by default /etc/fstab
do_install:append:raspberrypi4-64() {
    for DTB_FILE in `ls *.dtb *.dtbo`; do
        install -Dm 0644 ${B}/${DTB_FILE} ${D}/boot2/devicetree/${DTB_FILE}
    done
}
