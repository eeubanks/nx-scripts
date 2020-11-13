#!/bin/bash

# INSTRUCTIONS
# sudo gen-ssh-key.sh example@gmail.com

if [ ! -n "$1" ] ; then
	echo 'Missing argument: email_address'
	exit 1
fi

if [ "$(id -u)" != "0" ] ; then
	echo "You must be root to run this script."
	exit 2
fi

email_addr=$1
ssh-keygen -t ed25519 -C "$email_addr"
ssh-add ~/.ssh/ssh-ed25519
echo "New SSH key added: ~/.ssh/ssh-ed25519"
