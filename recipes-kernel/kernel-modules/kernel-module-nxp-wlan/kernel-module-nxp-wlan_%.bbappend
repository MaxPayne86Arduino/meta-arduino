FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI:append = " \
    file://moal.conf \
"

do_install:append () {
    install -d ${D}${sysconfdir}/modprobe.d
    install -m 0644 ${WORKDIR}/moal.conf ${D}${sysconfdir}/modprobe.d/
}

FILES:${PN} += "${sysconfdir}"
