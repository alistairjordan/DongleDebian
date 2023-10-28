# Bootloader build directory

This directory is a simple build process as outlined by HandsomeHacker [https://www.kancloud.cn/handsomehacker/openstick/2637566]

The docker build is quite large, this doesn't need to be done ever(?) again so it's not part of the CI/CD process.
The files have been manually moved into the EDL folder to forever be forgotten about.

## How to build

```
cd bootloader
./docker_brun.sh
mv aboot.bin ../edl/
```
