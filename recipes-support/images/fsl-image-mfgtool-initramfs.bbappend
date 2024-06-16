# Following package are already included in
# MACHINE_EXTRA_RRECOMMENDS
CORE_IMAGE_EXTRA_INSTALL += " \
    arduino-device-tree \
    kernel-module-nxp-wlan \
    firmware-nxp-wifi-nxpiw612-sdio \
    firmware-nxp-wifi \
"

# Install extra packages
CORE_IMAGE_EXTRA_INSTALL += " \
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
"
# NOTES:
# - We install only memtool from imx-test
