#!/bin/bash

rm -rf .repo/local_manifests

repo init -u https://github.com/yaap/manifest.git -b fifteen --git-lfs

# local_manifests
git clone https://github.com/koko-07870/local_manifests --depth 1 -b test .repo/local_manifests

# sync
repo sync -c --force-sync --optimized-fetch --no-tags --no-clone-bundle --prune -j$(nproc --all)

# keys
rm -rf vendor/yaap/signing/keys
git clone https://github.com/koko-07870/extra -b tmp vendor/yaap/signing/keys

# start
source build/envsetup.sh
lunch yaap_a52q-user
make installclean && m yaap -j$(nproc --all)
