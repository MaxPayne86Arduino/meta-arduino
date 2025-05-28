SRCREV_openocd:portenta-x8 = "4fe57a0c197158958c7cc295002504d6434d4777"

EXTRA_OECONF:append:portenta-x8 = " --enable-imx_gpio --enable-linuxgpiod --enable-internal-jimtcl"
PACKAGECONFIG:remove:portenta-x8 = " sysfsgpio"

