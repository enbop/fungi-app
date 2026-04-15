#include "flutter_window.h"

#include <windows.h>

#include <optional>
#include <string>

#include "flutter/generated_plugin_registrant.h"

#define WIDEN2(x) L##x
#define WIDEN(x) WIDEN2(x)

namespace {

constexpr wchar_t kLaunchAtLoginRegistryPath[] =
    L"Software\\Microsoft\\Windows\\CurrentVersion\\Run";
constexpr wchar_t kLaunchAtLoginValueName[] = WIDEN(FUNGI_APP_DISPLAY_NAME);
constexpr char kLaunchAtLoginChannelName[] = "fungi_app/launch_at_login";

flutter::EncodableMap MakeLaunchAtLoginStatus(bool enabled) {
  flutter::EncodableMap status;
  status[flutter::EncodableValue("supported")] = flutter::EncodableValue(true);
  status[flutter::EncodableValue("enabled")] = flutter::EncodableValue(enabled);
  status[flutter::EncodableValue("requiresApproval")] =
      flutter::EncodableValue(false);
  return status;
}

std::wstring GetExecutableCommandLine(bool hide_to_tray) {
  std::wstring executable_path(MAX_PATH, L'\0');
  DWORD length = ::GetModuleFileNameW(nullptr, executable_path.data(),
                                      static_cast<DWORD>(executable_path.size()));

  while (length == executable_path.size()) {
    executable_path.resize(executable_path.size() * 2, L'\0');
    length = ::GetModuleFileNameW(nullptr, executable_path.data(),
                                  static_cast<DWORD>(executable_path.size()));
  }

  executable_path.resize(length);
  std::wstring command_line = L"\"" + executable_path + L"\"";
  if (hide_to_tray) {
    command_line += L" --launch-to-tray";
  }
  return command_line;
}

bool IsLaunchAtLoginEnabled() {
  HKEY key = nullptr;
  if (::RegOpenKeyExW(HKEY_CURRENT_USER, kLaunchAtLoginRegistryPath, 0, KEY_READ,
                      &key) != ERROR_SUCCESS) {
    return false;
  }

  DWORD type = 0;
  LONG result = ::RegGetValueW(key, nullptr, kLaunchAtLoginValueName, RRF_RT_REG_SZ,
                               &type, nullptr, nullptr);
  ::RegCloseKey(key);
  return result == ERROR_SUCCESS;
}

LONG SetLaunchAtLoginEnabled(bool enabled, bool hide_to_tray) {
  HKEY key = nullptr;
  LONG open_result =
      ::RegCreateKeyExW(HKEY_CURRENT_USER, kLaunchAtLoginRegistryPath, 0, nullptr,
                        REG_OPTION_NON_VOLATILE, KEY_SET_VALUE, nullptr, &key,
                        nullptr);
  if (open_result != ERROR_SUCCESS) {
    return open_result;
  }

  LONG result = ERROR_SUCCESS;
  if (enabled) {
    const std::wstring value = GetExecutableCommandLine(hide_to_tray);
    result = ::RegSetValueExW(
        key, kLaunchAtLoginValueName, 0, REG_SZ,
        reinterpret_cast<const BYTE*>(value.c_str()),
        static_cast<DWORD>((value.size() + 1) * sizeof(wchar_t)));
  } else {
    result = ::RegDeleteValueW(key, kLaunchAtLoginValueName);
    if (result == ERROR_FILE_NOT_FOUND) {
      result = ERROR_SUCCESS;
    }
  }

  ::RegCloseKey(key);
  return result;
}

}  // namespace

FlutterWindow::FlutterWindow(const flutter::DartProject& project)
    : project_(project) {}

FlutterWindow::~FlutterWindow() {}

