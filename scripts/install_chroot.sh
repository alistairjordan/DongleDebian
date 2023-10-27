set -e

apt install -y vim initramfs-tools # This needs to be done for the install initrd generation of the kernel install
dpkg -i $(cat linux_deb)
apt install -y openssh-server
apt install -y wireless-tools network-manager net-tools

#Enable usb_eth service
systemctl enable usb_eth.service

ssh-keygen -t rsa -f "$HOME/.ssh/id_rsa" -N ""
cat ${HOME}/.ssh/id_rsa.pub >> ${HOME}/.ssh/authorized_keys

