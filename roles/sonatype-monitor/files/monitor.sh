#!/bin/bash
# script that will send an email to EMAIL when disk use in partition PART is bigger than %MAX
# adapt these 3 parameters to your case
MAX=50
#EMAIL=gkesavan@hortonworks.com
# EMAIL=releng-group@hortonworks.com
PART=/dev/sdf
PART1=/dev/sdh
PART0=/dev/sda1
 
status=0
USE=`df $PART | grep -v Filesystem|  awk '{ print $5 }' | cut -d'%' -f1`
if [ $USE -gt $MAX ]; then
  echo "REF https://hortonworks.jira.com/browse/BUG-12744?focusedCommentId=74279 \
for cleanup info" &&  echo "Nexus Internal Running out of disk space /grid/0 : $USE Percent used"  && echo ""
  status=1
fi

USE=`df $PART1 | grep -v Filesystem|  awk '{ print $5 }' | cut -d'%' -f1`
if [ $USE -gt $MAX ]; then
  echo "REF https://hortonworks.jira.com/browse/BUG-12744?focusedCommentId=74279 \
for cleanup info" && echo "Nexus Internal Running out of disk space /grid/1 : $USE Percent used" && echo ""
  status=1
fi

USE=`df $PART0 | grep -v Filesystem|  awk '{ print $5 }' | cut -d'%' -f1`
if [ $USE -gt $MAX ]; then
  echo "REF https://hortonworks.jira.com/browse/BUG-12744?focusedCommentId=74279 \
for cleanup info" && echo "Nexus Internal  (root filesystem)Running out of disk space / : $USE Percent used"  && echo ""
   status=1
fi


exit $status

