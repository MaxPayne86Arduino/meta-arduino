include recipes-bsp/device-tree/arduino-device-tree.inc

do_move_files_rpi() {
    mv ${WORKDIR}/raspberrypi4-64/overlays/*.dts ${WORKDIR}/
}

python () {
    if d.getVar('MACHINE') == 'raspberrypi4-64':
        bb.build.addtask('do_move_files_rpi', 'do_configure', 'do_patch', d)
}
