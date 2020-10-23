unchained-packer-template
=============

CentOS 6 - 8 / FreeBSD 12 x64 + VirtualBox / VMWare for Packer Template

## Packer Build for VirtualBox

```
cd centos6 or centos7 or centos8 or freebsd12
packer validate [ CentOS_6.json | CentOS_7.json | CentOS_8.json | FreeBSD12.json ]
VERSION=v20201023 packer build [ -only virtualbox-iso | -only vmware-iso ]  [ CentOS_6.json | CentOS_7.json | CentOS_8.json | FreeBSD12.json ]
```

## Add Vagrant Box

```
vagrant box add BOXNAME UNCHAINED-CentOS-6-x86_64-v20201023-virtualbox.box
vagrant box add BOXNAME UNCHAINED-CentOS-7-x86_64-v20201023-virtualbox.box
vagrant box add BOXNAME UNCHAINED-CentOS-6-x86_64-v20201023-virtualbox.box
vagrant box add BOXNAME UNCHAINED-FreeBSD-12-x86_64-v20201023-virtualbox.box
or
vagrant box add BOXNAME UNCHAINED-CentOS-6-x86_64-v20201023-vmware.box
vagrant box add BOXNAME UNCHAINED-CentOS-7-x86_64-v20201023-vmware.box
vagrant box add BOXNAME UNCHAINED-CentOS-6-x86_64-v20201023-vmware.box
vagrant box add BOXNAME UNCHAINED-FreeBSD-12-x86_64-v20201023-vmware.box
```

## Atlas a.k.a Vagrant Cloud

```
mkdir vagrant-virtualmachine
cd vagrant-virtualmachine

vagrant init unchained/centos6
or
vagrant init unchained/centos7
or
vagrant init unchained/centos8
or
vagrant init unchained/freebsd12

vagrant up
```


## or Public URL Init

```
mkdir centos
cd centos
vagrant init UNCHAINED-CentOS-6-x86_64-v20201023 https://www.unchained.co.jp/pub/boxes/UNCHAINED-CentOS-6-x86_64-v20201023-virtualbox.box
vagrant init UNCHAINED-CentOS-7-x86_64-v20201023 https://www.unchained.co.jp/pub/boxes/UNCHAINED-CentOS-7-x86_64-v20201023-virtualbox.box
vagrant init UNCHAINED-CentOS-8-x86_64-v20201023 https://www.unchained.co.jp/pub/boxes/UNCHAINED-CentOS-8-x86_64-v20201023-virtualbox.box
vagrant init UNCHAINED-FreeBSD-12-x86_64-v20201023 https://www.unchained.co.jp/pub/boxes/UNCHAINED-FreeBSD-12-x86_64-v20201023-virtualbox.box
or
vagrant init UNCHAINED-CentOS-6-x86_64-v20201023 https://www.unchained.co.jp/pub/boxes/UNCHAINED-CentOS-6-x86_64-v20201023-vmware.box
vagrant init UNCHAINED-CentOS-7-x86_64-v20201023 https://www.unchained.co.jp/pub/boxes/UNCHAINED-CentOS-7-x86_64-v20201023-vmware.box
vagrant init UNCHAINED-CentOS-8-x86_64-v20201023 https://www.unchained.co.jp/pub/boxes/UNCHAINED-CentOS-6-x86_64-v20201023-vmware.box
vagrant init UNCHAINED-FreeBSD-12-x86_64-v20201023 https://www.unchained.co.jp/pub/boxes/UNCHAINED-FreeBSD-12-x86_64-v20201023-vmware.box
vagrant up
```

## or Edit Vagrantfile (Vagrant 1.5.0 or Higher)

```diff
   # please see the online documentation at vagrantup.com.

   # Every Vagrant virtual environment requires a box to build off of.
-  config.vm.box = "base"
+  config.vm.box = "unchained/centos" or "unchained/centos7" or "unchained/centos8" or "unchained/freebsd12"

   # Create a forwarded port mapping which allows access to a specific port
   # within the machine from a port on the host machine. In the example below,
```

```
vagrant up11.5.5
```
