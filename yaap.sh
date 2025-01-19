#!/bin/bash

rm -rf .repo/local_manifests

repo init -u https://github.com/yaap/manifest.git -b fifteen --git-lfs

git clone https://github.com/koko-07870/local_manifests --depth 1 -b yaap .repo/local_manifests

/opt/crave/resync.sh

rm -rf vendor/yaap/signing/keys
git clone https://github.com/koko-07870/extra -b tmp vendor/yaap/signing/keys

rm -rf packages/apps/FastCharge
git clone https://github.com/yaap/packages_apps_FastCharge -b fifteen packages/apps/FastCharge

rm -rf hardware/qcom-caf/common
git clone https://github.com/LineageOS/android_hardware_qcom-caf_common -b lineage-22.1 hardware/qcom-caf/common

export BUILD_USERNAME=koko-07870
export BUILD_HOSTNAME=crave
echo "exported hostname"

source build/envsetup.sh

lunch yaap_a52q-user && m installclean && m yaap
