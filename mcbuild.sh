#!/bin/bash
echo "==> Cleaning packaging files..."
rm ../linux* > /dev/null
rm -rf ./debian > /dev/null

if [ "$1" == "clean" ] 
    then
	echo "==> Cleaning source tree..."
	make mrproper 
fi

echo "==> Copying Vostro 2520 config..."
cp ./configs/dell-vostro-2520.config ./.config

echo "==> Building .deb packages..."
#make-kpkg --initrd --append_to_version="-mcdope+`git log -1 --format="%H"`" kernel_image kernel_headers kernel_source
#make-kpkg --initrd --append_to_version="+`git log -1 --format="%H"`" kernel_image kernel_headers kernel_source
make-kpkg --initrd --append_to_version="+mcdope-`date +%Y%m%d-%H%M`" kernel_image kernel_headers kernel_source > build.log 2>&1
if [ "$1" == "install" ]
    then
	echo "==> Installing .deb packages ..."
	sudo dpkg -i ../linux-*
fi
echo ""
echo ""
echo "==> DONE!"

