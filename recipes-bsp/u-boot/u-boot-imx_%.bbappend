FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI:append:portenta-x9 = " \
    file://Makefile \
    file://portenta-x9_defconfig \
    file://portenta-x9.dts \
    file://portenta-x9-u-boot.dtsi \
    file://portenta-x9.c \
    file://portenta-x9_lpddr4_timing.c \
    file://portenta-x9_spl.c \
    file://portenta-x9.h \
"

do_override_files_portenta_x9 () {
    # Override Makefile
    cp ${WORKDIR}/Makefile ${S}/arch/arm/dts/Makefile

    # @TODO: find which defconfig is effectively used in original bsp
    cp ${WORKDIR}/portenta-x9_defconfig ${S}/configs/imx93_9x9_qsb_defconfig
    cp ${WORKDIR}/portenta-x9_defconfig ${S}/configs/imx93_9x9_qsb_inline_ecc_defconfig

    cp ${WORKDIR}/portenta-x9.dts ${S}/arch/arm/dts/imx93-9x9-qsb.dts

    # @TODO: u-boot auto-includes the *-u-boot.dtsi prepending MACHINE to the board devicetree
    # see scripts/Makefile.lib, so should never be included directly from board devicetree
    cp ${WORKDIR}/portenta-x9-u-boot.dtsi ${S}/arch/arm/dts/imx93-9x9-qsb-u-boot.dtsi

    cp ${WORKDIR}/portenta-x9.c ${S}/board/freescale/imx93_qsb/imx93_qsb.c
    cp ${WORKDIR}/portenta-x9_lpddr4_timing.c ${S}/board/freescale/imx93_qsb/lpddr4_timing.c
    cp ${WORKDIR}/portenta-x9_spl.c ${S}/board/freescale/imx93_qsb/spl.c

    cp ${WORKDIR}/portenta-x9.h ${S}/include/configs/imx93_qsb.h
}

python () {
    if d.getVar('MACHINE') == 'portenta-x9':
        bb.build.addtask('do_override_files_portenta_x9', 'do_configure', 'do_patch', d)
}
