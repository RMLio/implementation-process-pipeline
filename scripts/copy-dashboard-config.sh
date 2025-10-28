#!/usr/bin/env bash

DIRECTORY=dashboard-config

if [ -d "$DIRECTORY" ]; then
  echo "$DIRECTORY exists."
  mv $DIRECTORY ap-data-to-dashboard/subprojects/miravi-a-linked-data-viewer/miravi-initial-config
else
  echo "$DIRECTORY doesn't exist. Using initial config."
fi

