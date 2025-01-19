#!/bin/bash

rm -rf .repo/local_manifests

repo init -u https://github.com/yaap/manifest.git -b fifteen --git-lfs

git clone https://github.com/koko-07870/local_manifests --depth 1 -b yaap .repo/local_manifests

/opt/crave/resync.sh

rm -rf vendor/yaap/signing/keys
rm -rf .repo/local_manifests
git clone https://github.com/koko-07870/local_manifests -b tmp .repo/local_manifests
repo sync extra

export BUILD_USERNAME=koko-07870
export BUILD_HOSTNAME=crave
echo "exported hostname"

source build/envsetup.sh

lunch yaap_a52q-user && m installclean && m yaap
