# Inject QCOM proprietary and hardware-specific packages into arduino-multimedia-image.
# Mirrors the content of qcom-multimedia-proprietary-image.bb from meta-qcom-distro
# (camera stack, GPU/adreno, DSP kernel modules, GStreamer IMSDK plugins, WLAN
# license enforcement) plus Qualcomm GPU packagegroups and NPU metrics support.

# QCOM specific utilities & resource management
CORE_IMAGE_EXTRA_INSTALL:append = " \
    packagegroup-qcom-utilities-gpu-utils \
    thermald \
    userspace-resource-manager \
    userspace-resource-manager-extensions \
"

# QCOM proprietary camera, video, GPU & DSP stack
CORE_IMAGE_EXTRA_INSTALL:append = " \
    camera-service \
    camx-dlkm \
    camx-kodiak \
    camx-lemans \
    camx-nhx \
    camx-talos \
    gst-plugins-imsdk-prop \
    iris-video-dlkm \
    kgsl-dlkm \
    libdiag-bin \
    qcom-adreno \
    qcom-sensors-binaries \
    qwes \
    ${@bb.utils.contains('BBFILE_COLLECTIONS', 'meta-audioreach', 'packagegroup-audioreach', '', d)} \
"

CORE_IMAGE_EXTRA_INSTALL:append:aarch64 = " \
    gst-plugins-imsdk-oss \
    gst-plugins-imsdk-python \
"

CORE_IMAGE_EXTRA_INSTALL:append:monza = " libqcnpuperf libqcnpuperf-cli"

# QCOM targets always use Wayland; guard against incomplete distro configs.
REQUIRED_DISTRO_FEATURES += "wayland"
