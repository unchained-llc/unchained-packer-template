unchained-packer-template
=============

FreeBSD 14 aarch64 / FreeBSD 15 aarch64 / AlmaLinux 9 aarch64 / AlmaLinux 10 aarch64 + Parallels

## Packer Build for Parallels

```
cd freebsd14-aarch64 or freebsd15-aarch64 or almalinux9-aarch64 or almalinux10-aarch64
packer init .
packer validate [ FreeBSD14.pkr.hcl | FreeBSD15.pkr.hcl | AlmaLinux_9.pkr.hcl | AlmaLinux_10.pkr.hcl ]
VERSION=v20260706 packer build [ FreeBSD14.pkr.hcl | FreeBSD15.pkr.hcl | AlmaLinux_9.pkr.hcl | AlmaLinux_10.pkr.hcl ]
```



## Add Vagrant Box

```
vagrant box add BOXNAME UNCHAINED-FreeBSD-14-aarch64-v20260706-parallels.box
vagrant box add BOXNAME UNCHAINED-FreeBSD-15-aarch64-v20260706-parallels.box
vagrant box add BOXNAME UNCHAINED-AlmaLinux-9-aarch64-v20260706-parallels.box
vagrant box add BOXNAME UNCHAINED-AlmaLinux-10-aarch64-v20260706-parallels.box
```

## Atlas a.k.a Vagrant Cloud


```
mkdir packer-virtualmachine
cd packer-virtualmachine

vagrant init unchained-llc/almalinux9-aarch64
vagrant init unchained-llc/almalinux10-aarch64
or
vagrant init unchained-llc/freebsd14-aarch64
vagrant init unchained-llc/freebsd15-aarch64
```

```
vagrant up
```


## or Public URL Init


```
mkdir vagrant-virtualmachine
cd vagrant-virtualmachine
vagrant init UNCHAINED-AlmaLinux-9-aarch64-v20260706 https://www.unchained.co.jp/pub/boxes/UNCHAINED-AlmaLinux-9-aarch64-v20260706-parallels.box
vagrant init UNCHAINED-AlmaLinux-10-aarch64-v20260706 https://www.unchained.co.jp/pub/boxes/UNCHAINED-AlmaLinux-10-aarch64-v20260706-parallels.box
or
vagrant init UNCHAINED-FreeBSD-14-aarch64-v20260706 https://www.unchained.co.jp/pub/boxes/UNCHAINED-FreeBSD-x86_64-aarch64-v20260706-vmware.box
vagrant init UNCHAINED-FreeBSD-15-aarch64-v20260706 https://www.unchained.co.jp/pub/boxes/UNCHAINED-FreeBSD-x86_64-aarch64-v20260706-vmware.box
```

```
vagrant up
```
