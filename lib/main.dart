// import '/custom_code/actions/index.dart' as actions;
// import 'package:provider/provider.dart';
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
//
// import 'package:flutter_localizations/flutter_localizations.dart';
// import 'package:flutter_web_plugins/url_strategy.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'auth/firebase_auth/firebase_user_provider.dart';
// import 'auth/firebase_auth/auth_util.dart';
//
// import 'backend/push_notifications/push_notifications_util.dart';
// import 'backend/firebase/firebase_config.dart';
// import '/flutter_flow/flutter_flow_theme.dart';
// import 'flutter_flow/flutter_flow_util.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:flutter/foundation.dart';
// import 'package:firebase_crashlytics/firebase_crashlytics.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
// import 'flutter_flow/nav/nav.dart';
// import 'index.dart';
//
// import '/flutter_flow/admob_util.dart';
// import 'dart:async';
// import 'package:easy_debounce/easy_debounce.dart';
// import 'theme_controller.dart';
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   GoRouter.optionURLReflectsImperativeAPIs = true;
//   usePathUrlStrategy();
//
//   final environmentValues = FFDevEnvironmentValues();
//   await environmentValues.initialize();
//   debugLogEnvironmentValue(environmentValues);
//
//   await initFirebase();
//
//   // Start initial custom actions code
//   await actions.lockPortraitOrientation();
//   await actions.connect();
//   await actions.setupForegroundNotifications();
//   // End initial custom actions code
//
//   await FlutterFlowTheme.initialize();
//   adMobRequestConsent();
//   adMobUpdateRequestConfiguration();
//
//   final appState = FFAppState(); // Initialize FFAppState
//   await appState.initializePersistedState();
//   debugLogAppState(appState);
//   appState.addListener(() {
//     debugLogAppState(appState);
//   });
//
//   if (!kIsWeb) {
//     FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
//   }
//
//   final originalErrorWidgetBuilder = ErrorWidget.builder;
//   ErrorWidget.builder = (FlutterErrorDetails details) {
//     try {
//       final match = RegExp(
//               r'The relevant error-causing widget was:\s+([a-zA-Z0-9]+)(.|\n)*When the exception was thrown, this was the stack:((.|\n)*)')
//           .firstMatch(details.toString());
//       if (match == null) {
//         return originalErrorWidgetBuilder(details);
//       }
//       final widgetName = match.group(1);
//       final stackTrace = match.group(3)!;
//
//       // The stack trace usually is very long, and most of it is entirely
//       // irrelevant for troubleshooting, e.g.:
//       //
//       // dart-sdk/lib/_internal/js_dev_runtime/private/ddc_runtime/errors.dart 251:49  throw_
//       // dart-sdk/lib/_internal/js_dev_runtime/private/ddc_runtime/errors.dart 29:3    assertFailed
//       // packages/flutter/src/widgets/text.dart 378:14                                 new
//       // packages/debug_screen_test/home_page/home_page_widget.dart 51:15              build
//       // packages/flutter/src/widgets/framework.dart 4870:27                           build
//       // packages/flutter/src/widgets/framework.dart 4754:15                           performRebuild
//       // packages/flutter/src/widgets/framework.dart 4928:11                           performRebuild
//       // packages/flutter/src/widgets/framework.dart 4477:5                            rebuild
//       // <a long long list of internal libraries>
//       //
//       // We truncate everything after project-specific code.
//
//       final filteredStackTrace = <String>[];
//       var foundProjectTraces = false;
//       for (final line in stackTrace.split('\n')) {
//         if (line.startsWith('packages/vote_for_goat/')) {
//           foundProjectTraces = true;
//         } else {
//           if (foundProjectTraces) {
//             filteredStackTrace.add('...');
//             break;
//           }
//         }
//         filteredStackTrace.add(line);
//       }
//
//       final result = '''${details.exceptionAsString()}
//
// The relevant error-causing widget was: $widgetName
//
// Stack trace: ${filteredStackTrace.join("\n")}''';
//
//       return ErrorWidget.withDetails(message: result);
//     } catch (_) {
//       return originalErrorWidgetBuilder(details);
//     }
//   };
//
//   /// Every second, fire logging call for different channel (tag) so that frequent
//   /// logging calls don't get delayed too much
//   Timer.periodic(const Duration(seconds: 2), (timer) {
//     EasyDebounce.fire('405ebf2ff50c295c675b5802889ea941f081fd51');
//     EasyDebounce.cancel('405ebf2ff50c295c675b5802889ea941f081fd51');
//     EasyDebounce.fire('fbcc19a787981a30d86b10103c2f3951604b2ae6');
//     EasyDebounce.cancel('fbcc19a787981a30d86b10103c2f3951604b2ae6');
//
//     EasyDebounce.fire('c0186d2c21d5d9300ee148206df9fbd1850b8d41');
//     EasyDebounce.cancel('c0186d2c21d5d9300ee148206df9fbd1850b8d41');
//
//     EasyDebounce.fire('508f3c74205c87928b71f49040062e732f9c20b0');
//     EasyDebounce.cancel('508f3c74205c87928b71f49040062e732f9c20b0');
//   });
//
//   runApp(ChangeNotifierProvider(
//     create: (context) => appState,
//     child: MyApp(),
//   ));
// }
//
// class MyApp extends StatefulWidget {
//   // This widget is the root of your application.
//   @override
//   State<MyApp> createState() => _MyAppState();
//
//   static _MyAppState of(BuildContext context) =>
//       context.findAncestorStateOfType<_MyAppState>()!;
// }
//
// class _MyAppState extends State<MyApp> {
//   ThemeMode _themeMode = FlutterFlowTheme.themeMode;
//   double _textScaleFactor = 1.0;
//
//   late AppStateNotifier _appStateNotifier;
//   late GoRouter _router;
//   String getRoute([RouteMatch? routeMatch]) {
//     final RouteMatch lastMatch =
//         routeMatch ?? _router.routerDelegate.currentConfiguration.last;
//     final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
//         ? lastMatch.matches
//         : _router.routerDelegate.currentConfiguration;
//     return matchList.uri.toString();
//   }
//
//   List<String> getRouteStack() =>
//       _router.routerDelegate.currentConfiguration.matches
//           .map((e) => getRoute(e))
//           .toList();
//   late Stream<BaseAuthUser> userStream;
//
//   final authUserSub = authenticatedUserStream.listen((_) {});
//   final fcmTokenSub = fcmTokenUserStream.listen((_) {});
//
//   @override
//   void initState() {
//     super.initState();
//
//     _appStateNotifier = AppStateNotifier.instance;
//     _router = createRouter(_appStateNotifier);
//     userStream = voteForGoatFirebaseUserStream()
//       ..listen((user) {
//         _appStateNotifier.update(user);
//         debugLogAuthenticatedUser();
//       });
//     jwtTokenStream.listen((_) {});
//     Future.delayed(
//       Duration(milliseconds: 1000),
//       () => _appStateNotifier.stopShowingSplashImage(),
//     );
//
//     // Register theme controller so other widgets can change theme.
//     // AppThemeController.instance.register(setThemeMode);
//
//     _router.routerDelegate.addListener(() {
//       if (mounted) {
//         debugLogGlobalProperty(
//           context,
//           routePath: getRoute(),
//           routeStack: getRouteStack(),
//         );
//       }
//     });
//   }
//
//   @override
//   void dispose() {
//     authUserSub.cancel();
//     fcmTokenSub.cancel();
//     super.dispose();
//   }
//
//   void setThemeMode(ThemeMode mode) => safeSetState(() {
//         _themeMode = mode;
//         FlutterFlowTheme.saveThemeMode(mode);
//       });
//
//   void setTextScaleFactor(double updatedFactor) {
//     if (updatedFactor < FlutterFlowTheme.minTextScaleFactor ||
//         updatedFactor > FlutterFlowTheme.maxTextScaleFactor) {
//       return;
//     }
//     safeSetState(() {
//       _textScaleFactor = updatedFactor;
//     });
//   }
//
//   void incrementTextScaleFactor(double incrementValue) {
//     final updatedFactor = _textScaleFactor + incrementValue;
//     if (updatedFactor < FlutterFlowTheme.minTextScaleFactor ||
//         updatedFactor > FlutterFlowTheme.maxTextScaleFactor) {
//       return;
//     }
//     safeSetState(() {
//       _textScaleFactor = updatedFactor;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp.router(
//       debugShowCheckedModeBanner: false,
//       title: 'VoteForGoat',
//       localizationsDelegates: [
//         GlobalMaterialLocalizations.delegate,
//         GlobalWidgetsLocalizations.delegate,
//         GlobalCupertinoLocalizations.delegate,
//       ],
//       supportedLocales: const [Locale('en', '')],
//       theme: ThemeData(
//         brightness: Brightness.light,
//         useMaterial3: false,
//       ),
//       darkTheme: ThemeData(
//         brightness: Brightness.dark,
//         useMaterial3: false,
//       ),
//       themeMode: _themeMode,
//       routerConfig: _router,
//       builder: (_, child) => MediaQuery(
//         data: MediaQuery.of(context).copyWith(
//           textScaler:
//               _textScaleFactor == FlutterFlowTheme.defaultTextScaleFactor
//                   ? MediaQuery.of(context).textScaler.clamp(
//                         minScaleFactor: FlutterFlowTheme.minTextScaleFactor,
//                         maxScaleFactor: FlutterFlowTheme.maxTextScaleFactor,
//                       )
//                   : TextScaler.linear(_textScaleFactor).clamp(
//                       minScaleFactor: FlutterFlowTheme.minTextScaleFactor,
//                       maxScaleFactor: FlutterFlowTheme.maxTextScaleFactor,
//                     ),
//         ),
//         child: child!,
//       ),
//     );
//   }
// }
//
// class NavBarPage extends StatefulWidget {
//   NavBarPage({
//     Key? key,
//     this.initialPage,
//     this.page,
//     this.disableResizeToAvoidBottomInset = false,
//   }) : super(key: key);
//
//   final String? initialPage;
//   final Widget? page;
//   final bool disableResizeToAvoidBottomInset;
//
//   @override
//   _NavBarPageState createState() => _NavBarPageState();
// }
//
// /// This is the private State class that goes with NavBarPage.
// class _NavBarPageState extends State<NavBarPage> {
//   String _currentPageName = 'homePage';
//   late Widget? _currentPage;
//
//   @override
//   void initState() {
//     super.initState();
//     _currentPageName = widget.initialPage ?? _currentPageName;
//     _currentPage = widget.page;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final tabs = {
//       'homePage': HomePageWidget(),
//       'eligible_player': EligiblePlayerWidget(),
//       'rankingPage': RankingPageWidget(),
//       'YourFinalRanking': YourFinalRankingWidget(),
//       'PlayWithFriends': PlayWithFriendsWidget(),
//     };
//     final currentIndex = tabs.keys.toList().indexOf(_currentPageName);
//
//     final MediaQueryData queryData = MediaQuery.of(context);
//
//     return Scaffold(
//       resizeToAvoidBottomInset: !widget.disableResizeToAvoidBottomInset,
//       body: MediaQuery(
//           data: queryData
//               .removeViewInsets(removeBottom: true)
//               .removeViewPadding(removeBottom: true),
//           child: _currentPage ?? tabs[_currentPageName]!),
//       extendBody: true,
//       bottomNavigationBar: FloatingNavbar(
//         currentIndex: currentIndex,
//         onTap: (i) => safeSetState(() {
//           _currentPage = null;
//           _currentPageName = tabs.keys.toList()[i];
//         }),
//         backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
//         selectedItemColor: FlutterFlowTheme.of(context).primary,
//         unselectedItemColor: FlutterFlowTheme.of(context).secondaryText,
//         selectedBackgroundColor: Color(0x00000000),
//         borderRadius: 8.0,
//         itemBorderRadius: 8.0,
//         margin: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
//         padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
//         width: double.infinity,
//         elevation: 0.0,
//         items: [
//           FloatingNavbarItem(
//             customWidget: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Icon(
//                   Icons.home_outlined,
//                   color: currentIndex == 0
//                       ? FlutterFlowTheme.of(context).primary
//                       : FlutterFlowTheme.of(context).secondaryText,
//                   size: 24.0,
//                 ),
//                 Text(
//                   'Home',
//                   overflow: TextOverflow.ellipsis,
//                   style: TextStyle(
//                     color: currentIndex == 0
//                         ? FlutterFlowTheme.of(context).primary
//                         : FlutterFlowTheme.of(context).secondaryText,
//                     fontSize: 11.0,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           FloatingNavbarItem(
//             customWidget: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Icon(
//                   Icons.menu,
//                   color: currentIndex == 1
//                       ? FlutterFlowTheme.of(context).primary
//                       : FlutterFlowTheme.of(context).secondaryText,
//                   size: 24.0,
//                 ),
//                 Text(
//                   'Eligible Players',
//                   overflow: TextOverflow.ellipsis,
//                   style: TextStyle(
//                     color: currentIndex == 1
//                         ? FlutterFlowTheme.of(context).primary
//                         : FlutterFlowTheme.of(context).secondaryText,
//                     fontSize: 11.0,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           FloatingNavbarItem(
//             customWidget: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Icon(
//                   Icons.star_outline_rounded,
//                   color: currentIndex == 2
//                       ? FlutterFlowTheme.of(context).primary
//                       : FlutterFlowTheme.of(context).secondaryText,
//                   size: 24.0,
//                 ),
//                 Text(
//                   'Your Ranking',
//                   overflow: TextOverflow.ellipsis,
//                   style: TextStyle(
//                     color: currentIndex == 2
//                         ? FlutterFlowTheme.of(context).primary
//                         : FlutterFlowTheme.of(context).secondaryText,
//                     fontSize: 11.0,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           FloatingNavbarItem(
//             customWidget: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Icon(
//                   Icons.star_outline_rounded,
//                   color: currentIndex == 3
//                       ? FlutterFlowTheme.of(context).primary
//                       : FlutterFlowTheme.of(context).secondaryText,
//                   size: 24.0,
//                 ),
//                 Text(
//                   'Global Ranking',
//                   overflow: TextOverflow.ellipsis,
//                   style: TextStyle(
//                     color: currentIndex == 3
//                         ? FlutterFlowTheme.of(context).primary
//                         : FlutterFlowTheme.of(context).secondaryText,
//                     fontSize: 11.0,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           FloatingNavbarItem(
//             customWidget: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Icon(
//                   Icons.groups_outlined,
//                   color: currentIndex == 4
//                       ? FlutterFlowTheme.of(context).primary
//                       : FlutterFlowTheme.of(context).secondaryText,
//                   size: 24.0,
//                 ),
//                 Text(
//                   'Play With Friends',
//                   overflow: TextOverflow.ellipsis,
//                   style: TextStyle(
//                     color: currentIndex == 4
//                         ? FlutterFlowTheme.of(context).primary
//                         : FlutterFlowTheme.of(context).secondaryText,
//                     fontSize: 11.0,
//                   ),
//                 ),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }



