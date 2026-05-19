# Common Arduino core installation logic using arduino-cli (native) from STAGING_BINDIR_NATIVE

ARDUINO_CLI ?= "${STAGING_BINDIR_NATIVE}/arduino-cli"
ARDUINO_CORE ?= ""

do_install_arduino_core() {
    if [ -n "${ARDUINO_CORE}" ]; then
        export ARDUINO_DIRECTORIES_DATA=${D}/home/arduino/.arduino15
        install -d ${ARDUINO_DIRECTORIES_DATA}
        ${ARDUINO_CLI} core install ${ARDUINO_CORE}
        ${ARDUINO_CLI} cache clean
    fi
}
