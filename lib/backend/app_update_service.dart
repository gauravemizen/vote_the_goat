import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '/backend/api_requests/api_calls.dart';
import '/components/app_update_dialog/app_update_dialog_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '../app_version.dart';

class AppUpdateService {
  static final AppUpdateService _instance = AppUpdateService._internal();
  factory AppUpdateService() => _instance;
  AppUpdateService._internal();

  /// Check for app updates from the server
  Future<bool> checkForUpdates({
    required BuildContext context,
    bool showOptionalUpdates = true,
  }) async {
    try {
      if (kDebugMode) {
        print('🔍 Checking for app updates...');
      }

      // Get current app version (hardcoded)
      final currentVersion = AppVersion.currentVersionName;
      final currentBuildNumber = AppVersion.currentBuildNumber;

      if (kDebugMode) {
        print('📱 Current Version: $currentVersion (Build: $currentBuildNumber)');
      }

      // Call version check API
      final platform = Platform.isAndroid ? 'android' : 'ios';
      final response = await DashboardGroup.versionCheckCall.call(
        platform: platform,
        currentVersionCode: currentBuildNumber,
      );
      if (kDebugMode) {
        print('🔗 Version check API response:');
        print('  Status: [33m[1m${response.statusCode}[0m');
        print('  Succeeded: ${response.succeeded}');
        print('  Body: ${response.bodyText}');
        print('  Headers: ${response.headers}');
        print('  Exception: ${response.exceptionMessage}');
      }

      if (!response.succeeded) {
        if (kDebugMode) {
          print('❌ Version check API failed: ${response.statusCode}');
        }
        return true;
      }

      final responseData = response.jsonBody;
      if (responseData == null || responseData['data'] == null) {
        if (kDebugMode) {
          print('❌ No version data in response');
        }
        return true;
      }

      // Extract version info
      final apiPlatform = VersionCheckCall.platform(responseData) ?? '';
      final apiLatestVersionName = VersionCheckCall.latestVersionName(responseData) ?? '';
      final forceUpdate = VersionCheckCall.forceUpdate(responseData) ?? false;
      final updateUrl = VersionCheckCall.updateUrl(responseData) ?? '';
      final releaseNotes = VersionCheckCall.releaseNotes(responseData) ?? '';
      final isMaintenance = VersionCheckCall.isMaintenance(responseData) ?? false;
      final maintenanceMessage = VersionCheckCall.maintenanceMessage(responseData) ?? '';

      final isAndroid = Platform.isAndroid;
      final localPlatform = isAndroid ? 'android' : 'ios';
      final localVersionName = isAndroid ? AppVersion.androidVersionName : AppVersion.iosVersionName;

      if (kDebugMode) {
        print('🆕 API Platform: $apiPlatform');
        print('🆕 API Latest Version Name: $apiLatestVersionName');
        print('📱 Local Platform: $localPlatform');
        print('📱 Local Version Name: $localVersionName');
        print('🟢 Update URL: $updateUrl');
      }

      // Check if we need to show maintenance dialog
      if (isMaintenance) {
        if (context.mounted) {
          await _showMaintenanceOverlay(context, maintenanceMessage);
        }
        return false; // Block navigation during maintenance
      }

      // Only show update dialog if platform matches and version does NOT match
      if (apiPlatform.toLowerCase() == localPlatform && apiLatestVersionName != localVersionName) {
        if (updateUrl.isNotEmpty) {
          if (kDebugMode) {
            print('🟩 Showing update dialog!');
          }
          // Show update dialog using Overlay (bypasses GoRouter navigator entirely)
          final result = await _showUpdateOverlay(
            context,
            forceUpdate: forceUpdate,
            updateUrl: updateUrl,
            latestVersion: apiLatestVersionName,
            releaseNotes: releaseNotes,
          );
          // If force update, block navigation (return false)
          if (forceUpdate) return false;
          // If user chose to update later or dismissed, allow navigation
          return result == true;
        } else {
          if (kDebugMode) {
            print('🟨 Update URL is empty, not showing dialog.');
          }
        }
        return true;
      } else {
        if (kDebugMode) {
          print('🟦 No update needed or platform mismatch, not showing dialog.');
        }
      }
      return true;
    } catch (e, stackTrace) {
      if (kDebugMode) {
        print('❌ Error checking for updates: $e');
        print('📍 Stack trace: $stackTrace');
      }
      return true;
    }
  }

