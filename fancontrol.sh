#!/usr/bin/bash
while true
do
	clear
	echo
	j=0
	cat /proc/acpi/ibm/fan | grep -e "speed" -e "level" | while read LINE
	do
		if [[ $j == 0 ]];then
			echo "fan " $LINE
		elif [[ $j == 1 ]];then
			echo "control " $LINE
		else
			break
		fi
		j=$(($j+1))
	done

	echo
	tempArray=(0 0 0 0)
	fanon=-1
	fanoff=1
	while read LINE
	do
		echo $LINE
		indexnum=`expr index "$LINE" "\+"`
		tmp=`expr substr "$LINE" $(($indexnum+1)) 2`
		echo $tmp
		if [[ $tmp > 48 ]];then
			fanon=1
			continue
		fi
		if [[ $tmp > 43 ]];then
			fanoff=0
		fi

	done < <(sensors |grep -e "core 0" -e "id 0" -e "temp1" -e "core 1" -i)

	echo
	echo "fanon : "$fanon

	if [[ $fanon == 1 ]];then
		echo "handed over to auto control system"
		echo level auto > /proc/acpi/ibm/fan
	else
		if [[ $fanoff == 1 && $fanon != 1 ]];then
			echo "fan off"
			echo level 0 > /proc/acpi/ibm/fan
		fi
	fi
	sleep 2
done
