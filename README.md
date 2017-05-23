centos-packer
=============

CentOS 6 / 7 x64 + VirtualBox / VMWare for Packer Template

## Packer Build for VirtualBox

```
cd centos6 or centos7
packer validate [ CentOS_6.json | CentOS_7.json ]
VERSION=v20170524 packer build [ -only virtualbox-iso | -only vmware-iso ]  [ CentOS_6.json | CentOS_7.json ]
```

## Add Vagrant Box

```
vagrant box add BOXNAME UNCHAINED-CentOS-6-x86_64-v20170524-virtualbox.box
vagrant box add BOXNAME UNCHAINED-CentOS-7-x86_64-v20170524-virtualbox.box
or
vagrant box add BOXNAME UNCHAINED-CentOS-6-x86_64-v20170524-vmware.box
vagrant box add BOXNAME UNCHAINED-CentOS-7-x86_64-v20170524-vmware.box
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
vagrant init UNCHAINED-CentOS-6-x86_64-v20170524 https://www.unchained.co.jp/pub/boxes/UNCHAINED-CentOS-6-x86_64-v20170524-virtualbox.box
vagrant init UNCHAINED-CentOS-7-x86_64-v20170524 https://www.unchained.co.jp/pub/boxes/UNCHAINED-CentOS-7-x86_64-v20170524-virtualbox.box
or
vagrant init UNCHAINED-CentOS-6-x86_64-v20170524 https://www.unchained.co.jp/pub/boxes/UNCHAINED-CentOS-6-x86_64-v20170524-vmware.box
vagrant init UNCHAINED-CentOS-7-x86_64-v20170524 https://www.unchained.co.jp/pub/boxes/UNCHAINED-CentOS-7-x86_64-v20170524-vmware.box
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

[VMWare tools fails to Compile on Centos 7.3 (1611)](https://communities.vmware.com/message/2637447?tstart=0)

1. download VMware Tools 10.1.0 or Higher
1. extract it
1. copy vmtools/linux.iso centos7/
1. build

refs #4
