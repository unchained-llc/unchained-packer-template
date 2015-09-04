# Install cloud-init
yum -y install epel-release
yum -y install cloud-init
sed -i 's/disable_root.*/disable_root: 0/' /etc/cloud/cloud.cfg
sed -i 's/^.*requiretty/#Defaults requiretty/' /etc/sudoers
