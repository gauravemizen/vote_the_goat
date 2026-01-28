import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '/flutter_flow/admob_util.dart' as admob;
import 'dart:async';

class AdService {
  static final AdService _instance = AdService._internal();
  factory AdService() => _instance;
  AdService._internal();

  // Ad unit IDs (replace with your actual IDs)
  static const String _bannerAdUnitId = "ca-app-pub-3940256099942544/5224354917"; // Test ID

  // static const String _interstitialAdUnitId = "ca-app-pub-3940256099942544/1033173712"; // Test ID
  // static const String _interstitialAdUnitId = "ca-app-pub-3966796550837650/2359278172"; // Test ID

  // static const String _interstitialAdUnitId = kDebugMode
  //     ? "ca-app-pub-3940256099942544/1033173712"
  //     : "ca-app-pub-7068447670600610/1583126082";





  static String get _interstitialAdUnitId {
    if (Platform.isAndroid) {
      return kDebugMode
          ? 'ca-app-pub-3940256099942544/1033173712'
          : 'ca-app-pub-7068447607600610/9304224423';
    } else if (Platform.isIOS) {
      return kDebugMode
          ? 'ca-app-pub-3940256099942544/4411468910'
          : 'ca-app-pub-7068447607600610/5092686759';
    } else {
      return '';
    }
  }



  // Timer management
  Timer? _interstitialTimer;
  DateTime? _lastAdShown;
  String? _currentPage;
  static const int _adIntervalMinutes =3;

  Future<bool> shouldShowAds() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final currentPlan = prefs.getString('current_plan') ?? 'free';

      // Only show ads for free plan users
      bool showAds = currentPlan == 'free';

      debugPrint('[AdService] shouldShowAds: plan=$currentPlan, showAds=$showAds');
      return showAds;
    } catch (e) {
      debugPrint('[AdService] shouldShowAds error: $e');
      return true; // Default to showing ads if error
    }
  }

  Future<void> updateAdSettingsForPlan(String plan) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('current_plan', plan);
      await prefs.setBool('show_ads', plan == 'free');

      debugPrint('[AdService] Updated settings for plan: $plan');

      // Stop timer if user upgrades to premium
      if (plan != 'free') {
        stopInterstitialTimer();
      }
    } catch (e) {
      debugPrint('[AdService] Error updating ad settings: $e');
    }
  }

  // Page tracking for time-based ads
  void startPageTimer(String pageName) async {
    if (!await shouldShowAds()) return;

    _currentPage = pageName;
    stopInterstitialTimer(); // Stop any existing timer

    debugPrint('[AdService] Starting timer for page: $pageName');

    _interstitialTimer = Timer.periodic(
      const Duration(minutes: _adIntervalMinutes),
          (timer) async {
        await _showTimedInterstitialAd();
      },
    );
  }

  void stopInterstitialTimer() {
    _interstitialTimer?.cancel();
    _interstitialTimer = null;
    debugPrint('[AdService] Stopped interstitial timer');
  }

  Future<void> _showTimedInterstitialAd() async {
    try {
      if (!await shouldShowAds()) {
        stopInterstitialTimer();
        return;
      }

      final now = DateTime.now();

      // Check if enough time has passed since last ad
      if (_lastAdShown != null) {
        final timeSinceLastAd = now.difference(_lastAdShown!);
        if (timeSinceLastAd.inMinutes < _adIntervalMinutes) {
          debugPrint('[AdService] Not enough time passed since last ad');
          return;
        }
      }

      debugPrint('[AdService] Attempting to show timed interstitial ad');
      await loadInterstitialAd();

      // Small delay to ensure ad is loaded
      await Future.delayed(const Duration(seconds: 2));

      final success = await admob.showInterstitialAd();
      if (success) {
        _lastAdShown = now;
        debugPrint('[AdService] Timed interstitial ad shown successfully');
      }
    } catch (e) {
      debugPrint('[AdService] Error showing timed interstitial: $e');
    }
  }

  Future<void> loadInterstitialAd() async {
    if (!await shouldShowAds()) return;

    try {
      debugPrint('[AdService] Loading interstitial ad');
      admob.loadInterstitialAd(
        _interstitialAdUnitId,
        _bannerAdUnitId,
        true,
      );
    } catch (e) {
      debugPrint('[AdService] Error loading interstitial ad: $e');
    }
  }

  Future<bool> showInterstitialAd() async {
    if (!await shouldShowAds()) return false;

    try {
      final success = await admob.showInterstitialAd();
      if (success) {
        _lastAdShown = DateTime.now();
        debugPrint('[AdService] Manual interstitial ad shown successfully');
      }
      return success;
    } catch (e) {
      debugPrint('[AdService] Error showing interstitial ad: $e');
      return false;
    }
  }

  String getBannerAdUnitId() => _bannerAdUnitId;

  // Cleanup method
  void dispose() {
    stopInterstitialTimer();
  }
}
