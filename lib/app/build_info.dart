class AppBuildInfo {
  static const channel = String.fromEnvironment(
    'FUNGI_APP_CHANNEL',
    defaultValue: 'nightly',
  );
  static const commitHash = String.fromEnvironment('FUNGI_APP_COMMIT');
  static const buildTime = String.fromEnvironment('FUNGI_APP_BUILD_TIME');

  static bool get isStable => channel == 'stable' || channel == 'release';

  static String get channelLabel => isStable ? 'Stable' : 'Dev';

  static String get appName => isStable ? 'Fungi' : 'Fungi Dev';

  static String get commitLabel {
    final value = commitHash.trim();
    if (value.isEmpty) {
      return 'unknown';
    }
    return value.length <= 12 ? value : value.substring(0, 12);
  }

  static String get buildTimeLabel {
    final value = buildTime.trim();
    return value.isEmpty ? 'unknown' : value;
  }
}
