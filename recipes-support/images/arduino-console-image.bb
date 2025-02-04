DESCRIPTION = "Arduino console-only image that includes \
multimedia packages (VPU and GPU) when available."
IMAGE_FEATURES += " \
    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', '', \
       bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11-base', '', d), d)} \
"

LICENSE = "MIT"

inherit core-image

CORE_IMAGE_EXTRA_INSTALL += " \
    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', \
                         'firmwared', '', d)} \
    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', \
                         'weston weston-init', '', d)} \
    ${@bb.utils.contains('DISTRO_FEATURES', 'x11 wayland', \
                         'weston-xwayland xterm', '', d)} \
"

IMAGE_FEATURES:remove = "${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'x11-base', '', d)}"

CORE_IMAGE_EXTRA_INSTALL += "${@bb.utils.contains('DISTRO_FEATURES', 'x11 wayland', \
                                              'weston-xwayland weston-init xterm', '', d)}"

include recipes-support/images/arduino-image.inc
