#!/bin/sh

set -e

if [ $# -eq 0 ]; then
    echo "No arguments provided."
    echo "Usage: init-lambda-code.sh <PACKAGE_NAME>"
    exit 1
fi

PACKAGE_NAME=$1

cd lambda
mkdir -p "$PACKAGE_NAME"
cp dummy/dummy.py "$PACKAGE_NAME"/"$PACKAGE_NAME".py
