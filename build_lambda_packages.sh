#!/bin/sh

set -e
echo ""
echo ""


# Build Lambda runtime code
echo "Building runtime code for AWS Lambda functions"
echo "=============================================="
echo ""



PROJECT_ROOT_DIR=$PWD
RUNTIME_ROOT_PACKAGES="$(find ${PROJECT_ROOT_DIR} -type d -name "runtime")"


for package in $RUNTIME_ROOT_PACKAGES
do
  cd $package

  PACKAGES="$(ls)"
  for PACKAGE in $PACKAGES
  do
    echo ">>>>> Building '$PACKAGE' package..."
    cd "$PACKAGE" 
    rm -rf */  # removes all sub-folders of the package (these might contain previously installed dependencies)
    rm -f "$PACKAGE".zip 
    pipreqs . --force &> /dev/null
    pip install -q -r requirements.txt -t . --disable-pip-version-check 
    rm requirements.txt
    zip -q -r "$PACKAGE".zip *
    cd ..
    echo ">>>>> Package '$PACKAGE' has been built."
    echo "=============================================="
    echo ""
  done
  cd $PROJECT_ROOT_DIR
  

done

