#!/bin/sh

# make a new user
useradd $1 -s /bin/bash -m
echo $1:passw0rd | chpasswd

# add user to sudo
usermod -aG sudo $1

# allow password-based ssh login
sed -i '/PasswordAuthentication/c\PasswordAuthentication yes' /etc/ssh/sshd_config
service ssh restart