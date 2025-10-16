// // import '../../nav/nav_widget.dart';
// // import '/components/conectivilty/conectivilty_widget.dart';
// // import '/flutter_flow/flutter_flow_theme.dart';
// // import '/flutter_flow/flutter_flow_util.dart';
// // import '/flutter_flow/flutter_flow_video_player.dart';
// // import '/flutter_flow/flutter_flow_widgets.dart';
// // import 'dart:ui';
// // import '/custom_code/actions/index.dart' as actions;
// // import '/index.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter/scheduler.dart';
// // import 'package:flutter_spinkit/flutter_spinkit.dart';
// // import 'package:google_fonts/google_fonts.dart';
// // import 'package:provider/provider.dart';
// // import 'package:webviewx_plus/webviewx_plus.dart';
// // import 'splash_model.dart';
// // export 'splash_model.dart';
// //
// // class SplashWidget extends StatefulWidget {
// //   const SplashWidget({super.key});
// //
// //   static String routeName = 'splash';
// //   static String routePath = '/splash';
// //
// //   @override
// //   State<SplashWidget> createState() => _SplashWidgetState();
// // }
// //
// // class _SplashWidgetState extends State<SplashWidget> with RouteAware {
// //   late SplashModel _model;
// //
// //   final scaffoldKey = GlobalKey<ScaffoldState>();
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //     _model = createModel(context, () => SplashModel());
// //
// //     // On page load action.
// //     SchedulerBinding.instance.addPostFrameCallback((_) async {
// //       _model.isConnected = await actions.connect();
// //       if (_model.isConnected == true) {
// //         await Future.delayed(
// //           Duration(
// //             milliseconds: 4000,
// //           ),
// //         );
// //         if (FFAppState().authToken != null && FFAppState().authToken != '') {
// //           // context.goNamed(HomePageWidget.routeName);
// //           context.goNamed(
// //               NavWidget
// //                   .routeName);
// //
// //         } else {
// //           context.goNamed(LogInWidget.routeName);
// //         }
// //       } else {
// //         await showDialog(
// //           context: context,
// //           builder: (dialogContext) {
// //             return Dialog(
// //               elevation: 0,
// //               insetPadding: EdgeInsets.zero,
// //               backgroundColor: Colors.transparent,
// //               alignment: AlignmentDirectional(0.0, 0.0)
// //                   .resolve(Directionality.of(context)),
// //               child: WebViewAware(
// //                 child: GestureDetector(
// //                   onTap: () {
// //                     FocusScope.of(dialogContext).unfocus();
// //                     FocusManager.instance.primaryFocus?.unfocus();
// //                   },
// //                   child: ConectiviltyWidget(),
// //                 ),
// //               ),
// //             );
// //           },
// //         );
// //       }
// //     });
// //   }
// //
// //   @override
// //   void dispose() {
// //     routeObserver.unsubscribe(this);
// //
// //     _model.dispose();
// //
// //     super.dispose();
// //   }
// //
// //   @override
// //   void didUpdateWidget(SplashWidget oldWidget) {
// //     super.didUpdateWidget(oldWidget);
// //     _model.widget = widget;
// //   }
// //
// //   @override
// //   void didChangeDependencies() {
// //     super.didChangeDependencies();
// //     final route = DebugModalRoute.of(context);
// //     if (route != null) {
// //       routeObserver.subscribe(this, route);
// //     }
// //     debugLogGlobalProperty(context);
// //   }
// //
// //   @override
// //   void didPopNext() {
// //     if (mounted && DebugFlutterFlowModelContext.maybeOf(context) == null) {
// //       setState(() => _model.isRouteVisible = true);
// //       debugLogWidgetClass(_model);
// //     }
// //   }
// //
// //   @override
// //   void didPush() {
// //     if (mounted && DebugFlutterFlowModelContext.maybeOf(context) == null) {
// //       setState(() => _model.isRouteVisible = true);
// //       debugLogWidgetClass(_model);
// //     }
// //   }
// //
// //   @override
// //   void didPop() {
// //     _model.isRouteVisible = false;
// //   }
// //
// //   @override
// //   void didPushNext() {
// //     _model.isRouteVisible = false;
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     DebugFlutterFlowModelContext.maybeOf(context)
// //         ?.parentModelCallback
// //         ?.call(_model);
// //     context.watch<FFAppState>();
// //
// //     return Builder(
// //       builder: (context) => GestureDetector(
// //         onTap: () {
// //           FocusScope.of(context).unfocus();
// //           FocusManager.instance.primaryFocus?.unfocus();
// //         },
// //         child: Scaffold(
// //           key: scaffoldKey,
// //           backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
// //           body: SingleChildScrollView(
// //             primary: false,
// //             child: Column(
// //               mainAxisSize: MainAxisSize.max,
// //               children: [
// //                 FlutterFlowVideoPlayer(
// //                   path: 'assets/videos/MicrosoftTeams-video.mp4',
// //                   videoType: VideoType.asset,
// //                   autoPlay: true,
// //                   looping: false,
// //                   showControls: false,
// //                   allowFullScreen: true,
// //                   allowPlaybackSpeedMenu: false,
// //                   lazyLoad: false,
// //                 ),
// //               ],
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }
//
//
//
//
//
// ///2
// import '../../nav/nav_widget.dart';
// import '/components/conectivilty/conectivilty_widget.dart';
// import '/flutter_flow/flutter_flow_theme.dart';
// import '/flutter_flow/flutter_flow_util.dart';
// import '/flutter_flow/flutter_flow_video_player.dart';
// import '/flutter_flow/flutter_flow_widgets.dart';
// import 'dart:ui';
// import '/custom_code/actions/index.dart' as actions;
// import '/index.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/scheduler.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:provider/provider.dart';
// import 'package:webviewx_plus/webviewx_plus.dart';
// import 'splash_model.dart';
// export 'splash_model.dart';
//
// class SplashWidget extends StatefulWidget {
//   const SplashWidget({super.key});
//
//   static String routeName = 'splash';
//   static String routePath = '/splash';
//
//   @override
//   State<SplashWidget> createState() => _SplashWidgetState();
// }
//
// class _SplashWidgetState extends State<SplashWidget> with RouteAware {
//   late SplashModel _model;
//
//   final scaffoldKey = GlobalKey<ScaffoldState>();
//
//   @override
//   void initState() {
//     super.initState();
//     _model = createModel(context, () => SplashModel());
//
//     // 🧭 On page load action
//     SchedulerBinding.instance.addPostFrameCallback((_) async {
//       debugPrint('🔵 [Splash] Page loaded — starting connectivity check...');
//       _model.isConnected = await actions.connect();
//       debugPrint('🌐 [Splash] Connectivity status: ${_model.isConnected}');
//
//       if (_model.isConnected == true) {
//         debugPrint('✅ [Splash] Internet available — starting 4s delay...');
//         await Future.delayed(const Duration(milliseconds: 4000));
//
//         // ✅ Ensure widget is still mounted before navigation
//         if (!mounted) {
//           debugPrint('⚠️ [Splash] Widget unmounted — stopping navigation.');
//           return;
//         }
//
//         debugPrint('🟢 [Splash] Checking auth token...');
//         debugPrint('🔑 [Splash] Token value: "${FFAppState().authToken}"');
//
//         if (FFAppState().authToken != null &&
//             FFAppState().authToken != '') {
//           debugPrint('🏠 [Splash] Token found — navigating to Home (NavWidget).');
//           context.goNamed(NavWidget.routeName);
//         } else {
//           debugPrint('🔐 [Splash] No token — navigating to Login screen.');
//           context.goNamed(LogInWidget.routeName);
//         }
//       } else {
//         debugPrint('🚫 [Splash] No internet — showing connectivity dialog.');
//         await showDialog(
//           context: context,
//           builder: (dialogContext) {
//             return Dialog(
//               elevation: 0,
//               insetPadding: EdgeInsets.zero,
//               backgroundColor: Colors.transparent,
//               alignment: AlignmentDirectional(0.0, 0.0)
//                   .resolve(Directionality.of(context)),
//               child: WebViewAware(
//                 child: GestureDetector(
//                   onTap: () {
//                     FocusScope.of(dialogContext).unfocus();
//                     FocusManager.instance.primaryFocus?.unfocus();
//                   },
//                   child: ConectiviltyWidget(),
//                 ),
//               ),
//             );
//           },
//         );
//       }
//     });
//   }
//
//   @override
//   void dispose() {
//     routeObserver.unsubscribe(this);
//     _model.dispose();
//     super.dispose();
//   }
//
//   @override
//   void didUpdateWidget(SplashWidget oldWidget) {
//     super.didUpdateWidget(oldWidget);
//     _model.widget = widget;
//   }
//
//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     final route = DebugModalRoute.of(context);
//     if (route != null) {
//       routeObserver.subscribe(this, route);
//     }
//     debugLogGlobalProperty(context);
//   }
//
//   @override
//   void didPopNext() {
//     if (mounted && DebugFlutterFlowModelContext.maybeOf(context) == null) {
//       setState(() => _model.isRouteVisible = true);
//       debugLogWidgetClass(_model);
//     }
//   }
//
//   @override
//   void didPush() {
//     if (mounted && DebugFlutterFlowModelContext.maybeOf(context) == null) {
//       setState(() => _model.isRouteVisible = true);
//       debugLogWidgetClass(_model);
//     }
//   }
//
//   @override
//   void didPop() {
//     _model.isRouteVisible = false;
//   }
//
//   @override
//   void didPushNext() {
//     _model.isRouteVisible = false;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     DebugFlutterFlowModelContext.maybeOf(context)
//         ?.parentModelCallback
//         ?.call(_model);
//     context.watch<FFAppState>();
//
//     return Builder(
//       builder: (context) => GestureDetector(
//         onTap: () {
//           FocusScope.of(context).unfocus();
//           FocusManager.instance.primaryFocus?.unfocus();
//         },
//         child: Scaffold(
//           key: scaffoldKey,
//           backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
//           body: SingleChildScrollView(
//             primary: false,
//             child: Column(
//               mainAxisSize: MainAxisSize.max,
//               children: [
//                 FlutterFlowVideoPlayer(
//                   path: 'assets/videos/MicrosoftTeams-video.mp4',
//                   videoType: VideoType.asset,
//                   autoPlay: true,
//                   looping: false,
//                   showControls: false,
//                   allowFullScreen: true,
//                   allowPlaybackSpeedMenu: false,
//                   lazyLoad: false,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }



