FILESEXTRAPATHS:prepend := "${THISDIR}/linux-qcom-next:"

LINUX_VERSION:ventuno-q = "6.19.5"
SRCREV:ventuno-q = "6d944a84a0d57999d3c4aae46470e175245a0839"
KBUILD_CONFIG_EXTRA:remove:ventuno-q = "${S}/arch/arm64/configs/prune.config ${S}/arch/arm64/configs/qcom.config"
SRCBRANCH:ventuno-q = "nobranch=1"
SRCBRANCH:class-devupstream:ventuno-q = "branch=early/hwe/monza"
SRC_URI:remove:ventuno-q = "git://github.com/qualcomm-linux/kernel.git;${SRCBRANCH};protocol=https"
SRC_URI:append:ventuno-q = " git://github.com/qualcomm-linux/kernel-topics.git;${SRCBRANCH};protocol=https file://configs/monza.cfg"

KBUILD_CONFIG_EXTRA:remove:aarch64 = "${S}/arch/arm64/configs/rt.config"
SRC_URI:append = " file://preempt-rt.cfg"
