#!/bin/bash
rm -rf vendor/extra
git clone https://github.com/koko-07870/vendor_extra -b main vendor/extra
rm -rf vendor/qcom/opensource/libfmjni/Android.bp
wget -O Android.bp https://raw.githubusercontent.com/koko-07870/scripts/refs/heads/main/Android.bp
source build/envsetup.sh
lunch aosp_a52q-ap2a-userdebug
make CertifiedPropsOverlay
