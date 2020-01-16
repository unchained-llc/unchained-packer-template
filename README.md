centos-packer
=============

CentOS 6 / 7 / 8 x64 + VirtualBox / VMWare for Packer Template

## Packer Build for VirtualBox

```
cd centos6 or centos7 or centos8
packer validate [ CentOS_6.json | CentOS_7.json | CentOS_8.json ]
VERSION=v20200116 packer build [ -only virtualbox-iso | -only vmware-iso ]  [ CentOS_6.json | CentOS_7.json | CentOS_8.json ]
```

## Add Vagrant Box

```
vagrant box add BOXNAME UNCHAINED-CentOS-6-x86_64-v20200116-virtualbox.box
vagrant box add BOXNAME UNCHAINED-CentOS-7-x86_64-v20200116-virtualbox.box
vagrant box add BOXNAME UNCHAINED-CentOS-6-x86_64-v20200116-virtualbox.box
or
vagrant box add BOXNAME UNCHAINED-CentOS-6-x86_64-v20200116-vmware.box
vagrant box add BOXNAME UNCHAINED-CentOS-7-x86_64-v20200116-vmware.box
vagrant box add BOXNAME UNCHAINED-CentOS-6-x86_64-v20200116-vmware.box
```

## Atlas a.k.a Vagrant Cloud

```
mkdir centos
cd centos

vagrant init unchained/centos6
or
vagrant init unchained/centos7
or
vagrant init unchained/centos8

vagrant up
```


## or Public URL Init

```
mkdir centos
cd centos
vagrant init UNCHAINED-CentOS-6-x86_64-v20200116 https://www.unchained.co.jp/pub/boxes/UNCHAINED-CentOS-6-x86_64-v20200116-virtualbox.box
vagrant init UNCHAINED-CentOS-7-x86_64-v20200116 https://www.unchained.co.jp/pub/boxes/UNCHAINED-CentOS-7-x86_64-v20200116-virtualbox.box
vagrant init UNCHAINED-CentOS-6-x86_64-v20200116 https://www.unchained.co.jp/pub/boxes/UNCHAINED-CentOS-6-x86_64-v20200116-virtualbox.box
or
vagrant init UNCHAINED-CentOS-6-x86_64-v20200116 https://www.unchained.co.jp/pub/boxes/UNCHAINED-CentOS-6-x86_64-v20200116-vmware.box
vagrant init UNCHAINED-CentOS-7-x86_64-v20200116 https://www.unchained.co.jp/pub/boxes/UNCHAINED-CentOS-7-x86_64-v20200116-vmware.box
vagrant init UNCHAINED-CentOS-6-x86_64-v20200116 https://www.unchained.co.jp/pub/boxes/UNCHAINED-CentOS-7-x86_64-v20200116-vmware.box
vagrant up
```

## or Edit Vagrantfile (Vagrant 1.5.0 or Higher)

```diff
   # please see the online documentation at vagrantup.com.

   # Every Vagrant virtual environment requires a box to build off of.
-  config.vm.box = "base"
+  config.vm.box = "unchained/centos" or "unchained/centos7" or "unchained/centos8"

   # Create a forwarded port mapping which allows access to a specific port
   # within the machine from a port on the host machine. In the example below,
```

```
vagrant up
```
