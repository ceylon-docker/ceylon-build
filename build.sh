#!/bin/bash

set -e

if [[ -f /output/.novolume ]]; then
    echo "WARNING: Missing -v /your/output/path:/output argument to docker, output will be lost"
    sleep 3
fi

if [[ -z "$1" ]]; then
    echo "Missing Ceylon version argument"
    exit
fi

CEYLON_VERSION=$1
SHA=$(git ls-remote -t https://github.com/ceylon/ceylon.git ${CEYLON_VERSION} | cut -f 1)
BUILDID=$(echo ${SHA} | cut -c1-7)
wget "https://github.com/ceylon/ceylon/archive/${BUILDID}.zip"
unzip ${BUILDID}.zip
cd ceylon-${SHA}
ant -Dbuildid=${BUILDID} clean clean-packages release
sudo cp -a dist/ceylon-${CEYLON_VERSION}.zip /output

