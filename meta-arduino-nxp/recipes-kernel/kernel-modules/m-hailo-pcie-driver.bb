SUMMARY = "Hailo PCIe driver"
DESCRIPTION = "The Hailo PCIe driver is required for interacting with a Hailo device over the PCIe interface"
LICENSE = "GPL-2.0-only"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0-only;md5=801f80980d171dd6425610833a22dbe6"

inherit module

SRC_URI = " \
    git://github.com/hailo-ai/hailort-drivers.git;branch=master;protocol=https \
    file://0001-OE-fix-Makefile.patch;patchdir=../../ \
"
SRCREV = "64897376cd67954ff497e194d6ca76d67f404b26"

S = "${WORKDIR}/git/linux/pcie"

PV = "v4.21.0"

RPROVIDES_${PN} += "kernel-module-hailo-pcie-driver"
