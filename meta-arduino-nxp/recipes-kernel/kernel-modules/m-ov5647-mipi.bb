SUMMARY = "OmniVision ov5647 cmos sensor driver"
DESCRIPTION = "Driver re-arranged from NXP for i.MX 8 M platform and renamed ov5647_mipi.c"
LICENSE = "GPL-2.0-only"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0-only;md5=801f80980d171dd6425610833a22dbe6"

inherit module

PR = "r1"
PV = "0.1"

SRC_URI = " \
  file://Makefile \
  file://ov5647_mipi.c \
  file://ov5647-mipi.conf \
"

S = "${WORKDIR}"

do_install:append:portenta-x9 () {
    install -d ${D}${sysconfdir}/modprobe.d
    install -m 0644 ${WORKDIR}/ov5647-mipi.conf ${D}${sysconfdir}/modprobe.d/
}

FILES:${PN}:portenta-x9 += "${sysconfdir}"
