#!/bin/bash
rm -rf vendor/extra
git clone https://github.com/koko-07870/vendor_extra -b main vendor/extra
rm -rf vendor/qcom/opensource/libfmjni/Android.bp
cd vendor/qcom/opensource/libfmjni
wget -O Android.mk https://raw.githubusercontent.com/LineageOS/android_vendor_qcom_opensource_libfmjni/e33227ed63c6b8e7df0b638f556bf14fa99acd83/Android.mk
cd -
source build/envsetup.sh
lunch aosp_a52q-ap2a-userdebug
make CertifiedPropsOverlay
