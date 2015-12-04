# Install cloud-init
yum -y install epel-release
yum -y install cloud-init cloud-utils dracut-modules-growroot
sed -i 's/disable_root.*/disable_root: 0/' /etc/cloud/cloud.cfg
sed -i 's/\(resize_rootfs_tmp.*\)/\1\nresize_rootfs: true/' /etc/cloud/cloud.cfg
sed -i 's/^.*requiretty/#Defaults requiretty/' /etc/sudoers
