DESCRIPTION = "Arduino uuu scripts, to be used with mfgtool-files or uuu tool"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"

FILESEXTRAPATHS:prepend := "${THISDIR}/${mfgtool-files}:"

SRC_URI:append:portenta-x9 = " \
    file://portenta-x9/bootloader.uuu \
    file://portenta-x9/full_image.uuu \
    file://portenta-x9/linux_initramfs.uuu \
    file://portenta-x9/probe_emmc.uuu \
    file://portenta-x9/probe_eth_phys.uuu \
    file://portenta-x9/probe_gpio.uuu \
    file://portenta-x9/probe_pmic.uuu \
    file://portenta-x9/probe_sdcard.uuu \
    file://portenta-x9/test_ram.uuu \
"

do_deploy:prepend:portenta-x9() {
    install -d ${DEPLOYDIR}/${PN}
    install -m 0644 ${WORKDIR}/portenta-x9/linux_initramfs.uuu ${DEPLOYDIR}/${PN}/linux_initramfs.uuu
    # @TODO: deploy other scripts
}
