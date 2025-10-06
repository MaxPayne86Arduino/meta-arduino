FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
FILESEXTRAPATHS:prepend := "${THISDIR}/../../../meta-arduino-nxp/recipes-kernel/linux/linux-imx:"

SRC_URI:append = " \
    file://portenta-x8-standard.scc \
    file://portenta-x8.cfg \
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
    file://generic/MIPI-CSI-0001-added-ops-notifier-complete.patch \
    file://generic/OV5640-0001-add-v4l2-controls.patch \
    file://generic/LEDS-TRIGGER-0001-backporting-triggers-gpio.patch \
"

SRC_URI:append:portenta-x8 = " \
    file://portenta-x8/DVFS-0001-Add_400MHz_200MHz_100MHz.patch \
"
