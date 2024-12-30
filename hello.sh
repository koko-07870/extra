#!/bin/bash

rm -rf .repo/local_manifests
rm -rf out/soong/*.glob*

repo init -u https://github.com/LineageOS/android.git -b lineage-22.1 --git-lfs

git clone https://github.com/koko-07870/local_manifests --depth 1 -b lineage .repo/local_manifests

repo sync -c -j66 --force-sync --no-clone-bundle --no-tags --optimized-fetch

source build/envsetup.sh
croot
brunch a52q
