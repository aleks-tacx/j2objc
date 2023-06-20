#!/bin/bash
echo "Will prepare J2ObjC headers."
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
cd $SCRIPT_DIR/../dist/frameworks
INCLUDE_DIR_NAME=Include
rm -rf $INCLUDE_DIR_NAME

function populateHeaders() {
    echo "Current dir `pwd`"
    echo "Populate headers for $1"
    BASE_NAME=$( basename -- "${1%.*}" )
    NEW_DIR_NAME=${2}/$BASE_NAME
    mkdir -p $NEW_DIR_NAME
    cp -R $1/Headers/. $NEW_DIR_NAME
}

export -f populateHeaders
find . -name "*.xcframework" -type d -exec bash -c "populateHeaders {} $INCLUDE_DIR_NAME" \;
zip -r ${INCLUDE_DIR_NAME}.zip $INCLUDE_DIR_NAME
rm -rf $INCLUDE_DIR_NAME