  /// Show update dialog as an Overlay entry (bypasses GoRouter completely)
  Future<bool?> _showUpdateOverlay(
    BuildContext context, {
    required bool forceUpdate,
    required String updateUrl,
    required String latestVersion,
    required String releaseNotes,
  }) async {
    if (!context.mounted) return null;

    final completer = Completer<bool?>();
    late OverlayEntry overlayEntry;

    overlayEntry = OverlayEntry(
      builder: (overlayContext) {
        return Material(
          color: Colors.black54,
          child: Center(
            child: AppUpdateDialogWidget(
              forceUpdate: forceUpdate,
              updateUrl: updateUrl,
              latestVersion: latestVersion,
              releaseNotes: releaseNotes,
              onUpdateLater: () {
                if (kDebugMode) {
                  print('👋 User chose to update later');
                }
                overlayEntry.remove();
                if (!completer.isCompleted) {
                  completer.complete(true);
                }
              },
            ),
          ),
        );
      },
    );

    Overlay.of(context, rootOverlay: true).insert(overlayEntry);

    return completer.future;
  }

  /// Show maintenance dialog as an Overlay entry (bypasses GoRouter completely)
  Future<void> _showMaintenanceOverlay(BuildContext context, String message) async {
    if (!context.mounted) return;

    final completer = Completer<void>();
    late OverlayEntry overlayEntry;

    overlayEntry = OverlayEntry(
      builder: (overlayContext) {
        return Material(
          color: Colors.black54,
          child: Center(
            child: AlertDialog(
              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              content: Container(
                width: MediaQuery.sizeOf(context).width * 0.85,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Maintenance Icon
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.orange.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Icon(
                        Icons.construction_rounded,
                        color: Colors.orange,
                        size: 44,
                      ),
                    ),

                    SizedBox(height: 20),

                    // Title
                    Text(
                      'Under Maintenance',
                      style: FlutterFlowTheme.of(context).headlineSmall.override(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        color: FlutterFlowTheme.of(context).primaryText,
                      ),
                      textAlign: TextAlign.center,
                    ),

                    SizedBox(height: 12),

                    // Message
                    Text(
                      message.isNotEmpty
                          ? message
                          : 'We\'re currently performing scheduled maintenance to improve your experience. Please check back shortly.',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Poppins',
                        color: FlutterFlowTheme.of(context).secondaryText,
                      ),
                      textAlign: TextAlign.center,
                    ),

                    SizedBox(height: 20),

                    // Info box
                    Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.orange.withOpacity(0.08),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: Colors.orange.withOpacity(0.25),
                        ),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.info_outline_rounded,
                            color: Colors.orange,
                            size: 20,
                          ),
                          SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              'The app will be available again once maintenance is complete.',
                              style: FlutterFlowTheme.of(context).bodySmall.override(
                                fontFamily: 'Poppins',
                                color: Colors.orange.shade800,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 24),

                    // Retry button
                    SizedBox(
                      width: double.infinity,
                      height: 44,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          overlayEntry.remove();
                          if (!completer.isCompleted) {
                            completer.complete();
                          }
                        },
                        icon: Icon(Icons.refresh_rounded, size: 20),
                        label: Text(
                          'Retry',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: FlutterFlowTheme.of(context).primary,
                          foregroundColor: Colors.white,
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );

    Overlay.of(context, rootOverlay: true).insert(overlayEntry);

    return completer.future;
  }

  /// Compare version strings (e.g., "1.0.2" vs "1.0.1")
  int _compareVersions(String version1, String version2) {
    final v1Parts = version1.split('.').map((e) => int.tryParse(e) ?? 0).toList();
    final v2Parts = version2.split('.').map((e) => int.tryParse(e) ?? 0).toList();

    final maxLength = [v1Parts.length, v2Parts.length].reduce((a, b) => a > b ? a : b);

    // Pad with zeros
    while (v1Parts.length < maxLength) v1Parts.add(0);
    while (v2Parts.length < maxLength) v2Parts.add(0);

    for (int i = 0; i < maxLength; i++) {
      final diff = v1Parts[i].compareTo(v2Parts[i]);
      if (diff != 0) return diff;
    }

    return 0;
  }
}
