#!/bin/bash
rm -rf .repo/local_manifests
rm -rf out/soong/*.glob*

git clone https://github.com/koko-07870/local_manifests --depth 1 -b test .repo/local_manifests

repo sync -c -j66 --force-sync --no-clone-bundle --no-tags --optimized-fetch

rm -rf vendor/yaap/signing/keys
git clone https://github.com/koko-07870/extra -b tmp vendor/yaap/signing/keys

source build/envsetup.sh
lunch yaap_a52q-user && m yaap -j$(nproc --all)
