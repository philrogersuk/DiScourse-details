#!/bin/bash

read -p "Enter username : " username
read -s -p "Enter initial password : " password

egrep "^$username" /etc/passwd >/dev/null
if [ $? -eq 0 ]; then
   echo "$username already exists"
   exit 1
else
   pass=$(perl -e 'print crypt($ARGV[0], "password")' $password)
   useradd -m -p "$pass" "$username"
   [ $? -eq 0 ] && echo "User has been added to system!" || echo "Failed to add user"
fi
