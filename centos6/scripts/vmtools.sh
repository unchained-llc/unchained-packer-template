if [[ $PACKER_BUILDER_TYPE =~ virtualbox ]]; then
yum -y install bzip2 net-tools
VBOX_VERSION=$(cat /home/vagrant/.vbox_version)
cd /tmp
mount -o loop /home/vagrant/VBoxGuestAdditions_$VBOX_VERSION.iso /mnt
sh /mnt/VBoxLinuxAdditions.run
umount /mnt
rm -rf /home/vagrant/VBoxGuestAdditions_*.iso
fi

if [[ $PACKER_BUILDER_TYPE =~ vmware ]]; then
yum -y install net-tools
yum -y install epel-release
yum -y install open-vm-tools
fi
