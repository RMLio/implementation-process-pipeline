#!/usr/bin/env bash

cd ap-data-to-dashboard
npm i
npm run setup
rm -rf subprojects && mkdir subprojects && pushd subprojects
git clone -b v2.1.1 https://github.com/SolidLabResearch/miravi-a-linked-data-viewer.git
(cd miravi-a-linked-data-viewer/main && npm i)
popd
