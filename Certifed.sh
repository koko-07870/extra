#!/bin/bash
rm -rf vendor/extra
git clone https://github.com/koko-07870/vendor_extra -b main vendor/extra
cd vendor/extra
make CertifiedPropsOverlay
