#!/bin/bash
# ***************************************************************************************
# Script to update the Android 10 minimal manifest (with "repo sync")
# - Author:  DarthJabba9
# - Version: 001
# - Date:    03 November 2020
# ***************************************************************************************

MANIFEST_10_DIR="fox_10_manifest"

# print message and quit
abort() {
  echo "$@"
  exit
}

# is the fox_10 manifest directory supplied from the command line?
if [ -n "$1" ]; then 
   MANIFEST_10_DIR="$1"
   [ "$1" = "." ] && MANIFEST_10_DIR="$PWD"
fi

# test whether it is valid
if [ ! -d $MANIFEST_10_DIR ]; then
   abort "Syntax = $0 <fox_10_manifest_directory>"
fi

cd $MANIFEST_10_DIR
[ "$?" != "0" ] && abort "- Invalid directory: $MANIFEST_10_DIR"

# some more rudimentary checks
echo "- Checking the directory ($MANIFEST_10_DIR) for validity"
if [ ! -d bootable/ -o ! -d external/ -o ! -d bionic/ -o ! -d system/ -o ! -d toolchain/ ]; then
   abort "- Invalid manifest directory: $MANIFEST_10_DIR"
fi
LOC="$PWD"
echo "- Done."

# move the OrangeFox "bootable" directory
echo "- Backing up the OrangeFox recovery sources"
BACKUPDIR="fox_bootable"
[ -d $BACKUPDIR ] && rm -rf $BACKUPDIR

mv bootable/ $BACKUPDIR
[ "$?" != "0" ] && abort "- Error backing up the OrangeFox recovery sources"
echo "- Done."

# re-sync
echo "- Updating the manifest ..."
repo sync
echo "- Done."

echo "- Restoring the OrangeFox recovery sources ..."
# remove the TWRP bootable/
rm -rf bootable/

# restore the OrangeFox bootable directory
mv $BACKUPDIR bootable/
echo "- Done."

# Update OrangeFox sources
echo "- Updating the OrangeFox recovery sources ..."
cd $LOC/bootable/recovery
git pull
echo "- Done."

# Update OrangeFox vendor tree
echo "- Updating the OrangeFox vendor tree ..."
cd $LOC/vendor/recovery
git pull
echo "- Done."

# Finished
echo "- Finished! You need to update your device tree(s) manually."
#
