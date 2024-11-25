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
    packagegroup-nxp-zigbee-rcp \
"

# Install extra packages
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
    hdparm \
    stress-ng \
    imx-test \
    bluez5 \
    systemd \
    openocd \
    htop \
    libgpiod \
    libgpiod-tools \
    can-utils \
    python3-core \
    python3-smbus2 \
    python3-periphery \
    u-boot-fw-utils \
    ethtool \
    dtc \
    mdio-tools \
    usbutils \
    networkmanager-nmcli \
    iperf3 \
"
# NOTES:
# - We install only memtool from imx-test

# Change users and passwords
# echo -n "password" | openssl passwd -6 -stdin
# escape any $ character
inherit extrausers
EXTRA_USERS_PARAMS = "usermod -p '' root;"

inherit systemd
# @TODO: disabling following services since we're in a initramfs image
SYSTEMD_DISABLE_SERVICES += "proc-fs-nfsd.mount"
SYSTEMD_DISABLE_SERVICES += "systemd-remount-fs.service"
