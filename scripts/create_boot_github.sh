DTB_FILE="./release.dtb"
#DTB_FILE="./dtb/*.dtb"
KERNEL_FILE="./kernel.gz"

INITRD_FILE="./debian/boot/initrd*"

cat ${KERNEL_FILE} ${DTB_FILE} > kernel-dtb

mkbootimg --base 0x80000000 \
        --kernel_offset 0x00080000 \
        --ramdisk_offset 0x02000000 \
        --tags_offset 0x01e00000 \
        --pagesize 2048 \
        --second_offset 0x00f00000 \
        --ramdisk ${INITRD_FILE} \
        --cmdline "earlycon root=PARTUUID=a7ab80e8-e9d1-e8cd-f157-93f69b1d141e console=ttyMSM0,115200 no_framebuffer=true rw"\
        --kernel kernel-dtb -o boot.img

rm -rf kernel-dtb
