#!/usr/bin/env bash

img="debian-installer-wandboard.img"
device="/dev/sdc"
byte_size="512"

read -p "Enter device to write to [${device}]: " device_input
device="${device_input:-${device}}"

echo "Writing ${img} to ${device}..."

sudo dd if=${img} of=${device} bs=${byte_size}
