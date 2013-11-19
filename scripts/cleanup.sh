sed -i '/HWADDR/d' /etc/sysconfig/network-scripts/ifcfg-eth0
rm -f /etc/ssh/ssh_host_*
rm -f /etc/udev/rules.d/70-persistent-net.rules
rm -f /var/lib/dhclient/dhclient-eth0.leases
rm -rf VBoxGuestAdditions_*.iso
rm -rf /tmp/*
yum -y clean all
