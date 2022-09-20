#!/bin/bash

if [ $USER = root ]
then
	username=temp

	while [ ! -z "$username" ]
	do
			read -p "Enter username: " username

		if [ -z "$username" ]
		then
			echo done
		else
			read -p "Enter password: " -s  password
			useradd $username
			echo $password | passwd --stdin $username
			echo "User $username has been created"
		fi

	done
else
	echo "This action requires root privileges."
fi
