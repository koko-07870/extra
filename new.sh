#!/bin/bash

rm -rf .repo/local_manifests

# sync
repo sync -c --force-sync --optimized-fetch --no-tags --no-clone-bundle --prune -j$(nproc --all)

rm -rf vendor/yaap/signing/keys
