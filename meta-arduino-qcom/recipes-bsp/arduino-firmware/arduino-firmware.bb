SUMMARY = "Install Arduino firmware binaries for the target"
LICENSE = "MIT"

inherit arduino-core

DEPENDS += "arduino-cli-native base-passwd"

# Use ARDUINO_ZEPHYR_CORE from machine config
FW_INSTALL_DIR = "/lib/firmware/arduino"
FW_SRC_DIR = "${WORKDIR}/../arduino-core/image/home/arduino/.arduino15/packages/arduino/hardware/zephyr/0.55.0/firmwares"

do_install() {
    install -d ${D}${FW_INSTALL_DIR}
    install -m 0644 ${FW_SRC_DIR}/${ARDUINO_ZEPHYR_CORE}.bin ${D}${FW_INSTALL_DIR}/
    install -m 0644 ${FW_SRC_DIR}/${ARDUINO_ZEPHYR_CORE}.elf ${D}${FW_INSTALL_DIR}/
}

FILES:${PN} += "${FW_INSTALL_DIR}"

INSANE_SKIP:${PN} += "already-stripped split-strip"
INHIBIT_PACKAGE_STRIP = "1"
INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
