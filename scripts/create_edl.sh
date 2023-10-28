set -e

cp root.img edl/rootfs.bin
cp boot.img edl/boot.bin

zip edl.zip edl/*
