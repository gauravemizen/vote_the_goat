import '../../nav/nav_widget.dart';
import '../../subscription/ad_service.dart';
import '../../subscription/smart_interstitial_manager.dart';
import '/backend/api_requests/api_calls.dart';
import '/components/drawer_menu/drawer_menu_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  static String routeName = 'homePage';
  static String routePath = '/homePage';

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

// class _HomePageWidgetState extends State<HomePageWidget> with RouteAware {
//   late HomePageModel _model;
//
//   final scaffoldKey = GlobalKey<ScaffoldState>();
//
//   @override
//   void initState() {
//     super.initState();
//     _model = createModel(context, () => HomePageModel());
//
//     // On page load action.
//     SchedulerBinding.instance.addPostFrameCallback((_) async {
//       admob.loadInterstitialAd(
//         "ca-app-pub-3940256099942544/5224354917",
//         "ca-app-pub-3940256099942544/5224354917",
//         true,
//       );
//
//       _model.getProfileRes = await DashboardGroup.getProfileCall.call(
//         authToken: FFAppState().authToken,
//       );
//
//       if ((_model.getProfileRes?.succeeded ?? true)) {
//         FFAppState().userName = getJsonField(
//           (_model.getProfileRes?.jsonBody ?? ''),
//           r'''$.name''',
//         ).toString();
//         safeSetState(() {});
//
//         _model.interstitialAdSuccess = await admob.showInterstitialAd();
//
//         safeSetState(() {});
//       }
//     });
//   }

// dart
// In 'lib/homepage/home_page/home_page_widget.dart'

///1

