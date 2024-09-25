# Armbian kernels
## Build environment
```python
VM {
 `ram`: `2Gb`,
 `cpu`: `4 cores`,
 `disk`: `48GB`,
}
```
OS: `Ubuntu 20.04.2 LTS (GNU/Linux 5.4.0-74-generic x86_64)`

## Prerequesites
You need following packages:
- `apt -y install git npm`
- `apt -y install dialog` - used for my menu driven build script.
- `npm install -g etcher-cli` - tool to burn OS image to SD card.

## Get everything
Usually, I keep source in `/usr/src`, so we `cd /usr/src`.
- `git clone https://github.com/armbian/build`
- `git clone https://github.com/p0rc0jet/Armbian-kernels.git`
Simply `cp -r Armbian-kernels/usr-src/* /usr/src`.
Verify that `build/z_start.sh` is symlink that points to `/usr/src/armbian_script/z_start.sh`

## Build
To build kernel just `cd buld` and `./z_start.sh`.

### z_start.sh
Script made for development purposes, when you need to rebuild image many times. It sets all `compile.sh` options in advance.

Script uses Ubuntu 20.04 base and latest stable kernel sources. It can easily be adjusted for boards other than `orangepi4` or `wandboard`. 

### Kernel configuration
For kernel configuration use file provided in `rk3399` and `wandboard` folder. 

Please keep in mind, that this are optimized kernel configurations, so if target board differs from `rk3399` or `imx6`, some additional kernel configuration will require. 

Ready **image will be located** in `build/output/images/<image_name>.img`

#### Wandboard DL
Most of customizations are for Wandboard iMX6. 

#### Rockchip RK3399

/!\ WARNING! One and only warning, with performance kernel board draws **way more** power and mighty overheats. I you don't have performance cooling don't even try it.

Builds pretty much 'out of the box', just need to add kernel file.

## Burn to MicroSD
/!\ WARNING! Burning to `/dev` device WILL erase all device contents!

Assuming we are in `/usr/src/build`.

`etcher output/images/<image_name>.img -d /dev/<sd_card>`

in my case it was: `etcher output/images/Armbian_21.02.0-trunk_Wandboard-srv_focal_current_5.10.4_minimal.img -d /dev/sdc`


# Links
- https://github.com/armbian/build - armbian sources
- https://github.com/balena-io/etcher-cli - sd burning tool
- https://ubuntu.com/#download - ubuntu image download


## Disclaimer
the software is provided "as is", without warranty of any kind, express or implied, including but not limited to the warranties of merchantability, fitness for a particular purpose and oninfringement. in no event shall the authors or copyright holders be liable for any claim, damages or other liability, whether in an action of contract, tort or otherwise, arising from, out of or in connection with the software or the use or other dealings in the software.
