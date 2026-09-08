DESCRIPTION = "Arduino multimedia image with GStreamer, camera and display support. \
Builds on the Weston image to add video capture (V4L2), hardware-accelerated \
GStreamer pipelines and GPU utilities. Platform-specific camera stacks and \
proprietary codecs are injected via bbappend files in the BSP layers."

LICENSE = "MIT"

require recipes-support/images/arduino-weston-image.bb

# Audio Stack (PipeWire, WirePlumber, ALSA)
CORE_IMAGE_EXTRA_INSTALL += " \
    pipewire \
    pipewire-alsa \
    pipewire-modules-meta \
    pipewire-pulse \
    pipewire-spa-tools \
    pipewire-tools \
    wireplumber \
    pulseaudio-pactl \
    alsa-utils-alsatplg \
    alsa-utils-alsaucm \
    alsa-utils-aplay \
"

# Camera & Video / GStreamer Framework
CORE_IMAGE_EXTRA_INSTALL += " \
    gstreamer1.0 \
    gstreamer1.0-plugins-base \
    gstreamer1.0-plugins-good \
    gstreamer1.0-plugins-bad \
    gstreamer1.0-python \
    gstd \
    gst-instruments \
    libcamera \
    libcamera-gst \
    v4l-utils \
"

# GPU, DRM & Display Utilities
CORE_IMAGE_EXTRA_INSTALL += " \
    clinfo \
    kmscube \
    libdrm-tests \
    mesa-demos \
    vulkan-tools \
    weston-examples \
"

# ML / Machine Learning Runtime Tools
CORE_IMAGE_EXTRA_INSTALL += " \
    tensorflow-lite-tools \
"
