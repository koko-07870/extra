#!/bin/bash

# local_manifests
rm -rf .repo/local_manifests

# sync
repo sync -j$(nproc --all) --no-tags --no-clone-bundle --force-sync --current-branch
