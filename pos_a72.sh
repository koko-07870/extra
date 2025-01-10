#!/bin/bash

rm -rf .repo/local_manifests
rm -rf out/soong/*.glob*

repo init -u https://github.com/PixelOS-AOSP/manifest.git -b fifteen --git-lfs

git clone https://github.com/koko-07870/local_manifests --depth 1 -b pos-a72 .repo/local_manifests

/opt/crave/resync.sh

rm -rf vendor/aosp/signing/keys
git clone https://github.com/koko-07870/extra -b tmp vendor/aosp/signing/keys

export BUILD_USERNAME=koko-07870
export BUILD_HOSTNAME=crave
echo "exported hostname"

source build/envsetup.sh

breakfast a72q && make installclean && mka bacon -j$(nproc --all)