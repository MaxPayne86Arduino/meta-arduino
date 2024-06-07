# Device-tree is not necessary since it's loaded by uuu in
# the correct address
#CORE_IMAGE_EXTRA_INSTALL += "arduino-device-tree"

# Install extra packages
CORE_IMAGE_EXTRA_INSTALL += " \
    procps \
    iw \
    net-tools \
    iproute2 \
    wpa-supplicant \
    dnsmasq \
    i2c-tools \
    stress-ng \
    imx-test \
"
# NOTES:
# - We install only memtool from imx-test
