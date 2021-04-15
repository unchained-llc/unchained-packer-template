rm -f /etc/ssh/ssh_host_*
rm -rf /var/db/freebsd-update/*
rm -rf /tmp/*
pkg clean -a -y
