unchained-packer-template
=============

CentOS 7-8 8Stream / AlmaLinux 8 / FreeBSD 12 - 13 x64 + VirtualBox / VMWare for Packer Template

## Packer Build for VirtualBox

```
cd centos7 or centos8 or centos8stream or almalinux8 or freebsd12 or freebsd13
packer validate [ CentOS_7.json | CentOS_8.json | CentOS_8_Stream.json | AlmaLinux_8.json | FreeBSD12.json | FreeBSD13.json ]
VERSION=v20210619 packer build [ CentOS_7.json | CentOS_8.json | CentOS_8_Stream.json | AlmaLinux_8.json | FreeBSD12.json | FreeBSD13.json ]
```

## Add Vagrant Box

```
vagrant box add BOXNAME UNCHAINED-CentOS-7-x86_64-v20210619-virtualbox.box
vagrant box add BOXNAME UNCHAINED-CentOS-8-x86_64-v20210619-virtualbox.box
vagrant box add BOXNAME UNCHAINED-CentOS-8-Stream-x86_64-v20210619-virtualbox.box
vagrant box add BOXNAME UNCHAINED-AlmaLinux-8-x86_64-v20210619-virtualbox.box
vagrant box add BOXNAME UNCHAINED-FreeBSD-12-x86_64-v20210619-virtualbox.box
vagrant box add BOXNAME UNCHAINED-FreeBSD-13-x86_64-v20210619-virtualbox.box
or
vagrant box add BOXNAME UNCHAINED-CentOS-7-x86_64-v20210619-vmware.box
vagrant box add BOXNAME UNCHAINED-CentOS-8-x86_64-v20210619-vmware.box
vagrant box add BOXNAME UNCHAINED-CentOS-8-Stream-x86_64-v20210619-vmware.box
vagrant box add BOXNAME UNCHAINED-AlmaLinux-8-x86_64-v20210619-vmware.box
vagrant box add BOXNAME UNCHAINED-FreeBSD-12-x86_64-v20210619-vmware.box
vagrant box add BOXNAME UNCHAINED-FreeBSD-13-x86_64-v20210619-vmware.box

## Atlas a.k.a Vagrant Cloud

```
mkdir vagrant-virtualmachine
cd vagrant-virtualmachine

vagrant init unchained/centos7
or
vagrant init unchained/centos8
or
vagrant init unchained/centos8stream
or
vagrant init unchained/almalinux8
or
vagrant init unchained/freebsd12
or
vagrant init unchained/freebsd13

vagrant up
```


## or Public URL Init

```
mkdir centos
cd centos
vagrant init UNCHAINED-CentOS-7-x86_64-v20210619 https://www.unchained.co.jp/pub/boxes/UNCHAINED-CentOS-7-x86_64-v20210619-virtualbox.box
vagrant init UNCHAINED-CentOS-8-x86_64-v20210619 https://www.unchained.co.jp/pub/boxes/UNCHAINED-CentOS-8-x86_64-v20210619-virtualbox.box
vagrant init UNCHAINED-CentOS-8-Stream-x86_64-v20210619 https://www.unchained.co.jp/pub/boxes/UNCHAINED-CentOS-8-Stream-x86_64-v20210619-virtualbox.box
vagrant init UNCHAINED-AlmaLinux-8--x86_64-v20210619 https://www.unchained.co.jp/pub/boxes/UNCHAINED-AlmaLinux-8-x86_64-v20210619-virtualbox.box
vagrant init UNCHAINED-FreeBSD-12-x86_64-v20210619 https://www.unchained.co.jp/pub/boxes/UNCHAINED-FreeBSD-12-x86_64-v20210619-virtualbox.box
vagrant init UNCHAINED-FreeBSD-13-x86_64-v20210619 https://www.unchained.co.jp/pub/boxes/UNCHAINED-FreeBSD-13-x86_64-v20210619-virtualbox.box
or
vagrant init UNCHAINED-CentOS-7-x86_64-v20210619 https://www.unchained.co.jp/pub/boxes/UNCHAINED-CentOS-7-x86_64-v20210619-vmware.box
vagrant init UNCHAINED-CentOS-8-x86_64-v20210619 https://www.unchained.co.jp/pub/boxes/UNCHAINED-CentOS-8-x86_64-v20210619-vmware.box
vagrant init UNCHAINED-CentOS-8-Stream-x86_64-v20210619 https://www.unchained.co.jp/pub/boxes/UNCHAINED-CentOS-8-Stream-x86_64-v20210619-vmware.box
vagrant init UNCHAINED-AlmaLinux-8--x86_64-v20210619 https://www.unchained.co.jp/pub/boxes/UNCHAINED-AlmaLinux-8-x86_64-v20210619-vmware.box
vagrant init UNCHAINED-FreeBSD-12-x86_64-v20210619 https://www.unchained.co.jp/pub/boxes/UNCHAINED-FreeBSD-12-x86_64-v20210619-vmware.box
vagrant init UNCHAINED-FreeBSD-13-x86_64-v20210619 https://www.unchained.co.jp/pub/boxes/UNCHAINED-FreeBSD-13-x86_64-v20210619-vmware.box

vagrant up
```

## or Edit Vagrantfile (Vagrant 1.5.0 or Higher)

```diff
   # please see the online documentation at vagrantup.com.

   # Every Vagrant virtual environment requires a box to build off of.
-  config.vm.box = "base"
+  config.vm.box = "unchained/centos7" or "unchained/centos8" or "unchained/freebsd12"

   # Create a forwarded port mapping which allows access to a specific port
   # within the machine from a port on the host machine. In the example below,
```

```
vagrant up
```
