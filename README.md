# Fungi App

The official graphical user interface for [Fungi](../fungi), built with Flutter.

<div align="center">
  <img src="https://raw.githubusercontent.com/enbop/fungi/e21ea16a6cc3eaa57da0c025550d717c6b32a1a6/assets/fungi-data-tunnel.png" alt="File Transfer Interface" width="250" style="margin: 10px; border-radius: 8px; box-shadow: 0 4px 8px rgba(0,0,0,0.2);">
  <img src="https://raw.githubusercontent.com/enbop/fungi/e21ea16a6cc3eaa57da0c025550d717c6b32a1a6/assets/fungi-data-tunnel.png" alt="Data Tunnel Interface" width="250" style="margin: 10px; border-radius: 8px; box-shadow: 0 4px 8px rgba(0,0,0,0.2);">
</div>

## Architecture

Fungi App communicates with the underlying `fungi` binary via **gRPC**. The app manages the lifecycle of the daemon process.

## Development

### Prerequisites

1.  **Flutter SDK**: Ensure you have the latest Flutter SDK installed.
2.  **Fungi Artifacts**: This project requires pre-built `fungi` binaries and proto files.
    *   Create a `fungi-artifacts` directory in the project root.
    *   Place the `fungi` (or `fungi.exe`) binary for your platform in `fungi-artifacts/`.
    *   Place `fungi_daemon.proto` in `fungi-artifacts/`.

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
