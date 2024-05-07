unchained-packer-template
=============

FreeBSD 13 aarch64 / FreeBSD 14 aarch64 / AlmaLinux 9 aarch64 + Parallels

## Packer Build for Parallels

```
packer plugins install github.com/parallels/parallels
cd freebsd13-aarch64 or freebsd14-aarch64 or almalinux9-aarch64
packer validate [ FreeBSD13.json | FreeBSD14.json | AlmaLinux_9.json ]
VERSION=v20240507 packer build [ FreeBSD13.json | FreeBSD14.json | AlmaLinux_9.json ]
```

## Add Vagrant Box

```
vagrant box add BOXNAME UNCHAINED-AlmaLinux-9-aarch64-v20240507-parallels.box
vagrant box add BOXNAME UNCHAINED-FreeBSD-13-aarch64-v20240507-parallels.box
vagrant box add BOXNAME UNCHAINED-FreeBSD-14-aarch64-v20240507-parallels.box
```

## Atlas a.k.a Vagrant Cloud


```
mkdir packer-virtualmachine
cd packer-virtualmachine

vagrant init unchained/almalinux9-aarch64
or
vagrant init unchained/freebsd13-aarch64
vagrant init unchained/freebsd14-aarch64
```

```
vagrant up
```


## or Public URL Init


```
mkdir vagrant-virtualmachine
cd vagrant-virtualmachine
vagrant init UNCHAINED-AlmaLinux-9-aarch64-v20240507 https://www.unchained.co.jp/pub/boxes/UNCHAINED-AlmaLinux-9-aarch64-v20240507-parallels.box
or
vagrant init UNCHAINED-FreeBSD-13-aarch64-v20240507 https://www.unchained.co.jp/pub/boxes/UNCHAINED-FreeBSD-x86_64-aarch64-v20240507-vmware.box
vagrant init UNCHAINED-FreeBSD-14-aarch64-v20240507 https://www.unchained.co.jp/pub/boxes/UNCHAINED-FreeBSD-x86_64-aarch64-v20240507-vmware.box
```

```
vagrant up
```

## or Edit Vagrantfile (Vagrant 1.5.0 or Higher)

```diff
   # please see the online documentation at vagrantup.com.

   # Every Vagrant virtual environment requires a box to build off of.
-  config.vm.box = "base"
+  config.vm.box "unchained/freebsd13-aarch64" or "unchained/freebsd14-aarch64" or "unchained/almalinux9-aarch64"

   # Create a forwarded port mapping which allows access to a specific port
   # within the machine from a port on the host machine. In the example below,
```

vagrant up
