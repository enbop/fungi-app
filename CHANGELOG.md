# Changelog

All notable changes to this project are documented in this file.

## [0.7.1+4] - 2026-08-29

### Changed

- Updated the bundled daemon and minimum compatible daemon version to Fungi 0.7.1.
- The bundled daemon now restores and refreshes remote services without delaying startup, retains cached observations after refresh failures, and applies bounded request timeouts.
- Remote device refreshes now run in the background so unavailable or untrusted devices do not block app actions.

### Fixed

- Remote connection failures now show a concise, consistent message while preserving cached service information.

## [0.7.0+3] - 2026-07-12

### Added

- Device and service management aligned with the Fungi 0.7.0 workflow.
- Service recipes for applying services locally or to a saved device.

### Changed

- Updated the bundled core and gRPC integration for Fungi 0.7.0.
- Simplified navigation around devices, services, and local access.

### Removed

- Removed legacy file transfer, data tunnel, and obsolete compatibility UI.

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
