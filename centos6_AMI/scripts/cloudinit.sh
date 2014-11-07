# Install cloud-init
yum -y localinstall http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
yum -y install cloud-init
sed -i 's/disable_root.*/disable_root: 0/' /etc/cloud/cloud.cfg
sed -i 's/^.*requiretty/#Defaults requiretty/' /etc/sudoers
