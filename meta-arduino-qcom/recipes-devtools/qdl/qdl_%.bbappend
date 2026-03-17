inherit deploy

BBCLASSEXTEND = "native"

do_deploy() {
    bbwarn "qdl-native: Deploying to ${DEPLOYDIR}/qdl-native/qdl"
    install -D -m 0755 ${B}/qdl ${DEPLOYDIR}/qdl-native/qdl
}

addtask deploy after do_install before do_build
