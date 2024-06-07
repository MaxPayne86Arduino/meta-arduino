FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI += " \
    file://linuxrc \
"

do_patch_append () {
    cp ${WORKDIR}/linuxrc ${S}/linuxrc
}
