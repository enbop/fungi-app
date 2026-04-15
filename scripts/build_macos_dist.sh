#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$repo_root"

source scripts/dist_env.sh "$@"

cleanup_local_channel=1
for arg in "${fungi_app_build_args[@]}"; do
  if [ "$arg" = "--config-only" ]; then
    cleanup_local_channel=0
  fi
done

cat > macos/Runner/Configs/LocalChannel.xcconfig <<EOF
FUNGI_APP_CHANNEL = $FUNGI_APP_CHANNEL
PRODUCT_NAME = $fungi_app_display_name
PRODUCT_BUNDLE_IDENTIFIER = $fungi_app_bundle_id
FUNGI_APP_ICON_NAME = $fungi_app_macos_icon
FUNGI_APP_DISPLAY_NAME = $fungi_app_display_name
EOF

if [ "$cleanup_local_channel" = "1" ]; then
  trap 'rm -f macos/Runner/Configs/LocalChannel.xcconfig' EXIT
fi

flutter build macos --release "${fungi_app_build_args[@]}" "${fungi_app_dart_defines[@]}"
