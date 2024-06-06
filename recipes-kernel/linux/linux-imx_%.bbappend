FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI += "file://portenta_x9_defconfig"

do_kernel_metadata:prepend () {
    install -m 0644 ${WORKDIR}/portenta_x9_defconfig ${S}/arch/arm64/configs/
}

