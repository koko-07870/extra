#!/bin/bash

rm -rf .repo/local_manifests
rm -rf device/samsung
rm -rf vendor/samsung
rm -rf hardware/samsung
rm -rf packages/apps/ViPER4AndroidFX
rm -rf vendor/extra
rm -rf kernel/samsung

repo init -u https://github.com/PixelOS-Fifteen/manifest.git -b fifteen --git-lfs

git clone https://github.com/koko-07870/local_manifests --depth 1 -b pos .repo/local_manifests

# sync
/opt/crave/resync.sh

rm -rf vendor/aosp/signing/keys
git clone https://github.com/koko-07870/extra -b tmp vendor/aosp/signing/keys

# Export
export BUILD_USERNAME=koko-07870
export BUILD_HOSTNAME=crave
echo "------ Export Done ------"

source build/envsetup.sh

lunch aosp_a52q-ap3a-userdebug && make installclean && mka bacon -j$(nproc --all)
