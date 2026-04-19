#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$repo_root"

source scripts/dist_env.sh "$@"

flutter build linux --release ${fungi_app_build_args[@]+"${fungi_app_build_args[@]}"} "${fungi_app_dart_defines[@]}"
