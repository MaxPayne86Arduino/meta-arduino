FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI += " \
    file://wifi_mod_para.conf \
    file://2EL_WlanCalData_ext_NXP_dANT.conf \
"

do_install:append() {
    # Custom conf file
    install -D -m 0644 ${WORKDIR}/wifi_mod_para.conf ${D}${nonarch_base_libdir}/firmware/nxp/wifi_mod_para.conf

    # Custom calibration file
    install -D -m 0644 ${WORKDIR}/2EL_WlanCalData_ext_NXP_dANT.conf ${D}${nonarch_base_libdir}/firmware/nxp/WlanCalData_ext_NXP_dANT.conf
}

FILES:${PN}-nxp-common:append = " \
    ${nonarch_base_libdir}/firmware/nxp \
"