// class _HomePageWidgetState extends State<HomePageWidget> with RouteAware {
//   late HomePageModel _model;
//   final scaffoldKey = GlobalKey<ScaffoldState>();
//
//
//   ///1
//   // Future<void> _loadProfileOrRedirect() async {
//   //   final token = FFAppState().authToken;
//   //   final tail = (token != null && token.isNotEmpty)
//   //       ? token.substring(token.length - (token.length >= 4 ? 4 : token.length))
//   //       : 'n/a';
//   //   debugPrint('[HomePage] getProfile: start, tokenPresent=${token != null &&
//   //       token.isNotEmpty}, tokenTail=$tail');
//   //
//   //   try {
//   //     final res = await DashboardGroup.getProfileCall.call(
//   //       authToken: token,
//   //     );
//   //
//   //     debugPrint('[HomePage] getProfile: response received');
//   //     debugPrint(
//   //         '[HomePage] getProfile: status=${res?.statusCode}, succeeded=${res
//   //             ?.succeeded}');
//   //
//   //     final bodyStr = '${res?.jsonBody}';
//   //     debugPrint(
//   //       '[HomePage] getProfile: body=${bodyStr.length > 800
//   //           ? bodyStr.substring(0, 800) + '...(' + bodyStr.length.toString() +
//   //           ' chars)'
//   //           : bodyStr}',
//   //     );
//   //
//   //     final status = res?.statusCode;
//   //     final succeeded = res?.succeeded == true;
//   //     final unauthorized = status == 401 || status == 403;
//   //
//   //     if (!succeeded || unauthorized) {
//   //       debugPrint(
//   //           '[HomePage] getProfile: failed/unauthorized -> redirecting to login');
//   //       FFAppState().authToken = '';
//   //       if (!mounted) return;
//   //       await Navigator.of(context).pushNamedAndRemoveUntil(
//   //         LogInWidget.routeName,
//   //             (route) => false,
//   //       );
//   //       return;
//   //     }
//   //
//   //     FFAppState().userName = getJsonField(
//   //       (res?.jsonBody ?? ''),
//   //       r'$.name',
//   //     ).toString();
//   //     debugPrint(
//   //         '[HomePage] getProfile: success, userName=${FFAppState().userName}');
//   //     safeSetState(() {});
//   //   } catch (e, st) {
//   //     debugPrint('[HomePage] getProfile: exception=$e');
//   //     debugPrint('[HomePage] getProfile: stack=$st');
//   //     FFAppState().authToken = '';
//   //     if (!mounted) return;
//   //     await Navigator.of(context).pushNamedAndRemoveUntil(
//   //       LogInWidget.routeName,
//   //           (route) => false,
//   //     );
//   //   }
//   // }
//
//
//
//
//   ///2
//   Future<void> _loadProfileOrRedirect() async {
//     final token = FFAppState().authToken;
//     final tail = (token != null && token.isNotEmpty)
//         ? token.substring(token.length - (token.length >= 4 ? 4 : token.length))
//         : 'n/a';
//     debugPrint('[HomePage] getProfile: start, tokenPresent=${token != null &&
//         token.isNotEmpty}, tokenTail=$tail');
//
//     try {
//       final res = await DashboardGroup.getProfileCall.call(
//         authToken: token,
//       );
//
//       debugPrint('[HomePage] getProfile: response received');
//       debugPrint(
//           '[HomePage] getProfile: status=${res?.statusCode}, succeeded=${res
//               ?.succeeded}');
//
//       final bodyStr = '${res?.jsonBody}';
//       debugPrint(
//         '[HomePage] getProfile: body=${bodyStr.length > 800
//             ? bodyStr.substring(0, 800) + '...(' + bodyStr.length.toString() +
//             ' chars)'
//             : bodyStr}',
//       );
//
//       final status = res?.statusCode;
//       final succeeded = res?.succeeded == true;
//       final unauthorized = status == 401 || status == 403;
//
//       if (!succeeded || unauthorized) {
//         debugPrint(
//             '[HomePage] getProfile: failed/unauthorized -> redirecting to login');
//
//         // Clear all app state data
//         _clearAllAppStateData();
//
//         if (!mounted) return;
//         await Navigator.of(context).pushNamedAndRemoveUntil(
//           LogInWidget.routeName,
//               (route) => false,
//         );
//         return;
//       }
//
//       FFAppState().userName = getJsonField(
//         (res?.jsonBody ?? ''),
//         r'$.name',
//       ).toString();
//       debugPrint(
//           '[HomePage] getProfile: success, userName=${FFAppState().userName}');
//       safeSetState(() {});
//     } catch (e, st) {
//       debugPrint('[HomePage] getProfile: exception=$e');
//       debugPrint('[HomePage] getProfile: stack=$st');
//
//       // Clear all app state data
//       _clearAllAppStateData();
//
//       if (!mounted) return;
//       await Navigator.of(context).pushNamedAndRemoveUntil(
//         LogInWidget.routeName,
//             (route) => false,
//       );
//     }
//   }
//
//   void _clearAllAppStateData() {
//     debugPrint('[HomePage] Clearing all app state data');
//
//     // Clear authentication token
//     FFAppState().authToken = '';
//
//     // Clear user data
//     FFAppState().userName = '';
//
//     // Add other app state properties that need to be cleared
//     // For example:
//     // FFAppState().userId = '';
//     // FFAppState().userEmail = '';
//     // FFAppState().userProfile = null;
//     // FFAppState().preferences = {};
//     // FFAppState().cachedData = [];
//
//     // If you have a method to reset all app state, you can call it here:
//     // FFAppState().reset();
//   }
//
//
//   // @override
//   // void initState() {
//   //   super.initState();
//   //   _model = createModel(context, () => HomePageModel());
//   //   debugPrint('[HomePage] initState');
//   //
//   //   SchedulerBinding.instance.addPostFrameCallback((_) async {
//   //     // Preload interstitial ad (will check subscription status internally)
//   //     await SmartInterstitialManager().preloadInterstitial();
//   //
//   //     await _loadProfileOrRedirect();
//   //     if (!mounted) return;
//   //
//   //     // Show interstitial ad (will check subscription status internally)
//   //     _model.interstitialAdSuccess =
//   //     await SmartInterstitialManager().showInterstitialIfAllowed();
//   //     debugPrint('[HomePage] Smart interstitial: shown=${_model
//   //         .interstitialAdSuccess}');
//   //     safeSetState(() {});
//   //   });
//   // }
//
//
//   @override
//   void initState() {
//     super.initState();
//     _model = createModel(context, () => HomePageModel());
//     debugPrint('[HomePage] initState');
//
//     SchedulerBinding.instance.addPostFrameCallback((_) async {
//       // Start page timer for 5-minute interval ads
//       AdService().startPageTimer('homePage');
//
//       // Preload interstitial ad (will check subscription status internally)
//       await SmartInterstitialManager().preloadInterstitial();
//
//       await _loadProfileOrRedirect();
//
//       await SmartInterstitialManager().showInterstitialIfAllowed();
//
//       if (!mounted) return;
//     });
//   }
//
//
// // ...rest of the class remains unchanged...
//
//
//   @override
//   void dispose() {
//     // Stop the page timer when leaving the page
//     AdService().stopInterstitialTimer();
//     routeObserver.unsubscribe(this);
//     _model.dispose();
//     super.dispose();
//   }
//
//   @override
//   void didUpdateWidget(HomePageWidget oldWidget) {
//     super.didUpdateWidget(oldWidget);
//     _model.widget = widget;
//     // Restart timer when widget updates
//     AdService().startPageTimer('homePage');
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
//       // Restart timer when returning to this page
//       AdService().startPageTimer('homePage');
//       debugLogWidgetClass(_model);
//     }
//   }
//
//   @override
//   void didPush() {
//     if (mounted && DebugFlutterFlowModelContext.maybeOf(context) == null) {
//       setState(() => _model.isRouteVisible = true);
//       // Start timer when page is pushed
//       AdService().startPageTimer('homePage');
//       debugLogWidgetClass(_model);
//     }
//   }
//
//   @override
//   void didPop() {
//     _model.isRouteVisible = false;
//     // Stop timer when leaving the page
//     AdService().stopInterstitialTimer();
//   }
//   @override
//   void didPushNext() {
//     _model.isRouteVisible = false;
//     AdService().stopInterstitialTimer();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     DebugFlutterFlowModelContext
//         .maybeOf(context)
//         ?.parentModelCallback
//         ?.call(_model);
//     context.watch<FFAppState>();
//
//     return GestureDetector(
//       onTap: () {
//         FocusScope.of(context).unfocus();
//         FocusManager.instance.primaryFocus?.unfocus();
//       },
//       child: Scaffold(
//         key: scaffoldKey,
//         backgroundColor: FlutterFlowTheme
//             .of(context)
//             .oposite,
//         drawer: Drawer(
//           elevation: 16.0,
//           child: WebViewAware(
//             child: wrapWithModel(
//               model: _model.drawerMenuModel,
//               updateCallback: () => safeSetState(() {}),
//               child: Builder(builder: (_) {
//                 return DebugFlutterFlowModelContext(
//                   rootModel: _model.rootModel,
//                   child: const DrawerMenuWidget(),
//                 );
//               }),
//             ),
//           ),
//         ),
//         body: Stack(
//           children: [
//             ClipRRect(
//               borderRadius: BorderRadius.circular(8.0),
//               child: Image.asset(
//                 Theme
//                     .of(context)
//                     .brightness == Brightness.dark
//                     ? 'assets/images/home_adj_dark.png'
//                     : 'assets/images/Home_(2).png',
//                 width: double.infinity,
//                 height: double.infinity,
//                 fit: BoxFit.fill,
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsetsDirectional.fromSTEB(
//                   16.0, 40.0, 16.0, 0.0),
//               child: SingleChildScrollView(
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Row(
//                       mainAxisSize: MainAxisSize.max,
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Container(
//                           width: 40.0,
//                           height: 40.0,
//                           decoration: BoxDecoration(
//                             color: FlutterFlowTheme
//                                 .of(context)
//                                 .backBtnClr,
//                             boxShadow: [
//                               BoxShadow(
//                                 blurRadius: 4.0,
//                                 color: (Theme
//                                     .of(context)
//                                     .brightness ==
//                                     Brightness.dark) ==
//                                     true
//                                     ? const Color(0x335D4E4E)
//                                     : Colors.white,
//                                 offset: const Offset(
//                                   0.0,
//                                   2.0,
//                                 ),
//                               )
//                             ],
//                             borderRadius: BorderRadius.circular(12.0),
//                             border: Border.all(
//                               color: (Theme
//                                   .of(context)
//                                   .brightness ==
//                                   Brightness.dark) ==
//                                   true
//                                   ? Colors.transparent
//                                   : const Color(0xD5999999),
//                             ),
//                           ),
//                           child: InkWell(
//                             splashColor: Colors.transparent,
//                             focusColor: Colors.transparent,
//                             hoverColor: Colors.transparent,
//                             highlightColor: Colors.transparent,
//                             onTap: () async {
//                               scaffoldKey.currentState!.openDrawer();
//                             },
//                             child: Icon(
//                               Icons.menu,
//                               color: FlutterFlowTheme
//                                   .of(context)
//                                   .tertiary,
//                               size: 24.0,
//                             ),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsetsDirectional.fromSTEB(
//                               8.0, 0.0, 0.0, 0.0),
//                           child: Container(
//                             width: 40.0,
//                             height: 40.0,
//                             decoration: BoxDecoration(
//                               color: FlutterFlowTheme
//                                   .of(context)
//                                   .backBtnClr,
//                               boxShadow: [
//                                 BoxShadow(
//                                   blurRadius: 4.0,
//                                   color: (Theme
//                                       .of(context)
//                                       .brightness ==
//                                       Brightness.dark) ==
//                                       true
//                                       ? const Color(0x335D4E4E)
//                                       : Colors.white,
//                                   offset: const Offset(
//                                     0.0,
//                                     2.0,
//                                   ),
//                                 )
//                               ],
//                               borderRadius: BorderRadius.circular(12.0),
//                               border: Border.all(
//                                 color: (Theme
//                                     .of(context)
//                                     .brightness ==
//                                     Brightness.dark) ==
//                                     true
//                                     ? Colors.transparent
//                                     : const Color(0xD5999999),
//                               ),
//                             ),
//                             child: Icon(
//                               FFIcons.kgroup,
//                               color: FlutterFlowTheme
//                                   .of(context)
//                                   .tertiary,
//                               size: 24.0,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     Align(
//                       alignment: const AlignmentDirectional(-1.0, 0.0),
//                       child: Padding(
//                         padding:
//                         const EdgeInsetsDirectional.fromSTEB(
//                             0.0, 70.0, 0.0, 0.0),
//                         child: Text(
//                           'Quick Access',
//                           style: FlutterFlowTheme
//                               .of(context)
//                               .headlineLarge
//                               .override(
//                             font: GoogleFonts.poppins(
//                               fontWeight: FlutterFlowTheme
//                                   .of(context)
//                                   .headlineLarge
//                                   .fontWeight,
//                               fontStyle: FlutterFlowTheme
//                                   .of(context)
//                                   .headlineLarge
//                                   .fontStyle,
//                             ),
//                             letterSpacing: 0.0,
//                             fontWeight: FlutterFlowTheme
//                                 .of(context)
//                                 .headlineLarge
//                                 .fontWeight,
//                             fontStyle: FlutterFlowTheme
//                                 .of(context)
//                                 .headlineLarge
//                                 .fontStyle,
//                           ),
//                         ),
//                       ),
//                     ),
//                     Padding(
//                       padding:
//                       const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
//                       child: Row(
//                         mainAxisSize: MainAxisSize.max,
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           InkWell(
//                             splashColor: Colors.transparent,
//                             focusColor: Colors.transparent,
//                             hoverColor: Colors.transparent,
//                             highlightColor: Colors.transparent,
//                             onTap: () async {
//                               // context.pushNamed(EligiblePlayerWidget.routeName);
//                               context.pushNamed(
//                                 NavWidget.routeName,
//                                 queryParameters: {
//                                   'initialTab': '1'
//                                 }, // Pass initialTab as 1 for TabNotifications
//                               );
//                             },
//                             child: Container(
//                               width: MediaQuery
//                                   .sizeOf(context)
//                                   .width * 0.44,
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(8.0),
//                                 border: Border.all(
//                                   color: FlutterFlowTheme
//                                       .of(context)
//                                       .homeBoxBorder,
//                                 ),
//                               ),
//                               child: Padding(
//                                 padding: const EdgeInsetsDirectional.fromSTEB(
//                                     8.0, 8.0, 8.0, 8.0),
//                                 child: Column(
//                                   mainAxisSize: MainAxisSize.max,
//                                   children: [
//                                     Container(
//                                       width: 50.0,
//                                       height: 50.0,
//                                       decoration: BoxDecoration(
//                                         color: FlutterFlowTheme
//                                             .of(context)
//                                             .brownColor,
//                                         boxShadow: const [
//                                           BoxShadow(
//                                             blurRadius: 4.0,
//                                             color: Color(0x335D4E4E),
//                                             offset: Offset(
//                                               0.0,
//                                               2.0,
//                                             ),
//                                           )
//                                         ],
//                                         shape: BoxShape.circle,
//                                       ),
//                                       child: Icon(
//                                         Icons.format_list_bulleted,
//                                         color: (Theme
//                                             .of(context)
//                                             .brightness ==
//                                             Brightness.dark) ==
//                                             true
//                                             ? FlutterFlowTheme
//                                             .of(context)
//                                             .lightPeach
//                                             : Colors.white,
//                                         size: 24.0,
//                                       ),
//                                     ),
//                                     Align(
//                                       alignment: const AlignmentDirectional(
//                                           0.0, 0.0),
//                                       child: Padding(
//                                         padding: const EdgeInsetsDirectional
//                                             .fromSTEB(
//                                             0.0, 4.0, 0.0, 0.0),
//                                         child: Text(
//                                           'Eligible Players',
//                                           style: FlutterFlowTheme
//                                               .of(context)
//                                               .headlineLarge
//                                               .override(
//                                             font: GoogleFonts.poppins(
//                                               fontWeight: FontWeight.w600,
//                                               fontStyle:
//                                               FlutterFlowTheme
//                                                   .of(
//                                                   context)
//                                                   .headlineLarge
//                                                   .fontStyle,
//                                             ),
//                                             fontSize: 14.0,
//                                             letterSpacing: 0.0,
//                                             fontWeight: FontWeight.w600,
//                                             fontStyle:
//                                             FlutterFlowTheme
//                                                 .of(context)
//                                                 .headlineLarge
//                                                 .fontStyle,
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ),
//                           InkWell(
//                             splashColor: Colors.transparent,
//                             focusColor: Colors.transparent,
//                             hoverColor: Colors.transparent,
//                             highlightColor: Colors.transparent,
//                             onTap: () async {
//                               context.pushNamed(AllPlayersWidget.routeName);
//                             },
//                             child: Container(
//                               width: MediaQuery
//                                   .sizeOf(context)
//                                   .width * 0.44,
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(8.0),
//                                 border: Border.all(
//                                   color: FlutterFlowTheme
//                                       .of(context)
//                                       .homeBoxBorder,
//                                 ),
//                               ),
//                               child: Padding(
//                                 padding: const EdgeInsetsDirectional.fromSTEB(
//                                     8.0, 8.0, 8.0, 8.0),
//                                 child: Column(
//                                   mainAxisSize: MainAxisSize.max,
//                                   children: [
//                                     Container(
//                                       width: 50.0,
//                                       height: 50.0,
//                                       decoration: BoxDecoration(
//                                         color: FlutterFlowTheme
//                                             .of(context)
//                                             .brownColor,
//                                         boxShadow: const [
//                                           BoxShadow(
//                                             blurRadius: 4.0,
//                                             color: Color(0x335D4E4E),
//                                             offset: Offset(
//                                               0.0,
//                                               2.0,
//                                             ),
//                                           )
//                                         ],
//                                         shape: BoxShape.circle,
//                                       ),
//                                       child: Icon(
//                                         Icons.format_list_bulleted,
//                                         color: (Theme
//                                             .of(context)
//                                             .brightness ==
//                                             Brightness.dark) ==
//                                             true
//                                             ? FlutterFlowTheme
//                                             .of(context)
//                                             .lightPeach
//                                             : Colors.white,
//                                         size: 24.0,
//                                       ),
//                                     ),
//                                     Align(
//                                       alignment: const AlignmentDirectional(
//                                           0.0, 0.0),
//                                       child: Padding(
//                                         padding: const EdgeInsetsDirectional
//                                             .fromSTEB(
//                                             0.0, 4.0, 0.0, 0.0),
//                                         child: Text(
//                                           'Players Bio',
//                                           style: FlutterFlowTheme
//                                               .of(context)
//                                               .headlineLarge
//                                               .override(
//                                             font: GoogleFonts.poppins(
//                                               fontWeight: FontWeight.w600,
//                                               fontStyle:
//                                               FlutterFlowTheme
//                                                   .of(
//                                                   context)
//                                                   .headlineLarge
//                                                   .fontStyle,
//                                             ),
//                                             fontSize: 14.0,
//                                             letterSpacing: 0.0,
//                                             fontWeight: FontWeight.w600,
//                                             fontStyle:
//                                             FlutterFlowTheme
//                                                 .of(context)
//                                                 .headlineLarge
//                                                 .fontStyle,
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Padding(
//                       padding:
//                       const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
//                       child: Row(
//                         mainAxisSize: MainAxisSize.max,
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Container(
//                             width: MediaQuery
//                                 .sizeOf(context)
//                                 .width * 0.44,
//                             height: MediaQuery
//                                 .sizeOf(context)
//                                 .height * 0.15,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(8.0),
//                               border: Border.all(
//                                 color:
//                                 FlutterFlowTheme
//                                     .of(context)
//                                     .homeBoxBorder,
//                               ),
//                             ),
//                             child: Padding(
//                               padding: const EdgeInsetsDirectional.fromSTEB(
//                                   8.0, 8.0, 8.0, 8.0),
//                               child: InkWell(
//                                 splashColor: Colors.transparent,
//                                 focusColor: Colors.transparent,
//                                 hoverColor: Colors.transparent,
//                                 highlightColor: Colors.transparent,
//                                 onTap: () async {
//                                   // context
//                                   //     .pushNamed(RankingPageWidget.routeName);
//
//
//                                   context.pushNamed(
//                                     NavWidget.routeName,
//                                     queryParameters: {
//                                       'initialTab': '2'
//                                     }, // Pass initialTab as 1 for TabNotifications
//                                   );
//                                 },
//                                 child: Column(
//                                   mainAxisSize: MainAxisSize.max,
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Container(
//                                       width: 50.0,
//                                       height: 50.0,
//                                       decoration: BoxDecoration(
//                                         color: FlutterFlowTheme
//                                             .of(context)
//                                             .brownColor,
//                                         boxShadow: const [
//                                           BoxShadow(
//                                             blurRadius: 4.0,
//                                             color: Color(0x335D4E4E),
//                                             offset: Offset(
//                                               0.0,
//                                               2.0,
//                                             ),
//                                           )
//                                         ],
//                                         shape: BoxShape.circle,
//                                       ),
//                                       child: Icon(
//                                         Icons.format_list_bulleted,
//                                         color: (Theme
//                                             .of(context)
//                                             .brightness ==
//                                             Brightness.dark) ==
//                                             true
//                                             ? FlutterFlowTheme
//                                             .of(context)
//                                             .lightPeach
//                                             : Colors.white,
//                                         size: 24.0,
//                                       ),
//                                     ),
//                                     Align(
//                                       alignment: const AlignmentDirectional(
//                                           0.0, 0.0),
//                                       child: Padding(
//                                         padding: const EdgeInsetsDirectional
//                                             .fromSTEB(
//                                             0.0, 4.0, 0.0, 0.0),
//                                         child: Text(
//                                           'Your Ranking',
//                                           style: FlutterFlowTheme
//                                               .of(context)
//                                               .headlineLarge
//                                               .override(
//                                             font: GoogleFonts.poppins(
//                                               fontWeight: FontWeight.w600,
//                                               fontStyle:
//                                               FlutterFlowTheme
//                                                   .of(
//                                                   context)
//                                                   .headlineLarge
//                                                   .fontStyle,
//                                             ),
//                                             fontSize: 14.0,
//                                             letterSpacing: 0.0,
//                                             fontWeight: FontWeight.w600,
//                                             fontStyle:
//                                             FlutterFlowTheme
//                                                 .of(context)
//                                                 .headlineLarge
//                                                 .fontStyle,
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ),
//                           Container(
//                             width: MediaQuery
//                                 .sizeOf(context)
//                                 .width * 0.44,
//                             height: MediaQuery
//                                 .sizeOf(context)
//                                 .height * 0.15,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(8.0),
//                               border: Border.all(
//                                 color:
//                                 FlutterFlowTheme
//                                     .of(context)
//                                     .homeBoxBorder,
//                               ),
//                             ),
//                             child: Padding(
//                               padding: const EdgeInsetsDirectional.fromSTEB(
//                                   8.0, 8.0, 8.0, 8.0),
//                               child: InkWell(
//                                 splashColor: Colors.transparent,
//                                 focusColor: Colors.transparent,
//                                 hoverColor: Colors.transparent,
//                                 highlightColor: Colors.transparent,
//
//                                 onTap: () async {
//                                   context.pushNamed(
//                                     NavWidget.routeName,
//                                     queryParameters: {
//                                       'initialTab': '3'
//                                     }, // Pass initialTab as 1 for TabNotifications
//                                   );
//                                 },
//
//                                 child: Column(
//                                   mainAxisSize: MainAxisSize.max,
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Container(
//                                       width: 50.0,
//                                       height: 50.0,
//                                       decoration: BoxDecoration(
//                                         color: FlutterFlowTheme
//                                             .of(context)
//                                             .brownColor,
//                                         boxShadow: const [
//                                           BoxShadow(
//                                             blurRadius: 4.0,
//                                             color: Color(0x335D4E4E),
//                                             offset: Offset(
//                                               0.0,
//                                               2.0,
//                                             ),
//                                           )
//                                         ],
//                                         shape: BoxShape.circle,
//                                       ),
//                                       child: Icon(
//                                         Icons.format_list_bulleted,
//                                         color: (Theme
//                                             .of(context)
//                                             .brightness ==
//                                             Brightness.dark) ==
//                                             true
//                                             ? FlutterFlowTheme
//                                             .of(context)
//                                             .lightPeach
//                                             : Colors.white,
//                                         size: 24.0,
//                                       ),
//                                     ),
//                                     Align(
//                                       alignment: const AlignmentDirectional(
//                                           0.0, 0.0),
//                                       child: Padding(
//                                         padding: const EdgeInsetsDirectional
//                                             .fromSTEB(
//                                             0.0, 4.0, 0.0, 0.0),
//                                         child: Text(
//                                           'The GOAT\nGlobal Ranking',
//                                           textAlign: TextAlign.center,
//                                           style: FlutterFlowTheme
//                                               .of(context)
//                                               .headlineLarge
//                                               .override(
//                                             font: GoogleFonts.poppins(
//                                               fontWeight: FontWeight.w600,
//                                               fontStyle:
//                                               FlutterFlowTheme
//                                                   .of(
//                                                   context)
//                                                   .headlineLarge
//                                                   .fontStyle,
//                                             ),
//                                             fontSize: 14.0,
//                                             letterSpacing: 0.0,
//                                             fontWeight: FontWeight.w600,
//                                             fontStyle:
//                                             FlutterFlowTheme
//                                                 .of(context)
//                                                 .headlineLarge
//                                                 .fontStyle,
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Padding(
//                       padding:
//                       const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
//                       child: Row(
//                         mainAxisSize: MainAxisSize.max,
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Container(
//                             width: MediaQuery
//                                 .sizeOf(context)
//                                 .width * 0.44,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(8.0),
//                               border: Border.all(
//                                 color:
//                                 FlutterFlowTheme
//                                     .of(context)
//                                     .homeBoxBorder,
//                               ),
//                             ),
//                             child: Padding(
//                               padding: const EdgeInsetsDirectional.fromSTEB(
//                                   8.0, 8.0, 8.0, 8.0),
//                               child: InkWell(
//                                 splashColor: Colors.transparent,
//                                 focusColor: Colors.transparent,
//                                 hoverColor: Colors.transparent,
//                                 highlightColor: Colors.transparent,
//
//
//                                 onTap: () async {
//                                   context.pushNamed(
//                                     NavWidget.routeName,
//                                     queryParameters: {
//                                       'initialTab': '4'
//                                     }, // Pass initialTab as 1 for TabNotifications
//                                   );
//                                 },
//                                 child: Column(
//                                   mainAxisSize: MainAxisSize.max,
//                                   children: [
//                                     Container(
//                                       width: 50.0,
//                                       height: 50.0,
//                                       decoration: BoxDecoration(
//                                         color: FlutterFlowTheme
//                                             .of(context)
//                                             .brownColor,
//                                         boxShadow: const [
//                                           BoxShadow(
//                                             blurRadius: 4.0,
//                                             color: Color(0x335D4E4E),
//                                             offset: Offset(
//                                               0.0,
//                                               2.0,
//                                             ),
//                                           )
//                                         ],
//                                         shape: BoxShape.circle,
//                                       ),
//                                       child: Icon(
//                                         Icons.groups_2_sharp,
//                                         color: (Theme
//                                             .of(context)
//                                             .brightness ==
//                                             Brightness.dark) ==
//                                             true
//                                             ? FlutterFlowTheme
//                                             .of(context)
//                                             .lightPeach
//                                             : Colors.white,
//                                         size: 24.0,
//                                       ),
//                                     ),
//                                     Align(
//                                       alignment: const AlignmentDirectional(
//                                           0.0, 0.0),
//                                       child: Padding(
//                                         padding: const EdgeInsetsDirectional
//                                             .fromSTEB(
//                                             0.0, 4.0, 0.0, 0.0),
//                                         child: Text(
//                                           'Play with friends',
//                                           style: FlutterFlowTheme
//                                               .of(context)
//                                               .headlineLarge
//                                               .override(
//                                             font: GoogleFonts.poppins(
//                                               fontWeight: FontWeight.w600,
//                                               fontStyle:
//                                               FlutterFlowTheme
//                                                   .of(
//                                                   context)
//                                                   .headlineLarge
//                                                   .fontStyle,
//                                             ),
//                                             fontSize: 14.0,
//                                             letterSpacing: 0.0,
//                                             fontWeight: FontWeight.w600,
//                                             fontStyle:
//                                             FlutterFlowTheme
//                                                 .of(context)
//                                                 .headlineLarge
//                                                 .fontStyle,
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ),
//                           Container(
//                             width: MediaQuery
//                                 .sizeOf(context)
//                                 .width * 0.44,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(8.0),
//                               border: Border.all(
//                                 color:
//                                 FlutterFlowTheme
//                                     .of(context)
//                                     .homeBoxBorder,
//                               ),
//                             ),
//                             child: Padding(
//                               padding: const EdgeInsetsDirectional.fromSTEB(
//                                   8.0, 8.0, 8.0, 8.0),
//                               child: InkWell(
//                                 splashColor: Colors.transparent,
//                                 focusColor: Colors.transparent,
//                                 hoverColor: Colors.transparent,
//                                 highlightColor: Colors.transparent,
//                                 onTap: () async {
//                                   context
//                                       .pushNamed(ContestPageWidget.routeName);
//                                 },
//                                 child: Column(
//                                   mainAxisSize: MainAxisSize.max,
//                                   children: [
//                                     Container(
//                                       width: 50.0,
//                                       height: 50.0,
//                                       decoration: BoxDecoration(
//                                         color: FlutterFlowTheme
//                                             .of(context)
//                                             .brownColor,
//                                         boxShadow: const [
//                                           BoxShadow(
//                                             blurRadius: 4.0,
//                                             color: Color(0x335D4E4E),
//                                             offset: Offset(
//                                               0.0,
//                                               2.0,
//                                             ),
//                                           )
//                                         ],
//                                         shape: BoxShape.circle,
//                                       ),
//                                       child: Icon(
//                                         Icons.emoji_events_sharp,
//                                         color: (Theme
//                                             .of(context)
//                                             .brightness ==
//                                             Brightness.dark) ==
//                                             true
//                                             ? FlutterFlowTheme
//                                             .of(context)
//                                             .lightPeach
//                                             : Colors.white,
//                                         size: 24.0,
//                                       ),
//                                     ),
//                                     Align(
//                                       alignment: const AlignmentDirectional(
//                                           0.0, 0.0),
//                                       child: Padding(
//                                         padding: const EdgeInsetsDirectional
//                                             .fromSTEB(
//                                             0.0, 4.0, 0.0, 0.0),
//                                         child: Text(
//                                           'Contests',
//                                           style: FlutterFlowTheme
//                                               .of(context)
//                                               .headlineLarge
//                                               .override(
//                                             font: GoogleFonts.poppins(
//                                               fontWeight: FontWeight.w600,
//                                               fontStyle:
//                                               FlutterFlowTheme
//                                                   .of(
//                                                   context)
//                                                   .headlineLarge
//                                                   .fontStyle,
//                                             ),
//                                             fontSize: 14.0,
//                                             letterSpacing: 0.0,
//                                             fontWeight: FontWeight.w600,
//                                             fontStyle:
//                                             FlutterFlowTheme
//                                                 .of(context)
//                                                 .headlineLarge
//                                                 .fontStyle,
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Flexible(
//                       child: Padding(
//                         padding:
//                         const EdgeInsetsDirectional.fromSTEB(
//                             0.0, 20.0, 0.0, 0.0),
//                         child: Container(
//                           width: double.infinity,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(12.0),
//                             border: Border.all(
//                               color: FlutterFlowTheme
//                                   .of(context)
//                                   .homeBoxBorder,
//                             ),
//                           ),
//                           child: InkWell(
//                             splashColor: Colors.transparent,
//                             focusColor: Colors.transparent,
//                             hoverColor: Colors.transparent,
//                             highlightColor: Colors.transparent,
//                             onTap: () async {
//                               context.pushNamed(AboutScreenWidget.routeName);
//                             },
//                             child: Row(
//                               mainAxisSize: MainAxisSize.max,
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Padding(
//                                   padding: const EdgeInsetsDirectional.fromSTEB(
//                                       14.0, 10.0, 14.0, 10.0),
//                                   child: Row(
//                                     mainAxisSize: MainAxisSize.max,
//                                     children: [
//                                       Text(
//                                         'ABOUT VOTE THE GOAT',
//                                         style: FlutterFlowTheme
//                                             .of(context)
//                                             .titleMedium
//                                             .override(
//                                           font: GoogleFonts.poppins(
//                                             fontWeight:
//                                             FlutterFlowTheme
//                                                 .of(context)
//                                                 .titleMedium
//                                                 .fontWeight,
//                                             fontStyle:
//                                             FlutterFlowTheme
//                                                 .of(context)
//                                                 .titleMedium
//                                                 .fontStyle,
//                                           ),
//                                           letterSpacing: 0.0,
//                                           fontWeight:
//                                           FlutterFlowTheme
//                                               .of(context)
//                                               .titleMedium
//                                               .fontWeight,
//                                           fontStyle:
//                                           FlutterFlowTheme
//                                               .of(context)
//                                               .titleMedium
//                                               .fontStyle,
//                                         ),
//                                       ),
//                                       const Padding(
//                                         padding: EdgeInsetsDirectional.fromSTEB(
//                                             8.0, 0.0, 0.0, 0.0),
//                                         child: Icon(
//                                           Icons.info_outline,
//                                           color: Color(0x78FFFFFF),
//                                           size: 16.0,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 Padding(
//                                   padding: const EdgeInsetsDirectional.fromSTEB(
//                                       0.0, 0.0, 14.0, 0.0),
//                                   child: Container(
//                                     decoration: BoxDecoration(
//                                       shape: BoxShape.circle,
//                                       border: Border.all(
//                                         color: const Color(0x2AFFFFFF),
//                                       ),
//                                     ),
//                                     child: Padding(
//                                       padding: const EdgeInsetsDirectional
//                                           .fromSTEB(
//                                           6.0, 6.0, 6.0, 6.0),
//                                       child: Icon(
//                                         Icons.arrow_forward_ios_rounded,
//                                         color: FlutterFlowTheme
//                                             .of(context)
//                                             .tertiary,
//                                         size: 14.0,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     Flexible(
//                       child: Padding(
//                         padding:
//                         const EdgeInsetsDirectional.fromSTEB(
//                             0.0, 14.0, 0.0, 0.0),
//                         child: Container(
//                           width: double.infinity,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(12.0),
//                             border: Border.all(
//                               color: FlutterFlowTheme
//                                   .of(context)
//                                   .homeBoxBorder,
//                             ),
//                           ),
//                           child: InkWell(
//                             splashColor: Colors.transparent,
//                             focusColor: Colors.transparent,
//                             hoverColor: Colors.transparent,
//                             highlightColor: Colors.transparent,
//                             onTap: () async {
//                               context
//                                   .pushNamed(SubscriptionPageWidget.routeName);
//                             },
//                             child: Row(
//                               mainAxisSize: MainAxisSize.max,
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Padding(
//                                   padding: const EdgeInsetsDirectional.fromSTEB(
//                                       14.0, 10.0, 14.0, 10.0),
//                                   child: Row(
//                                     mainAxisSize: MainAxisSize.max,
//                                     children: [
//                                       Text(
//                                         'PREMIUM PLANS',
//                                         style: FlutterFlowTheme
//                                             .of(context)
//                                             .titleMedium
//                                             .override(
//                                           font: GoogleFonts.poppins(
//                                             fontWeight:
//                                             FlutterFlowTheme
//                                                 .of(context)
//                                                 .titleMedium
//                                                 .fontWeight,
//                                             fontStyle:
//                                             FlutterFlowTheme
//                                                 .of(context)
//                                                 .titleMedium
//                                                 .fontStyle,
//                                           ),
//                                           letterSpacing: 0.0,
//                                           fontWeight:
//                                           FlutterFlowTheme
//                                               .of(context)
//                                               .titleMedium
//                                               .fontWeight,
//                                           fontStyle:
//                                           FlutterFlowTheme
//                                               .of(context)
//                                               .titleMedium
//                                               .fontStyle,
//                                         ),
//                                       ),
//                                       const Padding(
//                                         padding: EdgeInsetsDirectional.fromSTEB(
//                                             8.0, 0.0, 0.0, 0.0),
//                                         child: Icon(
//                                           Icons.info_outline,
//                                           color: Color(0x78FFFFFF),
//                                           size: 16.0,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 Padding(
//                                   padding: const EdgeInsetsDirectional.fromSTEB(
//                                       0.0, 0.0, 14.0, 0.0),
//                                   child: Container(
//                                     decoration: BoxDecoration(
//                                       shape: BoxShape.circle,
//                                       border: Border.all(
//                                         color: const Color(0x2AFFFFFF),
//                                       ),
//                                     ),
//                                     child: Padding(
//                                       padding: const EdgeInsetsDirectional
//                                           .fromSTEB(
//                                           6.0, 6.0, 6.0, 6.0),
//                                       child: Icon(
//                                         Icons.arrow_forward_ios_rounded,
//                                         color: FlutterFlowTheme
//                                             .of(context)
//                                             .tertiary,
//                                         size: 14.0,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     Flexible(
//                       child: Padding(
//                         padding:
//                         const EdgeInsetsDirectional.fromSTEB(
//                             0.0, 14.0, 0.0, 0.0),
//                         child: Container(
//                           width: double.infinity,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(12.0),
//                             border: Border.all(
//                               color: FlutterFlowTheme
//                                   .of(context)
//                                   .homeBoxBorder,
//                             ),
//                           ),
//                           child: InkWell(
//                             splashColor: Colors.transparent,
//                             focusColor: Colors.transparent,
//                             hoverColor: Colors.transparent,
//                             highlightColor: Colors.transparent,
//                             onTap: () async {
//                               context.pushNamed(PrivacyPolicyWidget.routeName);
//                             },
//                             child: Row(
//                               mainAxisSize: MainAxisSize.max,
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Padding(
//                                   padding: const EdgeInsetsDirectional.fromSTEB(
//                                       14.0, 10.0, 14.0, 10.0),
//                                   child: Row(
//                                     mainAxisSize: MainAxisSize.max,
//                                     children: [
//                                       Text(
//                                         'LEGAL & PRIVACY',
//                                         style: FlutterFlowTheme
//                                             .of(context)
//                                             .titleMedium
//                                             .override(
//                                           font: GoogleFonts.poppins(
//                                             fontWeight:
//                                             FlutterFlowTheme
//                                                 .of(context)
//                                                 .titleMedium
//                                                 .fontWeight,
//                                             fontStyle:
//                                             FlutterFlowTheme
//                                                 .of(context)
//                                                 .titleMedium
//                                                 .fontStyle,
//                                           ),
//                                           letterSpacing: 0.0,
//                                           fontWeight:
//                                           FlutterFlowTheme
//                                               .of(context)
//                                               .titleMedium
//                                               .fontWeight,
//                                           fontStyle:
//                                           FlutterFlowTheme
//                                               .of(context)
//                                               .titleMedium
//                                               .fontStyle,
//                                         ),
//                                       ),
//                                       const Padding(
//                                         padding: EdgeInsetsDirectional.fromSTEB(
//                                             8.0, 0.0, 0.0, 0.0),
//                                         child: Icon(
//                                           Icons.info_outline,
//                                           color: Color(0x78FFFFFF),
//                                           size: 16.0,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 Padding(
//                                   padding: const EdgeInsetsDirectional.fromSTEB(
//                                       0.0, 0.0, 14.0, 0.0),
//                                   child: Container(
//                                     decoration: BoxDecoration(
//                                       shape: BoxShape.circle,
//                                       border: Border.all(
//                                         color: const Color(0x2AFFFFFF),
//                                       ),
//                                     ),
//                                     child: Padding(
//                                       padding: const EdgeInsetsDirectional
//                                           .fromSTEB(
//                                           6.0, 6.0, 6.0, 6.0),
//                                       child: Icon(
//                                         Icons.arrow_forward_ios_rounded,
//                                         color: FlutterFlowTheme
//                                             .of(context)
//                                             .tertiary,
//                                         size: 14.0,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     Flexible(
//                       child: Padding(
//                         padding: const EdgeInsetsDirectional.fromSTEB(
//                             0.0, 14.0, 0.0, 82.0),
//                         child: Container(
//                           width: double.infinity,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(12.0),
//                             border: Border.all(
//                               color: FlutterFlowTheme
//                                   .of(context)
//                                   .homeBoxBorder,
//                             ),
//                           ),
//                           child: InkWell(
//                             splashColor: Colors.transparent,
//                             focusColor: Colors.transparent,
//                             hoverColor: Colors.transparent,
//                             highlightColor: Colors.transparent,
//                             onTap: () async {
//                               context
//                                   .pushNamed(ContactAndSupportWidget.routeName);
//                             },
//                             child: Row(
//                               mainAxisSize: MainAxisSize.max,
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Padding(
//                                   padding: const EdgeInsetsDirectional.fromSTEB(
//                                       14.0, 10.0, 14.0, 10.0),
//                                   child: Row(
//                                     mainAxisSize: MainAxisSize.max,
//                                     children: [
//                                       Text(
//                                         'CONTACT & SUPPORT',
//                                         style: FlutterFlowTheme
//                                             .of(context)
//                                             .titleMedium
//                                             .override(
//                                           font: GoogleFonts.poppins(
//                                             fontWeight:
//                                             FlutterFlowTheme
//                                                 .of(context)
//                                                 .titleMedium
//                                                 .fontWeight,
//                                             fontStyle:
//                                             FlutterFlowTheme
//                                                 .of(context)
//                                                 .titleMedium
//                                                 .fontStyle,
//                                           ),
//                                           letterSpacing: 0.0,
//                                           fontWeight:
//                                           FlutterFlowTheme
//                                               .of(context)
//                                               .titleMedium
//                                               .fontWeight,
//                                           fontStyle:
//                                           FlutterFlowTheme
//                                               .of(context)
//                                               .titleMedium
//                                               .fontStyle,
//                                         ),
//                                       ),
//                                       const Padding(
//                                         padding: EdgeInsetsDirectional.fromSTEB(
//                                             8.0, 0.0, 0.0, 0.0),
//                                         child: Icon(
//                                           Icons.info_outline,
//                                           color: Color(0x78FFFFFF),
//                                           size: 16.0,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 Padding(
//                                   padding: const EdgeInsetsDirectional.fromSTEB(
//                                       0.0, 0.0, 14.0, 0.0),
//                                   child: Container(
//                                     decoration: BoxDecoration(
//                                       shape: BoxShape.circle,
//                                       border: Border.all(
//                                         color: const Color(0x2AFFFFFF),
//                                       ),
//                                     ),
//                                     child: Padding(
//                                       padding: const EdgeInsetsDirectional
//                                           .fromSTEB(
//                                           6.0, 6.0, 6.0, 6.0),
//                                       child: Icon(
//                                         Icons.arrow_forward_ios_rounded,
//                                         color: FlutterFlowTheme
//                                             .of(context)
//                                             .tertiary,
//                                         size: 14.0,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             if (Theme
//                 .of(context)
//                 .brightness == Brightness.light)
//               Align(
//                 alignment: const AlignmentDirectional(0.0, -0.94),
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(8.0),
//                   child: Image.asset(
//                     'assets/images/LOGO_VTG_3.png',
//                     width: 158.0,
//                     height: 160.0,
//                     fit: BoxFit.scaleDown,
//                     alignment: const Alignment(0.0, 0.0),
//                   ),
//                 ),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }

///2
class _HomePageWidgetState extends State<HomePageWidget> with RouteAware {
  late HomePageModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  // Future<void> _loadProfileOrRedirect() async {
  //   debugPrint('[HomePage] _loadProfileOrRedirect: STARTING');
  //
  //   final token = FFAppState().authToken;
  //
  //   // Check if token exists and is not empty
  //   if (token == null || token.isEmpty) {
  //     debugPrint('[HomePage] getProfile: No auth token found -> redirecting to login');
  //     await _showSessionExpiredDialog();
  //     if (!mounted) return;
  //     await Navigator.of(context).pushNamedAndRemoveUntil(
  //       LogInWidget.routeName,
  //           (route) => false,
  //     );
  //     return;
  //   }
  //
  //   final tail = token.length >= 4
  //       ? token.substring(token.length - 4)
  //       : token;
  //   debugPrint('[HomePage] getProfile: start, tokenPresent=true, tokenTail=$tail');
  //
  //   try {
  //     final res = await DashboardGroup.getProfileCall.call(
  //       authToken: token,
  //     );
  //
  //     debugPrint('[HomePage] getProfile: response received');
  //     debugPrint('[HomePage] getProfile: status=${res?.statusCode}, succeeded=${res?.succeeded}');
  //
  //     final bodyStr = '${res?.jsonBody}';
  //     debugPrint(
  //       '[HomePage] getProfile: body=${bodyStr.length > 800
  //           ? bodyStr.substring(0, 800) + '...(' + bodyStr.length.toString() + ' chars)'
  //           : bodyStr}',
  //     );
  //
  //     final status = res?.statusCode;
  //     final succeeded = res?.succeeded == true;
  //     final unauthorized = status == 401 || status == 403;
  //
  //     // Check for various failure conditions
  //     if (res == null || !succeeded || unauthorized || status == null || status < 200 || status >= 300) {
  //       debugPrint('[HomePage] getProfile: failed/unauthorized -> redirecting to login');
  //       debugPrint('[HomePage] getProfile: res=$res, succeeded=$succeeded, unauthorized=$unauthorized, status=$status');
  //
  //       // Clear all app state data
  //       _clearAllAppStateData();
  //
  //       if (!mounted) return;
  //
  //       // Show session expired popup
  //       await _showSessionExpiredDialog();
  //
  //       await Navigator.of(context).pushNamedAndRemoveUntil(
  //         LogInWidget.routeName,
  //             (route) => false,
  //       );
  //       return;
  //     }
  //
  //     // Success case
  //     FFAppState().userName = getJsonField(
  //       (res?.jsonBody ?? ''),
  //       r'$.name',
  //     ).toString();
  //     debugPrint('[HomePage] getProfile: success, userName=${FFAppState().userName}');
  //     safeSetState(() {});
  //   } catch (e, st) {
  //     debugPrint('[HomePage] getProfile: exception=$e');
  //     debugPrint('[HomePage] getProfile: stack=$st');
  //
  //     // Clear all app state data
  //     _clearAllAppStateData();
  //
  //     if (!mounted) return;
  //
  //     // Show session expired popup
  //     await _showSessionExpiredDialog();
  //
  //     await Navigator.of(context).pushNamedAndRemoveUntil(
  //       LogInWidget.routeName,
  //           (route) => false,
  //     );
  //   }
  // }
  //
  // Future<void> _showSessionExpiredDialog() async {
  //   return showDialog<void>(
  //     context: context,
  //     barrierDismissible: false,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: Text(
  //           'Session Expired',
  //           style: FlutterFlowTheme.of(context).headlineSmall,
  //         ),
  //         content: Text(
  //           'Your session has expired. Please log in again to continue.',
  //           style: FlutterFlowTheme.of(context).bodyMedium,
  //         ),
  //         actions: [
  //           TextButton(
  //             onPressed: () {
  //               Navigator.of(context).pop();
  //               Navigator.of(context).pushNamedAndRemoveUntil(
  //                 LogInWidget.routeName,
  //                     (route) => false,
  //               );
  //             },
  //             child: Text(
  //               'OK',
  //               style: FlutterFlowTheme.of(context).titleSmall,
  //             ),
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

  ///2
  Future<void> _loadProfileOrRedirect() async {
    debugPrint('[HomePage] _loadProfileOrRedirect: STARTING');

    final token = FFAppState().authToken;

    // Check if token exists and is not empty
    if (token.isEmpty) {
      debugPrint(
          '[HomePage] getProfile: No auth token found -> redirecting to login');
      await _showSessionExpiredDialog();
      if (!mounted) return;
      return;
    }

    final tail = token.length >= 4 ? token.substring(token.length - 4) : token;
    debugPrint(
        '[HomePage] getProfile: start, tokenPresent=true, tokenTail=$tail');

    try {
      final res = await DashboardGroup.getProfileCall.call(
        authToken: token,
      );

      debugPrint('[HomePage] getProfile: response received');
      debugPrint(
          '[HomePage] getProfile: status=${res.statusCode}, succeeded=${res.succeeded}');

      final bodyStr = '${res.jsonBody}';
      debugPrint(
        '[HomePage] getProfile: body=${bodyStr.length > 800 ? '${bodyStr.substring(0, 800)}...(${bodyStr.length} chars)' : bodyStr}',
      );

      final status = res.statusCode;
      final succeeded = res.succeeded == true;
      final unauthorized = status == 401 || status == 403;

      // Check for various failure conditions
      if (!succeeded ||
          unauthorized ||
          status < 200 ||
          status >= 300) {
        debugPrint(
            '[HomePage] getProfile: failed/unauthorized -> redirecting to login');
        debugPrint(
            '[HomePage] getProfile: res=$res, succeeded=$succeeded, unauthorized=$unauthorized, status=$status');

        // Clear all app state data
        _clearAllAppStateData();

        if (!mounted) return;

        // Show session expired popup
        await _showSessionExpiredDialog();
        return;
      }

      // Success case
      FFAppState().userName = getJsonField(
        (res.jsonBody ?? ''),
        r'$.name',
      ).toString();



      // Extract and update advertisement status
      final advertisementStatus = getJsonField(
        (res.jsonBody ?? ''),
        r'$.data.advertisement_status',
      );

      if (advertisementStatus != null) {
        FFAppState().advertisementStatus = advertisementStatus is int
            ? advertisementStatus
            : int.tryParse(advertisementStatus.toString()) ?? 1;
        debugPrint('[HomePage] getProfile: advertisementStatus=${FFAppState().advertisementStatus}');
      } else {
        FFAppState().advertisementStatus = 1; // default to enabled
        debugPrint('[HomePage] getProfile: advertisementStatus not found in response, defaulting to 1');
      }



      debugPrint(
          '[HomePage] getProfile: success, userName=${FFAppState().userName}');
      safeSetState(() {});
    } catch (e, st) {
      debugPrint('[HomePage] getProfile: exception=$e');
      debugPrint('[HomePage] getProfile: stack=$st');

      // Clear all app state data
      _clearAllAppStateData();

      if (!mounted) return;

      // Show session expired popup
      await _showSessionExpiredDialog();
    }
  }

  Future<void> _showSessionExpiredDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Session Expired',
            style: FlutterFlowTheme.of(context).headlineSmall,
          ),
          content: Text(
            'Your session has expired. Please log in again to continue.',
            style: FlutterFlowTheme.of(context).bodyMedium,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                // Use the correct route name based on your app's routing
                // context.pushNamedAndRemoveUntil(
                //   'logIn', // or whatever the correct route name is
                //       (route) => false,
                // );

                context.goNamed(LogInWidget.routeName);
              },
              child: Text(
                'OK',
                style: FlutterFlowTheme.of(context).titleSmall,
              ),
            ),
          ],
        );
      },
    );
  }

  ///

  void _clearAllAppStateData() {
    debugPrint('[HomePage] Clearing all app state data');

    // Clear authentication token
    FFAppState().authToken = '';

    // Clear user data
    FFAppState().userName = '';

    // Add other app state properties that need to be cleared
    // For example:
    // FFAppState().userId = '';
    // FFAppState().userEmail = '';
    // FFAppState().userProfile = null;
    // FFAppState().preferences = {};
    // FFAppState().cachedData = [];

    // If you have a method to reset all app state, you can call it here:
    // FFAppState().reset();

    debugPrint('[HomePage] App state cleared');
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());
    debugPrint('[HomePage] initState');

    SchedulerBinding.instance.addPostFrameCallback((_) async {
      // Start page timer for 5-minute interval ads

      AdService().startPageTimer('homePage');

      // Preload interstitial ad (will check subscription status internally)
      await SmartInterstitialManager().preloadInterstitial();

      // Call profile validation - this will handle redirection if needed
      await _loadProfileOrRedirect();

      // Only continue with ads if we're still mounted (profile validation succeeded)
      if (mounted) {




        FFAppState().advertisementStatus==0 ? null :

        await SmartInterstitialManager().showInterstitialIfAllowed();
      }
    });
  }

  @override
  void dispose() {
    // Stop the page timer when leaving the page
    AdService().stopInterstitialTimer();
    routeObserver.unsubscribe(this);
    _model.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(HomePageWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    _model.widget = widget;
    // Restart timer when widget updates
    AdService().startPageTimer('homePage');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final route = DebugModalRoute.of(context);
    if (route != null) {
      routeObserver.subscribe(this, route);
    }
    debugLogGlobalProperty(context);
  }

  @override
  void didPopNext() {
    if (mounted && DebugFlutterFlowModelContext.maybeOf(context) == null) {
      setState(() => _model.isRouteVisible = true);
      // Restart timer when returning to this page
      AdService().startPageTimer('homePage');
      debugLogWidgetClass(_model);
    }
  }

  @override
  void didPush() {
    if (mounted && DebugFlutterFlowModelContext.maybeOf(context) == null) {
      setState(() => _model.isRouteVisible = true);
      // Start timer when page is pushed
      AdService().startPageTimer('homePage');
      debugLogWidgetClass(_model);
    }
  }

  @override
  void didPop() {
    _model.isRouteVisible = false;
    // Stop timer when leaving the page
    AdService().stopInterstitialTimer();
  }

  @override
  void didPushNext() {
    _model.isRouteVisible = false;
    AdService().stopInterstitialTimer();
  }

  @override
  Widget build(BuildContext context) {
    DebugFlutterFlowModelContext.maybeOf(context)
        ?.parentModelCallback
        ?.call(_model);
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).oposite,
        drawer: Drawer(
          elevation: 16.0,
          child: WebViewAware(
            child: wrapWithModel(
              model: _model.drawerMenuModel,
              updateCallback: () => safeSetState(() {}),
              child: Builder(builder: (_) {
                return DebugFlutterFlowModelContext(
                  rootModel: _model.rootModel,
                  child: const DrawerMenuWidget(),
                );
              }),
            ),
          ),
        ),
        body: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                // Theme.of(context).brightness == Brightness.dark
                //     ? 'assets/images/home_adj_dark.png'
                //     : 'assets/images/Home_(2).png',

                Theme.of(context).brightness == Brightness.dark
                    ? 'assets/images/Home_dark.png'
                    : 'assets/images/Home_(2).png',

                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.fill,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsetsDirectional.fromSTEB(16.0, 40.0, 16.0, 0.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 40.0,
                          height: 40.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).backBtnClr,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 4.0,
                                color: (Theme.of(context).brightness ==
                                            Brightness.dark) ==
                                        true
                                    ? const Color(0x335D4E4E)
                                    : Colors.white,
                                offset: const Offset(0.0, 2.0),
                              )
                            ],
                            borderRadius: BorderRadius.circular(12.0),
                            border: Border.all(
                              color: (Theme.of(context).brightness ==
                                          Brightness.dark) ==
                                      true
                                  ? Colors.transparent
                                  : const Color(0xD5999999),
                            ),
                          ),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              scaffoldKey.currentState!.openDrawer();
                            },
                            child: Icon(
                              Icons.menu,
                              color: FlutterFlowTheme.of(context).tertiary,
                              size: 24.0,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              8.0, 0.0, 0.0, 0.0),
                          child: Container(
                            width: 40.0,
                            height: 40.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).backBtnClr,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 4.0,
                                  color: (Theme.of(context).brightness ==
                                              Brightness.dark) ==
                                          true
                                      ? const Color(0x335D4E4E)
                                      : Colors.white,
                                  offset: const Offset(0.0, 2.0),
                                )
                              ],
                              borderRadius: BorderRadius.circular(12.0),
                              border: Border.all(
                                color: (Theme.of(context).brightness ==
                                            Brightness.dark) ==
                                        true
                                    ? Colors.transparent
                                    : const Color(0xD5999999),
                              ),
                            ),
                            child: Icon(
                              FFIcons.kgroup,
                              color: FlutterFlowTheme.of(context).tertiary,
                              size: 24.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Align(
                      alignment: const AlignmentDirectional(-1.0, 0.0),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0,
                            70.0,
                            // MediaQuery.sizeOf(context).width >= 600
                            //     ? MediaQuery.sizeOf(context).height * 0.16
                            //     : 70.0,
                            0.0,
                            0.0),
                        child: Text(
                          'Quick Access',
                          style: FlutterFlowTheme.of(context)
                              .headlineLarge
                              .override(
                                font: GoogleFonts.poppins(
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .headlineLarge
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .headlineLarge
                                      .fontStyle,
                                ),
                                letterSpacing: 0.0,
                                fontWeight: FlutterFlowTheme.of(context)
                                    .headlineLarge
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .headlineLarge
                                    .fontStyle,
                              ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          0.0, 12.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed(
                                NavWidget.routeName,
                                queryParameters: {'initialTab': '1'},
                              );
                            },
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 0.44,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .homeBoxBorder,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    8.0, 8.0, 8.0, 8.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      width: 50.0,
                                      height: 50.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .brownColor,
                                        boxShadow: const [
                                          BoxShadow(
                                            blurRadius: 4.0,
                                            color: Color(0x335D4E4E),
                                            offset: Offset(0.0, 2.0),
                                          )
                                        ],
                                        shape: BoxShape.circle,
                                      ),
                                      child: Icon(
                                        Icons.format_list_bulleted,
                                        color: (Theme.of(context).brightness ==
                                                    Brightness.dark) ==
                                                true
                                            ? FlutterFlowTheme.of(context)
                                                .lightPeach
                                            : Colors.white,
                                        size: 24.0,
                                      ),
                                    ),
                                    Align(
                                      alignment:
                                          const AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(0.0, 4.0, 0.0, 0.0),
                                        child: Text(
                                          'Eligible Players',
                                          style: FlutterFlowTheme.of(context)
                                              .headlineLarge
                                              .override(
                                                font: GoogleFonts.poppins(
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .headlineLarge
                                                          .fontStyle,
                                                ),
                                                fontSize: 14.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineLarge
                                                        .fontStyle,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed(AllPlayersWidget.routeName);
                            },
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 0.44,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .homeBoxBorder,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    8.0, 8.0, 8.0, 8.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      width: 50.0,
                                      height: 50.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .brownColor,
                                        boxShadow: const [
                                          BoxShadow(
                                            blurRadius: 4.0,
                                            color: Color(0x335D4E4E),
                                            offset: Offset(0.0, 2.0),
                                          )
                                        ],
                                        shape: BoxShape.circle,
                                      ),
                                      child: Icon(
                                        Icons.format_list_bulleted,
                                        color: (Theme.of(context).brightness ==
                                                    Brightness.dark) ==
                                                true
                                            ? FlutterFlowTheme.of(context)
                                                .lightPeach
                                            : Colors.white,
                                        size: 24.0,
                                      ),
                                    ),
                                    Align(
                                      alignment:
                                          const AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(0.0, 4.0, 0.0, 0.0),
                                        child: Text(
                                          'Players Bio',
                                          style: FlutterFlowTheme.of(context)
                                              .headlineLarge
                                              .override(
                                                font: GoogleFonts.poppins(
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .headlineLarge
                                                          .fontStyle,
                                                ),
                                                fontSize: 14.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineLarge
                                                        .fontStyle,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          0.0, 12.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: MediaQuery.sizeOf(context).width * 0.44,
                            height: MediaQuery.sizeOf(context).height * 0.15,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(
                                color:
                                    FlutterFlowTheme.of(context).homeBoxBorder,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  8.0, 8.0, 8.0, 8.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pushNamed(
                                    NavWidget.routeName,
                                    queryParameters: {'initialTab': '2'},
                                  );
                                },
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 50.0,
                                      height: 50.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .brownColor,
                                        boxShadow: const [
                                          BoxShadow(
                                            blurRadius: 4.0,
                                            color: Color(0x335D4E4E),
                                            offset: Offset(0.0, 2.0),
                                          )
                                        ],
                                        shape: BoxShape.circle,
                                      ),
                                      child: Icon(
                                        Icons.format_list_bulleted,
                                        color: (Theme.of(context).brightness ==
                                                    Brightness.dark) ==
                                                true
                                            ? FlutterFlowTheme.of(context)
                                                .lightPeach
                                            : Colors.white,
                                        size: 24.0,
                                      ),
                                    ),
                                    Align(
                                      alignment:
                                          const AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(0.0, 4.0, 0.0, 0.0),
                                        child: Text(
                                          'Your Ranking',
                                          style: FlutterFlowTheme.of(context)
                                              .headlineLarge
                                              .override(
                                                font: GoogleFonts.poppins(
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .headlineLarge
                                                          .fontStyle,
                                                ),
                                                fontSize: 14.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineLarge
                                                        .fontStyle,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.sizeOf(context).width * 0.44,
                            height: MediaQuery.sizeOf(context).height * 0.15,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(
                                color:
                                    FlutterFlowTheme.of(context).homeBoxBorder,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  8.0, 8.0, 8.0, 8.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pushNamed(
                                    NavWidget.routeName,
                                    queryParameters: {'initialTab': '3'},
                                  );
                                },
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 50.0,
                                      height: 50.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .brownColor,
                                        boxShadow: const [
                                          BoxShadow(
                                            blurRadius: 4.0,
                                            color: Color(0x335D4E4E),
                                            offset: Offset(0.0, 2.0),
                                          )
                                        ],
                                        shape: BoxShape.circle,
                                      ),
                                      child: Icon(
                                        Icons.format_list_bulleted,
                                        color: (Theme.of(context).brightness ==
                                                    Brightness.dark) ==
                                                true
                                            ? FlutterFlowTheme.of(context)
                                                .lightPeach
                                            : Colors.white,
                                        size: 24.0,
                                      ),
                                    ),
                                    Align(
                                      alignment:
                                          const AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(0.0, 4.0, 0.0, 0.0),
                                        child: Text(
                                          'The GOAT\nGlobal Ranking',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .headlineLarge
                                              .override(
                                                font: GoogleFonts.poppins(
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .headlineLarge
                                                          .fontStyle,
                                                ),
                                                fontSize: 14.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineLarge
                                                        .fontStyle,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          0.0, 12.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: MediaQuery.sizeOf(context).width * 0.44,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(
                                color:
                                    FlutterFlowTheme.of(context).homeBoxBorder,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  8.0, 8.0, 8.0, 8.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pushNamed(
                                    NavWidget.routeName,
                                    queryParameters: {'initialTab': '4'},
                                  );
                                },
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      width: 50.0,
                                      height: 50.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .brownColor,
                                        boxShadow: const [
                                          BoxShadow(
                                            blurRadius: 4.0,
                                            color: Color(0x335D4E4E),
                                            offset: Offset(0.0, 2.0),
                                          )
                                        ],
                                        shape: BoxShape.circle,
                                      ),
                                      child: Icon(
                                        Icons.groups_2_sharp,
                                        color: (Theme.of(context).brightness ==
                                                    Brightness.dark) ==
                                                true
                                            ? FlutterFlowTheme.of(context)
                                                .lightPeach
                                            : Colors.white,
                                        size: 24.0,
                                      ),
                                    ),
                                    Align(
                                      alignment:
                                          const AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(0.0, 4.0, 0.0, 0.0),
                                        child: Text(
                                          'Play with friends',
                                          style: FlutterFlowTheme.of(context)
                                              .headlineLarge
                                              .override(
                                                font: GoogleFonts.poppins(
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .headlineLarge
                                                          .fontStyle,
                                                ),
                                                fontSize: 14.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineLarge
                                                        .fontStyle,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.sizeOf(context).width * 0.44,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(
                                color:
                                    FlutterFlowTheme.of(context).homeBoxBorder,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  8.0, 8.0, 8.0, 8.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context
                                      .pushNamed(ContestPageWidget.routeName);
                                },
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      width: 50.0,
                                      height: 50.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .brownColor,
                                        boxShadow: const [
                                          BoxShadow(
                                            blurRadius: 4.0,
                                            color: Color(0x335D4E4E),
                                            offset: Offset(0.0, 2.0),
                                          )
                                        ],
                                        shape: BoxShape.circle,
                                      ),
                                      child: Icon(
                                        Icons.emoji_events_sharp,
                                        color: (Theme.of(context).brightness ==
                                                    Brightness.dark) ==
                                                true
                                            ? FlutterFlowTheme.of(context)
                                                .lightPeach
                                            : Colors.white,
                                        size: 24.0,
                                      ),
                                    ),
                                    Align(
                                      alignment:
                                          const AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(0.0, 4.0, 0.0, 0.0),
                                        child: Text(
                                          'Contests',
                                          style: FlutterFlowTheme.of(context)
                                              .headlineLarge
                                              .override(
                                                font: GoogleFonts.poppins(
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .headlineLarge
                                                          .fontStyle,
                                                ),
                                                fontSize: 14.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineLarge
                                                        .fontStyle,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 20.0, 0.0, 0.0),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).homeBoxBorder,
                            ),
                          ),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed(AboutScreenWidget.routeName);
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      14.0, 10.0, 14.0, 10.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        'ABOUT VOTE THE GOAT',
                                        style: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .override(
                                              font: GoogleFonts.poppins(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMedium
                                                        .fontStyle,
                                              ),
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8.0, 0.0, 0.0, 0.0),
                                        child: Icon(
                                          Icons.info_outline,
                                          color: Color(0x78FFFFFF),
                                          size: 16.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 14.0, 0.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: const Color(0x2AFFFFFF),
                                      ),
                                    ),
                                    child: Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              6.0, 6.0, 6.0, 6.0),
                                      child: Icon(
                                        Icons.arrow_forward_ios_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .tertiary,
                                        size: 14.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 14.0, 0.0, 0.0),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).homeBoxBorder,
                            ),
                          ),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context
                                  .pushNamed(SubscriptionPageWidget.routeName);
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      14.0, 10.0, 14.0, 10.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        'PREMIUM PLANS',
                                        style: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .override(
                                              font: GoogleFonts.poppins(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMedium
                                                        .fontStyle,
                                              ),
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8.0, 0.0, 0.0, 0.0),
                                        child: Icon(
                                          Icons.info_outline,
                                          color: Color(0x78FFFFFF),
                                          size: 16.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 14.0, 0.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: const Color(0x2AFFFFFF),
                                      ),
                                    ),
                                    child: Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              6.0, 6.0, 6.0, 6.0),
                                      child: Icon(
                                        Icons.arrow_forward_ios_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .tertiary,
                                        size: 14.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 14.0, 0.0, 0.0),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).homeBoxBorder,
                            ),
                          ),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed(PrivacyPolicyWidget.routeName);
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      14.0, 10.0, 14.0, 10.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        'LEGAL & PRIVACY',
                                        style: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .override(
                                              font: GoogleFonts.poppins(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMedium
                                                        .fontStyle,
                                              ),
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8.0, 0.0, 0.0, 0.0),
                                        child: Icon(
                                          Icons.info_outline,
                                          color: Color(0x78FFFFFF),
                                          size: 16.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 14.0, 0.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: const Color(0x2AFFFFFF),
                                      ),
                                    ),
                                    child: Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              6.0, 6.0, 6.0, 6.0),
                                      child: Icon(
                                        Icons.arrow_forward_ios_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .tertiary,
                                        size: 14.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 14.0, 0.0, 82.0),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).homeBoxBorder,
                            ),
                          ),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context
                                  .pushNamed(ContactAndSupportWidget.routeName);
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      14.0, 10.0, 14.0, 10.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        'CONTACT & SUPPORT',
                                        style: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .override(
                                              font: GoogleFonts.poppins(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMedium
                                                        .fontStyle,
                                              ),
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8.0, 0.0, 0.0, 0.0),
                                        child: Icon(
                                          Icons.info_outline,
                                          color: Color(0x78FFFFFF),
                                          size: 16.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 14.0, 0.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: const Color(0x2AFFFFFF),
                                      ),
                                    ),
                                    child: Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              6.0, 6.0, 6.0, 6.0),
                                      child: Icon(
                                        Icons.arrow_forward_ios_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .tertiary,
                                        size: 14.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // if (Theme.of(context).brightness == Brightness.light)
            Align(
              alignment: const AlignmentDirectional(0.0, -0.94),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  Theme.of(context).brightness == Brightness.dark
                      ? 'assets/images/dark_logo.png'
                      : 'assets/images/LOGO_VTG_3.png',
                  width: 158.0,
                  height: 160.0,
                  fit: BoxFit.scaleDown,
                  alignment: const Alignment(0.0, 0.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
