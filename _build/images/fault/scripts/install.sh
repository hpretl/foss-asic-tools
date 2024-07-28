#!/bin/bash
set -e
cd /tmp || exit 1

mkdir -p "${TOOLS}/${FAULT_NAME}"
git clone --filter=blob:none "${FAULT_REPO_URL}" "${FAULT_NAME}"
cd "${FAULT_NAME}"
git checkout "${FAULT_REPO_COMMIT}"
git submodule update --init --recursive
echo "[INFO] Compiling Fault using Swift."
export PATH=/tmp/swift/usr/bin:$PATH
INSTALL_DIR=${TOOLS}/${FAULT_NAME} swift build -c release --static-swift-stdlib
