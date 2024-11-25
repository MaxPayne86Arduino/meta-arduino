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
"

# Change users and passwords
# echo -n "password" | openssl passwd -6 -stdin
# escape any $ character
inherit extrausers
EXTRA_USERS_PARAMS = "usermod -p '' root;"

inherit systemd
# @TODO: disabling following services since we're in a initramfs image
SYSTEMD_DISABLE_SERVICES += "proc-fs-nfsd.mount"
SYSTEMD_DISABLE_SERVICES += "systemd-remount-fs.service"
