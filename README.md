centos-packer
=============

CentOS 6.5 x86_64 + Chef 11.12 + VirtualBox 4.3.14 for Packer 0.6 Template

## Packer Build for VirtualBox

```
packer validate CentOS_6.5.json
packer build -only virtualbox-iso CentOS_6.5.json
```

## Add Vagrant Box

```
box add BOXNAME UNCHAINED-CentOS-6.5-x86_64-v20140716.box
```

## Vagrant Cloud

```
mkdir centos
cd centos
vagrant init unchained/centos
vagrant up
```


## or Public URL Init

```
mkdir centos
cd centos
vagrant init UNCHAINED-CentOS-6.5-x86_64-v20140716 http://www.unchained.co.jp/pub/boxes/UNCHAINED-CentOS-6.5-x86_64-v20140716.box
vagrant up
```

## or Edit Vagrantfile (Vagrant 1.5.0 or Higher)

```diff
   # please see the online documentation at vagrantup.com.

   # Every Vagrant virtual environment requires a box to build off of.
-  config.vm.box = "base"
+  config.vm.box = "unchained/vagrant"

   # Create a forwarded port mapping which allows access to a specific port
   # within the machine from a port on the host machine. In the example below,
```

```
vagrant up
```

Enjoy!!
