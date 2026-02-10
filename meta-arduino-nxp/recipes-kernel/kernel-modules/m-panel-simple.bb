SUMMARY = "Simple Panel"
DESCRIPTION = "Simple Panel driver from linux rpi-6.6.y, with adaptions for linux-imx"
HOMEPAGE = "https://github.com/raspberrypi/linux/blob/rpi-6.6.y/drivers/gpu/drm/panel/panel-simple.c"
LICENSE = "GPL-2.0-only"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0-only;md5=801f80980d171dd6425610833a22dbe6"

inherit module

PR = "r1"
PV = "rpi-6.6.y-imx"

SRC_URI = " \
    file://Makefile \
    file://panel-simple.c \
"

S = "${WORKDIR}"
