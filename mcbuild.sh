#!/bin/bash
start_time=`date +%s`

echo "==> Cleaning packaging files..."
rm ../linux* &> /dev/null
rm -rf ./debian &> /dev/null

if [ "$1" == "clean" ] 
then
	echo "==> Cleaning source tree..."
	make mrproper
	make distclean
fi

HOST=`hostname`
if [ "$HOST" == "tbits-laptop" ] 
then
	echo "==> Copying Laptop (Dell Vostro 2520) config..."
	cp ./configs/dell-vostro-2520.config ./.config
fi
if [ "$HOST" == "dope-seiner" ] 
then
	echo "==> Copying Desktop (ASUS P8-Z77M + i5 3570k) config..."
	cp ./configs/mcdope-desktop.config ./.config
fi

mccores=`grep -c "cpu cores" /proc/cpuinfo`
echo -n "==> Building .deb packages with "
echo -n $mccores
echo " parallel jobs..."
#make-kpkg -j$mccores --initrd --append_to_version="+mcdope-`date +%Y%m%d-%H%M`" kernel_image kernel_headers kernel_source > build.log 2>&1
make-kpkg -j$mccores --initrd kernel_image kernel_headers kernel_source > build.log 2>&1
if [ "$1" == "install" ]
    then
	echo "==> Installing .deb packages ..."
	sudo dpkg -i ../linux-*
fi

echo ""
echo ""
end_time=`date +%s`
time_diff=`expr $end_time - $start_time`
echo -n "==> DONE in "
echo -n $time_diff 
echo " s!"

