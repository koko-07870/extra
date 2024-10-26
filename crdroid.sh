#!/bin/bash

rm -rf .repo/local_manifests
rm -rf device/samsung
rm -rf vendor/samsung
rm -rf hardware/samsung

repo init -u https://github.com/crdroidandroid/android.git -b 15.0 --git-lfs

git clone https://github.com/koko-07870/local_manifests --depth 1 -b crdroid .repo/local_manifests

# sync
/opt/crave/resync.sh

# Export
export BUILD_USERNAME=koko-07870
export BUILD_HOSTNAME=crave
echo "======= Export Done ======"

source build/envsetup.sh

brunch a52q
