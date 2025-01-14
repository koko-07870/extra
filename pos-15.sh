#!/bin/bash

rm -rf .repo/local_manifests

repo init -u https://github.com/PixelOS-AOSP/manifest.git -b fifteen --git-lfs

git clone https://github.com/koko-07870/local_manifests --depth 1 -b pos .repo/local_manifests

/opt/crave/resync.sh

rm -rf vendor/aosp/signing/keys
git clone https://github.com/koko-07870/extra -b tmp vendor/aosp/signing/keys

export BUILD_USERNAME=koko-07870
export BUILD_HOSTNAME=crave
echo "exported hostname"

source build/envsetup.sh

breakfast a52q && make installclean && mka bacon -j$(nproc --all)
# breakfast a72q && make installclean && mka bacon -j$(nproc --all)

curl bashupload.com -T out/target/product/*/PixelOS*.zip
