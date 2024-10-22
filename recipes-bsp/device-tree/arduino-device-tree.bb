SUMMARY = "Arduino BSP device trees"
DESCRIPTION = "Arduino BSP device trees available from within layer"
SECTION = "bsp"
LICENSE = "GPL-2.0-only"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0-only;md5=801f80980d171dd6425610833a22dbe6"

FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

inherit devicetree

PROVIDES = "virtual/dtb"

include recipes-bsp/device-tree/arduino-device-tree.inc
