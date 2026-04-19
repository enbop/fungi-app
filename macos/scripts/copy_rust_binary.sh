#!/bin/bash

# Script to copy or link Rust binary to Flutter macOS build
set -e

echo "========== Copying Rust Binary =========="

# Paths
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_ROOT="${SCRIPT_DIR}/../.."
source "${REPO_ROOT}/scripts/core_artifacts.sh"

CHANNEL="${FUNGI_APP_CHANNEL:-nightly}"
ARCH="${FUNGI_CORE_ARCH:-${CURRENT_ARCH:-$(uname -m)}}"
if [ "${ARCH}" = "undefined_arch" ]; then
    ARCH="${ARCHS:-$(uname -m)}"
fi
ARCH="${ARCH%% *}"

RUST_BINARY_PATH="${REPO_ROOT}/$(fungi_core_desktop_binary_path "${CHANNEL}" "macos" "${ARCH}")"
DEST_DIR="${BUILT_PRODUCTS_DIR}/${PRODUCT_NAME}.app/Contents/Resources"
DEST_BINARY="${DEST_DIR}/fungi"

echo "Source: ${RUST_BINARY_PATH}"
echo "Destination: ${DEST_BINARY}"

# Check if Rust binary exists
if [ ! -f "${RUST_BINARY_PATH}" ]; then
    echo "Error: Rust binary not found at ${RUST_BINARY_PATH}"
    echo "Please ensure 'fungi-artifacts/${CHANNEL}/macos/$(fungi_core_normalize_arch "${ARCH}")/fungi' exists in the project root."
    exit 1
fi

# Create destination directory
mkdir -p "${DEST_DIR}"

# Check if we need to copy
SHOULD_COPY=true
if [ -f "${DEST_BINARY}" ]; then
    # Compare size and modification time (macOS stat syntax)
    SRC_SIZE=$(stat -f%z "${RUST_BINARY_PATH}")
    DEST_SIZE=$(stat -f%z "${DEST_BINARY}")
    
    SRC_MTIME=$(stat -f%m "${RUST_BINARY_PATH}")
    DEST_MTIME=$(stat -f%m "${DEST_BINARY}")
    
    if [ "${SRC_SIZE}" == "${DEST_SIZE}" ] && [ "${SRC_MTIME}" == "${DEST_MTIME}" ]; then
        SHOULD_COPY=false
        echo "Binary is identical (size and mtime match). Skipping copy."
    fi
fi

if [ "${SHOULD_COPY}" == "true" ]; then
    # Remove existing binary
    rm -f "${DEST_BINARY}"
    
    # Copy preserving attributes (timestamps)
    cp -p "${RUST_BINARY_PATH}" "${DEST_BINARY}"
    chmod +x "${DEST_BINARY}"
    echo "Copied binary."
fi

echo "========== Done =========="
