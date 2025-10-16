import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCQrz1tg4gCHBQelK8TY77b7t-meyp096M",
            authDomain: "vtgapp-2025.firebaseapp.com",
            projectId: "vtgapp-2025",
            storageBucket: "vtgapp-2025.firebasestorage.app",
            messagingSenderId: "360818518046",
            appId: "1:360818518046:web:3a6a655c375ee25b7fa60f",
            measurementId: "G-P94XCB8X8W"));
  } else {
    await Firebase.initializeApp();
  }
}
