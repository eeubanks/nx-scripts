#!/bin/bash

# Script usage example
# sudo ./hostname.sh mynewhostname
# sudo ./hostname.sh devgolang01

# AUTHOR NOTES:
# [+] This script must be run as root.
# [+] Thanks to jimbalaya71 --> https://gist.github.com/alateas/3436036

if [ ! -n "$1" ] ; then
	echo 'Missing argument: new_hostname'
	exit 1
fi

if [ "$(id -u)" != "0" ] ; then
	echo "You must be root to run this script."
	exit 2
fi

CUR_HOSTNAME=$(cat /etc/hostname)
NEW_HOSTNAME=$1

# Display the current hostname
echo "The current hostname is $CUR_HOSTNAME"

# Change the hostname
hostnamectl set-hostname $NEW_HOSTNAME
hostname $NEW_HOSTNAME

# Change hostname in /etc/hosts & /etc/hostname
sudo sed -i "s/$CUR_HOSTNAME/$NEW_HOSTNAME/g" /etc/hosts
sudo sed -i "s/$CUR_HOSTNAME/$NEW_HOSTNAME/g" /etc/hostname

# Display new hostname
echo "The new hostname is $NEW_HOSTNAME"

# Restart the machine
echo "Rebooting to apply changes... Please wait."
reboot
