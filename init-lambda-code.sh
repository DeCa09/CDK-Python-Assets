#!/bin/sh

set -e

PROJECT_ROOT_DIR=$PWD

if [ $# -ne 2 ]; then
    echo "Illegal number of arguments."
    echo "2 arguments were expected, $# given."
    echo "Usage: init-lambda-code.sh <COMPONENT_NAME> <PACKAGE_NAME>"
    exit 1
fi

COMPONENT_NAME=$1
PACKAGE_NAME=$2


if [ -d "$COMPONENT_NAME"/runtime ]; then
    # Control will enter here if $COMPONENT_NAME exists.
    echo "Component folder does exist already."
else
    echo "Component folder does not exist yet."
    mkdir -p "$COMPONENT_NAME"/"runtime"
fi


cd "$COMPONENT_NAME"/runtime
mkdir -p "$PACKAGE_NAME"
cp "$PROJECT_ROOT_DIR"/templates/dummy/dummy.py \
    "$PACKAGE_NAME"/"$PACKAGE_NAME".py
