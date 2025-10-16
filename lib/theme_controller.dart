// import 'package:flutter/material.dart';
// import 'flutter_flow/flutter_flow_theme.dart';
//
// /// A lightweight controller to allow widgets (like the drawer) to toggle
// /// the app's ThemeMode without creating an import cycle with main.dart.
// class AppThemeController {
//   AppThemeController._internal();
//   static final AppThemeController instance = AppThemeController._internal();
//
//   void Function(ThemeMode mode)? _applyThemeMode;
//
//   /// Called from MyApp state to register the internal setter.
//   void register(void Function(ThemeMode mode) setter) {
//     _applyThemeMode = setter;
//   }
//
//   /// Toggle dark mode on/off. Persists automatically via FlutterFlowTheme.
//   void setDarkMode(bool isDark) {
//     final target = isDark ? ThemeMode.dark : ThemeMode.light;
//     _applyThemeMode?.call(target);
//   }
//
//   /// Convenience: set explicitly.
//   void setThemeMode(ThemeMode mode) => _applyThemeMode?.call(mode);
// }
//
