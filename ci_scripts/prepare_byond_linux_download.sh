#!/bin/bash

mkdir build_linux
cd ./build_linux

THIS_SCRIPT_DIR=$( dirname $( realpath $0 ) )

$THIS_SCRIPT_DIR/download_and_extract.sh "https://www.byond.com/download/build/${BYOND_MAJOR}/${BYOND_MAJOR}.${BYOND_MINOR}_byond_linux.zip"
cd ./byond

# Create .sh files for each of the programs, that directs to `byondexec`. `byondexec` sets
# up the environment for us before running the program, so we don't need to do that
# ourselves.
cd ./bin
for file in $( find . -type f -executable ); do
	SCRIPT_FILE_NAME="${file}.sh"
	cp $THIS_SCRIPT_DIR/byond_linux_assets/byond_bin_exec.sh $SCRIPT_FILE_NAME
done
cd ..

# Delete some unnecessary files, to make the download smaller.
rm -r ./man/

# Preparation is done. Move out of the byond folder.
cd ..

# Finally, create the new zip file
zip -r byond_linux.zip byond/
