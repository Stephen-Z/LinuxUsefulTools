#!/bin/bash
#!/bin/bash

toTrash=/home/lzm/Desktop/Trash
if [ ! -d "/home/lzm/Desktop/Trash" ]; then
	echo "making the Trash..."
	mkdir -p /home/lzm/Desktop/Trash
fi

removeCMD=mv

if [ $# -gt 1 ]; then
	for p in $@
	do
		removeCMD=$removeCMD\ $p
	done
	removeCMD=$removeCMD\ $toTrash
else
	removeCMD=$removeCMD\ $1\ $toTrash
fi
echo $removeCMD
$removeCMD
