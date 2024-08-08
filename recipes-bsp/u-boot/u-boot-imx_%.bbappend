FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI:append:portenta-x8 = " \
    file://board/anx7625.c \
    file://board/anx7625.h \
    file://board/Kconfig \
    file://board/lpddr4_timing.c \
    file://board/Makefile \
    file://board/mmc.c \
    file://board/portenta-x8.c \
    file://board/portenta-x8_defconfig \
    file://board/portenta-x8.h \
    file://board/spl.c \
    file://devicetree/Makefile \
    file://devicetree/portenta-x8.dts \
    file://devicetree/portenta-x8-u-boot.dtsi \
    file://common/fat.c \
    file://common/Kconfig \
    file://common/spl_mmc.c \
"

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

do_override_files_portenta_x8 () {
    # Overrides
    cp ${WORKDIR}/common/Kconfig ${S}/arch/arm/mach-imx/imx8m/Kconfig
    cp ${WORKDIR}/common/fat.c ${S}/env/fat.c
    #cp ${WORKDIR}/common/spl_mmc.c ${S}/common/spl/spl_mmc.c
    cp ${WORKDIR}/devicetree/Makefile ${S}/arch/arm/dts/Makefile

    # Machine files (new)
    cp ${WORKDIR}/devicetree/portenta-x8.dts ${S}/arch/arm/dts/portenta-x8.dts
    cp ${WORKDIR}/devicetree/portenta-x8-u-boot.dtsi ${S}/arch/arm/dts/portenta-x8-u-boot.dtsi
    cp ${WORKDIR}/board/portenta-x8_defconfig ${S}/configs/portenta-x8_defconfig
    cp ${WORKDIR}/board/portenta-x8.h ${S}/include/configs/portenta-x8.h

    mkdir -p ${S}/board/arduino/portenta-x8
    cp ${WORKDIR}/board/Makefile ${S}/board/arduino/portenta-x8/Makefile
    cp ${WORKDIR}/board/Kconfig ${S}/board/arduino/portenta-x8/Kconfig
    cp ${WORKDIR}/board/anx7625.h ${S}/board/arduino/portenta-x8/anx7625.h
    cp ${WORKDIR}/board/anx7625.c ${S}/board/arduino/portenta-x8/anx7625.c
    cp ${WORKDIR}/board/spl.c ${S}/board/arduino/portenta-x8/spl.c
    cp ${WORKDIR}/board/lpddr4_timing.c ${S}/board/arduino/portenta-x8/lpddr4_timing.c
    cp ${WORKDIR}/board/portenta-x8.c ${S}/board/arduino/portenta-x8/portenta-x8.c
    cp ${WORKDIR}/board/mmc.c ${S}/board/arduino/portenta-x8/mmc.c
}

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
    if d.getVar('MACHINE') == 'portenta-x8':
        bb.build.addtask('do_override_files_portenta_x8', 'do_configure', 'do_patch', d)
    elif d.getVar('MACHINE') == 'portenta-x9':
        bb.build.addtask('do_override_files_portenta_x9', 'do_configure', 'do_patch', d)
}
