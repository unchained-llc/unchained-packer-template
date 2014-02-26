centos-packer
=============

CentOS 6.5 x86_64 + Chef 11.8.2 + VirtualBox 4.3.8 for Packer 0.5.2 Template

## Packer Build for VirtualBox

```
packer validate CentOS_6.5.json
packer build -only virtualbox-iso CentOS_6.5.json
```

## Add Vagrant Box

```
box add BOXNAME UNCHAINED-CentOS-6.5-x86_64-v20140226.box
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
vagrant init UNCHAINED-CentOS-6.5-x86_64-v20140226 http://www.unchained.co.jp/pub/boxes/UNCHAINED-CentOS-6.5-x86_64-v20140226.box
vagrant up
```

## or Edit Vagrantfile

```diff
   # please see the online documentation at vagrantup.com.

   # Every Vagrant virtual environment requires a box to build off of.
-  config.vm.box = "base"
+  config.vm.box = "UNCHAINED-CentOS-6.5-x86_64-v20140226"

   # The url from where the 'config.vm.box' box will be fetched if it
   # doesn't already exist on the user's system.
-  # config.vm.box_url = "http://domain.com/path/to/above.box"
+  config.vm.box_url = "http://www.unchained.co.jp/pub/boxes/UNCHAINED-CentOS-6.5-x86_64-v20140226.box"

   # Create a forwarded port mapping which allows access to a specific port
   # within the machine from a port on the host machine. In the example below,
```

```
vagrant up
```

Enjoy!!
