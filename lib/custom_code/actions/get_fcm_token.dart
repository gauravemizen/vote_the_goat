// Automatic FlutterFlow imports
// Imports other custom actions
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!

import 'dart:io' show Platform;
import 'package:firebase_messaging/firebase_messaging.dart';

Future<String> getFcmToken() async {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  try {
    if (Platform.isIOS) {
      String? apnsToken = await messaging.getAPNSToken();
      if (apnsToken == null) {
        // Wait briefly for APNS token to become available
        await Future.delayed(const Duration(seconds: 3));
        apnsToken = await messaging.getAPNSToken();
        if (apnsToken == null) return '';
      }
    }
    String? token = await messaging.getToken();
    return token ?? '';
  } catch (e) {
    return '';
  }
}
