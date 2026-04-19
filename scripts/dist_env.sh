#!/usr/bin/env bash

fungi_app_dist_channel=""
fungi_app_build_args=()

while [ "$#" -gt 0 ]; do
  case "$1" in
    --channel)
      if [ "$#" -lt 2 ]; then
        echo "--channel requires stable or nightly" >&2
        exit 64
      fi
      fungi_app_dist_channel="$2"
      shift 2
      ;;
    --channel=*)
      fungi_app_dist_channel="${1#--channel=}"
      shift
      ;;
    *)
      fungi_app_build_args+=("$1")
      shift
      ;;
  esac
done

fungi_app_dist_channel="${fungi_app_dist_channel:-nightly}"

case "$fungi_app_dist_channel" in
  stable | release)
    fungi_app_dist_channel="stable"
    fungi_app_display_name="Fungi"
    fungi_app_bundle_id="rs.fungi.FungiApp"
    fungi_app_macos_icon="AppIcon"
    fungi_app_android_flavor="stable"
    ;;
  nightly)
    fungi_app_display_name="Fungi Dev"
    fungi_app_bundle_id="rs.fungi.FungiApp.nightly"
    fungi_app_macos_icon="AppIconNightly"
    fungi_app_android_flavor="nightly"
    ;;
  *)
    echo "Unknown channel: $fungi_app_dist_channel" >&2
    echo "Usage: $0 [--channel stable|nightly] [flutter build args...]" >&2
    exit 64
    ;;
esac

export FUNGI_APP_CHANNEL="$fungi_app_dist_channel"
export FUNGI_APP_COMMIT="${FUNGI_APP_COMMIT:-$(git rev-parse --short=12 HEAD)}"
export FUNGI_APP_BUILD_TIME="${FUNGI_APP_BUILD_TIME:-$(date -u +%Y-%m-%dT%H:%M:%SZ)}"
export FUNGI_APP_NAME="$fungi_app_display_name"
export ANDROID_FLAVOR="$fungi_app_android_flavor"

fungi_app_dart_defines=(
  --dart-define=FUNGI_APP_CHANNEL="$FUNGI_APP_CHANNEL"
  --dart-define=FUNGI_APP_COMMIT="$FUNGI_APP_COMMIT"
  --dart-define=FUNGI_APP_BUILD_TIME="$FUNGI_APP_BUILD_TIME"
)
