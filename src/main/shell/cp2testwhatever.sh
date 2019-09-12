#!/bin/bash
#
# cp file to test-whatever
#
if [ $# -ne 1 ]
then 
	echo "Error : lack of necessary parameter" 1>&2
	echo "Usage : $0 file-name" 1>&2
	exit 1
fi

cp `pwd`/$1 /mnt/d/workspace/test-whatever/src/main/shell
echo "copy success"
