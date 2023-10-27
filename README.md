# DongleDebian
4G Wifi USB Modem Reverse Engineering / Debian Image

# Notes
* Build done using GitHub Actions
* Using predefined .config for linux kernel

# Starting Steps
```
# Init Submodules (For the linux src)
git submodule init
git submodule update --depth=1
# Add support to host kernel for binfmt
sudo apt install binfmt-support qemu-user-static
# Build/Run Docker Image
./scripts/docker_brun.sh
```
