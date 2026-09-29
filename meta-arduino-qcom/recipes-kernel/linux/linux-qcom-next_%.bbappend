FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRCREV:ventuno-q = "7c41f6626480abf3a67fd9436eeeb3c7c14a1702"

SRC_URI:append:imola = " file://imola.cfg"
SRC_URI:append:monza = " file://monza.cfg"
