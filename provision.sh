#!/bin/sh

# make a new user
useradd $1 -s /bin/bash -m
echo $1:passw0rd | chpasswd

# add user to wheel & sudo
usermod -aG sudo $1
