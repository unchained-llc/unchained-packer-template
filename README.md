centos-packer
=============

CentOS 6.4 x86_64 + Chef for Packer

## Packer Build for VirtualBox

```
packer validate CentOS_6.4.json
packer build -only virtualbox CentOS_6.4.json
```

## Add Vagrant Box

```
box add BOXNAME UNCHAINED-CentOS-6.4-x86_64-v20131130.box
```

## Vagrant up

```
mkdir centos
cd centos
vagrant init BOXNAME
vi Vagrantfile
vagrant up
```

## or Public URL Init

```
mkdir centos
cd centos
vagrant init UNCHAINED-CentOS-6.4-x86_64-v20131130 http://www.unchained.co.jp/pub/boxes/UNCHAINED-CentOS-6.4-x86_64-v20131130.box
vagrant up
```

## or Edit Vagrantfile

```diff
   # please see the online documentation at vagrantup.com.

   # Every Vagrant virtual environment requires a box to build off of.
-  config.vm.box = "base"
+  config.vm.box = "UNCHAINED-CentOS-6.4-x86_64-v20131130"

   # The url from where the 'config.vm.box' box will be fetched if it
   # doesn't already exist on the user's system.
-  # config.vm.box_url = "http://domain.com/path/to/above.box"
+  config.vm.box_url = "http://www.unchained.co.jp/pub/boxes/UNCHAINED-CentOS-6.4-x86_64-v20131130.box"

   # Create a forwarded port mapping which allows access to a specific port
   # within the machine from a port on the host machine. In the example below,
```

```
vagrant up
```

Enjoy!!
