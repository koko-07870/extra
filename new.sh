#!/bin/bash

rm -rf .repo/local_manifests
rm -rf out/soong/*.glob*

repo init -u https://github.com/kawaaii/pixelos-manifest.git -b fifteen-qpr1 --git-lfs

git clone https://github.com/koko-07870/local_manifests --depth 1 -b pos-a52 .repo/local_manifests

repo sync -c -j66 --force-sync --no-clone-bundle --no-tags --optimized-fetch

rm -rf vendor/aosp/signing/keys
git clone https://github.com/koko-07870/extra -b tmp vendor/aosp/signing/keys

export BUILD_USERNAME=koko-07870

source build/envsetup.sh

breakfast a52q && make installclean && mka bacon -j$(nproc --all)
