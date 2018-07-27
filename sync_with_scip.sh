#!/bin/bash

# this is a simple script to sync all listed Benders' decomposition files with
# the BendersSCIP repository.
#
# By default, the files will be copied from the input SCIP directory to the
# BendersSCIP directory. To copy the files from the BendersSCIP directory to the
# SCIP directory, then the -u parameter must be set

UPDATE=0
SCIPDIR=""
BENDERSFILES=""

TOORFROM="from"

# parsing the command line arguments
for i in $@
do
   if test "$i" = "-u"
   then
      UPDATE=1
   else
      if test -z $SCIPDIR
      then
         SCIPDIR=$i
      else
         BENDERSFILES=$i
      fi
   fi
done

if test -z $BENDERSFILES
then
   echo "All inputs have not been defined. Please specify the SCIP directory and the Benders' decomposition framework source files"
   echo "Correct usage: sync_with_scip.sh <dir/to/scip> <benders source files>"
   exit 1
fi

SCIPPATH=`realpath $SCIPDIR`

# Checking whether the user is sure they want to update the SCIP directory
if [ "$UPDATE" = 1 ]
then
   echo "This action will update the SCIP directory with the BendersSCIP code."
   read -p "Are you sure you want to do this? [y/N]: " yn

   # the default is No
   case $yn in
      [Yy]* ) break;;
      [Nn]* ) exit;;
      * ) exit;;
   esac

   TOORFROM="to"
fi

echo "Syncing all Benders' decomposition framework source files $TOORFROM $SCIPPATH"

for file in `cat $BENDERSFILES`
do
   if [ "$UPDATE" = 0 ]
   then
      SOURCEDIR=$SCIPDIR
      DESTDIR=./
   else
      SOURCEDIR=./
      DESTDIR=$SCIPDIR
   fi

   SOURCEFILE=$SOURCEDIR/$file
   RELPATH=$(dirname "$file")

   # checking whether the source file exists.
   if [ ! -f $SOURCEFILE ]
   then
      echo "The source file: $SOURCEFILE, does not exist."
   else
      # if the file exists, then we call rsync to copy the file to the repository
      printf 'Syncing: %-45s -> %s\n' $SOURCEDIR$file $(basename $DESTDIR)/$file
      rsync $SOURCEFILE $DESTDIR/$RELPATH/
   fi
done

echo "Syncing of Benders' decomposition framework source files is completed"
