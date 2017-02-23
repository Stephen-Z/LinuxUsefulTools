#!/usr/bin/bash
if [[ $1 == 'start' ]];then
	echo 'starting teamviewer....'
	teamviewer --daemon start
	teamviewer
elif [[ $1 == 'stop' ]];then
	echo 'terminating teamviewer....'
	teamviewer --daemon stop
else
	echo 'unknown argument.'
fi
