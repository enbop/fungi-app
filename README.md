# Fungi App

The official graphical interface for managing devices and services on a [Fungi](https://github.com/enbop/fungi) network.

On macOS, we recommend installing Fungi App through our Homebrew tap:

```bash
brew tap enbop/fungi
brew install --cask fungi-app
```

For the nightly channel instead:

```bash
brew tap enbop/fungi
brew install --cask fungi-app-nightly
```

## Architecture

Fungi App communicates with the underlying `fungi` binary via **gRPC**. The app can start and stop an app-managed daemon, or connect to a compatible daemon that was already started by the user.

## Versioning

Fungi App currently tracks the `fungi` core release line directly.

- The app version should match the compatible core daemon version, for example `0.7.0`.
- UI-only repackaging or platform-specific release increments should use build metadata, for example `0.7.0+4`.

## Development

### Prerequisites

1.  **Flutter SDK**: Ensure you have the latest Flutter SDK installed.
2.  **Fungi Artifacts**: download the matching core binary and proto:
    ```bash
    scripts/fetch_core_artifacts.sh
    ```
    Use `--platform android` for Android, or `--platform all` to prepare every packaged target. Artifacts are placed under `fungi-artifacts/<channel>/<platform>/<arch>/`.
3.  **macOS**: If you're building on macOS, install CocoaPods (required for macOS Flutter plugins):
    ```bash
    brew install cocoapods
    pod setup
    ```

### Code Generation

If you modify the `.proto` definitions, regenerate the Dart gRPC code:

```bash
# Install protoc_plugin
dart pub global activate protoc_plugin 21.1.2

# Update path
export PATH="$PATH:$HOME/.pub-cache/bin"

# Regenerate gRPC code
protoc --dart_out=grpc:lib/src/grpc/generated -Ifungi-artifacts fungi-artifacts/fungi_daemon.proto
```

### Running the App

```bash
flutter pub get
flutter run
```

For Android development builds, select the nightly flavor:

```bash
flutter run --flavor nightly
```

### Distribution Build

```bash
scripts/build_macos_dist.sh
scripts/build_linux_dist.sh
scripts/build_windows_dist.sh
scripts/build_android_dist.sh
```

Stable builds must opt in explicitly:

```bash
scripts/build_macos_dist.sh --channel stable
```
