# 📊 Ad Screens Map — Vote For Goat

> Last updated: April 7, 2026

---

## Summary

Ads are shown on **7 out of 20+ screens**. All auth, settings, subscription,
contest, ranking, match, profile, and chat screens are **ad-free**.

---

## ✅ Screens WITH Ads (7 screens)

| # | Screen | File | Triggers on page load |
|---|--------|------|-----------------------|
| 1 | **Home Page** | `lib/homepage/home_page/home_page_widget.dart` | `startPageTimer('homePage')` + `showInterstitialIfAllowed()` |
| 2 | **Eligible Players** | `lib/eligible_players/eligible_player/eligible_player_widget.dart` | `startPageTimer('eligiblePlayers')` + `showInterstitialIfAllowed()` |
| 3 | **Compare Players** | `lib/compare/compare_players/compare_players_widget.dart` | `startPageTimer('eligiblePlayers')` + `showInterstitialIfAllowed()` |
| 4 | **Filter Screen** | `lib/filter/filter_screen/filter_screen_widget.dart` | `startPageTimer('eligiblePlayers')` + `showInterstitialIfAllowed()` |
| 5 | **All Players** | `lib/player_bio/all_players/all_players_widget.dart` | `startPageTimer('allPlayersPage')` + `showInterstitialIfAllowed()` |
| 6 | **Player Bio** | `lib/player_bio/player_bio/player_bio_widget.dart` | `startPageTimer('playerBio')` + `showInterstitialIfAllowed()` |
| 7 | **Play With Friends** | `lib/play_with_friends/play_with_friends/play_with_friends_widget.dart` | `startPageTimer('playWithFriends')` + `showInterstitialIfAllowed()` |

### What happens on these screens:
- `startPageTimer()` → no-op (just preloads an ad as a bonus, global timer handles showing)
- `showInterstitialIfAllowed()` → tries to show an ad, but `AdService.showInterstitialAd()` enforces:
  - ❌ Blocked if < 3 min since app opened (initial cooldown)
  - ❌ Blocked if < 3 min since last ad shown (gap check)
  - ❌ Blocked if no ad is preloaded yet
  - ✅ Shows only if all 3 checks pass

---

## ❌ Screens WITHOUT Ads (everything else)

### Auth Screens
| Screen | File | Ads? |
|--------|------|------|
| Login | `lib/auth/log_in/log_in_widget.dart` | ❌ No |
| Login Copy | `lib/auth/log_in_copy/log_in_copy_widget.dart` | ❌ No |
| Sign Up | `lib/auth/sign_up/sign_up_widget.dart` | ❌ No |
| OTP | `lib/auth/otp/otp_widget.dart` | ❌ No |
| Forgot Password | `lib/auth/forgot_password/forgot_password_widget.dart` | ❌ No |
| Change Password | `lib/auth/change_password/change_password_widget.dart` | ❌ No |

### App Entry
| Screen | File | Ads? |
|--------|------|------|
| Splash | `lib/splash/splash/splash_widget.dart` | ❌ No |

### Settings & Profile
| Screen | File | Ads? |
|--------|------|------|
| Settings | `lib/setting/setting_page/setting_page_widget.dart` | ❌ No |
| My Profile | `lib/profile_section/my_profile_copy/my_profile_copy_widget.dart` | ❌ No |
| Reset Password | `lib/profile_section/reset_password/reset_password_widget.dart` | ❌ No |

### Subscription
| Screen | File | Ads? |
|--------|------|------|
| Subscription Page | `lib/subscription/subscription_page/subscription_page_widget.dart` | ❌ No |

### Match Players
| Screen | File | Ads? |
|--------|------|------|
| Match Players | `lib/match_players/match_playerss/match_playerss_widget.dart` | ❌ No |
| Resume Match | `lib/match_players/match_playerss/resume_to_match_players_widget.dart` | ❌ No |

### Contest Pages
| Screen | File | Ads? |
|--------|------|------|
| Contest Page | `lib/contest_pages/contest_page/contest_page_widget.dart` | ❌ No |
| Contest Details | `lib/contest_pages/contest_details/contest_details_widget.dart` | ❌ No |
| Active Contest Details | `lib/contest_pages/active_contast_details/active_contast_details_widget.dart` | ❌ No |
| Contest Question | `lib/contest_pages/contest_question/contest_question_widget.dart` | ❌ No |
| Contest Result | `lib/contest_pages/contest_result/contest_result_widget.dart` | ❌ No |