import '/custom_code/actions/index.dart' as actions;
import 'package:provider/provider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:firebase_core/firebase_core.dart';
import 'auth/firebase_auth/firebase_user_provider.dart';
import 'auth/firebase_auth/auth_util.dart';

import 'backend/push_notifications/push_notifications_util.dart';
import 'backend/firebase/firebase_config.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'flutter_flow/nav/nav.dart';
import 'index.dart';

import '/flutter_flow/admob_util.dart';
import 'dart:async';
import 'package:easy_debounce/easy_debounce.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GoRouter.optionURLReflectsImperativeAPIs = true;
  usePathUrlStrategy();

  final environmentValues = FFDevEnvironmentValues();
  await environmentValues.initialize();
  debugLogEnvironmentValue(environmentValues);

  await initFirebase();

  // Start initial custom actions code
  await actions.lockPortraitOrientation();
  await actions.connect();
  await actions.setupForegroundNotifications();
  // End initial custom actions code

  await FlutterFlowTheme.initialize();
  adMobRequestConsent();
  adMobUpdateRequestConfiguration();

  final appState = FFAppState(); // Initialize FFAppState
  await appState.initializePersistedState();
  debugLogAppState(appState);
  appState.addListener(() {
    debugLogAppState(appState);
  });

  if (!kIsWeb) {
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  }

  final originalErrorWidgetBuilder = ErrorWidget.builder;
  ErrorWidget.builder = (FlutterErrorDetails details) {
    try {
      final match = RegExp(
          r'The relevant error-causing widget was:\s+([a-zA-Z0-9]+)(.|\n)*When the exception was thrown, this was the stack:((.|\n)*)')
          .firstMatch(details.toString());
      if (match == null) {
        return originalErrorWidgetBuilder(details);
      }
      final widgetName = match.group(1);
      final stackTrace = match.group(3)!;

      // The stack trace usually is very long, and most of it is entirely
      // irrelevant for troubleshooting, e.g.:
      //
      // dart-sdk/lib/_internal/js_dev_runtime/private/ddc_runtime/errors.dart 251:49  throw_
      // dart-sdk/lib/_internal/js_dev_runtime/private/ddc_runtime/errors.dart 29:3    assertFailed
      // packages/flutter/src/widgets/text.dart 378:14                                 new
      // packages/debug_screen_test/home_page/home_page_widget.dart 51:15              build
      // packages/flutter/src/widgets/framework.dart 4870:27                           build
      // packages/flutter/src/widgets/framework.dart 4754:15                           performRebuild
      // packages/flutter/src/widgets/framework.dart 4928:11                           performRebuild
      // packages/flutter/src/widgets/framework.dart 4477:5                            rebuild
      // <a long long list of internal libraries>
      //
      // We truncate everything after project-specific code.

      final filteredStackTrace = <String>[];
      var foundProjectTraces = false;
      for (final line in stackTrace.split('\n')) {
        if (line.startsWith('packages/vote_for_goat/')) {
          foundProjectTraces = true;
        } else {
          if (foundProjectTraces) {
            filteredStackTrace.add('...');
            break;
          }
        }
        filteredStackTrace.add(line);
      }

      final result = '''${details.exceptionAsString()}
      
The relevant error-causing widget was: $widgetName

Stack trace: ${filteredStackTrace.join("\n")}''';

      return ErrorWidget.withDetails(message: result);
    } catch (_) {
      return originalErrorWidgetBuilder(details);
    }
  };

  /// Every second, fire logging call for different channel (tag) so that frequent
  /// logging calls don't get delayed too much
  Timer.periodic(const Duration(seconds: 2), (timer) {
    EasyDebounce.fire('405ebf2ff50c295c675b5802889ea941f081fd51');
    EasyDebounce.cancel('405ebf2ff50c295c675b5802889ea941f081fd51');
    EasyDebounce.fire('fbcc19a787981a30d86b10103c2f3951604b2ae6');
    EasyDebounce.cancel('fbcc19a787981a30d86b10103c2f3951604b2ae6');

    EasyDebounce.fire('c0186d2c21d5d9300ee148206df9fbd1850b8d41');
    EasyDebounce.cancel('c0186d2c21d5d9300ee148206df9fbd1850b8d41');

    EasyDebounce.fire('508f3c74205c87928b71f49040062e732f9c20b0');
    EasyDebounce.cancel('508f3c74205c87928b71f49040062e732f9c20b0');
  });

  runApp(ChangeNotifierProvider(
    create: (context) => appState,
    child: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  State<MyApp> createState() => _MyAppState();

  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>()!;
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = FlutterFlowTheme.themeMode;
  double _textScaleFactor = 1.0;

  late AppStateNotifier _appStateNotifier;
  late GoRouter _router;
  String getRoute([RouteMatch? routeMatch]) {
    final RouteMatch lastMatch =
        routeMatch ?? _router.routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : _router.routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }

  List<String> getRouteStack() =>
      _router.routerDelegate.currentConfiguration.matches
          .map((e) => getRoute(e))
          .toList();
  late Stream<BaseAuthUser> userStream;

  final authUserSub = authenticatedUserStream.listen((_) {});
  final fcmTokenSub = fcmTokenUserStream.listen((_) {});

  @override
  void initState() {
    super.initState();

    _appStateNotifier = AppStateNotifier.instance;
    _router = createRouter(_appStateNotifier);
    userStream = voteForGoatFirebaseUserStream()
      ..listen((user) {
        _appStateNotifier.update(user);
        debugLogAuthenticatedUser();
      });
    jwtTokenStream.listen((_) {});
    Future.delayed(
      Duration(milliseconds: 2000),
          () => _appStateNotifier.stopShowingSplashImage(),
    );

    _router.routerDelegate.addListener(() {
      if (mounted) {
        debugLogGlobalProperty(
          context,
          routePath: getRoute(),
          routeStack: getRouteStack(),
        );
      }
    });
  }

  @override
  void dispose() {
    authUserSub.cancel();
    fcmTokenSub.cancel();
    super.dispose();
  }

  void setThemeMode(ThemeMode mode) => safeSetState(() {
    _themeMode = mode;
    FlutterFlowTheme.saveThemeMode(mode);
  });

  void setTextScaleFactor(double updatedFactor) {
    if (updatedFactor < FlutterFlowTheme.minTextScaleFactor ||
        updatedFactor > FlutterFlowTheme.maxTextScaleFactor) {
      return;
    }
    safeSetState(() {
      _textScaleFactor = updatedFactor;
    });
  }

  void incrementTextScaleFactor(double incrementValue) {
    final updatedFactor = _textScaleFactor + incrementValue;
    if (updatedFactor < FlutterFlowTheme.minTextScaleFactor ||
        updatedFactor > FlutterFlowTheme.maxTextScaleFactor) {
      return;
    }
    safeSetState(() {
      _textScaleFactor = updatedFactor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'VoteForGoat',
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('en', '')],
      theme: ThemeData(
        brightness: Brightness.light,
        useMaterial3: false,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: false,
      ),
      themeMode: _themeMode,
      routerConfig: _router,
      builder: (_, child) => MediaQuery(
        data: MediaQuery.of(context).copyWith(
          textScaler:
          _textScaleFactor == FlutterFlowTheme.defaultTextScaleFactor
              ? MediaQuery.of(context).textScaler.clamp(
            minScaleFactor: FlutterFlowTheme.minTextScaleFactor,
            maxScaleFactor: FlutterFlowTheme.maxTextScaleFactor,
          )
              : TextScaler.linear(_textScaleFactor).clamp(
            minScaleFactor: FlutterFlowTheme.minTextScaleFactor,
            maxScaleFactor: FlutterFlowTheme.maxTextScaleFactor,
          ),
        ),
        child: child!,
      ),
    );
  }
}