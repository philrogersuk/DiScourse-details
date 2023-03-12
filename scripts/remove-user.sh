#!/bin/bash

read -p "Enter username : " username

#check user isn't root
if [ "$username" = "root" ]; then
   echo "cannot delete root"
   exit 1
fi

#check if user exists
egrep "^$username" /etc/passwd > /dev/null
if [ $? -eq 0 ]; then
   #force logout the user
   sudo killall -u user

   #delete user, home dir and mail spool
   userdel -r "$username"
else
   echo "User does not exist." 
fi
