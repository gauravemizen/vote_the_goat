# 🐐 Vote For Goat

**Vote For Goat** is a Flutter mobile application that lets users vote for their favourite athletes — the G.O.A.T (Greatest Of All Time) — across different sports. Users can browse players, compare them head-to-head, participate in contests, track rankings, and manage a personalised profile.

---

## 📱 Platform Support

| Platform | Supported |
|----------|-----------|
| Android  | ✅        |
| iOS      | ✅        |

**Current Version:** `1.0.1` (Android Build 9 / iOS Build 10)

---

## 🏗️ Project Architecture

The project is built with **Flutter** using **FlutterFlow** as the base scaffolding, and is structured around feature-based directories under `lib/`.

```
lib/
├── auth/               # Login, Sign-Up, OTP, Forgot Password, Change Password
├── backend/            # API calls, Firebase, push notifications, app update service
├── cms/                # CMS-driven content pages (About, Legal, etc.)
├── compare/            # Head-to-head player comparison
├── components/         # Reusable UI components (Drawer, Dialogs, Buttons, Ads)
├── contest_pages/      # Contest listing, details, questions & results
├── custom_code/        # Custom Flutter widgets and actions
├── eligible_players/   # Player eligibility screens
├── filter/             # Filtering logic for players and rankings
├── flutter_flow/       # FlutterFlow-generated theme, routing, and utilities
├── homepage/           # Home page, onboarding, player list
├── match_players/      # Player match-up voting logic
├── nav/                # Bottom navigation bar widget
├── player_bio/         # Player biography and details
├── play_with_friends/  # Social play / play with friends feature
├── profile_section/    # User profile management
├── ranking_pages/      # Global and personal ranking pages
├── setting/            # App settings
├── splash/             # Splash screen
├── subscription/       # In-App Purchases, Ad service, subscription plans
├── app_state.dart      # Global application state (FFAppState)
├── app_version.dart    # Hardcoded version info for Android & iOS
├── main.dart           # App entry point
└── theme_controller.dart # Dark/Light mode persistence
```

---

## ✨ Key Features

### 🔐 Authentication
- **Email/Password** login and registration
- **OTP Verification** on sign-up and forgot password flow
- **Forgot Password** with OTP-based reset
- **Change Password** from the profile section
- **Guest Login** — users can browse the app without creating an account
- **Google Sign-In** and **Apple Sign-In** (iOS)
- **Facebook Login** support
- Secure token storage using `flutter_secure_storage`

### 🗳️ Voting
- Vote for your favourite players (G.O.A.T)
- Swipe-style match-up cards to vote between two players
- Support for extra votes and unlimited voting via subscription plans

### 🏆 Rankings
- View global leaderboard rankings
- Track your personal vote history and progress
- Save and view your final ranking

### 🤜🤛 Player Comparison
- Compare two players head-to-head side by side
- View your previous comparisons history

### 📋 Player Profiles
- Detailed player biography pages
- Player stats and media
- Browse the full player list with filters

### 🏅 Contests
- Active contest listings
- Contest details and questions
- View contest results

### 🎮 Play With Friends
- Create or join sessions to vote alongside friends

### 👤 User Profile
- View and update profile details and avatar
- Manage notification preferences
- View subscription plan status

### 💎 Subscription & In-App Purchases
- **Free plan** — supported by ads
- **Premium plans** — remove ads, unlock extra/unlimited votes
- In-App Purchase integration via `in_app_purchase` (App Store & Play Store)
- Subscription state persisted via `SharedPreferences`

### 📢 Advertisements
- **Google Mobile Ads** integration (banner + interstitial)
- Smart ad service with:
  - Initial cooldown (3 min after app start)
  - Minimum interval between interstitials (3 min)
  - Automatic suppression on auth screens
  - Ad-free experience for premium subscribers

### 🔔 Push Notifications
- **Firebase Cloud Messaging (FCM)** for push notifications
- Toggle notifications on/off per user from the drawer menu
- Foreground notification handling

### 🌗 Theme
- Dark and Light mode support
- Theme selection persisted across sessions via `ThemeController`

### 🔄 App Update Service
- Checks the backend API for available app updates on launch
- Shows a forced or optional update dialog depending on the server response
- Compares current build number against the server's minimum required version

### 🔌 Connectivity
- Offline detection with `internet_connection_checker_plus`
- Connectivity alert component shown when offline

---

## 🔧 Tech Stack & Key Dependencies

