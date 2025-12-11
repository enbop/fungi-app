#!/bin/bash

# Script to copy or link Rust binary to Flutter Linux build
# Usage: copy_rust_binary.sh <install_prefix> <build_type>
set -e

echo "========== Copying Rust Binary =========="

INSTALL_PREFIX="$1"

# Paths
SCRIPT_DIR="$(dirname "$(realpath "${BASH_SOURCE[0]}")")"
# The fungi-artifacts directory is located at the root of the Flutter project (fungi-app)
# Relative path from script: ../../fungi-artifacts/fungi
RUST_BINARY_PATH="$(realpath "${SCRIPT_DIR}/../../fungi-artifacts/fungi")"
DEST_DIR="${INSTALL_PREFIX}"
DEST_BINARY="${DEST_DIR}/fungi"

echo "Source: ${RUST_BINARY_PATH}"
echo "Destination: ${DEST_BINARY}"

# Check if Rust binary exists
if [ ! -f "${RUST_BINARY_PATH}" ]; then
    echo "Error: Rust binary not found at ${RUST_BINARY_PATH}"
    echo "Please ensure 'fungi-artifacts/fungi' exists in the project root."
    exit 1
fi

# Create destination directory
mkdir -p "${DEST_DIR}"

# Check if we need to copy
SHOULD_COPY=true
if [ -f "${DEST_BINARY}" ]; then
    # Compare size and modification time
    SRC_SIZE=$(stat -c%s "${RUST_BINARY_PATH}")
    DEST_SIZE=$(stat -c%s "${DEST_BINARY}")
    
    SRC_MTIME=$(stat -c%Y "${RUST_BINARY_PATH}")
    DEST_MTIME=$(stat -c%Y "${DEST_BINARY}")
    
    if [ "${SRC_SIZE}" == "${DEST_SIZE}" ] && [ "${SRC_MTIME}" == "${DEST_MTIME}" ]; then
        SHOULD_COPY=false
        echo "Binary is identical (size and mtime match). Skipping copy."
    fi
fi

if [ "${SHOULD_COPY}" == "true" ]; then
    # Remove existing binary if it exists (to ensure clean copy)
    rm -f "${DEST_BINARY}"
    
    # Copy preserving attributes (timestamps) so the next check works
    cp -p "${RUST_BINARY_PATH}" "${DEST_BINARY}"
    chmod +x "${DEST_BINARY}"
    echo "Copied binary."
fi

echo "========== Done =========="
