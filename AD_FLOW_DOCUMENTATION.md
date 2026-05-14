# 📢 Ad Flow Documentation — Vote For Goat

> Last updated: May 12, 2026

---

## 🏗️ Architecture Overview

```
┌─────────────────────────────────────────────────────────┐
│                        main.dart                        │
│  App starts → AdMob init → AdService().initialize()     │
│                                │                        │
│                                ├── Preloads first ad    │
│                                └── Starts GLOBAL timer  │
└──────────────────────┬──────────────────────────────────┘
                       │
                       ▼
┌─────────────────────────────────────────────────────────┐
│              AdService (Singleton + Global Timer)        │
│                                                         │
│  ONE timer runs for the ENTIRE app lifetime:            │
│  • Ticks every 60 seconds                               │
│  • Checks: cooldown passed? 3 min since last ad?        │
│  • If yes + ad preloaded → show instantly                │
│  • After show → auto-preload next ad                    │
│                                                         │
│  Navigation does NOT affect the timer.                  │
│  Pages don't start/stop anything.                       │
└──────────┬──────────────────────────────────────────────┘
           │
           ▼
┌─────────────────────────────────────────────────────────┐
│                    admob_util.dart                       │
│                  (Low-level SDK wrapper)                 │
│  • loadInterstitialAdAsync() → Future<bool>             │
│  • showInterstitialAd() → Future<bool>                  │
│  • isInterstitialAdLoaded() → bool                      │
└─────────────────────────────────────────────────────────┘
```

---

## 📁 Files Involved

| File | Role |
|------|------|
| `lib/main.dart` | App entry — calls `AdService().initialize()` once |
| `lib/flutter_flow/admob_util.dart` | Low-level Google Mobile Ads SDK wrapper |
| `lib/subscription/ad_service.dart` | **Core ad logic** — global timer, preload, show, retry, plan check |
| `lib/subscription/smart_interstitial_manager.dart` | Thin backward-compatible wrapper (delegates to AdService) |
| `lib/subscription/page_timer_mixin.dart` | Mixin for pages — calls are now no-ops |

---

## 🌍 Why Global Timer (Not Page Timers)

### ❌ Old Approach: Per-Page Timers

```
User opens Eligible Players → starts 3-min timer
User navigates to Compare (2 min later) → STOPS old timer, starts NEW 3-min timer
User navigates to Filter (2 min later) → STOPS old timer, starts NEW 3-min timer
...
Timer NEVER fires because user navigates every 2 min!
```

### ✅ New Approach: One Global Timer

```
App opens → starts ONE global timer (runs forever)
User navigates anywhere → timer keeps running, unaffected
3 minutes pass → timer tick checks: time to show? → YES → shows ad
User navigates → timer still running
3 more minutes → shows another ad
...
Guaranteed delivery every 3 minutes regardless of navigation!
```

---

## 🔄 The 4-Step Preload Flow

```
STEP 1: PRELOAD IN ADVANCE
──────────────────────────
  App starts → main.dart → AdService().initialize()
       │
       ▼
  admob_util.loadInterstitialAdAsync()
       │
       ▼
  Google SDK loads ad from network (1-10 seconds)
       │
       ▼
  Callback fires → _isAdLoaded = true ✅


STEP 2: KEEP IT READY
─────────────────────
  Ad sits in memory, ready to display instantly.
  _isAdLoaded = true
  _isAdLoading = false
  No user-visible delay.


STEP 3: SHOW INSTANTLY WHEN TIMER TICKS
────────────────────────────────────────
  Global timer ticks (every 60 seconds)
       │
       ▼
  Check: user on free plan?
  Check: initial 3-min cooldown passed?
  Check: 3 min since last ad shown?
  Check: _isAdLoaded == true?
       │
       ├─ ALL YES → admob_util.showInterstitialAd() → Ad appears INSTANTLY
       │
       └─ ANY NO  → Skip this tick, try again in 60 seconds


STEP 4: AFTER SHOWING → PRELOAD NEXT AD
────────────────────────────────────────
  User dismisses ad
       │
       ▼
  _isAdLoaded = false
  _lastAdShown = DateTime.now()
       │
       ▼
  AdService().preloadInterstitialAd()  ← automatic!
       │
       ▼
  Next ad loading in background...
       │
       ▼
  Ready for next timer tick ✅
```

