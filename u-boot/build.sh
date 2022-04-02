#!/bin/bash 

printf_info()
{
	local BN=`basename $1`
	echo "											   "
	echo "*********************************************"
	echo "Please input target"
	echo "Usage:									   "
	echo "	$BN <defconfig|uboot|menuconfig>				       "
	echo "*********************************************"
	echo "											   "
}

make_defconfig()
{
	make ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- licheepi_nano_spiflash_defconfig
}

build_uboot()
{
	make ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- -j8
}

open_menuconfig()
{
	make ARCH=arm menuconfig
}

build_select_compile()
{
	case ${Para1} in
	defconfig)
		make_defconfig
		;;
	uboot)
		build_uboot
		;;
	menuconfig)
		open_menuconfig
		;;
	*)
		printf_info $0
		;;
    esac
	
}

#-----------------------------main---------------------------------

echo ===================build:$@====================

Para1=$1

build_select_compile

#------------------------------------------------------------------
