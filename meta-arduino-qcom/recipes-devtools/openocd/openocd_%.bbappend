FILESEXTRAPATHS:prepend:imola := "${THISDIR}/files/imola:"

# imola: build from the facchinm fork (jomla branch)
SRC_URI:imola = " \
    git://github.com/facchinm/OpenOCD.git;protocol=https;name=openocd;branch=jomla \
    git://repo.or.cz/r/git2cl.git;protocol=http;destsuffix=tools/git2cl;name=git2cl;branch=master \
    git://github.com/msteveb/jimtcl.git;protocol=https;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/jimtcl;name=jimtcl;branch=master \
    git://repo.or.cz/r/libjaylink.git;protocol=http;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/src/jtag/drivers/libjaylink;name=libjaylink;branch=master \
    file://openocd_gpiod.cfg \
    file://stm32u5x.cfg \
    file://stm32x5x_common.cfg \
    file://bin/arduino-debug.sh \
    file://bin/arduino-flash.sh \
    file://bin/arduino-reset.sh \
    file://share/openocd/scripts/mem_helper.tcl \
    file://share/openocd/scripts/target/swj-dp.tcl \
"

SRCREV_openocd:imola = "e6a2c12f41c9d1131b980c47af7517b4a5aca110"
SRCREV_git2cl:imola  = "${AUTOREV}"
SRCREV_jimtcl:imola  = "${AUTOREV}"
SRCREV_libjaylink:imola = "${AUTOREV}"

DEPENDS:append:imola = " libgpiod"

EXTRA_OECONF:append:imola = " --enable-linuxgpiod --enable-internal-jimtcl"
PACKAGECONFIG:remove:imola = " sysfsgpio"

OPENOCD_INSTALL_DIR = "/opt/openocd"

do_install:append:imola() {
    # Install cfg files
    install -d ${D}${OPENOCD_INSTALL_DIR}
    install -m 0644 ${WORKDIR}/openocd_gpiod.cfg      ${D}${OPENOCD_INSTALL_DIR}/
    install -m 0644 ${WORKDIR}/stm32u5x.cfg            ${D}${OPENOCD_INSTALL_DIR}/
    install -m 0644 ${WORKDIR}/stm32x5x_common.cfg     ${D}${OPENOCD_INSTALL_DIR}/

    # Install Arduino helper scripts
    install -d ${D}${OPENOCD_INSTALL_DIR}/bin
    install -m 0755 ${WORKDIR}/bin/arduino-debug.sh    ${D}${OPENOCD_INSTALL_DIR}/bin/
    install -m 0755 ${WORKDIR}/bin/arduino-flash.sh    ${D}${OPENOCD_INSTALL_DIR}/bin/
    install -m 0755 ${WORKDIR}/bin/arduino-reset.sh    ${D}${OPENOCD_INSTALL_DIR}/bin/

    # Install custom TCL scripts (override the ones installed by the build system)
    install -d ${D}${OPENOCD_INSTALL_DIR}/share/openocd/scripts/target
    install -m 0644 ${WORKDIR}/share/openocd/scripts/mem_helper.tcl \
        ${D}${OPENOCD_INSTALL_DIR}/share/openocd/scripts/
    install -m 0644 ${WORKDIR}/share/openocd/scripts/target/swj-dp.tcl \
        ${D}${OPENOCD_INSTALL_DIR}/share/openocd/scripts/target/

    # Symlink the openocd binary into /opt/openocd/bin so the scripts work
    ln -sf ${bindir}/openocd ${D}${OPENOCD_INSTALL_DIR}/bin/openocd
}

FILES:${PN}:append:imola = " ${OPENOCD_INSTALL_DIR}"
