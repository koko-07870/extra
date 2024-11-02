#!/bin/bash
rm -rf vendor/extra
git clone https://github.com/koko-07870/vendor_extra -b main vendor/extra
rm -rf vendor/qcom/opensource/libfmjni
git clone https://github.com/LineageOS/android_vendor_qcom_opensource_libfmjni -b lineage-21.0 vendor/qcom/opensource/libfmjni
source build/envsetup.sh
lunch aosp_a52q-ap2a-userdebug
make CertifiedPropsOverlay
