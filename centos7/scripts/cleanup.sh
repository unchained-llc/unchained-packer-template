# ref https://github.com/box-cutter/centos-vm/
rm -f /etc/ssh/ssh_host_*
rm -f /var/lib/NetworkManager/*
rm -rf /tmp/*
yum -y clean all
