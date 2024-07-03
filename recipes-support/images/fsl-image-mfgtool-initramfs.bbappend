# Following packages are already included in
# MACHINE_EXTRA_RRECOMMENDS
CORE_IMAGE_EXTRA_INSTALL:append:portenta-x9 = " arduino-device-tree"
CORE_IMAGE_EXTRA_INSTALL += " \
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
    bluez5 \
    kernel-module-btnxpuart \
    systemd \
"
# NOTES:
# - We install only memtool from imx-test

# Change users and passwords
# echo -n "password" | openssl passwd -6 -stdin
# escape any $ character
#HASHED_PASSWORD ?= "\$6\$u/18pXUAGGDZ7ctQ\$ZUAzwtGkx3zhanlobXy6LFM2MZcKk1kNI/aJUrUarZu/Mo01dzJO2v9cRFUT/nXFCOkRdCxF4pQIukKH9ZQTJ1"
#ARDUINO_USER ?= "arduino"
#EXTRA_USERS_PARAMS = "\
#    groupadd ${ARDUINO_USER}; \
#    useradd -p '' ${ARDUINO_USER}; \
#    usermod -a -G sudo,users,audio,plugdev ${ARDUINO_USER}; \
#"
inherit extrausers
EXTRA_USERS_PARAMS = "usermod -p '' root;"

