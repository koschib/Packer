#!/bin/bash

VERSION="2.6.7"

DOWNLOAD_PLATFORM="${TARGETPLATFORM/\//-}"
DOWNLOAD_FILE="argocd-${DOWNLOAD_PLATFORM}"
CHECKSUM_FILE="argocd-${VERSION}-checksums.txt"

# download https://github.com/argoproj/argo-cd/releases/download/v2.6.7/argocd-linux-amd64
wget "https://github.com/argoproj/argo-cd/releases/download/v${VERSION}/${DOWNLOAD_FILE}"
# dowload https://github.com/argoproj/argo-cd/releases/download/v2.6.7/argocd-2.6.7-checksums.txt
wget "https://github.com/argoproj/argo-cd/releases/download/v${VERSION}/${CHECKSUM_FILE}"

# Validate the binary
grep -i "${DOWNLOAD_FILE}" ${CHECKSUM_FILE} | sha256sum -c -

if [ $? -eq 0 ]; then 
    install -m 555 argocd-linux-amd64 argocd
fi

# clean up
rm ${DOWNLOAD_FILE}
rm ${CHECKSUM_FILE}

