#!/usr/bin/env bash

TEST_FILE="install-setup-done"

cd ap-data-to-dashboard

if [ -f "$TEST_FILE" ]; then
  echo "Installation and setup already done"
else
  npm i &> /dev/null
  npm run setup &> /dev/null
  touch $TEST_FILE
fi

cd ..
