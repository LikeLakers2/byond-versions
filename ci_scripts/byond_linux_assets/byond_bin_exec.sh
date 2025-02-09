#!/bin/sh
THIS_SCRIPT_DIR=$( dirname $( realpath $0 ) )
BYOND_EXEC="$THIS_SCRIPT_DIR/byondexec"

THIS_SCRIPT_NAME=$( basename $0 )
BYOND_PROGRAM_TO_EXEC="$THIS_SCRIPT_DIR/${THIS_SCRIPT_NAME%.*}"

shift 1

"$BYOND_EXEC" "$BYOND_PROGRAM_TO_EXEC" "$@"
