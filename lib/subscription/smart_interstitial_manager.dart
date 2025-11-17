import 'package:flutter/cupertino.dart';

import 'ad_service.dart';

class SmartInterstitialManager {
  static final SmartInterstitialManager _instance = SmartInterstitialManager._internal();
  factory SmartInterstitialManager() => _instance;
  SmartInterstitialManager._internal();

  Future<void> preloadInterstitial() async {
    try {
      await AdService().loadInterstitialAd();
    } catch (e) {
      debugPrint('[SmartInterstitialManager] Preload error: $e');
    }
  }

  Future<bool> showInterstitialIfAllowed() async {
    try {
      return await AdService().showInterstitialAd();
    } catch (e) {
      debugPrint('[SmartInterstitialManager] Show error: $e');
      return false;
    }
  }
}
