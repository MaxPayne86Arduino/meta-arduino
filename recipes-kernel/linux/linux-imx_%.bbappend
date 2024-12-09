FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI:append:portenta-x9 = " \
    file://defconfig \
    file://EDT-0001-Input-edt-ft5x06-Poll-the-device-if-no-interrupt-is-.patch \
    file://EDT-0002-Input-edt-ft54x6-Clean-up-timer-and-workqueue-on-rem.patch \
    file://EDT-0003-input-touchscreen-edt-ft5x06-Suppress-bogus-data-on-.patch \
    file://EDT-0004-input-edt-ft5x06-Include-I2C-details-in-names-for-th.patch \
    file://EDT-0005-input-edt-ft5x06-Correct-prefix-length-in-snprintf.patch \
    file://EDT-0006-Input-edt-ft5x06-fix-regmap-leak-when-probe-fails.patch \
    file://PANEL-0001-panel-simple-from-rpi-6.6y.patch \
"

# This is because methods in meta-imx-bsp/recipes-kernel/linux/linux-imx_6.6.bb
# keep overriding your kernel defconfig
do_copy_defconfig[noexec] = "1"
do_merge_delta_config[noexec] = "1"