---

## 🚀 App Startup Flow

```
main()
  │
  ├── WidgetsFlutterBinding.ensureInitialized()
  ├── FlutterNativeSplash.preserve()
  ├── initFirebase()
  ├── FlutterFlowTheme.initialize()
  │
  ├── adMobRequestConsent()                  ← GDPR consent
  ├── adMobUpdateRequestConfiguration()      ← Child-directed settings
  │
  ├── FFAppState().initializePersistedState()
  ├── FFAppState().initializeSubscriptionState()
  │
  ├── 🔥 AdService().initialize()            ← THE ONLY AD SETUP CALL
  │        │
  │        ├── preloadInterstitialAd()        ← First ad starts loading
  │        └── _startGlobalTimer()            ← Timer starts ticking
  │              │
  │              └── Timer.periodic(60 seconds)
  │                    │
  │                    └── _onGlobalTimerTick()
  │                          ├── Check plan (free?)
  │                          ├── Check initial cooldown (3 min)
  │                          ├── Check last ad shown (3 min gap)
  │                          └── Show if all conditions met
  │
  └── runApp(MyApp())
```

---

## ⏱️ Global Timer — How It Decides

Every 60 seconds, the timer runs `_onGlobalTimerTick()`:

```
_onGlobalTimerTick()
  │
  ├── 1. shouldShowAds()?
  │     ├── NO (paid plan)              → stop timer entirely
  │     └── NO (advertisement_status=0) → skip this tick
  │
  ├── 2. Ad loaded?
  │     └── NO → preloadInterstitialAd() → try next tick
  │
  └── 3. Call showInterstitialAd()
        └── (all cooldown/gap checks happen inside — see below)
```

### showInterstitialAd() — The Single Gatekeeper

**Every ad show request — whether from the global timer OR from page
navigation — goes through this ONE method.** It enforces all timing rules:

```
showInterstitialAd()
  │
  ├── 1. shouldShowAds()?
  │     ├── paid plan            → return false (no ads ever)
  │     └── advertisement_status=0 → return false (admin disabled)
  │
  ├── 2. Initial cooldown passed?
  │     └── now() - _globalTimerStartedAt >= 3 minutes?
  │           NO → 🚫 BLOCKED (app just opened)
  │
  ├── 3. Enough time since last ad?
  │     └── now() - _lastAdShown >= 3 minutes?
  │           NO → 🚫 BLOCKED (showed ad recently)
  │
  ├── 4. Ad loaded?
  │     └── NO → preload for next time, return false
  │
  └── 5. All checks passed → SHOW AD → record _lastAdShown → preload next
```

**This is why ads can never spam on navigation.** Even if 6 pages all call
`showInterstitialIfAllowed()` in their `initState`, only the first one
within a 3-minute window will actually show. The rest get blocked.

---

## 📄 Page Lifecycle (Navigation-Safe)

**No page triggers ads on navigation anymore.** All `showInterstitialIfAllowed()`
calls have been removed from page `initState()` methods. ONLY the global timer
shows ads, guaranteeing the 3-minute gap.

```
Page.initState()
  │
  ├── AdService().startPageTimer('pageName')
  │     └── No-op! Just triggers a preload as a bonus.
  │
  └── (No ad show call — global timer handles everything)

Example timeline:
  00:00 — App opens (initial cooldown starts)
  00:00 — Global timer starts ticking every 60s
  03:00 — Timer tick → cooldown passed, ad loaded → SHOWS AD
  03:01 — User navigates to Compare → NO ad (page doesn't trigger ads)
  03:30 — User navigates to Filter → NO ad (page doesn't trigger ads)
  06:01 — Timer tick → 3 min since last ad → SHOWS AD
  07:00 — User navigates to Player Bio → NO ad (page doesn't trigger ads)
  09:01 — Timer tick → 3 min since last ad → SHOWS AD


Page.dispose()
  │
  └── AdService().stopInterstitialTimer()
        └── No-op! Global timer keeps running.
```


