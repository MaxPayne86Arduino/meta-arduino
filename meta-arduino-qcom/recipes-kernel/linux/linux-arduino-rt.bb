FILESEXTRAPATHS:prepend := "${THISDIR}/linux-arduino:"

require recipes-kernel/linux/linux-arduino_6.16.bb

SRC_URI:append:imola = " file://imola.cfg"
SRC_URI:append:monza = " file://monza.cfg"
SRC_URI:append = " file://preempt-rt.cfg"
