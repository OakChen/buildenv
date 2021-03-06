#! /bin/sh

# buildenv docker运行脚本
# Copyright (C) 2019-2019 Oak Chen <oak@sfysoft.com>

until [ $# -eq 0 ]
do
	case $1 in
	-h | --help)
		echo "Usage:"
		echo "-h, --help        Display this information"
		echo "-n, --no-home     Don't map $HOME directory"
		echo "-p, --passwd      Map /etc/passwd"
		echo "-g, --group       Map /etc/group"
		echo "-s, --shadow      Map /etc/shadow"
		exit
		;;
	-n | --no-home)
		nohome=true
		;;
	-p | --password)
		mappasswd=true
		;;
	-g | --group)
		mapgroup=true
		;;
	-s | --shadow)
		mapshadow=true
		;;
	*)
		others="$*"
		break
		;;
	esac
	shift
done


if [ -z "$nohome" ]; then
	options="$options -v $HOME:$HOME"
fi

if [ "$mappasswd" = "true" ]; then
	options="$options -v /etc/passwd:/etc/passwd"
fi

if [ "$mapgroup" = "true" ]; then
	options="$options -v /etc/group:/etc/group"
fi

if [ "$mapshadow" = "true" ]; then
	options="$options -v /etc/shadow:/etc/shadow"
fi

options="$options $others"

commandline="docker run -it $options oakchen/buildenv bash"

echo $commandline
eval $commandline
