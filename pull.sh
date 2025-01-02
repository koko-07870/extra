#!/bin/bash

DIRROM="pos/"
# Check if the directory exists
if [ -d "$DIRROM" ]; then
    echo "Directory $DIRROM exists."
    cd "$DIRROM"
    rm .repo/manifests/crave.yaml* || true; # Removes existing crave.yamls
    curl -o .repo/manifests/crave.yaml https://raw.githubusercontent.com/sounddrill31/crave_aosp_builder/main/configs/crave/crave.yaml.aosp # Downloads crave.yaml
    echo "--------------cloned crave yaml---------------"
    crave pull out/target/product/a52q/PixelOS*.zip
    crave pull out/build_date.txt
    echo "-----done------"
else
    echo "Directory $DIRROM does not exist. now creating."
    crave clone create --projectID 82 /crave-devspaces/pos
    cd "$DIRROM"
    rm .repo/manifests/crave.yaml* || true; # Removes existing crave.yamls
    curl -o .repo/manifests/crave.yaml https://raw.githubusercontent.com/sounddrill31/crave_aosp_builder/main/configs/crave/crave.yaml.aosp # Downloads crave.yaml
    echo "--------------cloned crave yaml---------------"
    crave pull out/target/product/a52q/PixelOS*.zip
    crave pull out/build_date.txt
    echo "-----done------"
fi
