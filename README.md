# Arduino Yocto Project

This repository contains the Yocto layers designed to support Arduino microprocessor-based boards.

Main layer maintainer: Massimo Pennazio maxipenna@libero.it

## Layers Overview

### 1. `meta-arduino-common`

This layer contains common components shared across Arduino platforms:
- Android tools (ADB support)
- OpenOCD
- Avahi and network manager configurations
- M4 proxy
- Common image recipes (console, docker, weston, v4l2, OTBR)
- USB gadget configurations (libusbgx-config)

### 2. `meta-arduino-nxp`

This layer supports boards using NXP processors. It includes:
- Spl/U-Boot & Linux Kernel machines and configurations
- Device tree overlays
- Custom recipes specific to NXP platforms

**Dependencies**: `meta-arduino-common`

### 3. `meta-arduino-lmp`

This adds compatibility to [Linux Micro Platform (LMP) distribution from Foundries.io](https://github.com/foundriesio/lmp-manifest).

**Dependencies**: `meta-arduino-common`

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
   docker run -it -u $(id -u):$(id -g) -v $PWD:/workdir -w /workdir --name yocto-nxp hub.foundries.io/lmp-sdk:95 bash # First time only
   docker start yocto-nxp # Every login, skip first time
   cd ~/yocto/nxp && docker exec -it yocto-nxp bash # Every login, skip first time
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

## Supported Hardware

### Yocto Machines

| Machine            | Status                      |
|--------------------|----------------------------|
| portenta-x8        | In Production              |
| portenta-x9        | Internal Use / Prototype   |
| imx8mp-astrial     | Internal Use / Prototype   |
| raspberrypi4-64    | Internal Use / Prototype   |

### Carrier Boards

| Carrier Board              | Compatible Machines | Status        |
|----------------------------|---------------------|---------------|
| Portenta Breakout Board    | portenta-x8         | In Production |
| Portenta Max Carrier       | portenta-x8         | In Production |
| Portenta Mid Carrier       | portenta-x8         | In Production |
| Portenta Hat Carrier       | portenta-x8         | In Production |

### Camera Modules

All cameras use 2-lane MIPI-CSI interface.

| Camera Module              | Compatible Machines | Resolution | ISP | Status                            |
|----------------------------|---------------------|------------|-----|-----------------------------------|
| OV5640                     | portenta-x8         | 5MP        | Yes | Supported (acceptable perf.)      |
| OV5647                     | portenta-x8         | 5MP        | No  | Supported (poor perf.)            |
| IMX219                     | portenta-x8         | 8MP        | No  | Supported (poor perf.)            |
| IMX477                     | portenta-x8         | 12.3MP     | No  | Supported (poor perf.)            |

### DSI Display Panels

| Display Panel              | Compatible Machines | Resolution  | Size    | Touchscreen | Status        |
|----------------------------|---------------------|-------------|---------|-------------|---------------|
| EDT ET035012DM6            | portenta-x9         | 320×240     | 3.5"    | FT5x06      | Supported     |
| EDT ETM0350G0DH6           | portenta-x9         | 320×240     | 3.5"    | FT5x06      | Supported     |
| EDT ETM043080DH6GP         | portenta-x9         | 480×272     | 4.3"    | FT5x06      | Supported     |
| EDT ETM0430G0DH6           | portenta-x9         | 480×272     | 4.3"    | FT5x06      | Supported     |
| EDT ET057090DHU            | portenta-x9         | 640×480     | 5.7"    | FT5x06      | Supported     |
| EDT ETM0700G0DH6           | portenta-x9         | 800×480     | 7.0"    | FT5x06      | Supported     |
| EDT ETM0700G0BDH6          | portenta-x9         | 800×480     | 7.0"    | FT5x06      | Supported     |
| EDT ETML0700Y5DHA          | portenta-x9         | 1024×600    | 7.0"    | FT5x06      | Supported     |
| EDT ETMV570G2DHU           | portenta-x9         | 640×480     | 5.7"    | FT5x06              | Supported     |
| Jadard EK79202D            | portenta-x8         | Custom      | Custom  | atmel,atmel_mxt_ts  | Supported     |
| Sitronix ST7701            | portenta-x8         | Custom      | Custom  | goodix,gt911        | Supported     |

### WiFi/Bluetooth Modules

| Module                     | Compatible Machines | WiFi Standard     | Frequency Bands | Bluetooth | Status                    |
|----------------------------|---------------------|-------------------|-----------------|-----------|---------------------------|
| Murata 1DX                 | portenta-x8         | 802.11b/g/n       | 2.4GHz          | BT 4.2    | In Production             |
| NXP IW612                  | portenta-x9         | 802.11ax (WiFi 6) | 2.4GHz, 5GHz    | BT 5.4    | Internal Use / Prototype  |

### Secure Elements

| Module                     | Compatible Machines | Type         | Status        |
|----------------------------|---------------------|--------------|---------------|
| NXP SE05X                  | portenta-x8         | I2C          | In Production |

## Contributing

Contributions are welcome! Please submit pull requests or open issues for any bugs or feature requests.

## License

This project is licensed under the [MIT License](https://opensource.org/licenses/MIT).
