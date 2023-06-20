#!/bin/bash
echo "Will prepare the generated XCFrameworks to work with SPM."
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
cd $SCRIPT_DIR/../dist/frameworks
echo "Changing files in `pwd`"
find . -name module.modulemap -type f -delete -print
find . -name Info.plist -type f -exec bash -c "python3 $SCRIPT_DIR/modify_info_plist.py \"{}\"" \;

