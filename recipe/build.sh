#!/bin/bash

BASE_URL="https://repo.anaconda.com/pkgs"
NAME=fake_r
CHANNEL_NAME="r"
URL=${BASE_URL}/${CHANNEL_NAME}

for platform in win-64 linux-64 osx-64 noarch
do 
  
  mkdir -p $PREFIX/$NAME/$platform

  # without this file - conda is very slow on windows
  echo "{}" >> $PREFIX/$NAME/$platform/current_repodata.json

  curl -o $PREFIX/$NAME/$platform/repodata.json $URL/$platform/repodata.json
  curl -o $PREFIX/$NAME/$platform/patch_instructions.json $URL/$platform/patch_instructions.json
  curl -o $PREFIX/$NAME/$platform/repodata_from_packages.json $URL/$platform/repodata_from_packages.json
done
