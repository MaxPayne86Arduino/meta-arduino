# Developer Guide

## Getting Started [NXP Builds]

1. Initialize and sync the Yocto manifest:
   ```bash
   repo init -u https://github.com/nxp-imx/imx-manifest.git -m imx-6.6.52-2.2.0.xml -b imx-linux-scarthgap
   repo sync -j1 --fail-fast
   ```
2. Clone this repository into the `sources` directory created by the manifest:
   ```bash
   cd sources
   git clone https://github.com/Arduino/meta-arduino.git
   cd meta-arduino && git checkout scarthgap
   ```
3. Set up the Docker environment:
   ```bash
   docker run -it -u $(id -u):$(id -g) -v $PWD:/workdir -w /workdir --name yocto-nxp hub.foundries.io/lmp-sdk:95 bash
   ```
4. Configure the build environment:
   ```bash
   MACHINE=portenta-x8 DISTRO=fsl-imx-xwayland EULA=yes source ./imx-setup-release.sh -b bld-xwayland # First time only
   source setup-environment bld-xwayland # Every login, skip first time
   ```
5. Add the layers:
   ```bash
   bitbake-layers add-layer ../sources/meta-arduino/meta-arduino-common
   bitbake-layers add-layer ../sources/meta-arduino/meta-arduino-nxp
   ```
6. Build the image:
   ```bash
   bitbake arduino-console-image
   ```

## Getting Started [QCom Builds]

QCom-based builds use the [kas](https://kas.readthedocs.io/) structure rather than Google Repo.

1. Clone this repository and enter it:
   ```bash
   git clone https://github.com/Arduino/meta-arduino.git
   cd meta-arduino
   ```
2. Set up the cache environment variables:
   ```bash
   export SSTATE_DIR=/mnt/sstate-cache/sstate
   export DL_DIR=/mnt/sstate-cache/downloads
   ```
3. Run `kas-container` to build (e.g., for Imola / Arduino UNO Q):
   ```bash
   ./kas-container --runtime-args "--user $(id -u):$(id -g) --memory=48g" build meta-arduino-qcom/ci/imola.yml
   ```
   Or for Monza / VentUNO Q:
   ```bash
   ./kas-container --runtime-args "--user $(id -u):$(id -g) --memory=48g" build meta-arduino-qcom/ci/monza.yml
   ```

Note: Currently, the only supported image for QCom boards is `arduino-container-image.bb` (`arduino-container-image`).

## Getting Started [LmP Builds]

1. Initialize and sync the Yocto manifest:
   ```bash
   repo init -u https://source.foundries.io/factories/arduino/lmp-manifest.git -m arduino.xml -b main
   repo sync -j1 --fail-fast
   ```
3. Set up the Docker environment:
   ```bash
   docker run -it -u $(id -u):$(id -g) -v $PWD:/workdir -w /workdir --name yocto-lmp hub.foundries.io/lmp-sdk:95 bash
   ```

### Build mfgtools

1. Configure the build environment for `mfgtool-files`:
   ```bash
   DISTRO=lmp-mfgtool MACHINE=portenta-x8 . setup-environment
   echo "ACCEPT_FSL_EULA = \"1\"" >> conf/local.conf
   echo "MFGTOOL_FLASH_IMAGE = \"lmp-factory-image\"" >> conf/local.conf
   ```
2. Build the `mfgtool-files`:
   ```bash
   bitbake mfgtool-files
   ```

### Build the lmp factory image

1. Configure the build environment for the image:
   ```bash
   DISTRO=lmp-xwayland MACHINE=portenta-x8 . setup-environment
   echo "ACCEPT_FSL_EULA = \"1\"" >> conf/local.conf
   ```
2. Build the image:
   ```bash
   bitbake lmp-factory-image
   ```

### Build the lmp devel image

1. Configure the build environment for the image:
   ```bash
   DISTRO=lmp-base-xwayland MACHINE=portenta-x8 . setup-environment
   echo "ACCEPT_FSL_EULA = \"1\"" >> conf/local.conf
   ```
2. Build the image:
   ```bash
   bitbake lmp-devel-arduino-image
   ```

## How-To: Add Custom Devicetree Overlay, Kernel Module(s)

Suggesting modifications inside layers maintained here, but you might want to create your own separate Yocto layer.

1. Add your overlay to `recipes-bsp/device-tree/arduino-device-tree/<machine>/overlays`
2. Add your overlay for compilation in `./recipes-bsp/device-tree/arduino-device-tree.inc` or `./recipes-bsp/device-tree/arduino-device-tree.bbappend`
3. Corresponding module(s):
   - **NXP builds**: `meta-arduino-nxp/recipes-kernel/linux/linux-imx/<machine>/defconfig`, or better to keep this intact and add a custom `.cfg`, then add `.cfg` to `SRC_URI` in a `linux-imx.bbappend`
   - **LmP builds**: `meta-arduino-lmp/recipes-kernel/linux/linux-lmp-fslc-imx/<machine>/<machine>.cfg` (already provides `.cfg`)
   - **QCom builds**: `meta-arduino-qcom/recipes-kernel/linux/linux-arduino/<machine>.cfg` or via custom `.cfg` in `SRC_URI` in a `linux-arduino_%.bbappend`