---

## 🔁 Retry Logic (On Load Failure)

If an ad fails to load from the network:

```
preloadInterstitialAd() fails
  │
  ▼
_scheduleRetry()
  │
  ├── Attempt 1: wait 10 seconds → retry preload
  ├── Attempt 2: wait 20 seconds → retry preload
  ├── Attempt 3: wait 30 seconds → retry preload
  │
  └── Max retries reached → reset counter
      └── Global timer will trigger preload on next tick anyway
```

---

## 💰 Subscription-Based Ad Control

```
AdService().shouldShowAds()
  │
  ├── Read SharedPreferences → current_plan
  │
  ├── plan != 'free' → return false  (PAID USER — no ads, timer stops)
  │
  ├── plan == 'free' → check FFAppState().advertisementStatus
  │     ├── advertisement_status == 0 → return false  (admin disabled ads)
  │     └── advertisement_status == 1 → return true   (show ads)
  │
  └── On error → return true (default to showing ads)


AdService().updateAdSettingsForPlan(plan)
  │
  ├── Save plan to SharedPreferences
  │
  ├── plan != 'free' → _stopGlobalTimer() (kill everything)
  └── plan == 'free'  → preload + _startGlobalTimer() (resume)
```

### Ad Visibility Summary

| User Plan | `advertisement_status` | Ads Shown? |
|-----------|----------------------|------------|
| Paid (any) | any | ❌ No |
| Free | 0 | ❌ No |
| Free | 1 | ✅ Yes |

> `advertisement_status` comes from the `/profile` API response and is stored
> in `FFAppState().advertisementStatus`. It is read fresh on every timer tick
> via `shouldShowAds()`. No restart needed — changes take effect on next tick.

---

## 🆔 Ad Unit IDs

### Interstitial Ads

| Platform | Debug (Test Ads) | Release (Production) |
|----------|------------------|----------------------|
| **iOS** | `ca-app-pub-3940256099942544/4411468910` | `ca-app-pub-7068447607600610/5092686759` |
| **Android** | `ca-app-pub-3940256099942544/1033173712` | `ca-app-pub-7068447607600610/9304224423` |

### How Test vs Production is Determined

```dart
// In ad_service.dart:
static String get _interstitialAdUnitIdAndroid {
  return kDebugMode
      ? 'ca-app-pub-3940256099942544/1033173712'   // ← Test ad (debug builds)
      : 'ca-app-pub-7068447607600610/9304224423';   // ← Real ad (release builds)
}
```

- **`kDebugMode`** is `true` when running via `flutter run` or IDE
- **`kDebugMode`** is `false` in release builds (`flutter build apk --release`)
- Play Store builds are **always release** → always uses **real ad unit IDs**
- The `showTestAds` parameter in `admob_util` is set to `false` — we rely on `kDebugMode` in AdService instead

---

## ⏱️ Timing Summary

| Event | Timing |
|-------|--------|
| First ad preload | Immediately on app start |
| Global timer tick interval | Every 60 seconds |
| Initial cooldown (no ads) | First 3 minutes after app open |
| Minimum gap between ads | 3 minutes (`_adIntervalMinutes`) |
| Retry on load failure | 10s → 20s → 30s (3 attempts max) |
| Ad load from network | Typically 1-10 seconds |

**Why tick every 60s instead of every 3 min?**
If the ad wasn't loaded at the 3-min mark, we'd have to wait another 3 min.
With 60s ticks, we catch the ad within 1 minute of it becoming available.

---

## 📊 Where Ads Are Triggered (Pages)

**Ads are ONLY triggered by the global timer.** No page shows ads on navigation.

