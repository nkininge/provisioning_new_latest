#!/bin/bash
# script that will send an email to EMAIL when disk use in partition PART is bigger than %MAX
# adapt these 3 parameters to your case
MAX=${MAX:="90"}
PART=/
PART1=/grid/0/jenkins/workspace

function check_usage {
    if [ $1 -gt $MAX ] ; then
        echo "Jenkins $2 running out of $3: $1 percent used" && echo ""
    fi
    status=1
}

status=0
USE=`df $PART | grep -v Filesystem|  awk '{ print $5 }' | cut -d'%' -f1`
check_usage $USE "ROOT FILESYSTEM" "disk space"
USE=`df -i $PART | grep -v Filesystem|  awk '{ print $5 }' | cut -d'%' -f1`
check_usage $USE "ROOT FILESYSTEM" "inodes"

USE=`df $PART1 | grep -v Filesystem|  awk '{ print $5 }' | cut -d'%' -f1`
check_usage $USE $PART1 "disk space"
USE=`df -i $PART1 | grep -v Filesystem|  awk '{ print $5 }' | cut -d'%' -f1`
check_usage $USE $PART1 "inodes"

exit $status
