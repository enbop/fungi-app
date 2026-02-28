# Project Guidelines

## Code Style

- Follow Flutter lints baseline from [analysis_options.yaml](../analysis_options.yaml); no strong custom lint overrides are currently enabled.
- This app uses GetX for state and DI (`.obs`, `Obx`, `Get.put`, `Get.find`) rather than Provider/Riverpod/BLoC ([lib/main.dart](../lib/main.dart), [lib/app/controllers/fungi_controller.dart](../lib/app/controllers/fungi_controller.dart)).
- Keep long-running orchestration in controllers/services, not widgets; UI pages should remain presentational where possible ([lib/app/controllers/fungi_controller.dart](../lib/app/controllers/fungi_controller.dart), [lib/ui/pages/home/home_page.dart](../lib/ui/pages/home/home_page.dart)).
- Persist simple app flags through GetStorage (theme/daemon enable state) instead of introducing another local storage layer ([lib/app/controllers/fungi_controller.dart](../lib/app/controllers/fungi_controller.dart)).

## Architecture

- App flow: Flutter UI -> GetX controller/service -> local `fungi` process management -> gRPC daemon API.
- Route setup uses `GetMaterialApp` + `GetPage`; feature switching in home is tab-based, not deep route trees ([lib/main.dart](../lib/main.dart), [lib/app/routes/app_pages.dart](../lib/app/routes/app_pages.dart), [lib/ui/pages/home/home_page.dart](../lib/ui/pages/home/home_page.dart)).
- gRPC stubs are generated into [lib/src/grpc/generated](../lib/src/grpc/generated) from `fungi-artifacts/fungi_daemon.proto`.
- RPC endpoint is discovered by executing `fungi info rpc-address` (dynamic host/port), then creating `FungiDaemonClient` ([lib/ui/utils/daemon_client.dart](../lib/ui/utils/daemon_client.dart)).

## Build and Test

- Prereqs: Flutter SDK + `fungi-artifacts` directory containing `fungi`/`fungi.exe` and `fungi_daemon.proto` ([README.md](../README.md)).
- Install deps: `flutter pub get`.
- Run app: `flutter run`.
- Generate Dart gRPC code after proto changes:
  - `dart pub global activate protoc_plugin 21.1.2`
  - `export PATH="$PATH:$HOME/.pub-cache/bin"`
  - `protoc --dart_out=grpc:lib/src/grpc/generated -Ifungi-artifacts fungi-artifacts/fungi_daemon.proto`
- Recommended CI parity checks: `flutter analyze` then `flutter test` (tests are currently commented out in CI: [.github/workflows/tests.yml](../.github/workflows/tests.yml)).

## Project Conventions

- Do not edit generated files in [lib/src/grpc/generated](../lib/src/grpc/generated) by hand; regenerate from proto.
- Keep daemon lifecycle changes centralized in process/service utilities, not scattered across widgets ([lib/ui/utils/daemon_service_manager.dart](../lib/ui/utils/daemon_service_manager.dart), [lib/app/foreground_task.dart](../lib/app/foreground_task.dart)).
- Preserve cross-platform binary packaging hooks that copy `fungi` from `fungi-artifacts` into app bundles ([linux/CMakeLists.txt](../linux/CMakeLists.txt), [windows/scripts/copy_rust_binary.ps1](../windows/scripts/copy_rust_binary.ps1), [macos/Runner.xcodeproj/project.pbxproj](../macos/Runner.xcodeproj/project.pbxproj)).

## Integration Points

- Main integration is with the Rust daemon over gRPC using proto-compatible stubs ([lib/src/grpc/generated/fungi_daemon.pbgrpc.dart](../lib/src/grpc/generated/fungi_daemon.pbgrpc.dart)).
- App behavior depends on executable placement and startup arguments for platform-specific daemon launch ([README.md](../README.md), [lib/ui/utils/daemon_service_manager.dart](../lib/ui/utils/daemon_service_manager.dart)).
- When RPC fields/messages change, update `fungi-artifacts/fungi_daemon.proto` and regenerate Dart stubs before UI/controller edits.

## Security

- gRPC client currently uses `ChannelCredentials.insecure()` and assumes local daemon trust; treat bind/address changes as security-sensitive ([lib/ui/utils/daemon_client.dart](../lib/ui/utils/daemon_client.dart)).
- Android and macOS include elevated local-network/storage/runtime permissions; avoid broadening permissions unless required ([android/app/src/main/AndroidManifest.xml](../android/app/src/main/AndroidManifest.xml), [macos/Runner/Info.plist](../macos/Runner/Info.plist), [macos/Runner/Release.entitlements](../macos/Runner/Release.entitlements)).
- Avoid logging secrets or key material in daemon startup/client connection paths; existing logs are connectivity-focused ([lib/ui/utils/daemon_client.dart](../lib/ui/utils/daemon_client.dart)).
