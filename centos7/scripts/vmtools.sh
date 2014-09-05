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
mkdir /mnt/cdrom
mount -o loop /home/vagrant/linux.iso /mnt/cdrom
tar zxf /mnt/cdrom/VMwareTools-*.tar.gz -C /tmp
cd /tmp/vmware-tools-distrib
yum -y install net-tools
/tmp/vmware-tools-distrib/vmware-install.pl -d
umount /mnt/cdrom
rm -rf /tmp/vmware-tools-distrib
rm -rf /home/vagrant/linux.iso
fi
