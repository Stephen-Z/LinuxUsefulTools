#!/usr/bin/bash
for var in "$@"
do
	outputstr="Removing $var"
	echo
	echo $outputstr
	echo
	mv -f $var /home/stephen/.local/share/Trash/files
done
