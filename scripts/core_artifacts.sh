#!/usr/bin/env bash

fungi_core_artifacts_root="${FUNGI_CORE_ARTIFACTS_ROOT:-fungi-artifacts}"

fungi_core_normalize_arch() {
  case "$1" in
    arm64 | aarch64)
      printf 'aarch64'
      ;;
    x64 | x86_64 | amd64 | AMD64)
      printf 'x86_64'
      ;;
    *)
      printf '%s' "$1"
      ;;
  esac
}

fungi_core_host_arch() {
  fungi_core_normalize_arch "$(uname -m)"
}

fungi_core_desktop_binary_path() {
  local channel="$1"
  local platform="$2"
  local arch
  arch="$(fungi_core_normalize_arch "$3")"

  local executable="fungi"
  if [ "$platform" = "windows" ]; then
    executable="fungi.exe"
  fi

  printf '%s/%s/%s/%s/%s' \
    "$fungi_core_artifacts_root" \
    "$channel" \
    "$platform" \
    "$arch" \
    "$executable"
}

fungi_core_android_dir() {
  local channel="$1"
  printf '%s/%s/android' "$fungi_core_artifacts_root" "$channel"
}
