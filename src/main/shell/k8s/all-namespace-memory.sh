#!/bin/bash

#
# this shell is used to add all namespace's memory together 
#

# file to buffer one namespace sum memory
one=one-namespace-cache.txt

# file to buffer all namespace sum memory
all=all-namespace-cache.txt

# add all pod's memory together in all namespace
kubectl get namespace | awk '{print $1}' | awk 'NR>1' | while read namespace
do
	# 1.one namespace total memory
	kubectl top po -n $namespace | awk '{sub("Mi", "", $3); print $3}' | awk 'NR>1' | while read line
	do 
		let "sum_one += $line"
		echo $sum_one > $one
	done

	# 2.add this namespace's memory to all namespace's memory
	if [ -f $one ]
	then
		echo "$namespace: `cat $one`MB" 
		let "sum_all += `cat $one`"
		echo $sum_all > $all
	else
		echo "$namespace: 0MB" 
	fi

	# 3.clean buffer
	echo 0 > $one
done

# print sum memory, the unit is 'MB'
if [ -f $all ]
then
	echo "all: `cat $all`MB"
else 
	echo 0
fi


# delete cache file
rm -f $one
rm -f $all

exit 0