| Page | What it calls | What actually happens |
|------|--------------|----------------------|
| **Homepage** | `startPageTimer('homePage')` | No-op. Preloads ad as bonus. |
| **Eligible Players** | `startPageTimer('eligiblePlayers')` | No-op. Preloads ad as bonus. |
| **Compare Players** | `startPageTimer('eligiblePlayers')` | No-op. Preloads ad as bonus. |
| **Filter Screen** | `startPageTimer('eligiblePlayers')` | No-op. Preloads ad as bonus. |
| **All Players** | `startPageTimer('allPlayersPage')` | No-op. Preloads ad as bonus. |
| **Player Bio** | `startPageTimer('playerBio')` | No-op. Preloads ad as bonus. |
| **Play With Friends** | `startPageTimer('playWithFriends')` | No-op. Preloads ad as bonus. |

All `showInterstitialIfAllowed()` calls have been **removed** from page `initState()`.
The global timer is the **single source of ad showing**.

---

## 🐛 Previous Problems (Now Fixed)

| Problem | Old Behavior | New Behavior |
|---------|-------------|-------------|
| **Ad on every navigation** | `showInterstitialIfAllowed()` called on every page load with NO cooldown check — showed ad every time | `showInterstitialAd()` enforces 3-min gap; pages can call it freely, blocked if too soon |
| **Timer reset on navigation** | Each page start/stop created new timer; fast navigation = timer never fires | ONE global timer, never reset by navigation |
| **Ads rarely showed** | Load ad → wait 2s → try show (2s not enough) | Preload in background → show instantly when ready |
| **No reload after showing** | `_interstitialAd = null`, never reloaded | Auto-preloads next ad immediately after showing |
| **No retry on failure** | If load failed, never tried again | Exponential backoff + global timer retries on next tick |
| **Complex page logic** | Every page managed its own timer lifecycle | Pages are no-ops; all logic is centralized in AdService |
| **SmartInterstitialManager blocking** | `_blockInitialAd` re-blocked on every navigation | Initial cooldown built into global timer, never re-blocks |

---

## 🔍 Debug Logging

All ad events are logged with `debugPrint`. Look for these in the debug console:

```
[AdService] 🚀 Initializing global ad system
[AdService] ⏱️ Global timer started (checks every 60s, shows ad every 3min, initial cooldown 3min)
[AdService] ⏳ Preloading interstitial ad...
[AdService] ✅ Interstitial ad preloaded and READY
[AdService] ⏱️ Timer tick — time to show an ad
[AdService] 🎬 Showing interstitial ad NOW
[AdService] ✅ Interstitial ad shown successfully
[AdService] 🔄 Preloading NEXT interstitial ad
[AdService] ⏳ Initial cooldown active (45s / 180s)
[AdService] ⏳ 2min remaining until next ad eligible
[AdService] ⚠️ Ad not ready at tick time, preloading...
[AdService] 🔄 Retrying preload in 10s (attempt 1/3)
[AdService] startPageTimer(homePage) → no-op (global timer active)
[AdService] stopInterstitialTimer() → no-op (global timer active)
```

---

## 🗂️ Complete File Summary

### `lib/subscription/ad_service.dart` (Core)
- Singleton with global timer
- `initialize()` — called once from main.dart
- `preloadInterstitialAd()` — loads ad in background
- `showInterstitialAd()` — shows instantly + auto-reloads next
- `startPageTimer()` / `stopInterstitialTimer()` — backward-compatible no-ops
- `updateAdSettingsForPlan()` — stops/starts system based on plan

### `lib/flutter_flow/admob_util.dart` (SDK Wrapper)
- `loadInterstitialAdAsync()` — returns Future<bool> when ad is loaded
- `showInterstitialAd()` — shows the loaded ad
- `isInterstitialAdLoaded()` — checks if ad is in memory

### `lib/subscription/smart_interstitial_manager.dart` (Backward Compat)
- `showInterstitialIfAllowed()` — delegates to AdService
- `allowAdsAfterInitialDelay()` — no-op (global timer has built-in cooldown)
- `preloadInterstitial()` — delegates to AdService

### `lib/main.dart` (Entry Point)
- Calls `AdService().initialize()` after AdMob setup + subscription state init