///2
// import '../../nav/nav_widget.dart';
// import '/components/conectivilty/conectivilty_widget.dart';
// import '/flutter_flow/flutter_flow_theme.dart';
// import '/flutter_flow/flutter_flow_util.dart';
// import '/flutter_flow/flutter_flow_video_player.dart';
// import '/flutter_flow/flutter_flow_widgets.dart';
// import 'dart:ui';
// import '/custom_code/actions/index.dart' as actions;
// import '/index.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/scheduler.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:provider/provider.dart';
// import 'package:webviewx_plus/webviewx_plus.dart';
// import 'splash_model.dart';
// export 'splash_model.dart';
//
// class SplashWidget extends StatefulWidget {
//   const SplashWidget({super.key});
//
//   static String routeName = 'splash';
//   static String routePath = '/splash';
//
//   @override
//   State<SplashWidget> createState() => _SplashWidgetState();
// }
//
// class _SplashWidgetState extends State<SplashWidget> with RouteAware {
//   late SplashModel _model;
//
//   final scaffoldKey = GlobalKey<ScaffoldState>();
//
//   @override
//   void initState() {
//     super.initState();
//     print('🟢 [Splash] initState() called.');
//     _model = createModel(context, () => SplashModel());
//     print('🟢 [Splash] SplashModel created.');
//
//     SchedulerBinding.instance.addPostFrameCallback((_) async {
//       print('🔵 [Splash] Post frame callback started.');
//       print('🌍 [Splash] Checking internet connectivity...');
//
//       try {
//         _model.isConnected = await actions.connect();
//         print('🌐 [Splash] Connectivity check result: ${_model.isConnected}');
//       } catch (e) {
//         print('❌ [Splash] Error during connectivity check: $e');
//       }
//
//       if (_model.isConnected == true) {
//         print('✅ [Splash] Device is connected to the internet.');
//         print('⏱ [Splash] Starting 4-second splash delay...');
//         await Future.delayed(const Duration(milliseconds: 4000));
//         print('⏱ [Splash] 4-second delay completed.');
//
//         if (!mounted) {
//           print('⚠️ [Splash] Widget is unmounted after delay. Navigation aborted.');
//           return;
//         }
//
//         print('🟢 [Splash] Checking authentication token in FFAppState...');
//         print('🔑 [Splash] Token value: "${FFAppState().authToken}"');
//
//         if (FFAppState().authToken != null && FFAppState().authToken != '') {
//           print('🏠 [Splash] Token found. Navigating to NavWidget (Home).');
//           try {
//             context.goNamed(NavWidget.routeName);
//             print('✅ [Splash] Navigation to NavWidget triggered.');
//           } catch (e) {
//             print('❌ [Splash] Error navigating to NavWidget: $e');
//           }
//         } else {
//           print('🔐 [Splash] No token found. Navigating to LogInWidget.');
//           try {
//             context.goNamed(LogInWidget.routeName);
//             print('✅ [Splash] Navigation to LogInWidget triggered.');
//           } catch (e) {
//             print('❌ [Splash] Error navigating to LogInWidget: $e');
//           }
//         }
//       } else {
//         print('🚫 [Splash] No internet connection detected.');
//         print('💬 [Splash] Showing connectivity dialog.');
//         try {
//           await showDialog(
//             context: context,
//             builder: (dialogContext) {
//               return Dialog(
//                 elevation: 0,
//                 insetPadding: EdgeInsets.zero,
//                 backgroundColor: Colors.transparent,
//                 alignment: const AlignmentDirectional(0.0, 0.0)
//                     .resolve(Directionality.of(context)),
//                 child: WebViewAware(
//                   child: GestureDetector(
//                     onTap: () {
//                       print('🖱 [Splash] Connectivity dialog tapped.');
//                       FocusScope.of(dialogContext).unfocus();
//                       FocusManager.instance.primaryFocus?.unfocus();
//                     },
//                     child: const ConectiviltyWidget(),
//                   ),
//                 ),
//               );
//             },
//           );
//           print('✅ [Splash] Connectivity dialog closed.');
//         } catch (e) {
//           print('❌ [Splash] Error showing connectivity dialog: $e');
//         }
//       }
//
//       print('🏁 [Splash] Post frame callback finished.');
//     });
//   }
//
//   @override
//   void dispose() {
//     print('🧹 [Splash] dispose() called.');
//     routeObserver.unsubscribe(this);
//     _model.dispose();
//     print('🧹 [Splash] SplashModel disposed.');
//     super.dispose();
//   }
//
//   @override
//   void didUpdateWidget(SplashWidget oldWidget) {
//     super.didUpdateWidget(oldWidget);
//     print('🔄 [Splash] didUpdateWidget() called.');
//     _model.widget = widget;
//   }
//
//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     print('🔄 [Splash] didChangeDependencies() called.');
//     final route = DebugModalRoute.of(context);
//     if (route != null) {
//       print('📍 [Splash] Route subscribed to routeObserver.');
//       routeObserver.subscribe(this, route);
//     }
//     debugLogGlobalProperty(context);
//   }
//
//   @override
//   void didPopNext() {
//     print('↩️ [Splash] didPopNext() called.');
//     if (mounted && DebugFlutterFlowModelContext.maybeOf(context) == null) {
//       setState(() => _model.isRouteVisible = true);
//       debugLogWidgetClass(_model);
//     }
//   }
//
//   @override
//   void didPush() {
//     print('➡️ [Splash] didPush() called.');
//     if (mounted && DebugFlutterFlowModelContext.maybeOf(context) == null) {
//       setState(() => _model.isRouteVisible = true);
//       debugLogWidgetClass(_model);
//     }
//   }
//
//   @override
//   void didPop() {
//     print('⬅️ [Splash] didPop() called.');
//     _model.isRouteVisible = false;
//   }
//
//   @override
//   void didPushNext() {
//     print('⏩ [Splash] didPushNext() called.');
//     _model.isRouteVisible = false;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     print('🧱 [Splash] build() called.');
//     DebugFlutterFlowModelContext.maybeOf(context)
//         ?.parentModelCallback
//         ?.call(_model);
//     context.watch<FFAppState>();
//
//     return Builder(
//       builder: (context) => GestureDetector(
//         onTap: () {
//           print('👆 [Splash] Screen tapped.');
//           FocusScope.of(context).unfocus();
//           FocusManager.instance.primaryFocus?.unfocus();
//         },
//         child: Scaffold(
//           key: scaffoldKey,
//           backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
//           body: const SingleChildScrollView(
//             primary: false,
//             child: Column(
//               mainAxisSize: MainAxisSize.max,
//               children: [
//                 // print('🎥 [Splash] Playing intro video...'),
//                 FlutterFlowVideoPlayer(
//                   path: 'assets/videos/MicrosoftTeams-video.mp4',
//                   videoType: VideoType.asset,
//                   autoPlay: true,
//                   looping: false,
//                   showControls: false,
//                   allowFullScreen: true,
//                   allowPlaybackSpeedMenu: false,
//                   lazyLoad: false,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

