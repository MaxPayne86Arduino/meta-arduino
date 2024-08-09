FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI:portenta-x9 += " \
    file://linuxrc.portenta-x9 \
"

do_configure:prepend:portenta-x9 () {
    cp ${WORKDIR}/linuxrc.portenta-x9 ${S}/linuxrc
}

SRC_URI:portenta-x8 += " \
    file://linuxrc.portenta-x8 \
"

do_configure:prepend:portenta-x8 () {
    cp ${WORKDIR}/linuxrc.portenta-x8 ${S}/linuxrc
}
