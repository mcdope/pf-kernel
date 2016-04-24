#!/bin/bash
mccores=`grep -c "cpu cores" /proc/cpuinfo`

echo '==> Grabbing config '$1
cp $1 .config
echo '==> make menuconfig'
make -j$mccores menuconfig
echo '==> Saving config'
cp .config $1
echo 'DONE!'

