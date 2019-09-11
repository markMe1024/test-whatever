#!/bin/bash
#
#
# Script to print user information who currently login , current & time
#
clear
echo "Hello $USER"
echo "Today is : `date "+%Y-%m-%d"`"
echo "Number of user login: `who | wc -l`"
echo "calancer" ; cal
exit 0