FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI:append:portenta-x8 = " \
    file://u-boot-fio-arduino-changes-portenta-x8.patch \
"
