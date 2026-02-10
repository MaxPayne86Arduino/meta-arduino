SUMMARY = "Arduino Portenta X8 x8h7 driver"
LICENSE = "GPL-2.0-only"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0-only;md5=801f80980d171dd6425610833a22dbe6"

inherit module

PR = "r1"
PV = "0.1"

SRC_URI = " \
    git://github.com/arduino/portentax8-x8h7.git;branch=linux-imx-lf-6.6.y;protocol=https \
"
SRCREV = "${AUTOREV}"

S = "${WORKDIR}/git"

do_install:append() {
    bbwarn "Blacklisting x8h7 modules"
    install -d ${D}/${sysconfdir}/modprobe.d
    install -m 644 ${S}/blacklist.conf ${D}/${sysconfdir}/modprobe.d/blacklist.conf
}

FILES:${PN}:append = " ${sysconfdir}"
