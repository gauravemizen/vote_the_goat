#!/usr/bin/env python3
import os

base = "/Users/apple/Library/Application Support/io.flutterflow.prod.mac/vote_for_goat"

def write_file(rel_path, content):
    full = os.path.join(base, rel_path)
    os.makedirs(os.path.dirname(full), exist_ok=True)
    with open(full, 'w') as f:
        f.write(content)
    print(f"Created: {rel_path}")

# Android Fastlane
write_file("android/fastlane/Appfile", """json_key_file("play-store-key.json")
package_name("com.voteforgoat.app")
""")

write_file("android/fastlane/Fastfile", """default_platform(:android)

platform :android do
  desc "Deploy to Google Play Store"
  lane :deploy do |options|
    track = options[:track] || "internal"

    upload_to_play_store(
      track: track,
      aab: "../build/app/outputs/bundle/release/app-release.aab",
      skip_upload_metadata: true,
      skip_upload_images: true,
      skip_upload_screenshots: true,
      release_status: "draft"
    )
  end
end
""")

write_file("android/Gemfile", """source "https://rubygems.org"
gem "fastlane"
""")

# iOS Fastlane
write_file("ios/fastlane/Appfile", """app_identifier("com.voteforgoat.app")
""")

write_file("ios/fastlane/Fastfile", """default_platform(:ios)

platform :ios do
  desc "Deploy to App Store Connect"
  lane :deploy do |options|
    destination = options[:destination] || "testflight"

    api_key = app_store_connect_api_key(
      key_id: ENV["APP_STORE_CONNECT_API_KEY_ID"],
      issuer_id: ENV["APP_STORE_CONNECT_ISSUER_ID"],
      key_content: Base64.decode64(ENV["APP_STORE_CONNECT_API_KEY_BASE64"]),
      is_key_content_base64: false,
      in_house: false
    )

    if destination == "testflight"
      upload_to_testflight(
        api_key: api_key,
        ipa: "../build/ios/ipa/vote_for_goat.ipa",
        skip_waiting_for_build_processing: true
      )
    else
      upload_to_app_store(
        api_key: api_key,
        ipa: "../build/ios/ipa/vote_for_goat.ipa",
        skip_metadata: true,
        skip_screenshots: true,
        precheck_include_in_app_purchases: false
      )
    end
  end
end
""")

write_file("ios/Gemfile", """source "https://rubygems.org"
gem "fastlane"
""")

write_file("ios/ExportOptions.plist", """<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>method</key>
    <string>app-store</string>
    <key>uploadSymbols</key>
    <true/>
    <key>uploadBitcode</key>
    <false/>
</dict>
</plist>
""")

# iOS deploy workflow
write_file(".github/workflows/ios-deploy.yml", """name: Deploy iOS to App Store

on:
  workflow_dispatch:
    inputs:
      destination:
        description: 'Upload destination'
        required: true
        default: 'testflight'
        type: choice
        options:
          - testflight
          - appstore

jobs:
  build-and-deploy:
    name: Build & Deploy iOS
    runs-on: macos-latest
    steps:
      - uses: actions/checkout@v4

      - uses: subosito/flutter-action@v2
        with:
          flutter-version: '3.24.5'
          channel: 'stable'
          cache: true

      - run: flutter pub get

      - name: Install CocoaPods
        working-directory: ios
        run: pod install

      - name: Extract version
        id: version
        run: |
          VERSION=$(grep '^version:' pubspec.yaml | sed 's/version: //')
          echo "version_name=$(echo $VERSION | cut -d'+' -f1)" >> $GITHUB_OUTPUT
          echo "build_number=$(echo $VERSION | cut -d'+' -f2)" >> $GITHUB_OUTPUT

      - name: Install Apple certificate and provisioning profile
        env:
          P12_CERTIFICATE_BASE64: ${{ secrets.P12_CERTIFICATE_BASE64 }}
          P12_PASSWORD: ${{ secrets.P12_PASSWORD }}
          PROVISIONING_PROFILE_BASE64: ${{ secrets.PROVISIONING_PROFILE_BASE64 }}
          KEYCHAIN_PASSWORD: ${{ github.run_id }}
        run: |
          CERTIFICATE_PATH=$RUNNER_TEMP/build_certificate.p12
          PP_PATH=$RUNNER_TEMP/build_pp.mobileprovision
          KEYCHAIN_PATH=$RUNNER_TEMP/app-signing.keychain-db
          echo -n "$P12_CERTIFICATE_BASE64" | base64 --decode -o $CERTIFICATE_PATH
          echo -n "$PROVISIONING_PROFILE_BASE64" | base64 --decode -o $PP_PATH
          security create-keychain -p "$KEYCHAIN_PASSWORD" $KEYCHAIN_PATH
          security set-keychain-settings -lut 21600 $KEYCHAIN_PATH
          security unlock-keychain -p "$KEYCHAIN_PASSWORD" $KEYCHAIN_PATH
          security import $CERTIFICATE_PATH -P "$P12_PASSWORD" -A -t cert -f pkcs12 -k $KEYCHAIN_PATH
          security set-key-partition-list -S apple-tool:,apple: -k "$KEYCHAIN_PASSWORD" $KEYCHAIN_PATH
          security list-keychain -d user -s $KEYCHAIN_PATH
          mkdir -p ~/Library/MobileDevice/Provisioning\\ Profiles
          cp $PP_PATH ~/Library/MobileDevice/Provisioning\\ Profiles

      - name: Build iOS
        run: |
          flutter build ipa --release \\
            --build-name=${{ steps.version.outputs.version_name }} \\
            --build-number=${{ steps.version.outputs.build_number }} \\
            --export-options-plist=ios/ExportOptions.plist

      - uses: ruby/setup-ruby@v1
        with:
          ruby-version: '3.2'
          bundler-cache: true
          working-directory: ios

      - name: Install Fastlane
        working-directory: ios
        run: gem install bundler && bundle install

      - name: Deploy to App Store Connect
        working-directory: ios
        run: bundle exec fastlane deploy destination:${{ github.event.inputs.destination }}
        env:
          APP_STORE_CONNECT_API_KEY_ID: ${{ secrets.APP_STORE_CONNECT_API_KEY_ID }}
          APP_STORE_CONNECT_ISSUER_ID: ${{ secrets.APP_STORE_CONNECT_ISSUER_ID }}
          APP_STORE_CONNECT_API_KEY_BASE64: ${{ secrets.APP_STORE_CONNECT_API_KEY_BASE64 }}

      - uses: actions/upload-artifact@v4
        with:
          name: ios-release-${{ steps.version.outputs.version_name }}
          path: build/ios/ipa/*.ipa

      - name: Cleanup keychain
        if: ${{ always() }}
        run: security delete-keychain $RUNNER_TEMP/app-signing.keychain-db
""")

print("\nAll CI/CD files created successfully!")

