gpart create -s gpt da0
gpart add -s 512K -t freebsd-boot da0
gpart add -s 2G -t freebsd-swap da0
gpart add -t freebsd-zfs -l disk0 da0
gpart bootcode -b /boot/pmbr -p /boot/gptzfsboot -i 1 da0

zpool create -o altroot=/mnt -O compress=lz4 -O atime=off -m none -f zroot da0p3
zfs create -o mountpoint=none zroot/ROOT
zfs create -o mountpoint=/ zroot/ROOT/default
zfs create -o mountpoint=/tmp -o exec=on -o setuid=off zroot/tmp
zfs create -o mountpoint=/usr -o canmount=off zroot/usr
zfs create zroot/usr/home
zfs create -o setuid=off zroot/usr/ports
zfs create zroot/usr/src
zfs create -o mountpoint=/var -o canmount=off zroot/var
zfs create -o exec=off -o setuid=off zroot/var/audit
zfs create -o exec=off -o setuid=off zroot/var/crash
zfs create -o exec=off -o setuid=off zroot/var/log
zfs create -o atime=on zroot/var/mail
zfs create -o setuid=off zroot/var/tmp
zfs set mountpoint=/zroot zroot
zpool set bootfs=zroot/ROOT/default zroot

chmod 1777 /mnt/tmp
chmod 1777 /mnt/var/tmp
cd /mnt
ln -s usr/home home
cd

fetch -o - ftp://ftp.jp.freebsd.org/pub/FreeBSD/releases/amd64/12.1-RELEASE/base.txz | tar --unlink -xpJf - -C /mnt
fetch -o - ftp://ftp.jp.freebsd.org/pub/FreeBSD/releases/amd64/12.1-RELEASE/lib32.txz | tar --unlink -xpJf - -C /mnt
fetch -o - ftp://ftp.jp.freebsd.org/pub/FreeBSD/releases/amd64/12.1-RELEASE/kernel.txz | tar --unlink -xpJf - -C /mnt

zpool set cachefile=/mnt/boot/zfs/zpool.cache zroot
zfs set canmount=noauto zroot/ROOT/default

#!/bin/sh
cat > /mnt/etc/rc.conf << EORC
clear_tmp_enable="YES"
syslogd_flags="-ss"
sendmail_enable="NONE"
hostname="vagrant"
ifconfig_em0="DHCP"
sshd_enable="YES"
# Set dumpdev to "AUTO" to enable crash dumps, "NO" to disable
dumpdev="NO"
zfs_enable="YES"
EORC

cat > /mnt/boot/loader.conf << EOL
kern.geom.label.disk_ident.enable="0"
kern.geom.label.gptid.enable="0"
opensolaris_load="YES"
zfs_load="YES"
autoboot_delay="2"
EOL

cat > /mnt/etc/fstab << EOF
# Device		Mountpoint	FStype	Options		Dump	Pass#
/dev/da0p2		none	swap	sw		0	0
EOF

echo "vagrant" | chroot /mnt pw useradd vagrant -h 0 -G wheel -m
echo "vagrant" | chroot /mnt pw usermod root -h 0

mount -t devfs null /mnt/dev
cp /etc/resolv.conf /mnt/etc/
chroot /mnt pkg install -y sudo curl
mkdir -p /mnt/usr/local/etc/sudoers.d
cat <<EOS > /mnt/usr/local/etc/sudoers.d/vagrant
Defaults:vagrant !requiretty
vagrant ALL=(ALL) NOPASSWD: ALL
EOS
chmod 440 /mnt/usr/local/etc/sudoers.d/vagrant
