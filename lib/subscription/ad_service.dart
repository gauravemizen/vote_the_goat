import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '/flutter_flow/admob_util.dart' as admob;
import '/app_state.dart';
import 'dart:async';

class AdService {
  static final AdService _instance = AdService._internal();
  factory AdService() => _instance;
  AdService._internal();

  // ── Ad readiness state ──
  bool _isAdLoaded = false;
  bool _isAdLoading = false;
  int _retryCount = 0;
  static const int _maxRetries = 3;

  bool get isAdReady => _isAdLoaded;

  // ── Auth screen suppression ──
  // When the user is on an auth screen (login, signup, OTP, forgot password),
  // ads must never be shown.
  bool _isOnAuthScreen = false;

  /// Call with `true` when entering an auth screen, `false` when leaving.
  void setAuthScreen(bool value) {
    _isOnAuthScreen = value;
    debugPrint('[AdService] Auth screen active: $_isOnAuthScreen');
  }

  bool get isOnAuthScreen => _isOnAuthScreen;

  // Banner Ad Unit IDs
  static String get _bannerAdUnitId {
    if (Platform.isAndroid) {
      return kDebugMode
          ? 'ca-app-pub-3940256099942544/6300978111' // Android test banner
          : 'ca-app-pub-7068447607600610/YOUR_ANDROID_BANNER_ID'; // TODO: Replace with your real Android banner ad unit ID
    } else if (Platform.isIOS) {
      return kDebugMode
          ? 'ca-app-pub-3940256099942544/2934735716' // iOS test banner
          : 'ca-app-pub-7068447607600610/YOUR_IOS_BANNER_ID'; // TODO: Replace with your real iOS banner ad unit ID
    } else {
      return '';
    }
  }

  // Interstitial Ad Unit IDs
  static String get _interstitialAdUnitIdIOS {
    return kDebugMode
        ? 'ca-app-pub-3940256099942544/4411468910'
        : 'ca-app-pub-7068447607600610/5092686759';
  }

  static String get _interstitialAdUnitIdAndroid {
    return kDebugMode
        ? 'ca-app-pub-3940256099942544/1033173712'
        : 'ca-app-pub-7068447607600610/9304224423';
  }

  // ──────────────────────────────────────────────
  //  GLOBAL TIMER — runs for the entire app lifetime
  // ──────────────────────────────────────────────
  Timer? _globalTimer;
  DateTime? _lastAdShown;
  bool _globalTimerRunning = false;

  /// How often the global timer ticks to check if it's time to show an ad.
  /// This is NOT the ad interval — it's just how often we check.
  static const Duration _timerTickInterval = Duration(seconds: 60);

  /// Minimum gap between two interstitial ads.
  static const int _adIntervalMinutes = 3;

  /// Initial cooldown after app start before any ad can show.
  /// Prevents ads from appearing the moment the user opens the app.
  static const int _initialCooldownMinutes = 3;

  /// Timestamp when the global timer was started (app launch).
  DateTime? _globalTimerStartedAt;

  // ──────────────────────────────────────────────
  //  INITIALIZE — call once from main.dart
  // ──────────────────────────────────────────────
  /// Starts the global ad system:
  ///   1. Preloads the first interstitial ad
  ///   2. Starts the global timer that runs forever
  ///
  /// Call this once from main.dart after AdMob is initialized.
  Future<void> initialize() async {
    if (_globalTimerRunning) {
      debugPrint('[AdService] Already initialized, skipping');
      return;
    }

    debugPrint('[AdService] 🚀 Initializing global ad system');

    // Preload the first ad
    preloadInterstitialAd();

    // Start the global timer
    _startGlobalTimer();
  }

  void _startGlobalTimer() {
    if (_globalTimerRunning) return;

    _globalTimerStartedAt = DateTime.now();
    _globalTimerRunning = true;

    debugPrint('[AdService] ⏱️ Global timer started (checks every ${_timerTickInterval.inSeconds}s, '
        'shows ad every ${_adIntervalMinutes}min, initial cooldown ${_initialCooldownMinutes}min)');

    _globalTimer = Timer.periodic(_timerTickInterval, (timer) async {
      await _onGlobalTimerTick();
    });
  }

