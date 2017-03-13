#!/bin/sh

apt-get update
DEBIAN_FRONTEND=noninteractive apt-get upgrade -y
DEBIAN_FRONTEND=noninteractive apt-get install -y ncurses-dev libssl-dev build-essential linux-source kernel-package 

FULLVERSION=`find /boot/ -name "config-*" -printf "%f\n" | sort | tail -1 | cut -d'-' -f2-`
VERSION=`echo $FULLVERSION | cut -d'-' -f1`

cd /usr/src
tar xpvf linux-source-$VERSION.tar.bz2

cd linux-source-$VERSION
cp -ax /boot/config-$FULLVERSION .config

make oldconfig

sed -ir 's/^CONFIG_HIGHMEM=/# CONFIG_HIGHMEM is not set/' .config
sed -ir 's/^CONFIG_HIGHMEM4G=/# CONFIG_HIGHMEM4G is not set/' .config
sed -ir 's/^CONFIG_HIGHMEM64G=/# CONFIG_HIGHMEM64G is not set/' .config
sed -ir 's/^# CONFIG_NOHIGHMEM is not set/CONFIG_NOHIGHMEM=y/' .config
make olddefconfig

sed -ir 's/^CONFIG_X86_PAE=/# CONFIG_X86_PAE is not set/' .config
make olddefconfig

make-kpkg -j `nproc --all` --initrd --append-to-version=-non-pae kernel-image

