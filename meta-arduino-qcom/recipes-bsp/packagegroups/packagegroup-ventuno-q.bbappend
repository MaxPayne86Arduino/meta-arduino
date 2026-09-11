# Powers the pcie-m2-e-connector (WiFi/BT module) before qcom-pcie probes it; upstream doesn't recommend it.
RRECOMMENDS:${PN}-kernel-modules += " \
    kernel-module-pwrseq-pcie-m2 \
"

# arduino-usb-gadget (acm ffs ncm) needs these; upstream doesn't recommend them.
RRECOMMENDS:${PN}-kernel-modules += " \
    kernel-module-libcomposite \
    kernel-module-u-serial \
    kernel-module-usb-f-acm \
    kernel-module-usb-f-fs \
    kernel-module-u-ether \
    kernel-module-usb-f-ncm \
"
