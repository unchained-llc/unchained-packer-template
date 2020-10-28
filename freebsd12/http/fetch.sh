export BSDINSTALL_DISTSITE="ftp://ftp.freebsd.org/pub/FreeBSD/releases/amd64/12.2-RELEASE"
export DISTRIBUTIONS="base.txz kernel.txz"
export BSDINSTALL_DISTDIR="/media"
mdmfs -s 500m md0 /media
bsdinstall distfetch
