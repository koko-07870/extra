#!/bin/bash

repo init -u repo init -u https://github.com/yaap/manifest.git -b fifteen --git-lfs

# local_manifests
git clone https://github.com/koko-07870/local_manifests --depth 1 -b test .repo/local_manifests

# sync
repo sync -j$(nproc --all) --no-tags --no-clone-bundle --current-branch

# keys
rm -rf vendor/yaap/signing/keys
git clone https://github.com/koko-07870/extra -b tmp vendor/yaap/signing/keys

# start
source build/envsetup.sh
export TARGET_BUILD_GAPPS=true
lunch yaap_a52q-user
make installclean && m yaap -j$(nproc --all)
