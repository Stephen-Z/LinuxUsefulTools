#!/usr/bin/bash
#if [[ $1 != '' || $1 != null ]];then
#	echo -e "received min frequency \t"$1
#	minFrequency=$1
#else
#	echo "min frequency did not received,using default 1200000"
#	minFrequency=1200000
#fi
echo
if [[ $1 != '' || $1 != null ]];then
	echo -e "received max frequency \t"$1
	maxFrequency=$1
else
	echo "max frequency did not received,using default 3300000"
	maxFrequency=3300000
fi
echo
#echo "setting min frequency...."
#echo $minfrequency > /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
#echo $minfrequency > /sys/devices/system/cpu/cpu1/cpufreq/scaling_min_freq
#echo $minFrequency > /sys/devices/system/cpu/cpu2/cpufreq/scaling_min_freq
#echo $minFrequency > /sys/devices/system/cpu/cpu3/cpufreq/scaling_min_freq
echo
echo "setting max frequency...to $maxFrequency"
echo $maxFrequency > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
echo $maxFrequency > /sys/devices/system/cpu/cpu1/cpufreq/scaling_max_freq
echo $maxFrequency > /sys/devices/system/cpu/cpu2/cpufreq/scaling_max_freq
echo $maxFrequency > /sys/devices/system/cpu/cpu3/cpufreq/scaling_max_freq
echo

echo -e "cpu 0 \tMin:`cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq`\tMax:`cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq`"
echo
echo -e "cpu 1 \tMin:`cat /sys/devices/system/cpu/cpu1/cpufreq/scaling_min_freq`\tMax:`cat /sys/devices/system/cpu/cpu1/cpufreq/scaling_max_freq`"
echo
echo -e "cpu 2 \tMin:`cat /sys/devices/system/cpu/cpu2/cpufreq/scaling_min_freq`\tMax:`cat /sys/devices/system/cpu/cpu2/cpufreq/scaling_max_freq`"
echo
echo -e "cpu 3 \tMin:`cat /sys/devices/system/cpu/cpu3/cpufreq/scaling_min_freq`\tMax:`cat /sys/devices/system/cpu/cpu3/cpufreq/scaling_max_freq`"
