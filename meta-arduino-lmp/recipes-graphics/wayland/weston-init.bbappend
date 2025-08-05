FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI:append:lmp-wayland:portenta-x8 = " \
    file://weston.service.lcdif.patch \
"
