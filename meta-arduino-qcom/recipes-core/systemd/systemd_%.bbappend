do_install:append() {
    rm -f ${D}${sysconfdir}/profile.d/80-systemd-osc-context.sh
    rm -f ${D}${libdir}/tmpfiles.d/20-systemd-osc-context.conf
}

do_install:append() {
    rm -f ${D}${libdir}/systemd/profile.d/80-systemd-osc-context.sh
}

FILES:${PN}:remove = "${sysconfdir}/profile.d/80-systemd-osc-context.sh"
FILES:${PN}:remove = "${libdir}/tmpfiles.d/20-systemd-osc-context.conf"
FILES:${PN}:remove = "${libdir}/systemd/profile.d/80-systemd-osc-context.sh"