///3
import '../../nav/nav_widget.dart';
import '/components/conectivilty/conectivilty_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'splash_model.dart';
export 'splash_model.dart';

class SplashWidget extends StatefulWidget {
  const SplashWidget({super.key});

  static String routeName = 'splash';
  static String routePath = '/splash';

  @override
  State<SplashWidget> createState() => _SplashWidgetState();
}

class _SplashWidgetState extends State<SplashWidget> with RouteAware {
  late SplashModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    print('🟢 [Splash] initState() called.');
    _model = createModel(context, () => SplashModel());
    print('🟢 [Splash] SplashModel created.');

    SchedulerBinding.instance.addPostFrameCallback((_) async {
      print('🔵 [Splash] Post frame callback started.');
      print('🌍 [Splash] Checking internet connectivity...');

      try {
        _model.isConnected = await actions.connect();
        print('🌐 [Splash] Connectivity check result: ${_model.isConnected}');
      } catch (e) {
        print('❌ [Splash] Error during connectivity check: $e');
      }

      if (_model.isConnected == true) {
        print('✅ [Splash] Device is connected to the internet.');
        print('⏱ [Splash] Starting 4-second splash delay...');
        await Future.delayed(const Duration(milliseconds: 4000));
        print('⏱ [Splash] 4-second delay completed.');

        if (!mounted) {
          print('⚠️ [Splash] Widget is unmounted after delay. Navigation aborted.');
          return;
        }

        print('🟢 [Splash] Checking authentication token in FFAppState...');
        print('🔑 [Splash] Token value: "${FFAppState().authToken}"');

        if (FFAppState().authToken != null && FFAppState().authToken != '') {
          print('🏠 [Splash] Token found. Navigating to NavWidget (Home).');
          try {
            context.goNamed(NavWidget.routeName);
            print('✅ [Splash] Navigation to NavWidget triggered.');
          } catch (e) {
            print('❌ [Splash] Error navigating to NavWidget: $e');
          }
        } else {
          print('🔐 [Splash] No token found. Navigating to LogInWidget.');
          try {
            context.goNamed(LogInWidget.routeName);
            print('✅ [Splash] Navigation to LogInWidget triggered.');
          } catch (e) {
            print('❌ [Splash] Error navigating to LogInWidget: $e');
          }
        }
      } else {
        print('🚫 [Splash] No internet connection detected.');
        print('💬 [Splash] Showing connectivity dialog.');
        try {
          await showDialog(
            context: context,
            builder: (dialogContext) {
              return Dialog(
                elevation: 0,
                insetPadding: EdgeInsets.zero,
                backgroundColor: Colors.transparent,
                alignment: const AlignmentDirectional(0.0, 0.0)
                    .resolve(Directionality.of(context)),
                child: WebViewAware(
                  child: GestureDetector(
                    onTap: () {
                      print('🖱 [Splash] Connectivity dialog tapped.');
                      FocusScope.of(dialogContext).unfocus();
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                    child: const ConectiviltyWidget(),
                  ),
                ),
              );
            },
          );
          print('✅ [Splash] Connectivity dialog closed.');
        } catch (e) {
          print('❌ [Splash] Error showing connectivity dialog: $e');
        }
      }

      print('🏁 [Splash] Post frame callback finished.');
    });
  }

