SUMMARY = "Google Gasket driver"
LICENSE = "GPL-2.0-only"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0-only;md5=801f80980d171dd6425610833a22dbe6"

inherit module

SRC_SHA = "09385d485812088e04a98a6e1227bf92663e0b59"

SRC_URI = " \
    git://github.com/google/gasket-driver.git;rev=${SRC_SHA};branch=main;protocol=https \
    file://0001-OE-fix-Makefile.patch \
"

S = "${WORKDIR}/git/src"

EXTRA_OEMAKE += "KDIR='${KERNEL_SRC}'"

RPROVIDES_${PN} += "kernel-module-google-gasket-driver"
