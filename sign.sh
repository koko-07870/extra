#!/bin/bash

rm -rf .repo/local_manifests
git clone https://github.com/koko-07870/local_manifests --depth 1 -b test .repo/local_manifests
repo sync -j$(nproc --all) --no-tags --no-clone-bundle --current-branch

rm -rf vendor/yaap/signing/keys
git clone https://github.com/koko-07870/extra -b tmp vendor/yaap/signing/keys

source build/envsetup.sh
export TARGET_BUILD_GAPPS=true
lunch yaap_a52q-user
m yaap -j $(nproc --all)

# gofile-upload
FILE="out/target/product/a52q/YAAP*.zip"

SERVER=$(curl -s https://api.gofile.io/servers | jq -r '.data.servers[0].name')

LINK=$(curl -# -F "file=@$FILE" "https://${SERVER}.gofile.io/uploadFile" | jq -r '.data|.downloadPage') 2>&1

echo "$LINK"

echo
