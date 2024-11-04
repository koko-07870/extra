#!/bin/bash

rm -rf .repo/local_manifests
rm -rf device/samsung
rm -rf vendor/samsung
rm -rf hardware/samsung
rm -rf packages/apps/ViPER4AndroidFX
rm -rf vendor/extra
rm -rf kernel/samsung

repo init -u https://github.com/PixelOS-AOSP/manifest.git -b fourteen --git-lfs

git clone https://github.com/koko-07870/local_manifests --depth 1 -b pos .repo/local_manifests

# sync
/opt/crave/resync.sh

rm -rf vendor/aosp/signing/keys
git clone https://github.com/koko-07870/scripts -b tmp vendor/aosp/signing/keys

# Some ota Patches
rm -rf vendor/aosp/build/core/main_version.mk
cd vendor/aosp/build/core
wget -O main_version.mk https://raw.githubusercontent.com/koko-07870/scripts/refs/heads/pos/main_version.mk
cd -

rm -rf vendor/aosp/config/ota.mk
cd vendor/aosp/config
wget -O ota.mk https://raw.githubusercontent.com/koko-07870/scripts/refs/heads/pos/ota.mk
cd -

rm -rf packages/apps/Updates/app/src/main/java/net/pixelos/ota/misc/Constants.java
cd packages/apps/Updates/app/src/main/java/net/pixelos/ota/misc
wget -O Constants.java https://raw.githubusercontent.com/koko-07870/scripts/refs/heads/pos/Constants.java
cd -

# temp
rm -rf packages/apps/FMRadio
rm -rf vendor/qcom/opensource/libfmjni

# Export
export BUILD_USERNAME=koko-07870
export BUILD_HOSTNAME=crave
echo "======= Export Done ======"

source build/envsetup.sh

lunch aosp_a52q-ap2a-userdebug && make installclean && mka bacon
