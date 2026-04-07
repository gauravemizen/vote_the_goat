/// AppVersion: Hardcoded app version info for Android and iOS
class AppVersion {
  // Android version info
  static const String androidVersionName = '1.0.1';
  static const int androidBuildNumber = 9;

  // iOS version info
  static const String iosVersionName = '1.0.1';
  static const int iosBuildNumber = 10;

  static String get currentVersionName {
    if (_isAndroid) return androidVersionName;
    return iosVersionName;
  }

  static int get currentBuildNumber {
    if (_isAndroid) return androidBuildNumber;
    return iosBuildNumber;
  }

  static bool get _isAndroid {
    // Platform check (works only in runtime, not in web)
    try {
      return identical(0, 0.0) == false &&
          (const String.fromEnvironment('dart.library.io', defaultValue: '') != '');
    } catch (_) {
      return false;
    }
  }
}

