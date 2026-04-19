#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$repo_root"

source scripts/core_artifacts.sh

channel="nightly"
tag=""
platform=""
arch=""

usage() {
  cat >&2 <<'EOF'
Usage: scripts/fetch_core_artifacts.sh [--channel nightly|stable] [--tag TAG] [--platform PLATFORM] [--arch ARCH]

Defaults:
  channel: nightly
  tag: nightly for nightly, FUNGI_VERSION for stable
  platform: current host platform
  arch: current host arch

Examples:
  scripts/fetch_core_artifacts.sh
  scripts/fetch_core_artifacts.sh --platform android
  scripts/fetch_core_artifacts.sh --platform all
  scripts/fetch_core_artifacts.sh --channel stable
EOF
}

while [ "$#" -gt 0 ]; do
  case "$1" in
    --channel)
      if [ "$#" -lt 2 ]; then
        usage
        exit 64
      fi
      channel="$2"
      shift 2
      ;;
    --channel=*)
      channel="${1#--channel=}"
      shift
      ;;
    --tag)
      if [ "$#" -lt 2 ]; then
        usage
        exit 64
      fi
      tag="$2"
      shift 2
      ;;
    --tag=*)
      tag="${1#--tag=}"
      shift
      ;;
    --platform)
      if [ "$#" -lt 2 ]; then
        usage
        exit 64
      fi
      platform="$2"
      shift 2
      ;;
    --platform=*)
      platform="${1#--platform=}"
      shift
      ;;
    --arch)
      if [ "$#" -lt 2 ]; then
        usage
        exit 64
      fi
      arch="$2"
      shift 2
      ;;
    --arch=*)
      arch="${1#--arch=}"
      shift
      ;;
    -h | --help)
      usage
      exit 0
      ;;
    *)
      usage
      exit 64
      ;;
  esac
done

case "$channel" in
  nightly | dev)
    channel="nightly"
    tag="${tag:-nightly}"
    ;;
  stable | release)
    channel="stable"
    if [ -z "$tag" ]; then
      tag="$(tr -d '[:space:]' < FUNGI_VERSION)"
    fi
    ;;
  *)
    echo "Unknown channel: $channel" >&2
    usage
    exit 64
    ;;
esac

if [ -z "$platform" ]; then
  case "$(uname -s)" in
    Darwin) platform="macos" ;;
    Linux) platform="linux" ;;
    MINGW* | MSYS* | CYGWIN*) platform="windows" ;;
    *)
      echo "Cannot infer host platform. Use --platform macos|linux|windows|android|all." >&2
      exit 64
      ;;
  esac
fi

download_dir="$(mktemp -d)"
trap 'rm -rf "$download_dir"' EXIT

base_url="https://github.com/enbop/fungi/releases/download/${tag}"
case "$base_url" in
  https://github.com/enbop/fungi/releases/download/*) ;;
  *)
    echo "Refusing non-official artifact URL: $base_url" >&2
    exit 65
    ;;
esac

download() {
  local url="$1"
  local output="$2"
  case "$url" in
    https://github.com/enbop/fungi/releases/download/*) ;;
    *)
      echo "Refusing non-official artifact URL: $url" >&2
      exit 65
      ;;
  esac

  echo "Downloading $url"
  curl -fL --proto '=https' --tlsv1.2 -o "$output" "$url"
}

fetch_proto() {
  mkdir -p "$fungi_core_artifacts_root"
  local proto_tmp="$download_dir/fungi_daemon.proto"
  download "$base_url/fungi_daemon.proto" "$proto_tmp"
  mv -f "$proto_tmp" "$fungi_core_artifacts_root/fungi_daemon.proto"
}

fetch_desktop_artifact() {
  local artifact_platform="$1"
  local artifact_arch="$2"
  artifact_arch="$(fungi_core_normalize_arch "$artifact_arch")"

  local executable="fungi"
  if [ "$artifact_platform" = "windows" ]; then
    executable="fungi.exe"
  fi

  local archive="fungi-${artifact_platform}-${artifact_arch}.tar.gz"
  local archive_path="$download_dir/$archive"
  local extract_dir="$download_dir/${artifact_platform}-${artifact_arch}"
  local dest
  dest="$(dirname "$(fungi_core_desktop_binary_path "$channel" "$artifact_platform" "$artifact_arch")")"

  download "$base_url/$archive" "$archive_path"
  mkdir -p "$extract_dir" "$dest"
  tar -xzf "$archive_path" -C "$extract_dir"

  local binary_path
  binary_path="$(find "$extract_dir" -type f -name "$executable" | head -n 1)"
  if [ -z "$binary_path" ]; then
    echo "Could not find $executable in $archive" >&2
    find "$extract_dir" -maxdepth 3 -type f -print >&2
    exit 66
  fi

  mv "$binary_path" "$dest/$executable"
  chmod +x "$dest/$executable" || true

  if [ "$(uname -s)" = "Darwin" ] && [ "$artifact_platform" = "macos" ]; then
    xattr -dr com.apple.quarantine "$dest/$executable" 2>/dev/null || true
  fi

  echo "Installed $dest/$executable"
}

fetch_android_artifact() {
  local android_arch="${1:-arm64-v8a}"
  local archive="fungi-android-aarch64.tar.gz"
  local archive_path="$download_dir/$archive"
  local extract_dir="$download_dir/android-$android_arch"
  local dest="$fungi_core_artifacts_root/$channel/android/$android_arch"

  download "$base_url/$archive" "$archive_path"
  mkdir -p "$extract_dir" "$dest"
  tar -xzf "$archive_path" -C "$extract_dir"

  local binary_path
  binary_path="$(find "$extract_dir" -type f -name libfungi.so | head -n 1)"
  if [ -z "$binary_path" ]; then
    echo "Could not find libfungi.so in $archive" >&2
    find "$extract_dir" -maxdepth 3 -type f -print >&2
    exit 66
  fi

  mv "$binary_path" "$dest/libfungi.so"
  echo "Installed $dest/libfungi.so"
}

fetch_proto

case "$platform" in
  macos | linux | windows)
    fetch_desktop_artifact "$platform" "${arch:-$(fungi_core_host_arch)}"
    ;;
  android)
    fetch_android_artifact "${arch:-arm64-v8a}"
    ;;
  all)
    fetch_desktop_artifact macos aarch64
    fetch_desktop_artifact macos x86_64
    fetch_desktop_artifact linux x86_64
    fetch_desktop_artifact linux aarch64
    fetch_desktop_artifact windows x86_64
    fetch_android_artifact arm64-v8a
    ;;
  *)
    echo "Unknown platform: $platform" >&2
    usage
    exit 64
    ;;
esac
