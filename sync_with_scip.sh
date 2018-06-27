#!/bin/bash

# this is a simple script to sync all listed Benders' decomposition files with
# the BendersSCIP repository.

SCIPDIR=${1}
BENDERSFILES=${2}

SCIPPATH=`realpath $SCIPDIR`

if test -z $BENDERSFILES
then
   echo "All inputs have not been defined. Please specify the SCIP directory and the Benders' decomposition framework source files"
   exit 1
fi

echo "Syncing all Benders' decomposition framework source files from $SCIPPATH"

for file in `cat $BENDERSFILES`
do
   SOURCEFILE=$SCIPDIR/$file
   RELPATH=$(dirname "$file")
   # checking whether the source file exists.
   if [ ! -f $SOURCEFILE ]
   then
      echo "The source file: $file, does not exist."
   else
      # if the file exists, then we call rsync to copy the file to the repository
      echo "Syncing: $file"
      rsync $SOURCEFILE ./$RELPATH/
   fi
done

echo "Syncing of Benders' decomposition framework source files is completed"
