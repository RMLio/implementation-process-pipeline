#!/usr/bin/env bash

echo "Setting up repo"
./scripts/set-up-repo.sh || exit 1

echo "Generating RDF and building Miravi"
./scripts/generate-rdf-build-miravi-locally.sh || exit 1

