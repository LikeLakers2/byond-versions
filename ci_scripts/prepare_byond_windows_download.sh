#!/bin/bash
set -euo pipefail

THIS_SCRIPT_DIR=$( dirname $( realpath $0 ) )

mkdir build_windows
cd ./build_windows

bash -e $THIS_SCRIPT_DIR/download_and_extract.sh "https://www.byond.com/download/build/${BYOND_MAJOR}/${BYOND_MAJOR}.${BYOND_MINOR}_byond.zip"
cd ./byond

# Delete some unnecessary files, to make the download smaller
rm -r ./directx/
rm -r ./help/

# Preparation is done. Move out of the byond folder.
cd ..

# Finally, create the new zip file
zip -rq byond_windows.zip byond/
