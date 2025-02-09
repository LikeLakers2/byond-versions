#!/bin/bash

mkdir build_windows
cd ./build_windows

THIS_SCRIPT_DIR=$( dirname $( realpath $0 ) )

bash $THIS_SCRIPT_DIR/download_and_extract.sh "https://www.byond.com/download/build/${BYOND_MAJOR}/${BYOND_MAJOR}.${BYOND_MINOR}_byond.zip"
cd ./byond

# Delete some unnecessary files, to make the download smaller
rm -r ./directx/
rm -r ./help/

# Preparation is done. Move out of the byond folder.
cd ..

# Finally, create the new zip file
zip -r byond_windows.zip byond/
