SUMMARY = "Hailo PCIe driver"
DESCRIPTION = "The Hailo PCIe driver is required for interacting with a Hailo device over the PCIe interface"
LICENSE = "GPLv2"
LIC_FILES_CHKSUM = "file://../../LICENSE;md5=39bba7d2cf0ba1036f2a6e2be52fe3f0"

inherit module

SRC_URI = " \
    git://github.com/hailo-ai/hailort-drivers.git;branch=master;protocol=https \
    file://0001-OE-fix-Makefile.patch;patchdir=../../ \
"
SRCREV = "64897376cd67954ff497e194d6ca76d67f404b26"

S = "${WORKDIR}/git/linux/pcie"

PV = "v4.21.0"

RPROVIDES_${PN} += "kernel-module-hailo-pcie-driver"
