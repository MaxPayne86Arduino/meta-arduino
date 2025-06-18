FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI:append = " \
    file://generic/PCIE-0001-PCIE_PHY_CMN_REG063.patch \
    file://generic/EDT-0001-Input-edt-ft5x06-Poll-the-device-if-no-interrupt-is-.patch \
    file://generic/EDT-0002-Input-edt-ft54x6-Clean-up-timer-and-workqueue-on-rem.patch \
    file://generic/EDT-0003-input-touchscreen-edt-ft5x06-Suppress-bogus-data-on-.patch \
    file://generic/EDT-0004-input-edt-ft5x06-Include-I2C-details-in-names-for-th.patch \
    file://generic/EDT-0005-input-edt-ft5x06-Correct-prefix-length-in-snprintf.patch \
    file://generic/EDT-0006-Input-edt-ft5x06-fix-regmap-leak-when-probe-fails.patch \
    file://generic/PANEL-0001-panel-simple-from-rpi-6.6y.patch \
    file://generic/ATTINY-0001-regulator-rpi-panel-attiny-Don-t-read-the-LCD-power-.patch \
    file://generic/ATTINY-0002-regulator-rpi-panel-Power-off-display-on-shutdown.patch \
    file://generic/ATTINY-0003-regulator-rpi-panel-Remove-the-ID-read.patch \
    file://generic/TOSHIBA-0001-drm-bridge-tc358762-Ignore-EPROBE_DEFER-when-logging.patch \
    file://generic/TOSHIBA-0002-drm-bridge-tc358762-Program-the-DPI-mode-into-the-ch.patch \
    file://generic/TOSHIBA-0003-drm-bridge-tc358762-revert-move-ops-to-enable.patch \
    file://generic/ISI-0001-Added-support-for-RAW-bayer-formats-on-imx8-platform.patch \
"

SRC_URI:append:portenta-x8 = " \
    file://defconfig \
    file://DVFS-0001-Add_400MHz_200MHz_100MHz.patch \
"
# Removed this patch since in @ the tag lf-6.6.52-2.2.0 (scarthgap) this patch is alredy
# present in the kernel code
SRC_URI:remove:portenta-x8 = " \
    file://generic/PCIE-0001-PCIE_PHY_CMN_REG063.patch \
"

SRC_URI:append:portenta-x9 = " \
    file://defconfig \
"

SRC_URI:append:imx8mp-astrial = " \
    file://defconfig \
"

# This is because methods in meta-imx-bsp/recipes-kernel/linux/linux-imx_6.6.bb
# keep overriding your kernel defconfig
do_copy_defconfig[noexec] = "1"
do_merge_delta_config[noexec] = "1"
