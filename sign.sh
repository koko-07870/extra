#!/bin/bash

repo init -u https://github.com/yaap/manifest.git -b fifteen --git-lfs

git clone https://github.com/koko-07870/local_manifests --depth 1 -b test .repo/local_manifests

# sync
repo sync -j$(nproc --all) --no-tags --no-clone-bundle --current-branch