### Ranking Pages
| Screen | File | Ads? |
|--------|------|------|
| Ranking Page | `lib/ranking_pages/ranking_page/ranking_page_widget.dart` | ❌ No |
| Your Final Ranking | `lib/ranking_pages/your_final_ranking/your_final_ranking_widget.dart` | ❌ No |
| Save Progress | `lib/ranking_pages/save_progress/save_progress_ranking_widget.dart` | ❌ No |

### Play With Friends (sub-screens)
| Screen | File | Ads? |
|--------|------|------|
| Chat Page | `lib/play_with_friends/chat_page/chat_page_widget.dart` | ❌ No |
| Team Details | `lib/play_with_friends/team_details/team_details_widget.dart` | ❌ No |
| Friend Ranking | `lib/play_with_friends/play_with_friend_ranking/play_with_friend_ranking_widget.dart` | ❌ No |

### Other
| Screen | File | Ads? |
|--------|------|------|
| Filter Result | `lib/filter/filter_result/filter_result_widget.dart` | ❌ No |
| Your Comparisons | `lib/compare/your_comparisons/your_comparisons_widget.dart` | ❌ No |
| Home Onboarding | `lib/homepage/home_onboarding/home_onboarding_widget.dart` | ❌ No |

### Components / Dialogs / Bottom Sheets
| Component | Ads? |
|-----------|------|
| Drawer Menu | ❌ No |
| Winner Bottom Sheet | ❌ No |
| Delete Account Dialog | ❌ No |
| Log Out Dialog | ❌ No |
| App Update Dialog | ❌ No |
| Confirm Dialog | ❌ No |
| No Data Found | ❌ No |

---

## 🌍 Global Timer (applies to ALL screens)

In addition to the 7 page-level triggers above, the **global timer** runs
independently and can show an ad on ANY screen:

```
Global timer (started in main.dart)
  │
  ├── Ticks every 60 seconds
  ├── Checks: 3 min since app opened? 3 min since last ad? Ad preloaded?
  ├── If all yes → shows interstitial ad (regardless of which screen is active)
  └── If no → skips, tries again in 60 seconds
```

This means even screens without explicit ad triggers (like Settings or Ranking)
could potentially show an ad if the global timer fires while the user is on
that screen. The timer doesn't know or care which screen is active.

---

## 📈 Visual Map

```
                        ┌─────────────────┐
                        │   APP STARTS    │
                        │  (Splash - no ads)│
                        └────────┬────────┘
                                 │
                    ┌────────────┴────────────┐
                    │                         │
              ┌─────┴─────┐           ┌───────┴───────┐
              │  Login     │           │  Sign Up      │
              │  ❌ No ads │           │  ❌ No ads    │
              └─────┬─────┘           └───────┬───────┘
                    │                         │
                    └────────────┬────────────┘
                                 │
                    ┌────────────┴────────────┐
                    │      HOME PAGE          │
                    │      ✅ HAS ADS         │
                    └────────────┬────────────┘
                                 │
         ┌──────────┬────────────┼────────────┬──────────┐
         │          │            │            │          │
    ┌────┴────┐ ┌───┴───┐ ┌─────┴─────┐ ┌───┴────┐ ┌───┴────────┐
    │Eligible │ │Filter │ │Play With  │ │Contest │ │Ranking     │
    │Players  │ │Screen │ │Friends    │ │Page    │ │Page        │
    │✅ ADS   │ │✅ ADS │ │✅ ADS     │ │❌ No   │ │❌ No       │
    └────┬────┘ └───┬───┘ └─────┬─────┘ └────────┘ └────────────┘
         │          │            │
    ┌────┴────┐ ┌───┴───────┐ ┌─┴──────────┐
    │Compare  │ │Filter     │ │Chat Page   │
    │Players  │ │Result     │ │❌ No ads   │
    │✅ ADS   │ │❌ No ads  │ └────────────┘
    └────┬────┘ └───────────┘
         │
    ┌────┴────┐
    │All      │
    │Players  │
    │✅ ADS   │
    └────┬────┘
         │
    ┌────┴────┐
    │Player   │
    │Bio      │
    │✅ ADS   │
    └─────────┘
```

---

## ⏱️ When does an ad actually show?

Even on the 7 screens with ads, an ad will ONLY show if:

1. **User is on free plan** (paid users never see ads)
2. **Initial cooldown passed** (3 min after app open)
3. **Gap check passed** (3 min since last ad shown)
4. **Ad is preloaded** (loaded in memory, ready to display)

If any of these fail, the ad is silently skipped.

