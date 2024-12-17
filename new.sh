#!/bin/bash


# sync
repo init -u https://github.com/ProjectPixelage/android_manifest.git -b 15 --git-lfs

git clone https://github.com/koko-07870/local_manifests --depth 1 -b test .repo/local_manifests

repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags --optimized-fetch --prune

source build/envsetup.sh

breakfast a52q && make installclean && mka bacon -j$(nproc --all)
