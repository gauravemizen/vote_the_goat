# 🚀 CI/CD Pipeline — How to Trigger (Android)

## Overview

The Android CI/CD pipeline is defined in `.github/workflows/android-deploy.yml`.  
It builds a signed release AAB and deploys it to the **Google Play Store** using **Fastlane**.

---

## ✅ Prerequisites

### 1. GitHub Secrets — Must be configured before triggering

Go to: **GitHub Repo → Settings → Secrets and variables → Actions → New repository secret**

| Secret Name | Description | How to get it |
|---|---|---|
| `KEYSTORE_BASE64` | Base64-encoded `vtg_key.jks` keystore | Run: `base64 -i android/app/vtg_key.jks` |
| `STORE_PASSWORD` | Keystore store password | From `android/key.properties` |
| `KEY_PASSWORD` | Key entry password | From `android/key.properties` |
| `KEY_ALIAS` | Key alias name | From `android/key.properties` |
| `PLAY_STORE_SERVICE_ACCOUNT_JSON` | Base64-encoded Google Play service account JSON | Run: `base64 -i your-service-account.json` |

#### Commands to encode secrets locally:
```bash
# Encode keystore
base64 -i android/app/vtg_key.jks | pbcopy
# ☝️ This copies it to clipboard — paste directly into GitHub secret

# Encode Play Store service account JSON
base64 -i path/to/play-store-service-account.json | pbcopy
```

---

## 🔁 How to Trigger the Pipeline

### Option 1: GitHub Website (Manual Trigger)
1. Go to: `https://github.com/gauravemizen/vote_the_goat/actions`
2. Click **"Deploy Android to Play Store"** workflow
3. Click **"Run workflow"** button (top right)
4. Select the branch (e.g., `1.0.2-cicd-pipeline-setup` or `main`)
5. Choose the **track**:
   - `internal` — for internal testing (default)
   - `alpha` — for alpha testers
   - `beta` — for beta testers
   - `production` — for public release
6. Click **"Run workflow"**

---

### Option 2: GitHub CLI (Terminal)

#### Install GitHub CLI (if not installed):
```bash
brew install gh
```

#### Login:
```bash
gh auth login
```

#### Trigger the pipeline:
```bash
# Deploy to internal track (default)
gh workflow run android-deploy.yml \
  --repo gauravemizen/vote_the_goat \
  --ref main \
  -f track=internal

# Deploy to beta track
gh workflow run android-deploy.yml \
  --repo gauravemizen/vote_the_goat \
  --ref main \
  -f track=beta

# Deploy to production
gh workflow run android-deploy.yml \
  --repo gauravemizen/vote_the_goat \
  --ref main \
  -f track=production
```

#### Check pipeline status:
```bash
# List recent runs
gh run list --repo gauravemizen/vote_the_goat --workflow android-deploy.yml

# Watch a specific run in real-time (replace RUN_ID)
gh run watch RUN_ID --repo gauravemizen/vote_the_goat

# View logs of a run
gh run view RUN_ID --log --repo gauravemizen/vote_the_goat
```

---

### Option 3: GitHub REST API (curl)

```bash
# Replace YOUR_TOKEN with a GitHub personal access token
curl -X POST \
  -H "Authorization: Bearer YOUR_TOKEN" \
  -H "Accept: application/vnd.github+json" \
  https://api.github.com/repos/gauravemizen/vote_the_goat/actions/workflows/android-deploy.yml/dispatches \
  -d '{"ref":"main","inputs":{"track":"internal"}}'
```

---

## 🔄 What the Pipeline Does (Step by Step)

```
1. Checkout code
        ↓
2. Set up Java 17 (Temurin)
        ↓
3. Set up Flutter 3.24.5 (stable)
        ↓
4. flutter pub get  (install dependencies)
        ↓
5. Extract version from pubspec.yaml
        ↓
6. Decode keystore from KEYSTORE_BASE64 secret → android/app/vtg_key.jks
        ↓
7. Create android/key.properties with signing credentials
        ↓
8. flutter build appbundle --release  (builds signed .aab)
        ↓
9. Set up Ruby 3.2 + Bundler
        ↓
10. bundle install  (installs Fastlane)
        ↓
11. Decode Play Store key → android/fastlane/play-store-key.json
        ↓
12. bundle exec fastlane deploy track:<selected_track>
        ↓
13. Upload AAB as build artifact (downloadable from GitHub)
```

---

## 📦 Build Output

- **AAB location (in CI):** `build/app/outputs/bundle/release/app-release.aab`
- **GitHub Artifact:** Available under the workflow run → **Artifacts** section
- **Play Store:** Uploaded as a **draft** to the selected track

---

## 🛠 Run Locally (Test Build Without Deploying)

```bash
# From project root
flutter pub get
flutter build appbundle --release

# Verify the AAB was created
ls build/app/outputs/bundle/release/app-release.aab
```

#### To test Fastlane deploy locally:
```bash
cd android

# Make sure play-store-key.json is present
# Make sure key.properties is configured

bundle install
bundle exec fastlane deploy track:internal
```

---

## 🔗 Useful Links

- **GitHub Actions:** https://github.com/gauravemizen/vote_the_goat/actions
- **Play Console:** https://play.google.com/console
- **Workflow File:** `.github/workflows/android-deploy.yml`
- **Fastfile:** `android/fastlane/Fastfile`

