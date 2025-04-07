# Arduino Yocto Project

This repository contains two Yocto layers designed to support Arduino hardware platforms:

## Layers Overview

### 1. `meta-arduino-bsp`
This layer provides Board Support Package (BSP) configurations for Arduino hardware platforms. It includes:
- Device tree overlays.
- Kernel module recipes for Arduino-supported peripherals.
- U-Boot configurations for Arduino boards.

### 2. `meta-arduino-lmp`
This layer provides specific customizations targeting the Linux Micro Platform (LMP) distribution from Foundries.io (Qualcomm). It includes:
- Custom configurations for LMP.
- Recipes for integrating Arduino-specific features with LMP.

## Getting Started [NXP Builds]

1. Initialize and sync the Yocto manifest:
   ```bash
   repo init -u https://github.com/nxp-imx/imx-manifest.git -m imx-6.6.3-1.0.0.xml -b imx-linux-nanbield
   repo sync -j1 --fail-fast
   ```
2. Clone this repository into the `sources` directory created by the manifest:
   ```bash
   cd sources
   git clone https://github.com/Arduino/meta-arduino.git
   cd meta-arduino && git checkout nanbield
   ```
3. Set up the Docker environment:
   ```bash
   docker run -it -u $UID -v $PWD:/workdir -w /workdir --name yocto-nxp arduino/yocto-lmp-v93 bash # First time only
   docker start yocto-nxp # Every login, skip first time
   cd ~/yocto/nxp && docker exec -it yocto-nxp bash # Every login, skip first time
   ```
4. Configure the build environment:
   ```bash
   MACHINE=portenta-x9 DISTRO=fsl-imx-xwayland EULA=yes source ./imx-setup-release.sh -b bld-xwayland # First time only
   ```
5. Add the layers to your `bblayers.conf` file:
   ```bash
   echo 'BBLAYERS += "${BSPDIR}/sources/meta-arduino/meta-arduino-bsp"' >> conf/bblayers.conf
   ```
6. Customize your `local.conf` file to optimize the build environment:
   ```bash
   BB_NUMBER_PARSE_THREADS = "4"
   BB_NUMBER_THREADS = "4"
   PARALLEL_MAKE = "-j 4"
   ```

## Supported Boards

- Portenta X8
- Portenta X9
- Raspberry Pi CM4
- System Electronics Astrial

## Building the Image

Run the following commands to build an image:
```bash
source setup-environment
bitbake <image-name>
```

Replace `<image-name>` with the desired image recipe, such as `arduino-console-image`.

## Contributing

Contributions are welcome! Please submit pull requests or open issues for any bugs or feature requests.

## License

This project is licensed under the [GPL-2.0+](https://www.gnu.org/licenses/old-licenses/gpl-2.0.html).
