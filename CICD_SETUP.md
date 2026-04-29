# CI/CD Pipeline Setup Guide

## Overview
This project uses **GitHub Actions** + **Fastlane** to build and deploy to Google Play Store and Apple App Store. Both workflows are triggered manually via `workflow_dispatch`.

---

## Files Created

```
.github/workflows/
├── android-deploy.yml    # Android build & deploy workflow
└── ios-deploy.yml        # iOS build & deploy workflow

android/
├── Gemfile               # Ruby dependencies for Fastlane
└── fastlane/
    ├── Appfile           # Android app config
    └── Fastfile          # Android deploy lane

ios/
├── Gemfile               # Ruby dependencies for Fastlane
├── ExportOptions.plist   # iOS export configuration
└── fastlane/
    ├── Appfile           # iOS app config
    └── Fastfile          # iOS deploy lane
```

---

## GitHub Secrets Required

Go to: `https://github.com/gauravemizen/vote_the_goat/settings/secrets/actions`

### Android Secrets

| Secret | Description | How to get it |
|--------|-------------|---------------|
| `KEYSTORE_BASE64` | Base64-encoded keystore file | Run: `base64 -i android/app/vtg_key.jks \| pbcopy` |
| `KEY_ALIAS` | Keystore key alias | `vtg_alias` |
| `KEY_PASSWORD` | Key password | Your key password |
| `STORE_PASSWORD` | Store password | Your store password |
| `PLAY_STORE_SERVICE_ACCOUNT_JSON` | Base64-encoded Google Play service account JSON | See [Play Store Setup](#play-store-service-account) below |

### iOS Secrets

| Secret | Description | How to get it |
|--------|-------------|---------------|
| `P12_CERTIFICATE_BASE64` | Base64-encoded .p12 distribution certificate | Export from Keychain Access, then: `base64 -i cert.p12 \| pbcopy` |
| `P12_PASSWORD` | Password for the .p12 file | Password you set during export |
| `PROVISIONING_PROFILE_BASE64` | Base64-encoded provisioning profile | `base64 -i profile.mobileprovision \| pbcopy` |
| `APP_STORE_CONNECT_API_KEY_ID` | App Store Connect API Key ID | From App Store Connect > Users & Access > Keys |
| `APP_STORE_CONNECT_ISSUER_ID` | App Store Connect Issuer ID | From App Store Connect > Users & Access > Keys |
| `APP_STORE_CONNECT_API_KEY_BASE64` | Base64-encoded .p8 API key file | `base64 -i AuthKey_XXXXX.p8 \| pbcopy` |

---

## How to Use

### Deploy Android to Play Store
1. Go to **Actions** tab in GitHub
2. Select **"Deploy Android to Play Store"**
3. Click **"Run workflow"**
4. Choose track: `internal`, `alpha`, `beta`, or `production`
5. Click **"Run workflow"**

### Deploy iOS to App Store
1. Go to **Actions** tab in GitHub
2. Select **"Deploy iOS to App Store"**
3. Click **"Run workflow"**
4. Choose destination: `testflight` or `appstore`
5. Click **"Run workflow"**

---

## Setup Instructions

### Play Store Service Account
1. Go to [Google Cloud Console](https://console.cloud.google.com/)
2. Select your project (or create one linked to your Play Console)
3. Go to **IAM & Admin > Service Accounts**
4. Create a service account with **"Service Account User"** role
5. Create a JSON key and download it
6. Go to [Google Play Console](https://play.google.com/console) > **Settings > API access**
7. Link the service account and grant **"Release manager"** permission
8. Base64 encode the JSON: `base64 -i service-account.json | pbcopy`
9. Add as `PLAY_STORE_SERVICE_ACCOUNT_JSON` secret

### App Store Connect API Key
1. Go to [App Store Connect](https://appstoreconnect.apple.com/) > **Users and Access > Integrations > App Store Connect API**
2. Click **"Generate API Key"** with **"App Manager"** role
3. Note the **Key ID** and **Issuer ID**
4. Download the `.p8` file (only available once!)
5. Base64 encode: `base64 -i AuthKey_XXXXX.p8 | pbcopy`
6. Add all three as GitHub secrets

### iOS Certificate & Provisioning Profile
1. Open **Keychain Access** on your Mac
2. Find your **Apple Distribution** certificate
3. Right-click > **Export** as `.p12` (set a password)
4. Base64 encode: `base64 -i certificate.p12 | pbcopy`
5. Download your **App Store Distribution** provisioning profile from [Apple Developer Portal](https://developer.apple.com/account/resources/profiles/list)
6. Base64 encode: `base64 -i profile.mobileprovision | pbcopy`

---

## Version Management
Version is read from `pubspec.yaml` (`version: 1.0.1+11`). Update it before triggering a deploy:
- `1.0.1` = version name (shown to users)
- `11` = build number (must increment for each store upload)

