set -e

DEBIAN_DIR="debian"

dd if=/dev/zero of=root.img bs=1024k seek=3144 count=0
#dd if=/dev/zero of=root.img bs=512 seek=6975455 count=0
mkfs -t ext4 root.img
mkdir root
mount root.img root
cp -ax ${DEBIAN_DIR}/* root
umount root
rm -rf root
img2simg root.img rootfs.img
