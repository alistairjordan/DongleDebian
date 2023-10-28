# DongleDebian
4G Wifi USB Modem Reverse Engineering / Debian Image.

This project was inspired by OpenStick [https://github.com/OpenStick/OpenStick] a linux distribution made by HandsomeHacker. The Openstick Project only provides binaries for Linux running on the MSM8916 based 4G modem dongles, this project provides a system to produce images from scratch.  

# Notes
* Build done using Docker / GitHub Actions
* Using predefined .config for linux kernel

# Starting Steps

For running on a local machine, run the following in the terminal.

```
# Init Submodules (For the linux src)
git submodule init
git submodule update --depth=1
# Add support to host kernel for binfmt
sudo apt install binfmt-support qemu-user-static
# Build/Run Docker Container (Which mounts checkout directory)
./scripts/docker_brun.sh
```

The rootfs.img and boot.img will be created in the checkout directory.

# Deployment

Deployment can be done through Qualcomm EDL. 
[https://github.com/bkerler/edl]

## EDL Installation

```
# Configure system
sudo apt install -y python3 python3-pip python3-venv
sudo apt install -y adb fastboot liblzma-dev

git clone https://github.com/bkerler/edl
cd edl
python3 -m venv .
source bin/activate
pip3 install -r requirements.txt
git submodule update --init --recursive

```

## Backup Current Android System

*Push RESET button on device & insert into USB drive to enable EDL mode*

```
# Create Backup of original android system
python3 edl rl android_dump --skip=userdata --genxml

```

## Deploy DongleLinux

*Push RESET button on device & insert into USB drive to enable EDL mode*

```
# Unzip edl.zip within EDL directory
unzip edl.zip

# Copy over firmware and other bits from Android Dump


# Deploy DongleLinux
python3 edl wl edl

```