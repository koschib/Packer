#!/bin/bash

VERSION="v1.26.0"
DOWNLOAD_FILE="kubectl"
CHECKSUM_FILE="${DOWNLOAD_FILE}.sha256"

# download https://dl.k8s.io/release/v1.26.0/bin/linux/amd64/kubectl
wget "https://dl.k8s.io/release/${VERSION}/bin/${TARGETPLATFORM}/${DOWNLOAD_FILE}"
# download checksum file
wget "https://dl.k8s.io/release/${VERSION}/bin/${TARGETPLATFORM}/${CHECKSUM_FILE}"

# Validate the binary
echo "$(cat ${CHECKSUM_FILE})  ${DOWNLOAD_FILE}" | sha256sum -c -

if [ $? -eq 0 ]; then 
    # add execution permission
    chmod +x kubectl
else
    rm kubectl
fi
# clean up
rm ${CHECKSUM_FILE}

