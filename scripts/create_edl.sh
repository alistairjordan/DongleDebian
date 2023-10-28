set -e

mv root.img edl/rootfs.bin
mv boot.img edl/boot.bin

zip edl.zip edl/*
