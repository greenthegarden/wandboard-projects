# Wandboard image

## Creating image

See https://wiki.debian.org/InstallingDebianOn/Wandboard

Download firmware and partion files using

```bash
wget http://ftp.debian.org/debian/dists/stable/main/installer-armhf/current/images/netboot/SD-card-images/firmware.Wandboard.img.gz
wget http://ftp.debian.org/debian/dists/stable/main/installer-armhf/current/images/netboot/SD-card-images/partition.img.gz
```

Create image using `./create_image.sh` which downloads the files above and then concatenates the images using

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

```bash

wget -c https://rcn-ee.com/rootfs/eewiki/minfs/debian-9.8-minimal-armhf-2019-02-16.tar.xz
sha256sum debian-9.8-minimal-armhf-2019-02-16.tar.xz
40643313dbfc4bc9487455cb6e839cc110e226ac2e9046a2f59f05e563802943  debian-9.8-minimal-armhf-2019-02-16.tar.xz