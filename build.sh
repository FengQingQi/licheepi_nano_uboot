#/bin/bash
UBOOT_DIR="u-boot"

#说明：当前目录为 /home/f1c100s/u-boot-2018.01
DIR=$(cd $(dirname $0) && pwd )

printf_info(){
	local BN=`basename $1`
	echo "							              "
	echo "****************************************************************"
	echo "Please input target                                             "
	echo "Usage:							      						  "
	echo "	$BN <licheepi>                                        		  "
	echo "explain:                                                        "
	echo "    licheepi  : compile licheepi uboot					      "
	echo "****************************************************************"
	echo "								      "
}

build_licheepi()
{
	cd ${DIR}/$UBOOT_DIR
	make ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- licheepi_nano_spiflash_defconfig
	make ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- -j8
}

build_select_compile()
{
	case ${Para1} in
	licheepi)
		echo ===================build:$@====================
		build_licheepi
		;;	
	*)
		printf_info $0
		;;
    esac
}

#-----------------------------main---------------------------------


Para1=$1

build_select_compile

#------------------------------------------------------------------

