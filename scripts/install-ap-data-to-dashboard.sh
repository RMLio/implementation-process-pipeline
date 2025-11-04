#!/usr/bin/env bash

cd ap-data-to-dashboard
npm i
npm run setup
node src/shacl-to-template.js
