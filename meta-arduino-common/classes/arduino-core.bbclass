# Common Arduino core installation logic using arduino-cli (native) from STAGING_BINDIR_NATIVE

ARDUINO_CLI ?= "${STAGING_BINDIR_NATIVE}/arduino-cli"
ARDUINO_CORE ?= ""
ARDUINO_DIRECTORIES_DATA ?= "${B}/home/arduino/.arduino15"
ARDUINO_DIRECTORIES_USER ?= "${B}/home/arduino/Arduino"
ARDUINO_BUILD_PATH ?= "${B}/sketches-build"

export ARDUINO_DIRECTORIES_DATA
export ARDUINO_DIRECTORIES_USER
export ARDUINO_BUILD_PATH

do_install_arduino_core() {
    if [ -n "${ARDUINO_CORE}" ]; then
        install -d ${ARDUINO_DIRECTORIES_DATA}
        install -d ${ARDUINO_DIRECTORIES_USER}
        ${ARDUINO_CLI} core install ${ARDUINO_CORE}
        ${ARDUINO_CLI} cache clean
    fi
}
