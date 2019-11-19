#!/bin/bash -ex

echo "****Experimental script to move /grid/0/jenkins to a tmpfs partition****"
mkdir -p /grid/0/ramdisk/
mount -t tmpfs -o size=25000m,noatime tmpfs /grid/0/ramdisk/
mv /grid/0/jenkins /grid/0/jenkins.bak
time cp -rpv /grid/0/jenkins.bak/ /grid/0/ramdisk/jenkins
mkdir -p /grid/0/jenkins
mount --bind --verbose /grid/0/ramdisk/jenkins/ /grid/0/jenkins
touch /grid/0/jenkins/tmpfs.txt
echo "****Done. Please ensure that jenkins slaves are up and running as expected****"

echo "sleeping"

while true; do
  sleep 1
done
