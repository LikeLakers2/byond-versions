#!/bin/bash
set -euo pipefail

THIS_SCRIPT_DIR="$( dirname $( realpath $0 ) )"

mkdir build_linux
cd ./build_linux

bash $THIS_SCRIPT_DIR/download_and_extract.sh "https://www.byond.com/download/build/${BYOND_MAJOR}/${BYOND_MAJOR}.${BYOND_MINOR}_byond_linux.zip"
cd ./byond

# Create .sh files for each of the programs, that directs to `byondexec`. `byondexec` sets
# up the environment for us before running the program, so we don't need to do that
# ourselves.
mkdir bin_redirects
for BYOND_EXECUTABLE in $( find ./bin -type f -executable ); do
	EXEC_NAME="$( basename $BYOND_EXECUTABLE )"
	EXEC_NAME_WITHOUT_EXTENSION="${EXEC_NAME%.*}"
	if [ "$EXEC_NAME" != "$EXEC_NAME_WITHOUT_EXTENSION" ]; then
		# We have a file whose filename ends in an extension.
		# We assume it's not actually an executable, so we skip it.
		echo "Skipping $EXEC_NAME (Didn't match $EXEC_NAME_WITHOUT_EXTENSION)"
		continue
	fi
	echo "Writing redirection script for $EXEC_NAME"
	SCRIPT_FILE_NAME="$EXEC_NAME"
	cp $THIS_SCRIPT_DIR/byond_linux_assets/byond_bin_exec ./bin_redirects/$SCRIPT_FILE_NAME
	chmod +x ./bin_redirects/$SCRIPT_FILE_NAME
done

# Delete some unnecessary files, to make the download smaller.
rm -r ./man/

# Preparation is done. Move out of the byond folder.
cd ..

# Finally, create the new zip file
zip -rq byond_linux.zip byond/
