#!/bin/sh

rm *.log
vagrant destroy -f
git checkout -- *
rm -rf .vagrant/
git pull
