#!/bin/sh
make O=./build all_y_defconfig
cd ./build && make


#rm build -rf
#make mrproper
