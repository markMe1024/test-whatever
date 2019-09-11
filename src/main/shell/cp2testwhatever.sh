#!/bin/bash
#
# cp file to test-whatever
#
if [ $# -ne 1 ]
then 
	echo "Error : Arguments are not supplied"
	echo "Usage : $0 file-name"
	exit 1
fi

cp `pwd`/$1 /mnt/d/workspace/test-whatever/src/main/shell
echo "copy success"
