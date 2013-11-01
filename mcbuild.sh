#!/bin/bash
echo "==> Cleaning packaging files..."
rm ../linux* > /dev/null
rm -rf ./debian > /dev/null

echo "==> Cleaning source tree..."
make mrproper 

echo "==> Copying Vostro 2520 config..."
cp ./configs/dell-vostro-2520.config ./.config

echo "==> Building .deb packages..."
make-kpkg --initrd --append_to_version="-mcdope+`git log -1 --format="%H"`" kernel_image kernel_headers kernel_source

echo ""
echo ""
echo "==> DONE!"

