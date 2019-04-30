#!/usr/bin/env bash
pushd $(git rev-parse --show-toplevel)
VERSION=$(date +%Y-%m-%d)
echo $VERSION > VERSION
git commit -am "release $VERSION"
git tag $VERSION 
popd
