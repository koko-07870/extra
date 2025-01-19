#!/bin/bash

rm -rf .repo/local_manifests

repo init -u https://github.com/PixelOS-AOSP/manifest.git -b fifteen --git-lfs

git clone https://github.com/koko-07870/local_manifests --depth 1 -b pos .repo/local_manifests

/opt/crave/resync.sh

rm -rf vendor/aosp/signing/keys

cd .repo/local_manifests
wget -O tmp.xml https://raw.githubusercontent.com/koko-07870/local_manifests/refs/heads/tmp/tmp.xml
cd -
repo sync extra

export BUILD_USERNAME=koko-07870
export BUILD_HOSTNAME=crave
echo "exported hostname"

source build/envsetup.sh

breakfast a52q && make installclean && mka bacon -j$(nproc --all)
