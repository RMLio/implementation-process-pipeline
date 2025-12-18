#!/usr/bin/env bash

WORKDIR="dist"
BASE_URL="http://localhost:5500"

if compgen -G "data/*.xlsx" > /dev/null; then
  ./scripts/generate-rdf-build-miravi.sh $BASE_URL

  echo "1. Host RDF files via \"npx http-server $WORKDIR/output -p 5500 --cors true\""
  echo "2. Host Miravi via \"npx http-server $WORKDIR/docs -p 8080\""
  echo "3. Browse to http://localhost:8080"
else
  echo "No Excel files found in the data folder."
  exit 1
fi
