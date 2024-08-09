SUMMARY = "Arduino BSP device trees"
DESCRIPTION = "Arduino BSP device trees available from within layer"
SECTION = "bsp"
LICENSE = "GPL-2.0-only"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0-only;md5=801f80980d171dd6425610833a22dbe6"

FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

inherit devicetree

PROVIDES = "virtual/dtb"

# Device tree and overlays to be provided by the BSP layer
# E.g.:
# SRC_URI:append:board = "file://overlays_board.dts"
# COMPATIBLE_MACHINE_board = ".*"

SRC_URI:append:portenta-x9 = " \
    file://portenta-x9/arduino_portenta-x9.dts \
"
COMPATIBLE_MACHINE:portenta-x9 = ".*"
