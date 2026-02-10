SUMMARY = "Akida PCIe driver"
LICENSE = "GPL-2.0-only"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0-only;md5=801f80980d171dd6425610833a22dbe6"

inherit module

SRC_URI = " \
    git://github.com/Brainchip-Inc/akida_dw_edma.git;branch=master;protocol=https \
    file://0001-OE-fix-Makefile.patch \
    file://0002-Force-32bit-PCIe-accesses.patch \
"
SRCREV = "656640c901b07ef4540f425a015c72d1653fb9da"

S = "${WORKDIR}/git"

RPROVIDES_${PN} += "kernel-module-akida-pcie-driver"
