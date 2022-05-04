# Armbian kernels
Please be adwised, for start script to work you need `apt install dialog`.

To build a kernel you need to download armbian build source to `/usr/src/build`. 
Then place `z_start.sh` hyperlink to `build` folder and run it. 

This repo will contain config and other files needed to build linux kernel for following boards:

## Wandboard DL
Most of customizations are for Wandboard iMX6. 

## Rockchip RK3399

/!\  WARNING! One and only warning, with performance kernel board draws **way more** power and mighty overheats. I you don't have performance cooling don't even try it.

Builds pretty much 'out of the box', just need to add kernel file.


