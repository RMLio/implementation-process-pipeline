#!/usr/bin/env bash

CURRENT_BRANCH=$0
USE_DIST=$1

echo $CURRENT_BRANCH
echo $USE_DIST

if [[ "$CURRENT_BRANCH" == "main" ]]; then
  echo "Not using subdirectory because branch is main."

  if [[ "$USE_DIST" == "true" ]]; then
    mv ap-data-to-dashboard/node_modules/miravi/main/dist/* gh-pages
  else
    cp scripts/dashboard-placeholder.html gh-pages/index.html
  fi
else
  echo "Using subdirectory because branch is not main."
  mkdir -p gh-pages/$CURRENT_BRANCH

  if [[ "$USE_DIST" == "true" ]]; then
    mv ap-data-to-dashboard/node_modules/miravi/main/dist/* gh-pages/$CURRENT_BRANCH
  else
    cp scripts/dashboard-placeholder.html gh-pages/$CURRENT_BRANCH/index.html
  fi
fi
