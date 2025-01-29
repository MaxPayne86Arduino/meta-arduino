FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI:append:portenta-x9 = " \
    file://defconfig \
    file://imx8-media-dev.conf \
    file://EDT-0001-Input-edt-ft5x06-Poll-the-device-if-no-interrupt-is-.patch \
    file://EDT-0002-Input-edt-ft54x6-Clean-up-timer-and-workqueue-on-rem.patch \
    file://EDT-0003-input-touchscreen-edt-ft5x06-Suppress-bogus-data-on-.patch \
    file://EDT-0004-input-edt-ft5x06-Include-I2C-details-in-names-for-th.patch \
    file://EDT-0005-input-edt-ft5x06-Correct-prefix-length-in-snprintf.patch \
    file://EDT-0006-Input-edt-ft5x06-fix-regmap-leak-when-probe-fails.patch \
    file://PANEL-0001-panel-simple-from-rpi-6.6y.patch \
    file://ATTINY-0001-regulator-rpi-panel-attiny-Don-t-read-the-LCD-power-.patch \
    file://ATTINY-0002-regulator-rpi-panel-Power-off-display-on-shutdown.patch \
    file://ATTINY-0003-regulator-rpi-panel-Remove-the-ID-read.patch \
    file://TOSHIBA-0001-drm-bridge-tc358762-Ignore-EPROBE_DEFER-when-logging.patch \
    file://TOSHIBA-0002-drm-bridge-tc358762-Program-the-DPI-mode-into-the-ch.patch \
    file://TOSHIBA-0003-drm-bridge-tc358762-revert-move-ops-to-enable.patch \
    file://ISI-0001-Added-support-for-RAW-bayer-formats-on-imx8-platform.patch \
"

# This is because methods in meta-imx-bsp/recipes-kernel/linux/linux-imx_6.6.bb
# keep overriding your kernel defconfig
do_copy_defconfig[noexec] = "1"
do_merge_delta_config[noexec] = "1"