bool FlutterWindow::OnCreate() {
  if (!Win32Window::OnCreate()) {
    return false;
  }

  RECT frame = GetClientArea();

  // The size here must match the window dimensions to avoid unnecessary surface
  // creation / destruction in the startup path.
  flutter_controller_ = std::make_unique<flutter::FlutterViewController>(
      frame.right - frame.left, frame.bottom - frame.top, project_);
  // Ensure that basic setup of the controller was successful.
  if (!flutter_controller_->engine() || !flutter_controller_->view()) {
    return false;
  }
  RegisterPlugins(flutter_controller_->engine());
  RegisterLaunchAtLoginChannel();
  SetChildContent(flutter_controller_->view()->GetNativeWindow());

  flutter_controller_->engine()->SetNextFrameCallback([&]() {
    this->Show();
  });

  // Flutter can complete the first frame before the "show window" callback is
  // registered. The following call ensures a frame is pending to ensure the
  // window is shown. It is a no-op if the first frame hasn't completed yet.
  flutter_controller_->ForceRedraw();

  return true;
}

void FlutterWindow::RegisterLaunchAtLoginChannel() {
  launch_at_login_channel_ =
      std::make_unique<flutter::MethodChannel<flutter::EncodableValue>>(
          flutter_controller_->engine()->messenger(), kLaunchAtLoginChannelName,
          &flutter::StandardMethodCodec::GetInstance());

  launch_at_login_channel_->SetMethodCallHandler(
      [](const flutter::MethodCall<flutter::EncodableValue>& call,
         std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result) {
        if (call.method_name() == "getStatus") {
          result->Success(flutter::EncodableValue(
              MakeLaunchAtLoginStatus(IsLaunchAtLoginEnabled())));
          return;
        }

        if (call.method_name() == "setEnabled") {
          const auto* arguments =
              std::get_if<flutter::EncodableMap>(call.arguments());
          if (arguments == nullptr) {
            result->Error("invalid_args", "Missing arguments.");
            return;
          }

          const auto enabled_it =
              arguments->find(flutter::EncodableValue("enabled"));
          if (enabled_it == arguments->end()) {
            result->Error("invalid_args", "Missing enabled flag.");
            return;
          }

          const auto* enabled = std::get_if<bool>(&enabled_it->second);
          if (enabled == nullptr) {
            result->Error("invalid_args", "Enabled flag must be a boolean.");
            return;
          }

          bool hide_to_tray = true;
          const auto hide_to_tray_it =
              arguments->find(flutter::EncodableValue("hideToTray"));
          if (hide_to_tray_it != arguments->end()) {
            const auto* hide_to_tray_value =
                std::get_if<bool>(&hide_to_tray_it->second);
            if (hide_to_tray_value == nullptr) {
              result->Error("invalid_args",
                            "Hide-to-tray flag must be a boolean.");
              return;
            }
            hide_to_tray = *hide_to_tray_value;
          }

          const LONG registry_result =
              SetLaunchAtLoginEnabled(*enabled, hide_to_tray);
          if (registry_result != ERROR_SUCCESS) {
            result->Error("launch_at_login_error",
                          "Failed to update startup registration.",
                          flutter::EncodableValue(
                              static_cast<int>(registry_result)));
            return;
          }

          result->Success(flutter::EncodableValue(
              MakeLaunchAtLoginStatus(IsLaunchAtLoginEnabled())));
          return;
        }

        result->NotImplemented();
      });
}

void FlutterWindow::OnDestroy() {
  launch_at_login_channel_.reset();
  if (flutter_controller_) {
    flutter_controller_ = nullptr;
  }

  Win32Window::OnDestroy();
}

LRESULT
FlutterWindow::MessageHandler(HWND hwnd, UINT const message,
                              WPARAM const wparam,
                              LPARAM const lparam) noexcept {
  // Give Flutter, including plugins, an opportunity to handle window messages.
  if (flutter_controller_) {
    std::optional<LRESULT> result =
        flutter_controller_->HandleTopLevelWindowProc(hwnd, message, wparam,
                                                      lparam);
    if (result) {
      return *result;
    }
  }

  switch (message) {
    case WM_FONTCHANGE:
      flutter_controller_->engine()->ReloadSystemFonts();
      break;
  }

  return Win32Window::MessageHandler(hwnd, message, wparam, lparam);
}
