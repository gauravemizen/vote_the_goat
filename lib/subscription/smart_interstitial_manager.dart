// import 'package:flutter/cupertino.dart';
//
// import 'ad_service.dart';
//
// class SmartInterstitialManager {
//   static final SmartInterstitialManager _instance = SmartInterstitialManager._internal();
//   factory SmartInterstitialManager() => _instance;
//   SmartInterstitialManager._internal();
//
//   Future<void> preloadInterstitial() async {
//     try {
//       await AdService().loadInterstitialAd();
//     } catch (e) {
//       debugPrint('[SmartInterstitialManager] Preload error: $e');
//     }
//   }
//
//   Future<bool> showInterstitialIfAllowed() async {
//     try {
//       return await AdService().showInterstitialAd();
//     } catch (e) {
//       debugPrint('[SmartInterstitialManager] Show error: $e');
//       return false;
//     }
//   }
// }





///2
///
import 'package:flutter/cupertino.dart';
import 'ad_service.dart';

class SmartInterstitialManager {
  static final SmartInterstitialManager _instance =
  SmartInterstitialManager._internal();
  factory SmartInterstitialManager() => _instance;
  SmartInterstitialManager._internal();

  /// Flag to block ads immediately after page load
  bool _blockInitialAd = true;

  /// Call this when page is ready (after load)
  void allowAdsAfterInitialDelay({Duration delay = const Duration(minutes: 3)}) {
    Future.delayed(delay, () {
      _blockInitialAd = false;
      debugPrint('[SmartInterstitialManager] Initial ad block released');
    });
  }

  Future<void> preloadInterstitial() async {
    try {
      await AdService().loadInterstitialAd();
    } catch (e) {
      debugPrint('[SmartInterstitialManager] Preload error: $e');
    }
  }

  Future<bool> showInterstitialIfAllowed() async {
    try {
      // 🚫 Prevent page-load ads
      if (_blockInitialAd) {
        debugPrint(
            '[SmartInterstitialManager] Ad blocked (page just loaded)');
        return false;
      }

      return await AdService().showInterstitialAd();
    } catch (e) {
      debugPrint('[SmartInterstitialManager] Show error: $e');
      return false;
    }
  }

  /// Optional: Reset when navigating to a new page
  void resetForNewPage() {
    _blockInitialAd = true;
  }
}