  @override
  void dispose() {
    print('🧹 [Splash] dispose() called.');
    routeObserver.unsubscribe(this);
    _model.dispose();
    print('🧹 [Splash] SplashModel disposed.');
    super.dispose();
  }

  @override
  void didUpdateWidget(SplashWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('🔄 [Splash] didUpdateWidget() called.');
    _model.widget = widget;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('🔄 [Splash] didChangeDependencies() called.');
    final route = DebugModalRoute.of(context);
    if (route != null) {
      print('📍 [Splash] Route subscribed to routeObserver.');
      routeObserver.subscribe(this, route);
    }
    debugLogGlobalProperty(context);
  }

  @override
  void didPopNext() {
    print('↩️ [Splash] didPopNext() called.');
    if (mounted && DebugFlutterFlowModelContext.maybeOf(context) == null) {
      setState(() => _model.isRouteVisible = true);
      debugLogWidgetClass(_model);
    }
  }

  @override
  void didPush() {
    print('➡️ [Splash] didPush() called.');
    if (mounted && DebugFlutterFlowModelContext.maybeOf(context) == null) {
      setState(() => _model.isRouteVisible = true);
      debugLogWidgetClass(_model);
    }
  }

  @override
  void didPop() {
    print('⬅️ [Splash] didPop() called.');
    _model.isRouteVisible = false;
  }

  @override
  void didPushNext() {
    print('⏩ [Splash] didPushNext() called.');
    _model.isRouteVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    print('🧱 [Splash] build() called.');
    DebugFlutterFlowModelContext.maybeOf(context)
        ?.parentModelCallback
        ?.call(_model);
    context.watch<FFAppState>();

    return Builder(
      builder: (context) => GestureDetector(
        onTap: () {
          print('👆 [Splash] Screen tapped.');
          FocusScope.of(context).unfocus();
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: Colors.black, // Changed from FlutterFlowTheme to black
          body: Container(
            color: Colors.black, // Add container with black background
            width: double.infinity,
            height: double.infinity,
            child: const FlutterFlowVideoPlayer(
              path: 'assets/videos/MicrosoftTeams-video.mp4',
              videoType: VideoType.asset,
              autoPlay: true,
              looping: false,
              showControls: false,
              allowFullScreen: true,
              allowPlaybackSpeedMenu: false,
              lazyLoad: false,
            ),
          ),
        ),
      ),
    );
  }
}