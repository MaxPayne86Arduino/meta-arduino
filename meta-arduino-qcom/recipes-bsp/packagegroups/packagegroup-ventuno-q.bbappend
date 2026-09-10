# Powers the pcie-m2-e-connector (WiFi/BT module) before qcom-pcie probes it; upstream doesn't recommend it.
RRECOMMENDS:${PN}-kernel-modules += " \
    kernel-module-pwrseq-pcie-m2 \
"
