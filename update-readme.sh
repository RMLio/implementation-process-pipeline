#!/usr/bin/env bash

FILE=README.md
BACKUP_FILE=original-README.md

if [[ -f "$BACKUP_FILE" ]]; then
  echo "$FILE is already updated."
else
  echo "Updating $FILE."
  cat $FILE | sed "s/{{AP-URL}}/$1/g" | sed "s/{{SHACL-URL}}/$2/g" > temp.md
  cp $FILE $BACKUP_FILE
  mv temp.md $FILE
fi
