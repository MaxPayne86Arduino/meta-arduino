include recipes-bsp/device-tree/arduino-device-tree.inc

do_move_files_rpi() {
    cp ${WORKDIR}/raspberrypi4-64/overlays/*.dts ${WORKDIR}/
}

python () {
    if d.getVar('MACHINE') == 'raspberrypi4-64':
        bb.build.addtask('do_move_files_rpi', 'do_configure', 'do_patch', d)
}

# Since /boot is overridden by rpi-bootfiles package
# when p1 partition is mounted in /boot by default /etc/fstab
do_install:append:raspberrypi4-64() {
    for DTB_FILE in `ls *.dtb *.dtbo`; do
        install -Dm 0644 ${B}/${DTB_FILE} ${D}/boot2/devicetree/${DTB_FILE}
    done
}

FILES:${PN}:raspberrypi4-64 += " \
    /boot/devicetree \
    /boot2/devicetree \
"

