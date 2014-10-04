# Install cloud-init
yum -y localinstall http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
yum -y install cloud-init
echo 'cloud-user          ALL=(ALL)   NOPASSWD: ALL' >> /etc/sudoers.d/cloud-user
echo 'Defaults:cloud-user env_keep += SSH_AUTH_SOCK' >> /etc/sudoers.d/cloud-user
echo 'Defaults:cloud-user !requiretty'               >> /etc/sudoers.d/cloud-user
echo 'Defaults:cloud-user env_keep += SSH_AUTH_SOCK' >> /etc/sudoers.d/cloud-user
sed -i 's/disable_root.*/disable_root: 0/' /etc/cloud/cloud.cfg
sed -i 's/^.*requiretty/#Defaults requiretty/' /etc/sudoers
chmod 0440 /etc/sudoers.d/cloud-user
