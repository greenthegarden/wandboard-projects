# Wandboard Projects

## Creating Debian Image

See https://wiki.debian.org/InstallingDebianOn/Wandboard

Need netboot firmware and partition image files:

### Jessie

* http://ftp.debian.org/debian/dists/jessie/main/installer-armhf/20150422+deb8u5/images/netboot/SD-card-images/firmware.Wandboard_Quad.img.gz
* http://ftp.debian.org/debian/dists/jessie/main/installer-armhf/20150422+deb8u5/images/netboot/SD-card-images/partition.img.gz

### Stretch

* http://ftp.debian.org/debian/dists/stretch/main/installer-armhf/current/images/netboot/SD-card-images/firmware.Wandboard.img.gz
* http://ftp.debian.org/debian/dists/stretch/main/installer-armhf/current/images/netboot/SD-card-images/partition.img.gz

### Current

* http://ftp.debian.org/debian/dists/stable/main/installer-armhf/current/images/netboot/SD-card-images/firmware.Wandboard.img.gz
* http://ftp.debian.org/debian/dists/stable/main/installer-armhf/current/images/netboot/SD-card-images/partition.img.gz

**NOTE: Only Jessie versions appear to work**

Create image using [`./create_image.sh`](./create_image.sh) which downloads the files above and then concatenates the images using

```bash
zcat firmware.Wandboard.img.gz partition.img.gz > debian-installer-wandboard.img
```

Suggest using [balenaEtcher](https://www.balena.io/etcher/) to write image to SD card.

To check partiion to write image to use `sudo fdisk -l`.

Write image to SD card using `sudo ./write_image.sh` which runs the following

```bash
sudo dd if=debian-installer-wandboard.img of=/dev/sdX bs=512
```

## Check Docker support

```bash
wget https://raw.githubusercontent.com/moby/moby/master/contrib/check-config.sh
chmod +x check-config.sh
./check-config.sh
```

## Alternative

See https://www.digikey.com/eewiki/display/linuxonarm/Wandboard#Wandboard-Debian9
