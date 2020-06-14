#!/bin/bash
over=0.2.9
nver=0.2.10
sed -i "" "s/$over/$nver/g" k8s/pod.yaml
sed -i "" "s/$over/$nver/g" helm-src/values.yaml
cd helm-chart
helm dep up
./build.sh
./index.sh
cd ..

sed -i "" "s/$over/$nver/g" README.md
git add -A
git commit -m "$nver"