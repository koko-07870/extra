#!/bin/bash

rm -rf .repo/local_manifests

repo init -u https://github.com/kawaaii/pixelos-manifest.git -b fifteen-qpr1 --git-lfs

git clone https://github.com/koko-07870/local_manifests --depth 1 -b pos-a52 .repo/local_manifests

repo sync -c --force-sync --optimized-fetch --no-tags --no-clone-bundle --prune -j$(nproc --all)

# keys
rm -rf vendor/aosp/signing/keys
git clone https://github.com/koko-07870/extra -b tmp vendor/aosp/signing/keys

# start
source build/envsetup.sh

breakfast a52q && make installclean && mka bacon -j$(nproc --all)
