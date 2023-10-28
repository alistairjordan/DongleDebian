# EDL Directory

This directory contains the files required to create an EDL Deployment.

Much like the bootloader directory, this is a "Done once" kinda thing, as all the devices require the same partitions, have the same amount of EMMC etc. Therefore the process would remain static accross builds.

## Deployment Process

The following steps are required into making this a full deployment:
1. Take the edl.zip file from the latest Github CI/CD build and extract the contents to this directory
!TODO

## Contents
* aboot.bin - bootloader built by the DongleDebian/bootloader process.


## Notes
Sector size is 512 Bytes.
