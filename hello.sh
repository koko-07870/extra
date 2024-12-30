#!/bin/bash
rm -rf .repo/local_manifests
rm -rf out/soong/*.glob*

git clone https://github.com/koko-07870/local_manifests --depth 1 -b lineage .repo/local_manifests

repo sync -c -j66 --force-sync --no-clone-bundle --no-tags --optimized-fetch

source build/envsetup.sh
export USE_CCACHE=1
export CCACHE_EXEC=/usr/bin/ccache
ccache -M 50G

breakfast a52q && mka bacon
