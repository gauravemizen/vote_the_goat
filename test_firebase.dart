#!/usr/bin/env dart
// Standalone Firebase test script

import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

void main() async {
  print('🧪 Starting Firebase Services Test...');

  try {
    // Initialize Firebase
    await Firebase.initializeApp();
    print('✅ Firebase initialized successfully!');

    // Test Analytics
    await testAnalytics();

    // Test Crashlytics
    await testCrashlytics();

    print('');
    print('════════════════════════════════════════════');
    print('✅ ALL FIREBASE TESTS COMPLETED!');
    print('════════════════════════════════════════════');
    print('');
    print('📱 To verify:');
    print('1. Analytics: Firebase Console > Analytics > DebugView');
    print('2. Crashlytics: Firebase Console > Crashlytics');
    print('');

  } catch (e) {
    print('❌ Firebase test failed: $e');
    exit(1);
  }
}

Future<void> testAnalytics() async {
  try {
    print('📊 Testing Firebase Analytics...');

    final analytics = FirebaseAnalytics.instance;

    // Log a custom test event
    await analytics.logEvent(
      name: 'test_analytics_event',
      parameters: {
        'test_param': 'test_value',
        'timestamp': DateTime.now().toIso8601String(),
        'platform': 'iOS_Simulator',
      },
    );

    // Log screen view
    await analytics.logScreenView(
      screenName: 'firebase_test_screen',
      screenClass: 'FirebaseTestScreen',
    );

    // Set user property
    await analytics.setUserProperty(
      name: 'test_user_property',
      value: 'firebase_test_user',
    );

    print('✅ Firebase Analytics test events logged successfully!');

  } catch (e) {
    print('❌ Firebase Analytics test failed: $e');
  }
}

Future<void> testCrashlytics() async {
  try {
    print('🔥 Testing Firebase Crashlytics...');

    final crashlytics = FirebaseCrashlytics.instance;

    // Set custom keys
    await crashlytics.setCustomKey('test_key', 'firebase_test_value');
    await crashlytics.setCustomKey('test_timestamp', DateTime.now().toIso8601String());
    await crashlytics.setCustomKey('platform', 'iOS_Simulator');

    // Log a message
    await crashlytics.log('Firebase test message from VoteForGoat app - iOS Simulator');

    // Record a non-fatal error
    await crashlytics.recordError(
      Exception('Firebase test non-fatal error - please ignore'),
      StackTrace.current,
      reason: 'Testing Firebase Crashlytics integration',
      fatal: false,
    );

    print('✅ Firebase Crashlytics non-fatal error logged successfully!');

  } catch (e) {
    print('❌ Firebase Crashlytics test failed: $e');
  }
}
