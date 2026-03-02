FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:${THISDIR}/u-boot-fio:"

SRC_URI:append:portenta-x8 = " \
    file://portenta-x8-mfgtool.cfg \
    file://u-boot-fio-arduino-changes-portenta-x8.patch \
    file://usdhc3_emmc_speed_downgrade_200mhz.patch \
    file://usdhc_emmc_clock_debug_prints.patch \
"
