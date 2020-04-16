#!/bin/bash

#
# this shell is used to add all pods in one namespace together, and it accept one parameter which is the name of the namespace 
#

# file to buffer sum memory
filename=sum.txt

# add all pod's memory together by namespace
kubectl top po -n $1 | awk '{sub("Mi", "", $3); print $3}' | awk 'NR>1' | while read line
do 
	let "sum += $line"
	echo $sum > $filename
done

# print sum memory, the unit is 'MB'
if [ -f $filename ]
then
	cat sum.txt
else 
	echo 0
fi


# if sum.txt exist, delete it
rm -f $filename

exit 0

