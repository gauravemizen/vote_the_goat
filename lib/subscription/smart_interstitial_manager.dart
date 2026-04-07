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

/// SmartInterstitialManager v3 — Global Timer Edition
///
/// Now a thin wrapper around AdService. All timing, cooldowns, and preloading
/// are handled by AdService's single global timer.
///
/// Kept for backward compatibility with page widgets that call
/// showInterstitialIfAllowed() and allowAdsAfterInitialDelay().

import 'package:flutter/cupertino.dart';
import 'ad_service.dart';

class SmartInterstitialManager {
  static final SmartInterstitialManager _instance =
      SmartInterstitialManager._internal();
  factory SmartInterstitialManager() => _instance;
  SmartInterstitialManager._internal();

  /// @deprecated No-op — initial cooldown is now built into AdService's
  /// global timer (_initialCooldownMinutes). Kept for backward compatibility.
  void allowAdsAfterInitialDelay({
    Duration delay = const Duration(minutes: 3),
  }) {
    // No-op — AdService global timer handles initial cooldown automatically
    debugPrint('[SmartInterstitialManager] allowAdsAfterInitialDelay() → '
        'no-op (global timer handles cooldown)');
  }

  /// Preload an interstitial ad so it's ready in memory.
  Future<void> preloadInterstitial() async {
    try {
      await AdService().preloadInterstitialAd();
    } catch (e) {
      debugPrint('[SmartInterstitialManager] Preload error: $e');
    }
  }

  /// Show an interstitial ad if one is preloaded and the user is on free plan.
  /// The global timer handles periodic showing automatically, but this can be
  /// called for on-demand showing (e.g., on page navigation).
  Future<bool> showInterstitialIfAllowed() async {
    try {
      if (!AdService().isAdReady) {
        debugPrint('[SmartInterstitialManager] ⏳ Ad not ready yet — preloading');
        AdService().preloadInterstitialAd();
        return false;
      }

      return await AdService().showInterstitialAd();
    } catch (e) {
      debugPrint('[SmartInterstitialManager] Show error: $e');
      return false;
    }
  }

  /// @deprecated No-op — global timer doesn't reset on navigation.
  void resetForNewPage() {
    debugPrint('[SmartInterstitialManager] resetForNewPage() → no-op');
  }
}
