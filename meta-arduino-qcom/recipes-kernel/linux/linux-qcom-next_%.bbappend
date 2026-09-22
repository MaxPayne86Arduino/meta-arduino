FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRCREV:ventuno-q = "499944d3255bbd5af426a7aee496ce151a5c160d"

SRC_URI:append:imola = " file://imola.cfg"
SRC_URI:append:monza = " file://monza.cfg"