| Category | Package |
|---|---|
| Framework | Flutter 3.x (Dart ≥3.0) |
| State Management | `provider` + FlutterFlow `FFAppState` |
| Navigation | `go_router` |
| Backend / API | Custom REST API (`https://votethegoat.ezxdemo.com/api`) |
| Authentication | `firebase_auth`, `google_sign_in`, `sign_in_with_apple`, `flutter_facebook_auth` |
| Database (cloud) | `cloud_firestore` |
| Push Notifications | `firebase_messaging`, `flutter_local_notifications` |
| Crash Reporting | `firebase_crashlytics` |
| Analytics | `firebase_analytics` |
| Performance | `firebase_performance` |
| Storage | `firebase_storage` |
| Ads | `google_mobile_ads` |
| In-App Purchases | `in_app_purchase`, `in_app_purchase_storekit` |
| Secure Storage | `flutter_secure_storage` |
| Local Persistence | `shared_preferences` |
| HTTP | `http` |
| Image | `cached_network_image`, `image_picker` |
| Video | `video_player`, `chewie` |
| UI | `google_fonts`, `flutter_animate`, `lottie`, `flutter_svg`, `carousel_slider` |
| WebView | `webview_flutter`, `webviewx_plus` |
| Utilities | `uuid`, `intl`, `timeago`, `permission_handler`, `share_plus`, `url_launcher` |

---

## 🗺️ Screen Flow

```
Splash
  └──> Login / Sign Up / Guest Login
         └──> OTP Verification (on sign-up / forgot password)
Home Page
  ├── Drawer Menu
  │     ├── My Profile         (hidden for guests)
  │     ├── Notifications      (hidden for guests)
  │     ├── Contest            (hidden for guests)
  │     ├── Premium Plans      (hidden for guests)
  │     ├── Delete Account     (hidden for guests)
  │     ├── Theme Toggle
  │     ├── About Vote The Goat
  │     ├── Legal & Privacy
  │     ├── Contact Support
  │     ├── Logout             (Sign Up button for guests)
  │     └── App Version
  ├── Player List / Match-up Voting
  ├── Rankings
  ├── Compare Players
  └── Play With Friends
```

---

## 🧩 Guest User Experience

Users who choose to explore without registering are logged in as **guest users**. The app detects this via `$.data.is_guest` in the profile API response. Guest users:

- Can browse home, rankings, and player bios
- **Cannot** access: My Profile, Notifications, Contest, Premium Plans, Delete Account
- See a **Sign Up** button in the drawer instead of Logout
- Are prompted to sign up when trying to use restricted features

---

## 🔑 API Overview

All API calls go through the `AuthGroup` and `DashboardGroup` base URLs:

```
Base URL: https://votethegoat.ezxdemo.com/api
```

### Auth Endpoints
| Endpoint | Description |
|---|---|
| `POST /login` | Email/password login |
| `POST /register` | New user sign-up |
| `POST /otp-verify` | OTP verification |
| `POST /forgot-password` | Send OTP for password reset |
| `POST /forgot-otp-verify` | Verify forgot-password OTP |
| `POST /reset-password` | Reset password |
| `POST /change-password` | Change password (authenticated) |
| `POST /logout` | Log out and invalidate token |
| `POST /guest-login` | Anonymous guest login |
| `POST /resend-otp` | Resend OTP code |

### Dashboard Endpoints (Authenticated)
| Endpoint | Description |
|---|---|
| `GET /profile` | Fetch user profile + notification status + guest flag |
| `GET /version-check` | Check for app updates |
| `POST /enable-notification` | Toggle push notifications |
| `DELETE /delete-user` | Delete account permanently |

---

## 🚀 Getting Started

### Prerequisites
- Flutter SDK `>=3.0.0 <4.0.0`
- Dart SDK `>=3.0.0`
- Android Studio / Xcode
- Firebase project configured (see `firebase/`)

### Setup

1. **Clone the repository**
   ```bash
   git clone <repo-url>
   cd vote_for_goat
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Configure Firebase**
   - Place `google-services.json` in `android/app/`
   - Place `GoogleService-Info.plist` in `ios/Runner/`

4. **Environment values**
   - Update environment-specific values in `assets/environment_values/`

5. **Run the app**
   ```bash
   # Android
   flutter run

   # iOS
   cd ios && pod install && cd ..
   flutter run
   ```

### Build

```bash
# Android release APK
flutter build apk --release

# Android App Bundle (for Play Store)
flutter build appbundle --release

# iOS (for App Store)
flutter build ipa --release
```

---

## 🔒 Security

- Authentication tokens stored securely using `flutter_secure_storage`
- Firestore rules restrict write access (`allow write: if false` on team documents)
- Sensitive credentials never committed to source control

---

## 📁 Firebase Configuration

Firebase services used:

| Service | Purpose |
|---|---|
| Firebase Auth | Social login providers |
| Cloud Firestore | Real-time team/messages data |
| Firebase Storage | Media uploads |
| Firebase Messaging | Push notifications |
| Firebase Crashlytics | Crash reporting |
| Firebase Analytics | User analytics |
| Firebase Performance | Performance monitoring |

---

## 📝 Notes

- The project was scaffolded with **FlutterFlow** — the `flutter_flow/` directory contains auto-generated theme, utilities, and routing helpers.
- FlutterFlow's `WidgetClassDebugData` and `debugLogWidgetClass` are used throughout models for live debug inspection.
- The app is locked to **portrait orientation** (`lockPortraitOrientation` custom action).
- AdMob ad unit IDs should be replaced with production IDs before releasing (marked with `// TODO` comments in `ad_service.dart`).

---

## 📄 License

Private — All rights reserved. Not published to pub.dev.
