#!/usr/bin/env bash

WORKDIR="dist"
BASE_URL=$1

rm -rf $WORKDIR
mkdir $WORKDIR

cd $WORKDIR

echo "Cloning ap-data-to-dashboard"
git clone --revision=2bb5bd334f8d708d1e337eb7c4a9251856c636d1 --depth 1 https://github.com/RMLio/ap-data-to-dashboard.git ap-data-to-dashboard
rm -rf ap-data-to-dashboard/in
mkdir ap-data-to-dashboard/in

echo "Copying ../data/* to ap-data-to-dashboard/in"
cp ../data/* ap-data-to-dashboard/in

echo "Copying ../in-shacl/* to ap-data-to-dashboard/in-shacl"
cp ../in-shacl/* ap-data-to-dashboard/in-shacl

echo "Installing ap-data-to-dashboard"
cd ap-data-to-dashboard
npm i
npm run setup
cd ..

echo "Copying dashboard config"
rm -rf ap-data-to-dashboard/miravi-initial-config
mkdir ap-data-to-dashboard/miravi-initial-config
cp -r ../dashboard-config/* ap-data-to-dashboard/miravi-initial-config

echo "Running ap-data-to-dashboard"
cd ap-data-to-dashboard
./run.sh -u $BASE_URL
cd ..

echo "Moving Miravi dist to docs"
rm -rf docs && mkdir docs
mv ap-data-to-dashboard/node_modules/miravi/main/dist/* docs

echo "Moving RDF and mappings"
rm -rf output
mkdir output
rm -rf mappings
mkdir mappings
mv ap-data-to-dashboard/out/serve-me/* output/
mv ap-data-to-dashboard/out/*.rml.ttl mappings/
mv ap-data-to-dashboard/out/*.yml mappings/
