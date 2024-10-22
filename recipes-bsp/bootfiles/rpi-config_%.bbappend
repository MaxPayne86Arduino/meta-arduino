# Customize Raspberry Pi 64

do_deploy:append:raspberrypi4-64() {
    echo "# Enable Arduino Opta Gateway Carrier" >> $CONFIG
    echo "dtoverlay=ov_opta_gateway" >> $CONFIG
}
