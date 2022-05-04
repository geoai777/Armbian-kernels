#!/bin/bash

./compile.sh CLEAN_LEVEL="images,debs,make,oldcache" BOARD="wandboard-srv" \
	BRANCH="dev" KERNEL_CONFIGURE="no" \
	KERNEL_ONLY="no" BUILD_KSRC="no" WIREGUARD="no" \
	BUILD_DESKTOP="no" BUILD_MINIMAL="yes" RELEASE="focal" EXTRAWIFI="no"

