
SRC_URI:append:portenta-x9 = " \
    file://console-lpuart3.patch \
"

ATF_BOOT_UART_BASE = "0x42570000"
