# VoteForGoat - Project Structure Documentation

This document provides a comprehensive overview of the project's folder and file structure to help onboard new developers.

---

## Table of Contents

1. [Project Overview](#project-overview)
2. [Directory Structure](#directory-structure)
3. [Folder Descriptions](#folder-descriptions)
4. [Screen/Page Organization](#screenpage-organization)
5. [Business Logic & Services](#business-logic--services)
6. [Theme & Styling](#theme--styling)
7. [Architecture Pattern](#architecture-pattern)

---

## Project Overview

**VoteForGoat** is a Flutter mobile application built with FlutterFlow. The app utilizes Firebase as its backend (Authentication, Firestore, Cloud Functions, Storage, Crashlytics, Performance, and Messaging). It supports social logins (Google, Apple, Facebook) and includes features like player rankings, comparisons, contests, play-with-friends functionality, and subscription management.

---

## Directory Structure

```
vote_for_goat/
├── analysis_options.yaml         # Dart analysis configuration
├── devtools_options.yaml         # DevTools configuration
├── pubspec.yaml                  # Project dependencies and metadata
├── pubspec.lock                  # Locked dependency versions
├── README.md                     # Project readme
├── AD_FLOW_DOCUMENTATION.md      # Ad flow documentation
├── AD_SCREENS_MAP.md             # Ad screens mapping
├── APP_UPDATE_IMPLEMENTATION.md  # App update implementation guide
├── APP_UPDATE_UNIVERSAL_ACCESS.md # App update universal access docs
├── CHANGES_APRIL_7_2026.md       # Changelog for April 7, 2026
├── VERSION_UPDATE_CHANGELOG.md   # Version update changelog
├── flutter_run_output.log        # Flutter run output log
│
├── android/                      # Android platform-specific code
│   ├── app/
│   │   ├── build.gradle          # App-level Gradle config
│   │   ├── google-services.json  # Firebase Android config
│   │   ├── proguard-rules.pro    # ProGuard rules
│   │   ├── vtg_key.jks           # Keystore for signing
│   │   └── src/                  # Android source files
│   ├── build.gradle              # Project-level Gradle config
│   ├── gradle.properties         # Gradle properties
│   ├── key.properties            # Signing key properties
│   ├── local.properties          # Local SDK paths
│   └── settings.gradle           # Gradle settings
│
├── ios/                          # iOS platform-specific code
│   ├── Podfile                   # CocoaPods dependencies
│   ├── Podfile.lock              # Locked pod versions
│   ├── Runner/                   # iOS app target
│   ├── Runner.xcodeproj/         # Xcode project
│   ├── Runner.xcworkspace/       # Xcode workspace
│   ├── Flutter/                  # Flutter iOS integration
│   ├── ImageNotification/        # Image notification extension
│   └── Pods/                     # CocoaPods dependencies
│
├── web/                          # Web platform files
│   ├── index.html                # Web entry point
│   ├── flutter_bootstrap.js      # Flutter web bootstrap
│   ├── debug.js                  # Debug utilities
│   └── icons/                    # Web icons
│
├── assets/                       # Static assets
│   ├── audios/                   # Audio files
│   ├── environment_values/       # Environment configuration (JSON)
│   ├── fonts/                    # Custom fonts (Poppins, Good Times, etc.)
│   ├── images/                   # Image assets (logos, backgrounds, icons)
│   ├── jsons/                    # JSON data files
│   ├── pdfs/                     # PDF documents
│   ├── rive_animations/          # Rive animation files
│   └── videos/                   # Video assets
│
├── firebase/                     # Firebase configuration
│   ├── firebase.json             # Firebase project config
│   ├── firestore.indexes.json    # Firestore indexes
│   ├── firestore.rules           # Firestore security rules
│   ├── storage.rules             # Storage security rules
│   └── functions/                # Cloud Functions (Node.js)
│       ├── index.js              # Functions entry point
│       ├── api_manager.js        # API management utilities
│       └── package.json          # Node.js dependencies
│
├── test/                         # Test files
│   └── widget_test.dart          # Widget tests
│
└── lib/                          # Main Dart source code
    ├── main.dart                 # App entry point
    ├── app_state.dart            # Global app state (Provider)
    ├── app_version.dart          # Hardcoded app version info (Android/iOS)
    ├── index.dart                # Library exports
    ├── environment_values.dart   # Environment configuration
    ├── theme_controller.dart     # Theme mode controller
    │
    ├── auth/                     # Authentication module
    ├── backend/                  # Backend services & data
    ├── cms/                      # Content management screens
    ├── compare/                  # Player comparison feature
    ├── components/               # Reusable UI components
    ├── contest_pages/            # Contest-related pages
    ├── custom_code/              # Custom actions & widgets
    ├── eligible_players/         # Eligible players feature
    ├── filter/                   # Filter functionality
    ├── flutter_flow/             # FlutterFlow utilities & theme
    ├── homepage/                 # Home-related pages
    ├── match_players/            # Match players feature
    ├── nav/                      # Navigation components
    ├── play_with_friends/        # Social play feature
    ├── player_bio/               # Player biography pages
    ├── profile_section/          # User profile pages
    ├── ranking_pages/            # Ranking feature pages
    ├── setting/                  # Settings pages
    ├── splash/                   # Splash screen
    └── subscription/             # Subscription & ads
```

---

## Folder Descriptions

### `/lib` - Main Source Code

| Folder | Purpose |
|--------|---------|
| `auth/` | Authentication logic including Firebase Auth, social logins (Google, Apple, Facebook), login/signup screens, OTP verification, and password management. |
| `backend/` | Backend services including API requests, Firebase configuration, Firestore schema/models, Cloud Functions, push notifications, and storage utilities. |
| `cms/` | Content management pages (Privacy Policy, Contact & Support). |
| `compare/` | Player comparison feature with comparison screens and history. |
| `components/` | Reusable UI components (dialogs, buttons, drawer menu, etc.). |
| `contest_pages/` | Contest feature pages including details, questions, and results. |
| `custom_code/` | Custom actions (device utilities, notifications) and custom widgets (navigation bars, loaders). |
| `eligible_players/` | Eligible players listing and management. |
| `filter/` | Filter screens and filtered results display. |
| `flutter_flow/` | FlutterFlow framework utilities, theme, navigation, and helper widgets. |
| `homepage/` | Home page, onboarding, about screen, and players list. |
| `match_players/` | Match players functionality screens. |
| `nav/` | Main navigation widget and model. |
| `play_with_friends/` | Social play feature with chat, team details, and friend rankings. |
| `player_bio/` | Player biography and details pages. |
| `profile_section/` | User profile, profile editing, and password reset. |
| `ranking_pages/` | User rankings, final rankings, and progress saving. |
| `setting/` | Settings page and password management. |
| `splash/` | Splash screen implementation. |
| `subscription/` | Subscription management, ad services, and premium features. |

---

## Screen/Page Organization

Each feature module follows a **page-per-folder** convention:

```
feature_name/
├── feature_page/
│   ├── feature_page_widget.dart    # Main page widget
│   └── feature_page_model.dart     # Page state/model
```

### Key Screen Locations

| Screen | Location |
|--------|----------|
| Splash Screen | `lib/splash/splash/` |
| Login/Signup | `lib/auth/log_in/`, `lib/auth/sign_up/` |
| Home Page | `lib/homepage/home_page/` |
| Player Rankings | `lib/ranking_pages/ranking_page/` |
| Player Comparison | `lib/compare/compare_players/` |
| Eligible Players | `lib/eligible_players/eligible_player/` |
| Play With Friends | `lib/play_with_friends/play_with_friends/` |
| User Profile | `lib/profile_section/my_profile/` |
| Settings | `lib/setting/setting_page/` |
| Subscription | `lib/subscription/subscription_page/` |
| Contest Pages | `lib/contest_pages/contest_page/` |

---

## Business Logic & Services

### API & Backend Services

```
lib/backend/
├── api_requests/
│   ├── api_calls.dart           # API call definitions
│   ├── api_manager.dart         # HTTP request management
│   └── get_streamed_response.dart
│
├── firebase/
│   └── firebase_config.dart     # Firebase initialization
│
├── cloud_functions/
│   └── cloud_functions.dart     # Firebase Cloud Functions calls
│
├── firebase_storage/
│   └── storage.dart             # File upload/download utilities
│
├── push_notifications/
│   ├── push_notifications_handler.dart
│   ├── push_notifications_util.dart
│   └── serialization_util.dart
│
├── schema/                       # Data models
│   ├── users_record.dart
│   ├── teams_record.dart
│   ├── messages_record.dart
│   ├── structs/                  # Custom structs
│   │   ├── index.dart
│   │   └── to_progress_struct.dart
│   └── util/                     # Schema utilities
│
└── backend.dart                  # Backend exports
```

### Authentication Services

```
lib/auth/
├── auth_manager.dart             # Auth state management
├── base_auth_user_provider.dart  # Base user provider
│
├── firebase_auth/
│   ├── firebase_auth_manager.dart
│   ├── firebase_user_provider.dart
│   ├── auth_util.dart
│   ├── email_auth.dart
│   ├── google_auth.dart
│   ├── apple_auth.dart
│   ├── facebook_auth.dart
│   ├── anonymous_auth.dart
│   ├── github_auth.dart
│   └── jwt_token_auth.dart
│
└── services/
    └── device_id_service.dart    # Device identification
```

### Custom Actions & Utilities

```
lib/custom_code/
├── actions/
│   ├── index.dart
│   ├── connect.dart              # Connectivity management
│   ├── get_fcm_token.dart        # FCM token retrieval
│   ├── lock_portrait_orientation.dart
│   └── setup_foreground_notifications.dart
│
└── widgets/
    ├── index.dart
    ├── cube_grid_loader.dart     # Loading indicator
    ├── curved_nav_painter.dart   # Custom navigation UI
    ├── curved_nav_with_pages.dart
    └── dot_curved_bottom_nav.dart
```

### Subscription & Ad Services

```
lib/subscription/
├── ad_service.dart               # Ad management
├── page_timer_mixin.dart         # Timer for ad display
├── smart_ad_banner_widget.dart   # Banner ad widget
├── smart_interstitial_manager.dart # Interstitial ad manager
└── subscription_page/            # Subscription UI
```

---

## Theme & Styling

### Theme Configuration

```
lib/flutter_flow/
├── flutter_flow_theme.dart       # Theme definitions (colors, typography)
├── flutter_flow_util.dart        # Utility functions
├── flutter_flow_widgets.dart     # Styled button widgets
├── custom_icons.dart             # Custom icon definitions
└── ...
```

### Key Theme Files

| File | Purpose |
|------|---------|
| `flutter_flow_theme.dart` | Defines light/dark themes, color palette, and text styles. |
| `theme_controller.dart` | Manages theme mode switching (light/dark). |
| `custom_icons.dart` | Custom icon font definitions. |

### Design Tokens

- **Colors**: Defined in `FlutterFlowTheme` class (primary, secondary, tertiary, background, etc.)
- **Typography**: Uses Google Fonts (Poppins) with predefined text styles
- **Spacing**: Standard Flutter EdgeInsets patterns
- **Font Assets**: Located in `assets/fonts/` (Poppins, Good Times)

### Global Styles

- Theme mode persistence via `FlutterFlowTheme.saveThemeMode()`
- Text scaling support with min/max constraints
- Dark and light mode support throughout the app

---

## Architecture Pattern

### Pattern: **Feature-First with Page-Model Separation**

This project follows a **FlutterFlow-generated architecture** which combines:

1. **Feature-First Organization**: Code is organized by feature/module rather than by technical layer
2. **Page-Model Pattern**: Each screen has a corresponding model for state management
3. **Provider for State Management**: Uses `Provider` package for global app state

### Architectural Characteristics

```
┌─────────────────────────────────────────────────────┐
│                    Presentation                      │
│  ┌─────────────────────────────────────────────────┐│
│  │  Pages (Widgets)     │    Components            ││
│  │  - *_widget.dart     │    - Reusable UI         ││
│  └─────────────────────────────────────────────────┘│
├─────────────────────────────────────────────────────┤
│                   State Management                   │
│  ┌─────────────────────────────────────────────────┐│
│  │  Page Models         │    App State             ││
│  │  - *_model.dart      │    - app_state.dart      ││
│  │  (ChangeNotifier)    │    (Provider)            ││
│  └─────────────────────────────────────────────────┘│
├─────────────────────────────────────────────────────┤
│                      Services                        │
│  ┌─────────────────────────────────────────────────┐│
│  │  Backend Services    │    Auth Services         ││
│  │  - API calls         │    - Firebase Auth       ││
│  │  - Cloud Functions   │    - Social Auth         ││
│  └─────────────────────────────────────────────────┘│
├─────────────────────────────────────────────────────┤
│                    Data Layer                        │
│  ┌─────────────────────────────────────────────────┐│
│  │  Schema/Models       │    Firebase              ││
│  │  - *_record.dart     │    - Firestore           ││
│  │  - structs/          │    - Storage             ││
│  └─────────────────────────────────────────────────┘│
└─────────────────────────────────────────────────────┘
```

### Key Architectural Decisions

| Aspect | Implementation |
|--------|----------------|
| **State Management** | Provider + ChangeNotifier pattern |
| **Navigation** | GoRouter for declarative routing |
| **Backend** | Firebase (Firestore, Auth, Functions, Storage) |
| **API Layer** | Custom API manager with HTTP client |
| **Authentication** | Firebase Auth with multiple providers |
| **Theming** | Custom FlutterFlowTheme with light/dark support |
| **Ads** | Google Mobile Ads (AdMob) integration |
| **Push Notifications** | Firebase Cloud Messaging (FCM) |

### File Naming Conventions

- **Pages**: `*_widget.dart` (UI) + `*_model.dart` (state)
- **Records/Models**: `*_record.dart` (Firestore documents)
- **Utilities**: `*_util.dart`
- **Services**: `*_service.dart`
- **Index files**: `index.dart` (exports for barrel pattern)

---

## Getting Started

1. **Install Dependencies**
   ```bash
   flutter pub get
   ```

2. **Run the App**
   ```bash
   flutter run
   ```

3. **Build for Release**
   ```bash
   # Android
   flutter build apk --release
   
   # iOS
   flutter build ios --release
   ```

---

## Additional Resources

- [Flutter Documentation](https://docs.flutter.dev/)
- [Firebase Documentation](https://firebase.google.com/docs)
- [FlutterFlow Documentation](https://docs.flutterflow.io/)
- [Provider Package](https://pub.dev/packages/provider)
- [GoRouter Documentation](https://pub.dev/packages/go_router)

---

*Last Updated: February 2026*

