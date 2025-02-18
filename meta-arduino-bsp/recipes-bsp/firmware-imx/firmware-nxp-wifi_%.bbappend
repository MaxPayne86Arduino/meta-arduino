FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI += " \
    file://WlanCalData_ext_NXP_dANT.conf \
"

do_install:append() {
    # Custom calibration file
    install -D -m 0644 ${WORKDIR}/2EL_WlanCalData_ext_NXP_dANT.conf ${D}${nonarch_base_libdir}/firmware/nxp/WlanCalData_ext_NXP_dANT.conf
}

FILES:${PN}:append = " \
    ${D}${nonarch_base_libdir}/firmware/nxp \
"
