#!/usr/bin/bash 
allvolume=$(lsblk)
count=1
echo $allvolume | grep -q "$1[$count]"
result=$?
while [ 0 -eq 0 ]; do
	outputstr="unmounting /dev/$1$count"
	echo $outputstr
	udisksctl unmount -b /dev/$1$count
	sleep 1
	((count++))
	echo $allvolume | grep -q "$1[$count]"
	#echo $?
	if [ $? -gt 0 ]; then
		echo
		echo "all volumes unmounted!"
		echo
		break
	fi
done

#udisksctl unmount -b /dev/$1
sleep 1
echo "turning off the power"
udisksctl power-off -b /dev/$1

