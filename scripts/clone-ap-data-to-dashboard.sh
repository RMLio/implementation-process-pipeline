#!/usr/bin/env bash

DIRECTORY="ap-data-to-dashboard"

if [ -d "$DIRECTORY" ]; then
  echo "Folder $DIRECTORY already exists, so no cloning"
else
  echo "Cloning ap-data-to-dashboard"
  git clone --depth 1 https://github.com/RMLio/ap-data-to-dashboard.git $DIRECTORY
fi

