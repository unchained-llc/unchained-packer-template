zfs set compression=off zroot/ROOT/default
dd if=/dev/zero of=/EMPTY bs=1M
rm /EMPTY
zfs set compression=lz4 zroot/ROOT/default
