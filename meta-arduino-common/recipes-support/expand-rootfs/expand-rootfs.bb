SUMMARY = "Expand rootfs filesystem on first boot"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

SRC_URI = " \
    file://expand-rootfs.sh \
    file://expand-rootfs.service \
"

S = "${UNPACKDIR}"

inherit systemd

SYSTEMD_SERVICE:${PN} = "expand-rootfs.service"
SYSTEMD_AUTO_ENABLE:${PN} = "enable"

do_install() {
    install -d ${D}${bindir}
    install -m 0755 ${UNPACKDIR}/expand-rootfs.sh ${D}${bindir}/

    install -d ${D}${systemd_system_unitdir}
    install -m 0644 ${UNPACKDIR}/expand-rootfs.service ${D}${systemd_system_unitdir}/
}

RDEPENDS:${PN} += " \
    e2fsprogs-resize2fs \
    util-linux-sfdisk \
    util-linux-partx \
    util-linux-findmnt \
"
