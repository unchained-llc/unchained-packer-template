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
tar xf lib/modules/source/vmhgfs.tar
sed -i 's/#if LINUX_VERSION_CODE >= KERNEL_VERSION(3, 11, 0)/#if LINUX_VERSION_CODE >= KERNEL_VERSION(3, 10, 0)/g' vmhgfs-only/shared/compat_dcache.h
tar cf lib/modules/source/vmhgfs.tar vmhgfs-only
rm -rf vmhgfs-only
/tmp/vmware-tools-distrib/vmware-install.pl -d
umount /mnt/cdrom
rm -rf /tmp/vmware-tools-distrib
rm -rf /home/vagrant/linux.iso
cat << EOF > /etc/systemd/system/vmware.service
[Unit]
Description=VMware daemon

[Service]
ExecStart=/etc/init.d/vmware-tools start
ExecStop=/etc/init.d/vmware-tools stop
PIDFile=/var/lock/subsys/vmware-tools
TimeoutSec=0
RemainAfterExit=yes

[Install]
WantedBy=multi-user.target
EOF
systemctl enable vmware.service
fi
