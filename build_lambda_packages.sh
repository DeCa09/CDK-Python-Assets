#!/bin/sh

set -e
echo ""
echo ""


# Build Lambda runtime code
echo "Building runtime code for AWS Lambda functions"
echo "=============================================="
cd lambda
PACKAGES="$(ls)"
for PACKAGE in $PACKAGES
do
  echo ""
  echo ">>>>> Building $PACKAGE..."
  cd "$PACKAGE"
  pipreqs .
  pip install -r requirements.txt -t .
  rm requirements.txt
  rm -f "$PACKAGE".zip
  zip -q -r "$PACKAGE".zip *
  cd ..
  echo ">>>>> Building $PACKAGE. done."
done