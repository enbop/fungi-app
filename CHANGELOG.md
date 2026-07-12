# Changelog

All notable changes to this project are documented in this file.

## [0.7.0] - Unreleased

### Added
- Unified service management for apps running locally and on saved devices.
- Service recipe support for applying services locally or to another device.
- Runtime safety and relay configuration views.

### Changed
- Aligned the app, bundled core, and gRPC API with Fungi daemon 0.7.0.
- Daemon connections now follow the per-`fungi-dir` endpoint published by Fungi core instead of relying on a fixed RPC port.
- Reworked the interface around devices, trust, services, and local access.
- Remote service state now uses the daemon's device service snapshot and refresh flow.

### Removed
- Removed legacy file transfer, data tunnel, and obsolete daemon compatibility UI.

## [0.6.1+2] - 2026-04-09

### Fixed
- Improved macOS window restore behavior when reopening from the Dock or tray after hiding or minimizing the main window.

### Changed
- Added release workflow support to trigger Homebrew tap updates after tagged releases.

## [0.6.1] - 2026-04-07

### Changed
- Support for fungi daemon v0.6.1, including the new service management and relay configuration.
- Refactored the main tabs into `Home`, `Peers`, `Local`, and `Settings`.
- Marked old file transfer module as deprecated.

## [0.5.1] - 2026-03-04

### Added

- Daemon process exit handling and related app-side behavior improvements.
- Log viewer styling enhancements for better readability.

### Fixed

- Corrected `--fungi-dir` path handling after `0.5.0`.

## [0.5.0] - 2026-03-02

### Added

- Logging system settings page UI for configuring and managing app-side logging behavior.

### Changed

- First independent release of `fungi-app` as a standalone repository.
- Version aligned with `fungi` core daemon release `0.5.0`.
