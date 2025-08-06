FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI:append = " \
    file://${MACHINE}/uEnv.txt.in \
    file://${MACHINE}/boot.cmd \
"

do_move_boot_script_files() {
    bbdebug 2 "Moving boot script files for MACHINE=${MACHINE}"
    cp ${WORKDIR}/${MACHINE}/boot.cmd ${WORKDIR}/
    cp ${WORKDIR}/${MACHINE}/uEnv.txt.in ${WORKDIR}/
}

python () {
    bb.build.addtask('do_move_boot_script_files', 'do_configure', 'do_patch', d)
}

do_install() {
    install -d ${D}/boot
    install -m 0644 ${B}/boot.scr ${D}/boot/boot.scr
    install -m 0644 ${WORKDIR}/uEnv.txt.in ${D}/boot/uEnv.txt
}

FILES:${PN}:append = " \
    /boot/boot.scr \
    /boot/uEnv.txt \
"
