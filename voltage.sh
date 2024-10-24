#!/bin/bash

rm -rf .repo/local_manifests
rm -rf device/samsung
rm -rf vendor/samsung
rm -rf hardware/samsung
rm -rf kernel/samsung
rm -rf packages/apps/ViPER4AndroidFX

repo init -u https://github.com/VoltageOS-staging/manifest.git -b 15 --git-lfs

git clone https://github.com/koko-07870/local_manifests --depth 1 -b voltage .repo/local_manifests

# sync
/opt/crave/resync.sh

# keys
cd vendor/voltage-priv/keys
./gen_keys

# Some Patches
rm -rf vendor/voltage/build/soong/Android.bp
cd vendor/voltage/build/soong
wget -O Android.bp https://raw.githubusercontent.com/koko-07870/scripts/refs/heads/voltage/Android.bp
cd -

cd vendor/voltage/config
wget -O device_framework_matrix.xml https://raw.githubusercontent.com/DerpFest-AOSP/vendor_derp/refs/heads/15/config/device_framework_matrix.xml
cd -

# Export
export BUILD_USERNAME=koko-07870
export BUILD_HOSTNAME=crave
echo "======= Export Done ======"

source build/envsetup.sh

lunch voltage_a52q-ap3a-user && make installclean && m bacon
