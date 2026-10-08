/// The daemon API line supported by this GUI, independent of its build number.
class DaemonCompatibility {
  static const supportedVersions = '0.8.x';

  static bool supports(String version) {
    final match = RegExp(
      r'^v?(\d+)\.(\d+)\.(\d+)(?:-[0-9A-Za-z.-]+)?(?:\+[0-9A-Za-z.-]+)?$',
    ).firstMatch(version.trim());
    return match != null &&
        int.parse(match.group(1)!) == 0 &&
        int.parse(match.group(2)!) == 8;
  }
}
