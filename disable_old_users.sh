#!/bin/bash

for i in $(awk -F ':' '{print $3}' /etc/passwd)
do
	if [ $i -gt '999' ] && [ $i -lt '6000' ]
	then
		echo $i
	fi
done
