#!/bin/bash

set -e

UBUNTU_VERSION=$(lsb_release -r -s)

# Install Swift
_install_swift () {
	echo "[INFO] Installing Swift."
	cd /tmp
	SWIFT_VERSION=5.10.1
	if [[ $UBUNTU_VERSION == 22.04 ]]; then
		if [ "$(arch)" == "x86_64" ]; then
			echo "[INFO] Platform is x86_64, 22.04"
			wget --no-verbose https://download.swift.org/swift-${SWIFT_VERSION}-release/ubuntu2204/swift-${SWIFT_VERSION}-RELEASE/swift-${SWIFT_VERSION}-RELEASE-ubuntu22.04.tar.gz
			tar xzf swift-${SWIFT_VERSION}-RELEASE-ubuntu22.04.tar.gz
			mv swift-${SWIFT_VERSION}-RELEASE-ubuntu22.04 /tmp/swift
		elif [ "$(arch)" == "aarch64" ]; then
			echo "[INFO] Platform is aarch64, 22.04"
			wget --no-verbose https://download.swift.org/swift-${SWIFT_VERSION}-release/ubuntu2204-aarch64/swift-${SWIFT_VERSION}-RELEASE/swift-${SWIFT_VERSION}-RELEASE-ubuntu22.04-aarch64.tar.gz
			tar xzf swift-${SWIFT_VERSION}-RELEASE-ubuntu22.04-aarch64.tar.gz
			mv swift-${SWIFT_VERSION}-RELEASE-ubuntu22.04-aarch64 /tmp/swift
		else
			echo "[ERROR] Unknown platform"
			exit 1
		fi
	else
		echo "[ERROR] Unknown Ubuntu version"
		exit 1
	fi
}
_install_swift
