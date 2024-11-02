#!/bin/bash
rm -rf vendor/extra
git clone https://github.com/koko-07870/vendor_extra -b main vendor/extra
rm -rf device/samsung/sm7125-common/common.mk
cd device/samsung/sm7125-common
wget -O common.mk https://raw.githubusercontent.com/koko-07870/device_samsung_sm7125-common/refs/heads/fourteen/common.mk
cd -
rm -rf packages/apps/FMRadio
rm -rf vendor/qcom/opensource/libfmjni
. build/envsetup.sh
lunch aosp_a52q-ap2a-userdebug
make CertifiedPropsOverlay
