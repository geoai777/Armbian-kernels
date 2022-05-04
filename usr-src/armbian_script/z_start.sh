#!/bin/bash

kernel_conf="/srv/kern/cur.conf"
build_dir="/usr/src/build"
kconf_file="config/kernel/linux-imx6-dev.config"

cmd=(dialog --keep-tite --menu "Choose your action:" 0 0 0)

options=(1 "Build kernel image dev - no kernel src"
         2 "Build kernel image dev - with src"
         3 "Configure and build kernel only no source"
         4 "Configure and build OrangePi4"
	     5 "Copy kernel config from $kernel_conf to $build_dir/config/kernel"
         x "Exit")

choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)

for choice in $choices; do
	case $choice in
        1) $build_dir/compile.sh CLEAN_LEVEL="images,debs,make,oldcache" BOARD="wandboard-srv" KERNEL_ONLY="no" BUILD_KSRC="no" WIREGUARD="no" BUILD_DESKTOP="no" BUILD_MINIMAL="yes" RELEASE="focal" EXTRAWIFI="no" BRANCH="dev" KERNEL_CONFIGURE="no"
		;;
		2) $build_dir/compile.sh CLEAN_LEVEL="images,debs,make,oldcache" BOARD="wandboard-srv" KERNEL_ONLY="no" WIREGUARD="no" BUILD_DESKTOP="no" BUILD_MINIMAL="yes" RELEASE="focal" EXTRAWIFI="no" BRANCH="dev" KERNEL_CONFIGURE="no"
		;;
		3) $build_dir/compile.sh CLEAN_LEVEL="images,debs,make,oldcache" BOARD="wandboard-srv" KERNEL_ONLY="yes" BUILD_KSRC="no" WIREGUARD="no" BUILD_DESKTOP="no" BUILD_MINIMAL="yes" RELEASE="focal" EXTRAWIFI="no" BRANCH="dev" KERNEL_CONFIGURE="yes"
		;;
        4) $build_dir/compile.sh CLEAN_LEVEL="images,debs,make,oldcache" BOARD="orangepi4" KERNEL_ONLY="no" BUILD_KSRC="no" WIREGUARD="no" BUILD_DESKTOP="no" BUILD_MINIMAL="yes" RELEASE="focal" BRANCH="current" KERNEL_CONFIGURE="yes"
        ;;
		5)
			cp -f $kernel_conf $build_dir/$kconf_file
			grep "CONFIG_LOCALVERSION=" $build_dir/$kconf_file
		;;
		x | X) clear
		;;
    	esac
done

