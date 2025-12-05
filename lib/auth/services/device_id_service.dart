// TODO Implement this library.


import 'package:mobile_device_identifier/mobile_device_identifier.dart';

class DeviceIdService {
  static final _identifier = MobileDeviceIdentifier();

  /// Returns hardware-backed device ID that survives uninstall
  static Future<String> getDeviceId() async {
    try {
      final id = await _identifier.getDeviceId();
      if (id != null && id.isNotEmpty) {
        return id;
      }
    } catch (e) {
      // Handle error
    }

    // Fallback if needed
    return 'fallback-${DateTime.now().millisecondsSinceEpoch}';
  }
}
