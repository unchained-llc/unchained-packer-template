date > /etc/vagrant_box_build_time
cd ~vagrant
mkdir -m 700 .ssh
curl -L https://raw.githubusercontent.com/mitchellh/vagrant/master/keys/vagrant.pub -o .ssh/authorized_keys
chmod 600 .ssh/authorized_keys
chown -R vagrant:vagrant .
