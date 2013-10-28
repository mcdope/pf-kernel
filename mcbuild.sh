#!/bin/bash
rm ../linux* && rm -rf ./debian && make mrproper && cp ./configs/dell-vostro-2520.config ./.config && make-kpkg --initrd buildpackage --append_to_version="-mcdope+`git log -1 --format="%H"`"
