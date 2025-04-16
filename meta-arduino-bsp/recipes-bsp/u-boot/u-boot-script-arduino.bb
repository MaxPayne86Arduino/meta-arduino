DESCRIPTION = "Boot script for launching images with U-Boot distro boot"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"

INHIBIT_DEFAULT_DEPS = "1"
DEPENDS = "u-boot-mkimage-native"

UENV_FILE = "uEnv.txt.in"
BOOTCMD_FILE = "boot.cmd.in"

SRC_URI += " \
    file://${MACHINE}/${UENV_FILE} \
    file://${MACHINE}/${BOOTCMD_FILE} \
"

KERNEL_BOOTCMD ??= "bootz"
KERNEL_BOOTCMD:aarch64 ?= "booti"

inherit deploy

do_configure[noexec] = "1"
do_compile[noexec] = "1"

do_mkimage() {
    mkimage -A arm -T script -C none -n "Arduino boot script" -d ${WORKDIR}/${MACHINE}/${BOOTCMD_FILE} ${B}/boot.scr
}

addtask mkimage after do_compile before do_install

do_install() {
    install -d ${D}/boot
    install -m 0644 ${B}/boot.scr ${D}/boot/boot.scr
    install -m 0644 ${WORKDIR}/${MACHINE}/${UENV_FILE} ${D}/boot/uEnv.txt
}

do_deploy() {
    install -d ${DEPLOYDIR}
    install -m 0644 ${D}/boot/boot.scr ${DEPLOYDIR}/boot.scr-${MACHINE}-${PV}-${PR}
    ln -sf boot.scr-${MACHINE}-${PV}-${PR} ${DEPLOYDIR}/boot.scr-${MACHINE}
    ln -sf boot.scr-${MACHINE}-${PV}-${PR} ${DEPLOYDIR}/boot.scr
    install -m 0644 ${D}/boot/uEnv.txt ${DEPLOYDIR}/uEnv.txt
}

addtask deploy after do_install before do_build

FILES:${PN} += " \
    /boot/boot.scr \
    /boot/uEnv.txt \
"

PROVIDES += "u-boot-default-script"

PACKAGE_ARCH = "${MACHINE_ARCH}"

COMPATIBLE_MACHINE = "(portenta-x8|portenta-x9|imx8mp-astrial)"
