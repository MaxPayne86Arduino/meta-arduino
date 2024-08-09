FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI:portenta-x9 += " \
    file://portenta-x9/portenta_x9_defconfig \
"

do_kernel_metadata:prepend:portenta-x9 () {
    install -m 0644 ${WORKDIR}/portenta-x9/portenta_x9_defconfig ${S}/arch/arm64/configs/
}

