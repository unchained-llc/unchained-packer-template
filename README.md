centos-packer
=============

CentOS 6 / 7 x64 + VirtualBox / VMWare for Packer Template

## Packer Build for VirtualBox

```
cd centos6 or centos7
packer validate [ CentOS_6.json | CentOS_7.json ]
VERSION=v20161211 packer build [ -only virtualbox-iso | -only vmware-iso ]  [ CentOS_6.json | CentOS_7.json ]
```

## Add Vagrant Box

```
vagrant box add BOXNAME UNCHAINED-CentOS-6-x86_64-v20161130-virtualbox.box
vagrant box add BOXNAME UNCHAINED-CentOS-7-x86_64-v20161130-virtualbox.box
or
vagrant box add BOXNAME UNCHAINED-CentOS-6-x86_64-v20161130-vmware.box
vagrant box add BOXNAME UNCHAINED-CentOS-7-x86_64-v20161130-vmware.box
```

## Atlas a.k.a Vagrant Cloud

```
mkdir centos
cd centos
vagrant init unchained/centos
or
vagrant init unchained/centos7
vagrant up
```


## or Public URL Init

```
mkdir centos
cd centos
vagrant init UNCHAINED-CentOS-6-x86_64-v20161211 https://www.unchained.co.jp/pub/boxes/UNCHAINED-CentOS-6-x86_64-v20161130-virtualbox.box
vagrant init UNCHAINED-CentOS-7-x86_64-v20161211 https://www.unchained.co.jp/pub/boxes/UNCHAINED-CentOS-7-x86_64-v20161130-virtualbox.box
or
vagrant init UNCHAINED-CentOS-6-x86_64-v20161211 https://www.unchained.co.jp/pub/boxes/UNCHAINED-CentOS-6-x86_64-v20161130-vmware.box
vagrant init UNCHAINED-CentOS-7-x86_64-v20161211 https://www.unchained.co.jp/pub/boxes/UNCHAINED-CentOS-7-x86_64-v20161130-vmware.box
vagrant up
```

## or Edit Vagrantfile (Vagrant 1.5.0 or Higher)

```diff
   # please see the online documentation at vagrantup.com.

   # Every Vagrant virtual environment requires a box to build off of.
-  config.vm.box = "base"
+  config.vm.box = "unchained/centos" or "unchained/centos7"

   # Create a forwarded port mapping which allows access to a specific port
   # within the machine from a port on the host machine. In the example below,
```

```
vagrant up
```

## Known Issues

[mitchellh/vagrant: Authentication failure after inserting new key with Vagrant 1.8.5.](https://github.com/mitchellh/vagrant/issues/7610)

fix ex.
```diff
--- vagrant-original/plugins/guests/linux/cap/public_key.rb     2016-07-19 12:06:56.575045974 -0500
+++ vagrant/plugins/guests/linux/cap/public_key.rb      2016-07-19 12:07:34.303376009 -0500
@@ -54,6 +54,7 @@
             if test -f ~/.ssh/authorized_keys; then
               grep -v -x -f '#{remote_path}' ~/.ssh/authorized_keys > ~/.ssh/authorized_keys.tmp
               mv ~/.ssh/authorized_keys.tmp ~/.ssh/authorized_keys
+              chmod 0600 ~/.ssh/authorized_keys
             fi

             rm -f '#{remote_path}'
end
```

Enjoy!!
