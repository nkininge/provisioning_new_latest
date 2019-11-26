#!/bin/bash
# script that will send an email to EMAIL when disk use in partition PART is bigger than %MAX
# adapt these 3 parameters to your case
MAX=${MAX:="90"}
#EMAIL=gkesavan@hortonworks.com
# EMAIL=releng-group@hortonworks.com
PART=/
PART1=/jenkins/install
 
status=0
USE=`df $PART | grep -v Filesystem|  awk '{ print $5 }' | cut -d'%' -f1`
if [ $USE -gt $MAX ]; then
  echo "Jenkins ROOT FILESYSTEM Running out of disk space /grid/0 : $USE Percent used"  && echo ""
  status=1
fi

USE=`df $PART1 | grep -v Filesystem|  awk '{ print $5 }' | cut -d'%' -f1`
if [ $USE -gt $MAX ]; then
  echo "Jenkins disk space in $PART1 Running out of space : $USE Percent used" && echo ""
  status=1
fi

exit $status