  void _stopGlobalTimer() {
    _globalTimer?.cancel();
    _globalTimer = null;
    _globalTimerRunning = false;
    debugPrint('[AdService] ⏱️ Global timer stopped');
  }

  /// Called every tick. Decides whether to show an ad.
  Future<void> _onGlobalTimerTick() async {
    try {
      // 0. Never show ads on auth screens
      if (_isOnAuthScreen) {
        debugPrint('[AdService] ⏱️ Tick — on auth screen, skipping');
        return;
      }

      // 1. Check if user should see ads at all
      if (!await shouldShowAds()) {
        debugPrint('[AdService] User on paid plan — stopping global timer');
        _stopGlobalTimer();
        return;
      }

      // 2. Ensure an ad is preloaded
      if (!_isAdLoaded && !_isAdLoading) {
        debugPrint('[AdService] ⏱️ Tick — no ad loaded, preloading...');
        preloadInterstitialAd();
        return;
      }

      // 3. Try to show — showInterstitialAd() enforces cooldown & gap internally
      if (_isAdLoaded) {
        debugPrint('[AdService] ⏱️ Tick — attempting to show ad');
        await showInterstitialAd();
      }
    } catch (e) {
      debugPrint('[AdService] Error in global timer tick: $e');
    }
  }

  // ──────────────────────────────────────────────
  //  SUBSCRIPTION CHECK
  // ──────────────────────────────────────────────
  Future<bool> shouldShowAds() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final currentPlan = prefs.getString('current_plan') ?? 'free';

      // Condition 1: Paid plan → NO ads, no matter what
      if (currentPlan != 'free') {
        debugPrint('[AdService] shouldShowAds: paid plan ($currentPlan) → NO ads');
        return false;
      }

      // Condition 2: Free plan but advertisement_status = 0 → NO ads
      final adStatus = FFAppState().advertisementStatus;
      if (adStatus == 0) {
        debugPrint('[AdService] shouldShowAds: free plan but advertisement_status=0 → NO ads');
        return false;
      }

      // Condition 3: Free plan + advertisement_status = 1 → SHOW ads
      debugPrint('[AdService] shouldShowAds: free plan + advertisement_status=$adStatus → SHOW ads');
      return true;
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

