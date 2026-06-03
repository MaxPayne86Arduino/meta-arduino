SUMMARY = "Install Arduino firmware binaries for the target"
LICENSE = "MIT"

inherit arduino-core

DEPENDS += "arduino-cli-native base-passwd"

# Use ARDUINO_ZEPHYR_LOADER from machine config
FW_SRC_DIR = "${WORKDIR}/image/home/arduino/.arduino15/packages/arduino/hardware/zephyr/${ARDUINO_CORE_VERSION}/firmwares"

do_install() {
    do_install_arduino_core
    install -d ${D}${libdir}/firmware/arduino
    install -m 0644 ${FW_SRC_DIR}/${ARDUINO_ZEPHYR_LOADER}.bin ${D}${libdir}/firmware/arduino/
    install -m 0644 ${FW_SRC_DIR}/${ARDUINO_ZEPHYR_LOADER}.elf ${D}${libdir}/firmware/arduino/
    rm -rf ${WORKDIR}/image/home # Prune massive .arduino15 data dir
}

FILES:${PN} += "${libdir}/firmware/arduino"

INSANE_SKIP:${PN} += "already-stripped split-strip arch"
INHIBIT_PACKAGE_STRIP = "1"
INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
