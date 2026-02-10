FILESEXTRAPATHS:prepend := "${THISDIR}/arduino-device-tree:"

# Device tree and overlays to be provided by the BSP layer
# E.g.:
# SRC_URI:append:board = "file://overlays_board.dts"
# COMPATIBLE_MACHINE_board = ".*"

# Portenta-X8 som ovs
DTB_OVERLAYS:portenta-x8 = " \
    file://portenta-x8/overlays/ov_som_lbee5kl1dx.dts \
    file://portenta-x8/overlays/ov_som_x8h7.dts \
    file://portenta-x8/overlays/ov_som_gpu_vpus.dts \
    file://portenta-x8/overlays/ov_som_anx7625_video.dts \
    file://portenta-x8/overlays/ov_som_x8h7_spidev.dts \
"
# Breakout Carrier
DTB_OVERLAYS:append:portenta-x8 = " \
    file://portenta-x8/overlays/ov_carrier_breakout_uart3.dts \
    file://portenta-x8/overlays/ov_carrier_breakout_spdif.dts \
    file://portenta-x8/overlays/ov_carrier_breakout_sdc.dts \
    file://portenta-x8/overlays/ov_carrier_breakout_usbfs.dts \
    file://portenta-x8/overlays/ov_carrier_breakout_uart1.dts \
    file://portenta-x8/overlays/ov_carrier_breakout_spi0.dts \
    file://portenta-x8/overlays/ov_carrier_breakout_spi1.dts \
    file://portenta-x8/overlays/ov_carrier_breakout_i2s.dts \
    file://portenta-x8/overlays/ov_carrier_breakout_sai.dts \
    file://portenta-x8/overlays/ov_carrier_breakout_pdm.dts \
    file://portenta-x8/overlays/ov_carrier_breakout_gpio.dts \
    file://portenta-x8/overlays/ov_carrier_breakout_pwm.dts \
"
# Max Carrier
DTB_OVERLAYS:append:portenta-x8 = " \
    file://portenta-x8/overlays/ov_carrier_enuc_lora.dts \
    file://portenta-x8/overlays/ov_carrier_enuc_bq24195.dts \
    file://portenta-x8/overlays/ov_carrier_max_usbfs.dts \
    file://portenta-x8/overlays/ov_carrier_max_sdc.dts \
    file://portenta-x8/overlays/ov_carrier_max_cs42l52.dts \
    file://portenta-x8/overlays/ov_carrier_max_ov5647_camera_mipi.dts \
    file://portenta-x8/overlays/ov_carrier_max_imx219_camera_mipi.dts \
    file://portenta-x8/overlays/ov_carrier_max_pcie_mini.dts \
"
# HAT Carrier
DTB_OVERLAYS:append:portenta-x8 = " \
    file://portenta-x8/overlays/ov_carrier_rasptenta_base.dts \
    file://portenta-x8/overlays/ov_carrier_rasptenta_spi.dts \
    file://portenta-x8/overlays/ov_carrier_rasptenta_ov5647_camera_mipi.dts \
    file://portenta-x8/overlays/ov_carrier_rasptenta_imx219_camera_mipi.dts \
    file://portenta-x8/overlays/ov_carrier_rasptenta_imx708_camera_mipi.dts \
    file://portenta-x8/overlays/ov_carrier_rasptenta_pwm_fan.dts \
    file://portenta-x8/overlays/ov_rasptenta_iqaudio_codec.dts \
"
# Mid Carrier
DTB_OVERLAYS:append:portenta-x8 = " \
    file://portenta-x8/overlays/ov_carrier_mid_ov5647_camera_mipi.dts \
    file://portenta-x8/overlays/ov_carrier_mid_pcie_mini.dts \
    file://portenta-x8/overlays/ov_carrier_mid_imx219_camera_mipi.dts \
    file://portenta-x8/overlays/ov_carrier_mid_dsi_panel.dts \
    file://portenta-x8/overlays/ov_carrier_mid_dsi_lds101.dts \
    file://portenta-x8/overlays/ov_carrier_mid_ov5640_camera_mipi.dts \
"
# Ditto Carrier
DTB_OVERLAYS:append:portenta-x8 = " \
    file://portenta-x8/overlays/ov_carrier_ditto_base.dts \
"
# Pika-Spark Carrier
DTB_OVERLAYS:append:portenta-x8 = " \
    file://portenta-x8/overlays/ov_carrier_pika_spark.dts \
"
# Portenta-X8 root devicetree
SRC_URI:append:portenta-x8 = " \
    file://portenta-x8/arduino_portenta-x8.dts \
    file://portenta-x8/anx7625_base.dtsi \
    ${DTB_OVERLAYS} \
"
COMPATIBLE_MACHINE:portenta-x8 = ".*"

# Portenta-X9 supporting Raspberry Pi Compute Module 4 IO Board
DTB_OVERLAYS:append:portenta-x9 = " \
    file://portenta-x9/overlays/vc4-kms-dsi-7inch-overlay.dts \
"

# Portenta-X9 root devicetree
SRC_URI:append:portenta-x9 = " \
    file://portenta-x9/arduino_portenta-x9.dts \
    file://portenta-x9/arduino_portenta-x9-gateway.dts \
    file://portenta-x9/arduino_portenta-x9-rpi-cm4-io-board-dsi-panel.dts \
    file://portenta-x9/arduino_portenta-x9-rpi-cm4-io-board-dsi-panel-csi-camera-imx708.dts \
    file://portenta-x9/arduino_portenta-x9-rpi-cm4-io-board-dsi-panel-csi-camera-ov5647.dts \
    ${DTB_OVERLAYS} \
"
COMPATIBLE_MACHINE:portenta-x9 = ".*"

# System Electronics Astrial supporting ???
DTB_OVERLAYS:append:imx8mp-astrial = " \
"

# System Electronics Astrial root devicetree
SRC_URI:append:imx8mp-astrial = " \
    file://imx8mp-astrial/imx8mp-astrial.dts \
    ${DTB_OVERLAYS} \
"
COMPATIBLE_MACHINE:imx8mp-astrial = ".*"
