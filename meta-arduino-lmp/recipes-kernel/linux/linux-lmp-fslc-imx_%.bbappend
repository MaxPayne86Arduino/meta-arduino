FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI:append:portenta-x8 = " \
    file://portenta-x8-standard.scc \
    file://portenta-x8.cfg \
"
