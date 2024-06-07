# Install only memtool from imx-test
# suite which is very large in size

do_install () {
    install -d ${D}${bindir}
    install -m 0755 ${S}/test/memtool/memtool ${D}${bindir}/
}

FILES:${PN} += " \
    ${bindir} \
"

