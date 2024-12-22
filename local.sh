#!/bin/bash

rm -rf .repo/local_manifests
rm -rf device/samsung
rm -rf vendor/samsung
rm -rf hardware/samsung
rm -rf packages/apps/ViPER4AndroidFX
rm -rf vendor/extra
rm -rf kernel/samsung
rm -rf out/soong/*.glob*

repo init -u repo init -u https://github.com/yaap/manifest.git -b fifteen --git-lfs

# local_manifests
git clone https://github.com/koko-07870/local_manifests --depth 1 -b test .repo/local_manifests

# sync
/opt/crave/resync.sh

# keys
rm -rf vendor/yaap/signing/keys
git clone https://github.com/koko-07870/extra -b tmp vendor/yaap/signing/keys

rm -rf vendor/qcom/opensource/power/power.xml
rm -rf vendor/qcom/opensource/power/Android.mk
cd vendor/qcom/opensource/power/
wget -O Android.mk https://raw.githubusercontent.com/koko-07870/extra/refs/heads/spark/Android.mk.txt
cd ..

# Export
export BUILD_USERNAME=koko-07870
export BUILD_HOSTNAME=crave
echo "exported hostname"

# start
source build/envsetup.sh
export TARGET_BUILD_GAPPS=true
lunch yaap_a52q-user
make installclean && m yaap -j$(nproc --all)
