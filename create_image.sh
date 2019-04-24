#!/usr/bin/env bash

# remote_source="http://ftp.debian.org/debian/dists/stable/main/installer-armhf/current/images/netboot/SD-card-images"
remote_source="http://ftp.debian.org/debian/dists/jessie/main/installer-armhf/20150422+deb8u5/images/netboot/SD-card-images"

# firmware_img="firmware.Wandboard.img.gz"
firmware_img="firmware.Wandboard_Quad.img.gz"
partition_img="partition.img.gz"
debian_boot_img="debian-installer-wandboard.img"

rm *.gz

echo "Getting firmware image ${firmware_img} from ${remote_source}..."
wget ${remote_source}/${firmware_img} -O ${firmware_img}

echo "Getting partition image ${partition_img} from ${remote_source}..."
wget ${remote_source}/${partition_img} -O ${partition_img}

rm ${debian_boot_img}

echo "Creating Debian boot image ${debian_boot_img}..."
zcat ${firmware_img} ${partition_img} > ${debian_boot_img}
