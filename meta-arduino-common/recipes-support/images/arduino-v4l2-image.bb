DESCRIPTION = "Arduino basic v4l2 image that includes \
multimedia packages (VPU and GPU) when available."

LICENSE = "MIT"

require recipes-support/images/arduino-weston-image.bb

VIDEOTOOLS = " \
    gstreamer1.0 \
    gstreamer1.0-plugins-base \
    gstreamer1.0-plugins-good \
    gstreamer1.0-plugins-bad \
    imx-gst1.0-plugin \
    v4l-utils \
    gst-instruments \
"

CORE_IMAGE_EXTRA_INSTALL += " \
    ${VIDEOTOOLS} \
"
