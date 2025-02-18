# Setup image features
IMAGE_FEATURES:append = " ssh-server-dropbear"

# Following packages are already included in
# MACHINE_EXTRA_RRECOMMENDS
CORE_IMAGE_EXTRA_INSTALL:append:portenta-x9 = " arduino-device-tree"
CORE_IMAGE_EXTRA_INSTALL:append:portenta-x9 = " \
    kernel-module-nxp-wlan \
    firmware-nxp-wifi-nxpiw612-sdio \
    firmware-nxp-wifi \
    kernel-module-btnxpuart \
    lmbench \
"

# Install extra out of tree kernel drivers (som)
CORE_IMAGE_EXTRA_INSTALL += " \
    dtbocfg \
"

Install extra out of tree kernel drivers (carrier boards)
CORE_IMAGE_EXTRA_INSTALL += " \
    panel-simple \
    imx708 \
    ov5647-mipi \
    lan865x \
"

# Install custom u-boot scripts (mandatory for eMMC / SD Card boot)
CORE_IMAGE_EXTRA_INSTALL += " \
    u-boot-script-arduino \
"

# Install extra packages (minimal)
CORE_IMAGE_EXTRA_INSTALL += " \
    packagegroup-core-full-cmdline-extended \
    procps \
    iw \
    net-tools \
    iproute2 \
    wpa-supplicant \
    dnsmasq \
    i2c-tools \
    fio \
    stress-ng \
    imx-test \
    bluez5 \
    libgpiod \
    libgpiod-tools \
    can-utils \
    u-boot-fw-utils \
    ethtool \
    usbutils \
    dtbocfg \
"
# NOTES:
# - We install only memtool from imx-test

# Install extra packages (extra), comment if too big
CORE_IMAGE_EXTRA_INSTALL += " \
    packagegroup-base \
    systemd \
    networkmanager-nmcli \
    mdio-tools \
    iperf3 \
    openocd \
    htop \
    hdparm \
    dtc \
    python3-core \
    python3-smbus2 \
    python3-periphery \
    python3-pyserial \
    android-tools \
    android-tools-adbd \
    fb-test \
    fbida \
    v4l-utils \
    strace \
    tmate \
"

# Change users and passwords
# echo -n "password" | openssl passwd -6 -stdin
# escape any $ character
inherit extrausers
EXTRA_USERS_PARAMS = "usermod -p '' root;"

ARDUINO-USER = "arduino"
ARDUINO-UID = "1001"
ARDUINO-GID = "1001"

# Create arduino user and add to groups
EXTRA_USERS_PARAMS += " \
    groupadd -g ${ARDUINO-GID} ${ARDUINO-USER}; \
    useradd -u ${ARDUINO-UID} -g ${ARDUINO-GID} -p '' -G audio,sudo,users,plugdev -d /home/${ARDUINO-USER} -r -s /bin/bash ${ARDUINO-USER} \
"

# Create home directory for arduino user and set permissions
create_arduino_home() {
    mkdir -p ${IMAGE_ROOTFS}/home/${ARDUINO-USER}
    chown ${ARDUINO-UID}:${ARDUINO-GID} ${IMAGE_ROOTFS}/home/${ARDUINO-USER}
}

ROOTFS_POSTPROCESS_COMMAND += "create_arduino_home; "

# Custom task to write git SHA to /etc/os-release
write_git_sha() {
    META_LAYER_DIR="${BSPDIR}/sources/meta-arduino"
    GIT_SHA=$(cd ${META_LAYER_DIR} && git rev-parse HEAD)
    GIT_REMOTE=$(cd ${META_LAYER_DIR} && git config --get remote.origin.url)
    echo "META_LAYER_GIT_SHA=${GIT_SHA}" >> ${IMAGE_ROOTFS}/etc/os-release
    echo "META_LAYER_GIT_REMOTE=${GIT_REMOTE}" >> ${IMAGE_ROOTFS}/etc/os-release

    MANIFEST_DIR="${BSPDIR}/.repo/manifests"
    GIT_SHA=$(cd ${MANIFEST_DIR} && git rev-parse HEAD)
    GIT_REMOTE=$(cd ${MANIFEST_DIR} && git config --get remote.origin.url)
    echo "MANIFEST_GIT_SHA=${GIT_SHA}" >> ${IMAGE_ROOTFS}/etc/os-release
    echo "MANIFEST_GIT_REMOTE=${GIT_REMOTE}" >> ${IMAGE_ROOTFS}/etc/os-release
}

ROOTFS_POSTPROCESS_COMMAND += "write_git_sha; "
