FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

# FIXME: We should return INVALID here but currently only i.MX8M has support to override the UART
# base address in source code.
ATF_BOOT_UART_BASE:portenta-x8 ?= "0x30880000"
ATF_BOOT_UART_BASE:portenta-x9 ?= "0x42570000"
ATF_BOOT_UART_BASE:imx8mp-astrial ?= "0x30860000"

SRC_URI:append:portenta-x8 = " \
    file://console-uart3.patch \
"

SRC_URI:append:portenta-x9 = " \
    file://console-lpuart3.patch \
"

SRC_URI:append:astrial-imx8mp = " \
    file://console-uart1.patch \
"
