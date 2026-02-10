SUMMARY = "Jadard ek79202d driver"
LICENSE = "GPL-2.0-only"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0-only;md5=801f80980d171dd6425610833a22dbe6"

inherit module

PR = "r1"
PV = "0.1"

SRC_URI = " \
  file://Makefile \
  file://panel-jadard-ek79202d.c \
  file://COPYING \
"

S = "${WORKDIR}"
