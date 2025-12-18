#!/usr/bin/env bash

set -a # automatically export all variables
source urls.env
set +a

WORKDIR="dist"
mkdir -p $WORKDIR

if [ "$SHACL_URL" != "" -a "$AP_URL" != "" ]; then
  echo "AP url is $AP_URL"
  echo "SHACL url is $SHACL_URL"

  echo "Downloading SHACL"
  ./scripts/download-shacl.sh $SHACL_URL || exit 1

  echo "Adding AP and SHACL links to README"
  ./scripts/update-readme.sh $ap_url $shacl_url

  cd $WORKDIR
  ../scripts/clone-ap-data-to-dashboard.sh || exit 1
  cd ..

  echo "Copying shacl file in-shacl directory"
  cp in-shacl/* $WORKDIR/ap-data-to-dashboard/in-shacl

  cd $WORKDIR
  echo "Installing ap-data-to-dashboard"
  ../scripts/install-ap-data-to-dashboard.sh &> /dev/null || exit 1

  echo "Generating template and example data"
  cd ap-data-to-dashboard
  node src/shacl-to-template.js || exit 1

  echo "Moving template and example data"
  cp in-shacl/template.xlsx ../../template.xlsx
  cp in-shacl/template.schema.json ../../in-shacl/template.schema.json
  rm -rf ../example-data && mkdir ../../example-data
  cp in-shacl/dummy* ../../example-data
else
  echo "ERROR: AP url or SHACL url is not defined. Please update the file \"urls.env\"."
  exit 1
fi
