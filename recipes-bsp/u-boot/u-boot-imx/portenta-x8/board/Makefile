#
# Copyright 2018 NXP
#
# SPDX-License-Identifier:      GPL-2.0+
#

#obj-y += ../../freescale/common/
obj-y += mmc.o

obj-y += portenta-x8.o
obj-$(CONFIG_USB_TCPC) += tcpc.o

ifndef CONFIG_SPL_BUILD
obj-y += anx7625.o
endif

ifdef CONFIG_SPL_BUILD
obj-y += spl.o
obj-$(CONFIG_IMX8M_LPDDR4) += lpddr4_timing.o
endif