      if (plan != 'free') {
        // User upgraded → stop everything
        _stopGlobalTimer();
      } else {
        // User is on free plan → ensure system is running
        preloadInterstitialAd();
        _startGlobalTimer();
      }
    } catch (e) {
      debugPrint('[AdService] Error updating ad settings: $e');
    }
  }

  // ──────────────────────────────────────────────
  //  STEP 1 & 2: Preload ad in advance & keep ready
  // ──────────────────────────────────────────────
  Future<void> preloadInterstitialAd() async {
    if (!await shouldShowAds()) return;

    // Don't double-load
    if (_isAdLoaded || _isAdLoading) {
      debugPrint('[AdService] Ad already ${_isAdLoaded ? "loaded" : "loading"}, skipping preload');
      return;
    }

    _isAdLoading = true;
    debugPrint('[AdService] ⏳ Preloading interstitial ad...');

    try {
      final loaded = await admob.loadInterstitialAdAsync(
        _interstitialAdUnitIdIOS,
        _interstitialAdUnitIdAndroid,
        false, // Don't use test ads - our IDs already handle debug vs release
      );

      _isAdLoading = false;

      if (loaded) {
        _isAdLoaded = true;
        _retryCount = 0;
        debugPrint('[AdService] ✅ Interstitial ad preloaded and READY');
      } else {
        _isAdLoaded = false;
        debugPrint('[AdService] ⚠️ Interstitial ad failed to preload');
        _scheduleRetry();
      }
    } catch (e) {
      _isAdLoading = false;
      _isAdLoaded = false;
      debugPrint('[AdService] ❌ Error preloading interstitial ad: $e');
      _scheduleRetry();
    }
  }

  /// Retry loading with exponential backoff
  void _scheduleRetry() {
    if (_retryCount >= _maxRetries) {
      debugPrint('[AdService] Max retries reached, will try again on next tick');
      _retryCount = 0;
      return;
    }
    _retryCount++;
    final delaySeconds = _retryCount * 10; // 10s, 20s, 30s
    debugPrint('[AdService] 🔄 Retrying preload in ${delaySeconds}s (attempt $_retryCount/$_maxRetries)');
    Future.delayed(Duration(seconds: delaySeconds), () {
      preloadInterstitialAd();
    });
  }

  // ──────────────────────────────────────────────
  //  STEP 3: Show instantly when needed
  // ──────────────────────────────────────────────
  Future<bool> showInterstitialAd() async {
    // Never show ads on auth screens
    if (_isOnAuthScreen) {
      debugPrint('[AdService] 🚫 Blocked — on auth screen');
      return false;
    }

    if (!await shouldShowAds()) return false;

    // ── Enforce initial cooldown ──
    if (_globalTimerStartedAt != null) {
      final timeSinceStart = DateTime.now().difference(_globalTimerStartedAt!);
      if (timeSinceStart.inMinutes < _initialCooldownMinutes) {
        debugPrint('[AdService] 🚫 Blocked — initial cooldown active '
            '(${timeSinceStart.inSeconds}s / ${_initialCooldownMinutes * 60}s)');
        return false;
      }
    }

    // ── Enforce minimum gap between ads ──
    if (_lastAdShown != null) {
      final timeSinceLastAd = DateTime.now().difference(_lastAdShown!);
      if (timeSinceLastAd.inMinutes < _adIntervalMinutes) {
        debugPrint('[AdService] 🚫 Blocked — only ${timeSinceLastAd.inSeconds}s since last ad '
            '(need ${_adIntervalMinutes * 60}s)');
        return false;
      }
    }

    if (!_isAdLoaded) {
      debugPrint('[AdService] ⚠️ Ad not ready yet – preloading for next time');
      preloadInterstitialAd();
      return false;
    }

    try {
      debugPrint('[AdService] 🎬 Showing interstitial ad NOW');
      _isAdLoaded = false; // Mark as consumed

      final success = await admob.showInterstitialAd();
      if (success) {
        _lastAdShown = DateTime.now();
        debugPrint('[AdService] ✅ Interstitial ad shown successfully');
      }

      // ──────────────────────────────────────────
      //  STEP 4: After showing → load next ad
      // ──────────────────────────────────────────
      debugPrint('[AdService] 🔄 Preloading NEXT interstitial ad');
      preloadInterstitialAd();

      return success;
    } catch (e) {
      debugPrint('[AdService] ❌ Error showing interstitial ad: $e');
      _isAdLoaded = false;
      preloadInterstitialAd();
      return false;
    }
  }

  // ──────────────────────────────────────────────
  //  BACKWARD COMPATIBILITY — page calls are now no-ops
  // ──────────────────────────────────────────────
  /// @deprecated Use [initialize] instead. Kept so existing page code
  /// doesn't break. These are now harmless no-ops.
  void startPageTimer(String pageName) {
    // No-op — global timer handles everything.
    // Just ensure an ad is preloaded when user navigates.
    debugPrint('[AdService] startPageTimer($pageName) → no-op (global timer active)');
    preloadInterstitialAd();
  }

  /// @deprecated No-op — global timer is never stopped by page navigation.
  void stopInterstitialTimer() {
    // No-op — we don't stop the global timer on page transitions.
    debugPrint('[AdService] stopInterstitialTimer() → no-op (global timer active)');
  }

  /// Legacy method – now just calls preloadInterstitialAd
  Future<void> loadInterstitialAd() async {
    await preloadInterstitialAd();
  }

  String getBannerAdUnitId() => _bannerAdUnitId;

  // Cleanup method
  void dispose() {
    _stopGlobalTimer();
  }
}
