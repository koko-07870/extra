#!/bin/bash

rm -rf .repo/local_manifests
git clone https://github.com/koko-07870/local_manifests --depth 1 -b test .repo/local_manifests

repo sync -j$(nproc --all) --no-tags --no-clone-bundle --current-branch

rm -rf vendor/yaap/signing/keys
git clone https://github.com/koko-07870/extra -b tmp vendor/yaap/signing/keys

source build/envsetup.sh
export TARGET_BUILD_GAPPS=true
lunch yaap_a52q-user
m yaap -j $(nproc --all)
