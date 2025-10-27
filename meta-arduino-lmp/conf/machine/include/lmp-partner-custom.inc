# LMP partner specific customizations (either replace or extend options as defined by meta-lmp)

EXTERNAL_KERNEL_DEVICETREE = "${DEPLOY_DIR_IMAGE}/devicetree"

IMAGE_BOOT_FILES:append:lmp-base = " ${DTB_BOOT_FILES}"

WKS_FILE:mx8mm-nxp-bsp:lmp:remove = "imx-imx-boot-singlepart.wks.in"
WKS_FILE:mx8mm-nxp-bsp:lmp:sota = "sdimage-imx8m-spl-sota.wks.in"

# Fix virtual/dtb provider for lmp builds
PREFERRED_PROVIDER:virtual/dtb:lmp ?= "lmp-device-tree"
PREFERRED_PROVIDER:virtual/dtb:lmp-base ?= "lmp-device-tree"

# Add se05x by default for production/secure builds
MACHINE_FEATURES:append:lmp = " se05x"
MACHINE_FEATURES:remove:lmp-base = " se05x"
MACHINE_FEATURES:remove:lmp-mfgtool = " se05x"
SE05X_OEFID = "0xA201"

# @TODO: current u-boot-fio breaks do_deploy without optee
#MACHINE_FEATURES:remove:lmp-base = " optee"