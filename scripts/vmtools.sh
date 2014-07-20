if [[ $PACKER_BUILDER_TYPE =~ virtualbox ]]; then
VBOX_VERSION=$(cat /home/vagrant/.vbox_version)
cd /tmp
mount -o loop /home/vagrant/VBoxGuestAdditions_$VBOX_VERSION.iso /mnt
sh /mnt/VBoxLinuxAdditions.run
umount /mnt
rm -rf /home/vagrant/VBoxGuestAdditions_*.iso
fi

if [[ $PACKER_BUILDER_TYPE =~ vmware ]]; then
yum -y install fuse fuse-libs
mount -o loop /home/vagrant/linux.iso /mnt
cd /tmp
tar zxf /mnt/VMwareTools-*.tar.gz
umount /mnt
/tmp/vmware-tools-distrib/vmware-install.pl --default
rm -rf /tmp/vmware-tools-distrib
rm -rf /home/vagrant/linux.iso
fi
