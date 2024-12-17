#!/bin/bash

rm -rf .repo/local_manifests
rm -rf device/samsung
rm -rf vendor/samsung
rm -rf hardware/samsung
rm -rf packages/apps/ViPER4AndroidFX
rm -rf vendor/extra
rm -rf kernel/samsung

repo init -u https://github.com/PixelOS-Fifteen/manifest.git -b fifteen --git-lfs

# local_manifests
git clone https://github.com/koko-07870/local_manifests --depth 1 -b pos-a52 .repo/local_manifests

# sync
/opt/crave/resync.sh

# keys
rm -rf vendor/aosp/signing/keys
git clone https://github.com/koko-07870/extra -b tmp vendor/aosp/signing/keys

# Export
export BUILD_USERNAME=koko-07870
export BUILD_HOSTNAME=crave
echo "exported hostname"

# start
source build/envsetup.sh

breakfast a52q && make installclean && mka bacon -j$(nproc --all)

# gofile-upload
FILE="out/target/product/a52q/PixelOS_a52q*.zip

SERVER=$(curl -s https://api.gofile.io/servers | jq -r '.data.servers[0].name')

LINK=$(curl -# -F "file=@$FILE" "https://${SERVER}.gofile.io/uploadFile" | jq -r '.data|.downloadPage') 2>&1

echo "$LINK"

echo
