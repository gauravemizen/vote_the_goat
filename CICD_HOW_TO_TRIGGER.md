# 🚀 CI/CD Pipeline — How to Trigger (Android)

## Overview

The Android CI/CD pipeline is defined in `.github/workflows/android-deploy.yml`.  
It builds a signed release AAB and deploys it to the **Google Play Store** using **Fastlane**.

> ✅ **This project is already live in production.** The keystore (`vtg_key.jks`) and all signing credentials are already in place. You just need to add them as **GitHub Secrets** once, then trigger the pipeline anytime.

---

## ✅ Step 1 — Add GitHub Secrets (One-Time Setup)

Go to: **GitHub Repo → Settings → Secrets and variables → Actions → New repository secret**

### Secrets to add:

| Secret Name | Value |
|---|---|
| `KEYSTORE_BASE64` | *(run command below to get it)* |
| `STORE_PASSWORD` | `123456` |
| `KEY_PASSWORD` | `123456` |
| `KEY_ALIAS` | `vtg_alias` |
| `PLAY_STORE_SERVICE_ACCOUNT_JSON` | *(run command below to get it)* |

### Commands to generate the Base64 secrets (run from project root):

```bash
# 1. Encode the keystore and copy to clipboard
base64 -i android/app/vtg_key.jks | pbcopy
# ☝️ Now paste this value into the KEYSTORE_BASE64 secret on GitHub

# 2. Encode the Play Store service account JSON and copy to clipboard
base64 -i android/fastlane/play-store-key.json | pbcopy
# ☝️ Now paste this value into the PLAY_STORE_SERVICE_ACCOUNT_JSON secret on GitHub
```

> 💡 `pbcopy` automatically copies the output to your clipboard. Just go to GitHub and paste.

---

## 🔁 Step 2 — Trigger the Pipeline

### Option 1: GitHub Website (Easiest)
1. Go to: **https://github.com/gauravemizen/vote_the_goat/actions**
2. Click **"Deploy Android to Play Store"** in the left sidebar
3. Click **"Run workflow"** (top right of the runs list)
4. Select the branch: `main` (or `1.0.2-cicd-pipeline-setup` for testing)
5. Choose the **track**:
   - `internal` — internal testing ✅ *(use this for test runs)*
   - `alpha` — alpha testers
   - `beta` — beta testers
   - `production` — live on Play Store
6. Click **"Run workflow"** ✅

---

### Option 2: GitHub CLI (Terminal)

```bash
# Deploy to internal track (recommended for testing the pipeline)
gh workflow run android-deploy.yml \
  --repo gauravemizen/vote_the_goat \
  --ref main \
  -f track=internal

# Deploy to production
gh workflow run android-deploy.yml \
  --repo gauravemizen/vote_the_goat \
  --ref main \
  -f track=production
```

#### Monitor the run:
```bash
# List recent pipeline runs
gh run list --repo gauravemizen/vote_the_goat --workflow android-deploy.yml

# Watch live logs (replace RUN_ID with the number from the list above)
gh run watch RUN_ID --repo gauravemizen/vote_the_goat

# View full logs after completion
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
2. Set up Flutter 3.27.4 (stable)
        ↓
4. flutter pub get  (install dependencies)
        ↓
5. Extract version from pubspec.yaml
        ↓
6. Decode KEYSTORE_BASE64 secret → android/app/vtg_key.jks
        ↓
7. Create android/key.properties (storePassword, keyPassword, keyAlias)
        ↓
8. flutter build appbundle --release  (builds signed .aab)
        ↓
9. Set up Ruby 3.2 + Bundler
        ↓
10. bundle install  (installs Fastlane)
        ↓
11. Decode PLAY_STORE_SERVICE_ACCOUNT_JSON → android/fastlane/play-store-key.json
        ↓
12. bundle exec fastlane deploy track:<selected_track>
        ↓
13. Upload AAB as downloadable artifact on GitHub
```

---

## 📦 Build Output

- **AAB file (in CI):** `build/app/outputs/bundle/release/app-release.aab`
- **GitHub Artifact:** Go to the workflow run → scroll to **Artifacts** section → download
- **Play Store:** Uploaded as a **draft** to the selected track (you must manually publish from Play Console if using `production`)

---

## 🛠 Test the Build Locally (Without Deploying)

```bash
# From project root — just build the AAB
flutter pub get
flutter build appbundle --release

# Confirm the file exists
ls build/app/outputs/bundle/release/app-release.aab
```

#### Test Fastlane locally:
```bash
cd android
bundle install
bundle exec fastlane deploy track:internal
```

---

## 🔗 Quick Links

| Resource | Link |
|---|---|
| GitHub Actions (view runs) | https://github.com/gauravemizen/vote_the_goat/actions |
| Google Play Console | https://play.google.com/console |
| Workflow File | `.github/workflows/android-deploy.yml` |
| Fastfile | `android/fastlane/Fastfile` |
| Appfile | `android/fastlane/Appfile` |
