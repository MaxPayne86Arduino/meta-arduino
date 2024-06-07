FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI += " \
    file://linuxrc \
"

do_patch:append () {
    cp ${WORKDIR}/linuxrc ${S}/linuxrc
}
