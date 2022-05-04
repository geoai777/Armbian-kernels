#!/bin/bash

src_dir=wb
mnt_pt=/mnt/sd01

if [[ -d $src_dir ]]; then
	cp -f $src_dir/interfaces $mnt_pt/etc/network/
	cp -f $src_dir/shadow $mnt_pt/etc/
fi
