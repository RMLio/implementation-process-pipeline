#!/usr/bin/env bash

FILE=shacl.ttl

if [[ -f "$FILE" ]]; then
  echo "$FILE already exists."
else
  echo "Downloading SHACL."
  curl -L "$1" -o $FILE
fi

