#!/bin/sh

if [ $# -eq 0 ]
then
	echo "Remove a package, but tell dpkg it's still there."
	echo "Misuse of this program can break your system."
	echo "Usage: apt-holepunch [--dry-run] [--undo] packagename"
fi

DRYRUN=
UNINSTALL=0

[ -d /var/lib/apt/holepunch/tmp ] || mkdir -p /var/lib/apt/holepunch/tmp
[ -d /var/lib/apt/holepunch/packages ] || mkdir /var/lib/apt/holepunch/packages

for OPTION in "$@"
do
	case "$OPTION" in
		--dry-run) DRYRUN=--dry-run ;;
		-r|-u|--remove|--uninstall|--undo) UNINSTALL=1 ;;
		-*) echo "Option $OPTION not recognized" 1>&2 ; exit 1 ;;
	esac
done

for PACKAGENAME in "$@"
do
	case "$PACKAGENAME" in
		-*) ;;
		*)	if [ $UNINSTALL -eq 1 ]
			then
				echo "Removing $PACKAGENAME-apt-holepunch"
				dpkg --force-all $DRYRUN -r $PACKAGENAME-apt-holepunch >/dev/null
				rm -f /var/lib/apt/holepunch/packages/$PACKAGENAME.deb
				apt-get --no-list-cleanup --no-install-recommends $DRYRUN install $PACKAGENAME
			else
				rm -rf /var/lib/apt/holepunch/tmp
				mkdir -p /var/lib/apt/holepunch/tmp/DEBIAN || exit 3
				cat > /var/lib/apt/holepunch/tmp/DEBIAN/control <<!
Package: $PACKAGENAME-apt-holepunch
Version: 1
Section: apt-hold
Architecture: all
Provides: $PACKAGENAME
Conflicts: $PACKAGENAME
Maintainer: apt-holepunch <root@localhost>
Description: $PACKAGENAME is not installed.
!
				[ -f /var/lib/apt/holepunch/tmp/DEBIAN/control ] || exit 3
				dpkg-deb -b /var/lib/apt/holepunch/tmp /var/lib/apt/holepunch/packages/$PACKAGE.deb > /dev/null || exit $?
				[ -f /var/lib/apt/holepunch/packages/$PACKAGE.deb ] || exit 3
				if grep "Package: $PACKAGENAME" /var/lib/dpkg/status
				then
					echo "Removing $PACKAGENAME"
					dpkg --force-all $DRYRUN -r $PACKAGENAME >/dev/null || exit $?
				fi
				echo "Installing $PACKAGENAME-apt-holepunch"
				dpkg $DRYRUN -i /var/lib/apt/holepunch/packages/$PACKAGE.deb >/dev/null
			fi
	esac
done
