if [ "$PACKER_BUILDER_TYPE" != "virtualbox-iso" ]; then
pkg install -y virtualbox-ose-nox11
sysrc vboxheadless_enable=YES
sysrc vboxwatchdog_enable=YES
sysrc vboxnet_enable=YES
sysrc vboxwebsrv_enable=YES
fi

if [ "$PACKER_BUILDER_TYPE" != "vmware-iso" ]; then
pkg install -y open-vm-tools-nox11
sysrc vmware_guestd_enable=YES
fi
