#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
cd $SCRIPT_DIR/../dist/frameworks
find . -name "*.xcframework" -type d -exec bash -c "zip -r {}.zip {}" \;
