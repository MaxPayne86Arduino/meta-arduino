
DESCRIPTION = "Arduino basic docker image that includes \
weston support and \
multimedia packages (VPU and GPU) when available."

LICENSE = "MIT"

require recipes-support/images/arduino-console-image.bb

# Docker packages
CORE_IMAGE_EXTRA_INSTALL += " \
    docker \
    docker-compose \
"

# Arduino m4-proxy
CORE_IMAGE_EXTRA_INSTALL += " \
    m4-proxy \
"

EXTRA_USERS_PARAMS += "\
    groupadd docker; \
    usermod -a -G docker ${ARDUINO-USER}; \
"
