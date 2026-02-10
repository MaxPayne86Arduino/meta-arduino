# Arduino Yocto Project

This repository contains the Yocto layers designed to support Arduino microprocessor-based boards.

## Layers Overview

### 1. `meta-arduino-nxp`

This layer supports boards using NXP processors. It includes:
- Spl/U-Boot & Linux Kernel machines and configurations
- Device tree overlays
- Custom systemd unit files for Android Tools ADB support and more

### 2. `meta-arduino-lmp`

This adds compatibility to [Linux Micro Platform (LMP) distribution from Foundries.io](https://github.com/foundriesio/lmp-manifest).

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
   docker run -it -u $(id -u):$(id -g) -v $PWD:/workdir -w /workdir --name yocto-nxp arduino/yocto-lmp-v95 bash # First time only
   docker start yocto-nxp # Every login, skip first time
   cd ~/yocto/nxp && docker exec -it yocto-nxp bash # Every login, skip first time
   ```
4. Configure the build environment:
   ```bash
   MACHINE=portenta-x8 DISTRO=fsl-imx-xwayland EULA=yes source ./imx-setup-release.sh -b bld-xwayland # First time only
   source setup-environment bld-xwayland # Every login, skip first time
   ```
5. Add the layer:
   ```bash
   bitbake-layers add-layer meta-arduino-nxp
   ```
6. Build the image:
   ```bash
   bitbake arduino-console-image
   ```

## Getting Started [LmP Builds]

1. Initialize and sync the Yocto manifest:
   ```bash
   repo init -u https://source.foundries.io/factories/arduino/lmp-manifest.git -m arduino.xml -b main
   repo sync -j1 --fail-fast
   ```
3. Set up the Docker environment:
   ```bash
   docker run -it -u $(id -u):$(id -g) -v $PWD:/workdir -w /workdir --name yocto-lmp arduino/yocto-lmp-v95 bash
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

## Supported Yocto Machines

- portenta-x8 >> In Production
- portenta-x9 >> Internal Use / Prototype
- imx8mp-astrial >> Internal Use / Prototype
- raspberrypi4-64 >> Internal Use / Prototype

## Contributing

Contributions are welcome! Please submit pull requests or open issues for any bugs or feature requests.

## License

This project is licensed under the [MIT License](https://opensource.org/licenses/MIT).
