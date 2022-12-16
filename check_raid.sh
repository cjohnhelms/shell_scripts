#!/bin/bash
#
# this script checks the smart data on all spinning disk drives and provides details on raid status
# for variable use, modify the /dev/sd? to fit other drive types
#
for i in /dev/sd?
do
	echo $i
	smartctl -a $i
done
cat /proc/mdstat
