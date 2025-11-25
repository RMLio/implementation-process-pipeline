#!/usr/bin/env bash

CURRENT_BRANCH=$1

if [[ "$CURRENT_BRANCH" == "main" ]]; then
  echo "Not using subdirectory because branch is main."
  mv ap-data-to-dashboard/node_modules/miravi/main/dist/* gh-pages
else
  echo "Using subdirectory because branch is not main."
  mkdir -p gh-pages/$CURRENT_BRANCH
  mv ap-data-to-dashboard/node_modules/miravi/main/dist/* gh-pages/$CURRENT_BRANCH
fi
