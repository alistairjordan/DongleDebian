set -e

DEBIAN_DIR="debian"
LINUX_PACKAGE=$(cat linux/debian/linux-image/DEBIAN/control | grep "Package: " | sed "s/Package: //")
LINUX_VERSION=$(cat linux/debian/linux-image/DEBIAN/control | grep "Version: " | sed "s/Version: //")
LINUX_ARCH=$(cat linux/debian/linux-image/DEBIAN/control | grep "Architecture: " | sed "s/Architecture: //")
LINUX_DEB=$(echo "${LINUX_PACKAGE}_${LINUX_VERSION}_${LINUX_ARCH}.deb")

#Install Debian base system using debootstrap
debootstrap --arch=arm64 --keyring /usr/share/keyrings/debian-archive-keyring.gpg --variant=buildd --exclude=debfoster unstable ${DEBIAN_DIR} http://ftp.debian.org/debian

# Install qemu to run arm64 apt during build
apt-get install -y qemu-user-static
cp $(which qemu-aarch64-static) ./${DEBIAN_DIR}/usr/bin

#Copy USB Networking Service
cp files/usb_eth.service ${DEBIAN_DIR}/etc/systemd/system/usb_eth.service
cp files/usb_eth.sh ${DEBIAN_DIR}/usb_eth.sh
chmod +x ${DEBIAN_DIR}/usb_eth.sh
chmod 644 ${DEBIAN_DIR}/etc/systemd/system/usb_eth.service

#Stage the stuff which needs to be run in arm64 chroot
cp scripts/install_chroot.sh ./${DEBIAN_DIR}
cp ${LINUX_DEB} ./${DEBIAN_DIR}
echo ${LINUX_DEB} > ./${DEBIAN_DIR}/linux_deb
chroot ${DEBIAN_DIR}/ qemu-aarch64-static /bin/bash ./install_chroot.sh
rm -rf ./${DEBIAN_DIR}/${LINUX_DEB}
rm -rf ./${DEBIAN_DIR}/linux_deb

#Copy modem/wifi binaries
#mkdir edl/modem
#mount edl/modem.bin edl/modem
#cp edl/modem/image/* ${DEBIAN_DIR}/lib/firmware/
#umount edl/modem
#rm -rf edl/modem
cp -r firmware/* ${DEBIAN_DIR}/lib/firmware

# If needed, add WIFI connection
#cp ../wifi.nmconnection ./${DEBIAN_DIR}/etc/NetworkManager/system-connections
#chmod 600 ./${DEBIAN_DIR}/etc/NetworkManager/system-connections/wifi.nmconnection

# Copy out the SSH private key
cp ${DEBIAN_DIR}/root/.ssh/id_rsa ./private.key

#Build ROOTFS
./scripts/create_rootfs.sh
