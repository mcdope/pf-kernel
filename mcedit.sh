#!/bin/bash
echo '==> Grabbing config '$1
cp $1 .config
echo '==> make menuconfig'
make menuconfig
echo '==> Saving config'
cp .config $1
echo 'DONE!'

