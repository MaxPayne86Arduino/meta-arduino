FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI:append:portenta-x8 = " \
    file://Makefile \
    file://board/Makefile \
    file://imx8mm_evk_defconfig \
    file://imx8mm-evk.dts \
    file://imx8mm-evk.dtsi \
    file://imx8mm-evk-u-boot.dtsi \
    file://imx8mm-u-boot.dtsi \
    file://imx8mm_evk.h \
    file://imx8mm_evk.c \
    file://spl.c \
    file://lpddr4_timing.c \
    file://anx7625/anx7625.c \
    file://anx7625/anx7625.h \
"

do_override_files_portenta_x8 () {
    bbwarn Overriding files for ${MACHINE}

    # Override Makefile
    cp ${WORKDIR}/Makefile ${S}/arch/arm/dts/Makefile

    # Override Board Makefile
    cp ${WORKDIR}/board/Makefile ${S}/board/freescale/imx8mm_evk/Makefile

    # @TODO: inspect UBOOT_CONFIG_BASENAME for defconfig in use
    cp ${WORKDIR}/imx8mm_evk_defconfig ${S}/configs/imx8mm_evk_defconfig

    cp ${WORKDIR}/imx8mm-evk.dts ${S}/arch/arm/dts/imx8mm-evk.dts
    cp ${WORKDIR}/imx8mm-evk.dtsi ${S}/arch/arm/dts/imx8mm-evk.dtsi

    # @TODO: u-boot auto-includes the *-u-boot.dtsi prepending MACHINE to the board devicetree
    # see scripts/Makefile.lib, so should never be included directly from board devicetree
    cp ${WORKDIR}/imx8mm-evk-u-boot.dtsi ${S}/arch/arm/dts/imx8mm-evk-u-boot.dtsi
    cp ${WORKDIR}/imx8mm-u-boot.dtsi ${S}/arch/arm/dts/imx8mm-u-boot.dtsi

    cp ${WORKDIR}/imx8mm_evk.c ${S}/board/freescale/imx8mm_evk/imx8mm_evk.c
    cp ${WORKDIR}/lpddr4_timing.c ${S}/board/freescale/imx8mm_evk/lpddr4_timing.c
    cp ${WORKDIR}/spl.c ${S}/board/freescale/imx8mm_evk/spl.c

    cp ${WORKDIR}/imx8mm_evk.h ${S}/include/configs/imx8mm_evk.h

    cp ${WORKDIR}/anx7625/anx7625.c ${S}/board/freescale/imx8mm_evk/anx7625.c
    cp ${WORKDIR}/anx7625/anx7625.h ${S}/board/freescale/imx8mm_evk/anx7625.h
}

SRC_URI:append:portenta-x9 = " \
    file://Makefile \
    file://imx93_11x11_evk_defconfig \
    file://imx93_11x11_evk_inline_ecc_defconfig \
    file://imx93-11x11-evk.dts \
    file://imx93-11x11-evk-u-boot.dtsi \
    file://imx93_evk.c \
    file://lpddr4x_timing.c \
    file://spl.c \
    file://imx93_evk.h \
"

do_override_files_portenta_x9 () {
    bbwarn Overriding files for ${MACHINE}

    # Override Makefile
    cp ${WORKDIR}/Makefile ${S}/arch/arm/dts/Makefile

    # @TODO: inspect UBOOT_CONFIG_BASENAME for defconfig in use
    cp ${WORKDIR}/imx93_11x11_evk_defconfig ${S}/configs/imx93_11x11_evk_defconfig
    cp ${WORKDIR}/imx93_11x11_evk_inline_ecc_defconfig ${S}/configs/imx93_11x11_evk_inline_ecc_defconfig

    cp ${WORKDIR}/imx93-11x11-evk.dts ${S}/arch/arm/dts/imx93-11x11-evk.dts

    # @TODO: u-boot auto-includes the *-u-boot.dtsi prepending MACHINE to the board devicetree
    # see scripts/Makefile.lib, so should never be included directly from board devicetree
    cp ${WORKDIR}/imx93-11x11-evk-u-boot.dtsi ${S}/arch/arm/dts/imx93-11x11-evk-u-boot.dtsi

    cp ${WORKDIR}/imx93_evk.c ${S}/board/freescale/imx93_evk/imx93_evk.c
    cp ${WORKDIR}/lpddr4x_timing.c ${S}/board/freescale/imx93_evk/lpddr4x_timing.c
    cp ${WORKDIR}/spl.c ${S}/board/freescale/imx93_evk/spl.c

    cp ${WORKDIR}/imx93_evk.h ${S}/include/configs/imx93_evk.h
}

SRC_URI:append:imx8mp-astrial = " \
    file://Makefile \
    file://imx8mp_evk_defconfig \
    file://imx8mp_evk_inline_ecc_defconfig \
    file://imx8mp_evk_ndm_defconfig \
    file://imx8mp-evk.dts \
    file://imx8mp-evk-u-boot.dtsi \
    file://imx8mp_evk.c \
    file://lpddr4_timing.c \
    file://lpddr4_timing_ndm.c \
    file://spl.c \
    file://imx8mp_evk.h \
"

do_override_files_imx8mp_astrial () {
    bbwarn Overriding files for ${MACHINE}

    # Override Makefile
    cp ${WORKDIR}/Makefile ${S}/arch/arm/dts/Makefile

    # @TODO: inspect UBOOT_CONFIG_BASENAME for defconfig in use.
    # The modes ECC and NDM are NAND-specific
    cp ${WORKDIR}/imx8mp_evk_defconfig ${S}/configs/imx8mp_evk_defconfig
    cp ${WORKDIR}/imx8mp_evk_ndm_defconfig ${S}/configs/imx8mp_evk_ndm_defconfig
    cp ${WORKDIR}/imx8mp_evk_inline_ecc_defconfig ${S}/configs/imx8mp_evk_inline_ecc_defconfig

    cp ${WORKDIR}/imx8mp-evk.dts ${S}/arch/arm/dts/imx8mp-evk.dts

    # @TODO: u-boot auto-includes the *-u-boot.dtsi prepending MACHINE to the board devicetree
    # see scripts/Makefile.lib, so should never be included directly from board devicetree
    cp ${WORKDIR}/imx8mp-evk-u-boot.dtsi ${S}/arch/arm/dts/imx8mp-evk-u-boot.dtsi

    cp ${WORKDIR}/imx8mp_evk.c ${S}/board/freescale/imx8mp_evk/imx8mp_evk.c
    cp ${WORKDIR}/lpddr4_timing.c ${S}/board/freescale/imx8mp_evk/lpddr4_timing.c
    cp ${WORKDIR}/lpddr4_timing_ndm.c ${S}/board/freescale/imx8mp_evk/lpddr4_timing_ndm.c
    cp ${WORKDIR}/spl.c ${S}/board/freescale/imx8mp_evk/spl.c

    cp ${WORKDIR}/imx8mp_evk.h ${S}/include/configs/imx8mp_evk.h
}

python () {
    if d.getVar('MACHINE') == 'portenta-x8':
        bb.build.addtask('do_override_files_portenta_x8', 'do_configure', 'do_patch', d)
    elif d.getVar('MACHINE') == 'portenta-x9':
        bb.build.addtask('do_override_files_portenta_x9', 'do_configure', 'do_patch', d)
    elif d.getVar('MACHINE') == 'imx8mp-astrial':
        bb.build.addtask('do_override_files_imx8mp_astrial', 'do_configure', 'do_patch', d)
}
