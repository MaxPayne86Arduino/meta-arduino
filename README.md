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

## Getting Started

See [DEVELOPERS.md](DEVELOPERS.md) for instructions on setting up the build environment and building NXP and LmP images.

## Supported Hardware

See [HARDWARE.md](HARDWARE.md) for details on supported machines, carrier boards, camera modules, display panels, wireless modules, and secure elements.

## Contributing

Contributions are welcome! Please submit pull requests or open issues for any bugs or feature requests.

## License

This project is licensed under the [MIT License](https://opensource.org/licenses/MIT).
