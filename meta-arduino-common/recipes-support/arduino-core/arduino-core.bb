SUMMARY = "Install Arduino core for the target"
LICENSE = "MIT"

inherit arduino-core

DEPENDS += "arduino-cli-native"

do_install() {
    do_install_arduino_core
}

FILES:${PN} += "/home/arduino/.arduino15"
