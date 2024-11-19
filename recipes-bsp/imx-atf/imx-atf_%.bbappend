FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

# FIXME: We should return INVALID here but currently only i.MX8M has support to override the UART
# base address in source code.
ATF_BOOT_UART_BASE ?= "0x42570000"

SRC_URI:append:portenta-x9 = " \
    file://console-lpuart3.patch \
"
