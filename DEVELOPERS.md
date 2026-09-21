# Developer Guide

## Getting Started [NXP Builds]

> **Warning**: Only the `scarthgap` branch is supported at the moment.

Supported machines:

| Machine |
| --- |
| portenta-x8 |
| portenta-x9 |
| imx8mp-astrial |

For more hardware details and lifecycle status, see [HARDWARE.md](HARDWARE.md).

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
2. Set up the Docker environment:
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

Supported machines:

| Machine | Board |
| --- | --- |
| imola | UNO Q |
| monza | VentUNO Q |

For more hardware details and lifecycle status, see [HARDWARE.md](HARDWARE.md).

1. Clone this repository and enter it:
   ```bash
   git clone https://github.com/Arduino/meta-arduino.git
   cd meta-arduino
   ln -s meta-arduino-qcom/ci ci
   ```
2. Set up the cache environment variables:
   ```bash
   export SSTATE_DIR=/mnt/sstate-cache/sstate
   export DL_DIR=/mnt/sstate-cache/downloads
   ```
3. Run `kas-container` to build (e.g., for Imola / Arduino UNO Q):
   ```bash
   ./kas-container --runtime-args "--memory=48g" build ci/imola.yml
   ```
   Or for Monza / VentUNO Q:
   ```bash
   ./kas-container --runtime-args "--memory=48g" build ci/monza.yml
   ```

Note: Currently, the only supported image for QCom boards is `arduino-container-image.bb` (`arduino-container-image`).

Note on updating dependencies: The repository includes committed `.lock.yml` files (e.g., `ci/imola.lock.yml`) to ensure reproducible builds. If you need to update or regenerate lockfiles after updating base YAML definitions or upstream branch targets, run:
```bash
./kas-container lock ci/imola.yml # or ci/monza.yml
```

### Flashing [Imola]

1. Download the output artifact (`arduino-container-image-imola.rootfs.qcomflash.tar.gz`) from the Yocto deploy directory, extract it, and `cd` into the extracted folder.
2. Locally on your host PC, use `qdl` from inside the extracted archive:
   ```bash
   qdl --storage emmc --debug prog_firehose_ddr.elf rawprogram0.xml patch0.xml
   ```

### Flashing [Monza]

1. Download the output artifact (`arduino-container-image-monza.rootfs.qcomflash.tar.gz`) from the Yocto deploy directory, extract it, and `cd` into the extracted folder.
2. Locally on your host PC, use `qdl` from inside the extracted archive:
   ```bash
   qdl --storage spinor --debug prog_firehose_ddr.elf sail_nor/rawprogram*.xml sail_nor/patch*.xml --allow-missing
   qdl --storage emmc --debug prog_firehose_ddr.elf rawprogram1.xml patch1.xml
   qdl --storage emmc --debug prog_firehose_ddr.elf rawprogram0.xml patch0.xml
   ```

## Getting Started [LmP Builds]

> **Warning**: Only the `scarthgap` branch is supported at the moment.

Supported machines:

| Machine |
| --- |
| portenta-x8 |
| raspberrypi4-64 |

For more hardware details and lifecycle status, see [HARDWARE.md](HARDWARE.md).

1. Initialize and sync the Yocto manifest:
   ```bash
   repo init -u https://github.com/arduino/lmp-manifest.git -m arduino.xml -b main
   repo sync -j1 --fail-fast
   ```
2. Set up the Docker environment:
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

## How-To: Add Custom Devicetree Overlays and Kernel Configurations

> **Best Practice Note**: The examples below demonstrate modifications directly inside the layers provided in this repository. For project-specific customizations or proprietary add-ons, create your own separate Yocto layer and use `.bbappend` files rather than modifying these base layers directly.

### 1. Adding a Devicetree Overlay

1. **Add the overlay file**:
   Place your overlay source file (`<overlay_name>.dts`) in the appropriate machine overlays directory:
   - **NXP / LmP**: `meta-arduino-nxp/recipes-bsp/device-tree/arduino-device-tree/<machine>/overlays/<overlay_name>.dts`
   - **QCom**: `meta-arduino-qcom/recipes-bsp/device-tree/arduino-device-tree/<machine>/overlays/<overlay_name>.dts`

2. **Register the overlay for compilation**:
   Append the overlay to `DTB_OVERLAYS` in `arduino-device-tree.inc` (or in your custom `arduino-device-tree.bbappend`):
   ```bitbake
   DTB_OVERLAYS:append:<machine> = " \
       file://<machine>/overlays/<overlay_name>.dts \
   "
   ```

### 2. Adding Kernel Modules and Configuration Fragments (`.cfg`)

Rather than editing the default `defconfig` directly, Yocto best practice is to supply a configuration fragment (`.cfg`):

- **NXP builds (`linux-imx`)**:
  Keep the base `defconfig` intact. Place your custom `.cfg` in your layer's files directory and append it to `SRC_URI` in a `linux-imx_%.bbappend`:
  ```bitbake
  FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
  SRC_URI:append:<machine> = " file://my-custom-feature.cfg"
  ```
- **LmP builds (`linux-lmp-fslc-imx`)**:
  Add required kernel options to the machine-specific configuration fragment at `meta-arduino-lmp/recipes-kernel/linux/linux-lmp-fslc-imx/<machine>/<machine>.cfg`, or append a custom `.cfg` via a `linux-lmp-fslc-imx_%.bbappend`.
- **QCom builds (`linux-arduino` / `linux-qcom-next`)**:
  Add options directly to `meta-arduino-qcom/recipes-kernel/linux/linux-arduino/<machine>.cfg` (or `linux-qcom-next/<machine>.cfg`), or append a custom `.cfg` via `SRC_URI` in a `linux-arduino_%.bbappend` or `linux-qcom-next_%.bbappend`.
