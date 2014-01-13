#!/bin/bash
echo '==> Grabbing config'
cp configs/dell-vostro-2520.config .config
echo '==> make menuconfig'
make menuconfig
echo '==> Saving config'
cp .config configs/dell-vostro-2520.config
echo 'DONE!'

