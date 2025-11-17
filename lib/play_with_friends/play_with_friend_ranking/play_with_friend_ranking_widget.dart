// import '/backend/api_requests/api_calls.dart';
// import '/flutter_flow/flutter_flow_theme.dart';
// import '/flutter_flow/flutter_flow_util.dart';
// import '/flutter_flow/flutter_flow_widgets.dart';
// import 'dart:ui';
// import '/index.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/scheduler.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:provider/provider.dart';
// import 'play_with_friend_ranking_model.dart';
// export 'play_with_friend_ranking_model.dart';
//
// class PlayWithFriendRankingWidget extends StatefulWidget {
//   const PlayWithFriendRankingWidget({
//     super.key,
//     int? teamId,
//   }) : this.teamId = teamId ?? 0;
//
//   final int teamId;
//
//   static String routeName = 'PlayWithFriendRanking';
//   static String routePath = '/playWithFriendRanking';
//
//   @override
//   State<PlayWithFriendRankingWidget> createState() =>
//       _PlayWithFriendRankingWidgetState();
// }
//
// class _PlayWithFriendRankingWidgetState
//     extends State<PlayWithFriendRankingWidget> with RouteAware {
//   late PlayWithFriendRankingModel _model;
//
//   final scaffoldKey = GlobalKey<ScaffoldState>();
//
//   @override
//   void initState() {
//     super.initState();
//     _model = createModel(context, () => PlayWithFriendRankingModel());
//
//     // On page load action.
//     SchedulerBinding.instance.addPostFrameCallback((_) async {
//       _model.apiResultk4i = await DashboardGroup.teamRankingDetailsCall.call(
//         teamId: widget!.teamId,
//         authToken: FFAppState().authToken,
//       );
//
//       if ((_model.apiResultk4i?.succeeded ?? true)) {
//         safeSetState(() {});
//       }
//     });
//   }
//
//   @override
//   void dispose() {
//     routeObserver.unsubscribe(this);
//
//     _model.dispose();
//
//     super.dispose();
//   }
//
//   @override
//   void didUpdateWidget(PlayWithFriendRankingWidget oldWidget) {
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
//     final players = getJsonField(_model.apiResultk4i?.jsonBody, r'$.data')
//             as List<dynamic>? ??
//         [];
//
// // Print the team id to the console
//     print('Team ID iss>>>>>>: ${widget.teamId}');
//
//     DebugFlutterFlowModelContext.maybeOf(context)
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
//         backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
//         body: Stack(
//           alignment: const AlignmentDirectional(0.0, 1.0),
//           children: [
//             ClipRRect(
//               borderRadius: BorderRadius.circular(8.0),
//               child: Image.asset(
//                 Theme.of(context).brightness == Brightness.dark
//                     ? 'assets/images/commonBg.png'
//                     : 'assets/images/plain_whiteBg.png',
//                 width: double.infinity,
//                 height: double.infinity,
//                 fit: BoxFit.cover,
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsetsDirectional.fromSTEB(16.0, 40.0, 16.0, 0.0),
//               child: Column(
//                 mainAxisSize: MainAxisSize.max,
//                 children: [
//                   Row(
//                     mainAxisSize: MainAxisSize.max,
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       InkWell(
//                         splashColor: Colors.transparent,
//                         focusColor: Colors.transparent,
//                         hoverColor: Colors.transparent,
//                         highlightColor: Colors.transparent,
//                         onTap: () async {
//                           context.safePop();
//                         },
//                         child: Container(
//                           width: 40.0,
//                           height: 40.0,
//                           decoration: BoxDecoration(
//                             color: FlutterFlowTheme.of(context).backBtnClr,
//                             boxShadow: [
//                               const BoxShadow(
//                                 blurRadius: 4.0,
//                                 color: Color(0x335D4E4E),
//                                 offset: Offset(
//                                   0.0,
//                                   2.0,
//                                 ),
//                               )
//                             ],
//                             borderRadius: BorderRadius.circular(12.0),
//                             border: Border.all(
//                               color: (Theme.of(context).brightness ==
//                                           Brightness.dark) ==
//                                       true
//                                   ? Colors.black
//                                   : const Color(0xD5999999),
//                             ),
//                           ),
//                           child: Icon(
//                             Icons.arrow_back_rounded,
//                             color: FlutterFlowTheme.of(context).tertiary,
//                             size: 24.0,
//                           ),
//                         ),
//                       ),
//                       SingleChildScrollView(
//                         child: Column(
//                           mainAxisSize: MainAxisSize.max,
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Text(
//                               'team',
//                               style: FlutterFlowTheme.of(context)
//                                   .customTextStyle1
//                                   .override(
//                                     fontFamily: 'good times',
//                                     color:
//                                         FlutterFlowTheme.of(context).tertiary,
//                                     fontSize: 28.0,
//                                     letterSpacing: 0.0,
//                                     fontWeight: FontWeight.normal,
//                                   ),
//                             ),
//                             Text(
//                               'Details',
//                               style: FlutterFlowTheme.of(context)
//                                   .customTextStyle1
//                                   .override(
//                                     fontFamily: 'good times',
//                                     color: const Color(0xFFEB6027),
//                                     fontSize: 28.0,
//                                     letterSpacing: 0.0,
//                                     fontWeight: FontWeight.normal,
//                                   ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Padding(
//                         padding:
//                             const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
//                         child: InkWell(
//                           splashColor: Colors.transparent,
//                           focusColor: Colors.transparent,
//                           hoverColor: Colors.transparent,
//                           highlightColor: Colors.transparent,
//                           onTap: () async {
//                             context.pushNamed(AboutScreenWidget.routeName);
//                           },
//                           child: Container(
//                             width: 40.0,
//                             height: 40.0,
//                             decoration: BoxDecoration(
//                               color: FlutterFlowTheme.of(context).backBtnClr,
//                               boxShadow: [
//                                 const BoxShadow(
//                                   blurRadius: 4.0,
//                                   color: Color(0x335D4E4E),
//                                   offset: Offset(
//                                     0.0,
//                                     2.0,
//                                   ),
//                                 )
//                               ],
//                               borderRadius: BorderRadius.circular(12.0),
//                               border: Border.all(
//                                 color: (Theme.of(context).brightness ==
//                                             Brightness.dark) ==
//                                         true
//                                     ? Colors.black
//                                     : const Color(0xD5999999),
//                               ),
//                             ),
//                             child: Icon(
//                               FFIcons.kessentialUi1,
//                               color: FlutterFlowTheme.of(context).tertiary,
//                               size: 24.0,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   Expanded(
//                     child: Padding(
//                       padding:
//                           const EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 10.0),
//                       child: Column(
//                         mainAxisSize: MainAxisSize.max,
//                         children: [
//                           Container(
//                             decoration: BoxDecoration(
//                               shape: BoxShape.circle,
//                               border: Border.all(
//                                 color: FlutterFlowTheme.of(context).tertiary,
//                               ),
//                             ),
//                             child: Container(
//                                 width: 80.0,
//                                 height: 80.0,
//                                 clipBehavior: Clip.antiAlias,
//                                 decoration: const BoxDecoration(
//                                   shape: BoxShape.circle,
//                                 ),
//                                 child: Image.network(
//                                   '${getJsonField(_model.apiResultk4i?.jsonBody, r'$.logo')}',
//                                   errorBuilder: (context, error, stackTrace) =>
//                                       Image.asset(
//                                           'assets/images/error_image.webp',
//                                           fit: BoxFit.fill),
//                                 )),
//                           ),
//                           Padding(
//                             padding: const EdgeInsetsDirectional.fromSTEB(
//                                 0.0, 10.0, 0.0, 0.0),
//                             child: Text(
//                               // 'Basketball Legends',
//                               getJsonField(_model.apiResultk4i?.jsonBody,
//                                       r'$.team_name')
//                                   .toString(),
//
//                               style: FlutterFlowTheme.of(context)
//                                   .titleLarge
//                                   .override(
//                                     font: GoogleFonts.poppins(
//                                       fontWeight: FontWeight.w600,
//                                       fontStyle: FlutterFlowTheme.of(context)
//                                           .titleLarge
//                                           .fontStyle,
//                                     ),
//                                     fontSize: 20.0,
//                                     letterSpacing: 0.0,
//                                     fontWeight: FontWeight.w600,
//                                     fontStyle: FlutterFlowTheme.of(context)
//                                         .titleLarge
//                                         .fontStyle,
//                                   ),
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsetsDirectional.fromSTEB(
//                                 10.0, 10.0, 0.0, 0.0),
//                             child: Row(
//                               mainAxisSize: MainAxisSize.min,
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Icon(
//                                   Icons.groups_2,
//                                   color: Theme.of(context).brightness ==
//                                           Brightness.dark
//                                       ? const Color(0xFFC0C0C0)
//                                       : const Color(0xFF4D4D4D),
//                                   size: 18.0,
//                                 ),
//                                 Padding(
//                                   padding: const EdgeInsetsDirectional.fromSTEB(
//                                       3.0, 0.0, 0.0, 0.0),
//                                   child: Text(
//                                     '${players.length} Members',
//                                     textAlign: TextAlign.start,
//                                     style: FlutterFlowTheme.of(context)
//                                         .bodySmall
//                                         .override(
//                                           font: GoogleFonts.poppins(
//                                             fontWeight:
//                                                 FlutterFlowTheme.of(context)
//                                                     .bodySmall
//                                                     .fontWeight,
//                                             fontStyle:
//                                                 FlutterFlowTheme.of(context)
//                                                     .bodySmall
//                                                     .fontStyle,
//                                           ),
//                                           color: FlutterFlowTheme.of(context)
//                                               .tertiary,
//                                           letterSpacing: 0.0,
//                                           fontWeight:
//                                               FlutterFlowTheme.of(context)
//                                                   .bodySmall
//                                                   .fontWeight,
//                                           fontStyle:
//                                               FlutterFlowTheme.of(context)
//                                                   .bodySmall
//                                                   .fontStyle,
//                                         ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsetsDirectional.fromSTEB(
//                                 10.0, 14.0, 10.0, 10.0),
//                             child: Row(
//                               mainAxisSize: MainAxisSize.max,
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Expanded(
//                                   child: Align(
//                                     alignment: const AlignmentDirectional(0.0, 0.0),
//                                     child: Container(
//                                       height: 36.0,
//                                       decoration: BoxDecoration(
//                                         gradient: const LinearGradient(
//                                           colors: [
//                                             Color(0xFF038500),
//                                             Color(0xFF40AE3C),
//                                             Color(0xFF038500)
//                                           ],
//                                           stops: [0.0, 0.5, 1.0],
//                                           begin: AlignmentDirectional(0.0, 1.0),
//                                           end: AlignmentDirectional(0, -1.0),
//                                         ),
//                                         borderRadius:
//                                             BorderRadius.circular(12.0),
//                                       ),
//                                       child: Align(
//                                         alignment:
//                                             const AlignmentDirectional(0.0, 0.0),
//                                         child: Padding(
//                                           padding:
//                                               const EdgeInsetsDirectional.fromSTEB(
//                                                   10.0, 6.0, 10.0, 6.0),
//                                           child: Row(
//                                             mainAxisSize: MainAxisSize.max,
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.center,
//                                             children: [
//                                               const Icon(
//                                                 Icons.remove_red_eye,
//                                                 color: Colors.white,
//                                                 size: 16.0,
//                                               ),
//                                               Align(
//                                                 alignment: const AlignmentDirectional(
//                                                     0.0, 0.0),
//                                                 child: Padding(
//                                                   padding: const EdgeInsetsDirectional
//                                                       .fromSTEB(
//                                                           8.0, 0.0, 0.0, 0.0),
//                                                   child: Text(
//                                                     'Ranking',
//                                                     style: FlutterFlowTheme.of(
//                                                             context)
//                                                         .titleMedium
//                                                         .override(
//                                                           font: GoogleFonts
//                                                               .poppins(
//                                                             fontWeight:
//                                                                 FontWeight.w500,
//                                                             fontStyle:
//                                                                 FlutterFlowTheme.of(
//                                                                         context)
//                                                                     .titleMedium
//                                                                     .fontStyle,
//                                                           ),
//                                                           color: Colors.white,
//                                                           letterSpacing: 0.0,
//                                                           fontWeight:
//                                                               FontWeight.w500,
//                                                           fontStyle:
//                                                               FlutterFlowTheme.of(
//                                                                       context)
//                                                                   .titleMedium
//                                                                   .fontStyle,
//                                                         ),
//                                                   ),
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsetsDirectional.fromSTEB(
//                                 0.0, 20.0, 0.0, 0.0),
//                             child: Column(
//                               mainAxisSize: MainAxisSize.max,
//                               children: [
//                                 Container(
//                                   width: double.infinity,
//                                   decoration: BoxDecoration(
//                                     color: (Theme.of(context).brightness ==
//                                                 Brightness.dark) ==
//                                             true
//                                         ? Colors.white
//                                         : Colors.black,
//                                   ),
//                                   child: Padding(
//                                     padding: const EdgeInsetsDirectional.fromSTEB(
//                                         10.0, 7.0, 10.0, 7.0),
//                                     child: Row(
//                                       mainAxisSize: MainAxisSize.max,
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceEvenly,
//                                       children: [
//                                         Text(
//                                           'Rank',
//                                           style: FlutterFlowTheme.of(context)
//                                               .bodyMedium
//                                               .override(
//                                                 font: GoogleFonts.baloo2(
//                                                   fontWeight: FontWeight.w800,
//                                                   fontStyle:
//                                                       FlutterFlowTheme.of(
//                                                               context)
//                                                           .bodyMedium
//                                                           .fontStyle,
//                                                 ),
//                                                 color:
//                                                     FlutterFlowTheme.of(context)
//                                                         .oposite,
//                                                 fontSize: 16.0,
//                                                 letterSpacing: 0.0,
//                                                 fontWeight: FontWeight.w800,
//                                                 fontStyle:
//                                                     FlutterFlowTheme.of(context)
//                                                         .bodyMedium
//                                                         .fontStyle,
//                                               ),
//                                         ),
//                                         Expanded(
//                                           child: Padding(
//                                             padding:
//                                                 const EdgeInsetsDirectional.fromSTEB(
//                                                     40.0, 0.0, 0.0, 0.0),
//                                             child: Row(
//                                               mainAxisSize: MainAxisSize.max,
//                                               children: [
//                                                 Expanded(
//                                                   child: Text(
//                                                     'Player',
//                                                     style: FlutterFlowTheme.of(
//                                                             context)
//                                                         .bodyMedium
//                                                         .override(
//                                                           font: GoogleFonts
//                                                               .baloo2(
//                                                             fontWeight:
//                                                                 FontWeight.w800,
//                                                             fontStyle:
//                                                                 FlutterFlowTheme.of(
//                                                                         context)
//                                                                     .bodyMedium
//                                                                     .fontStyle,
//                                                           ),
//                                                           color: FlutterFlowTheme
//                                                                   .of(context)
//                                                               .oposite,
//                                                           fontSize: 16.0,
//                                                           letterSpacing: 0.0,
//                                                           fontWeight:
//                                                               FontWeight.w800,
//                                                           fontStyle:
//                                                               FlutterFlowTheme.of(
//                                                                       context)
//                                                                   .bodyMedium
//                                                                   .fontStyle,
//                                                         ),
//                                                   ),
//                                                 ),
//                                                 Text(
//                                                   'GOAT Points',
//                                                   style: FlutterFlowTheme.of(
//                                                           context)
//                                                       .bodyMedium
//                                                       .override(
//                                                         font:
//                                                             GoogleFonts.baloo2(
//                                                           fontWeight:
//                                                               FontWeight.w800,
//                                                           fontStyle:
//                                                               FlutterFlowTheme.of(
//                                                                       context)
//                                                                   .bodyMedium
//                                                                   .fontStyle,
//                                                         ),
//                                                         color:
//                                                             FlutterFlowTheme.of(
//                                                                     context)
//                                                                 .oposite,
//                                                         fontSize: 16.0,
//                                                         letterSpacing: 0.0,
//                                                         fontWeight:
//                                                             FontWeight.w800,
//                                                         fontStyle:
//                                                             FlutterFlowTheme.of(
//                                                                     context)
//                                                                 .bodyMedium
//                                                                 .fontStyle,
//                                                       ),
//                                                 ),
//                                               ],
//                                             ),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//
//                                 // ListView(
//                                 //
//                                 //   padding: EdgeInsets.zero,
//                                 //   shrinkWrap: true,
//                                 //   scrollDirection: Axis.vertical,
//                                 //   children: [
//                                 //     Container(
//                                 //       width: double.infinity,
//                                 //       decoration: BoxDecoration(
//                                 //         color: (Theme.of(context).brightness ==
//                                 //                     Brightness.dark) ==
//                                 //                 true
//                                 //             ? Color(0xFF4E4E4E)
//                                 //             : Colors.white,
//                                 //         boxShadow: [
//                                 //           BoxShadow(
//                                 //             blurRadius: 1.0,
//                                 //             color: Color(0x33463838),
//                                 //             offset: Offset(
//                                 //               1.0,
//                                 //               2.0,
//                                 //             ),
//                                 //             spreadRadius: 1.0,
//                                 //           )
//                                 //         ],
//                                 //       ),
//                                 //       child: Padding(
//                                 //         padding: EdgeInsetsDirectional.fromSTEB(
//                                 //             10.0, 7.0, 10.0, 7.0),
//                                 //         child: Row(
//                                 //           mainAxisSize: MainAxisSize.max,
//                                 //           mainAxisAlignment:
//                                 //               MainAxisAlignment.start,
//                                 //           children: [
//                                 //             Row(
//                                 //               mainAxisSize: MainAxisSize.max,
//                                 //               children: [
//                                 //                 FaIcon(
//                                 //                   FontAwesomeIcons.solidStar,
//                                 //                   color: Color(0xFFFFBC06),
//                                 //                   size: 18.0,
//                                 //                 ),
//                                 //                 Padding(
//                                 //                   padding: EdgeInsetsDirectional
//                                 //                       .fromSTEB(
//                                 //                           7.0, 0.0, 0.0, 0.0),
//                                 //                   child: Text(
//                                 //                     '1',
//                                 //                     style: FlutterFlowTheme.of(
//                                 //                             context)
//                                 //                         .titleMedium
//                                 //                         .override(
//                                 //                           font: GoogleFonts
//                                 //                               .poppins(
//                                 //                             fontWeight:
//                                 //                                 FlutterFlowTheme.of(
//                                 //                                         context)
//                                 //                                     .titleMedium
//                                 //                                     .fontWeight,
//                                 //                             fontStyle:
//                                 //                                 FlutterFlowTheme.of(
//                                 //                                         context)
//                                 //                                     .titleMedium
//                                 //                                     .fontStyle,
//                                 //                           ),
//                                 //                           letterSpacing: 0.0,
//                                 //                           fontWeight:
//                                 //                               FlutterFlowTheme.of(
//                                 //                                       context)
//                                 //                                   .titleMedium
//                                 //                                   .fontWeight,
//                                 //                           fontStyle:
//                                 //                               FlutterFlowTheme.of(
//                                 //                                       context)
//                                 //                                   .titleMedium
//                                 //                                   .fontStyle,
//                                 //                         ),
//                                 //                   ),
//                                 //                 ),
//                                 //               ],
//                                 //             ),
//                                 //             Expanded(
//                                 //               child: Padding(
//                                 //                 padding: EdgeInsetsDirectional
//                                 //                     .fromSTEB(
//                                 //                         40.0, 0.0, 0.0, 0.0),
//                                 //                 child: Row(
//                                 //                   mainAxisSize:
//                                 //                       MainAxisSize.max,
//                                 //                   children: [
//                                 //                     Container(
//                                 //                       width: 30.0,
//                                 //                       height: 30.0,
//                                 //                       clipBehavior:
//                                 //                           Clip.antiAlias,
//                                 //                       decoration: BoxDecoration(
//                                 //                         shape: BoxShape.circle,
//                                 //                       ),
//                                 //                       child: Image.network(
//                                 //                         'https://picsum.photos/seed/42/600',
//                                 //                         fit: BoxFit.cover,
//                                 //                         errorBuilder: (context,
//                                 //                                 error,
//                                 //                                 stackTrace) =>
//                                 //                             Image.asset(
//                                 //                           'assets/images/error_image.webp',
//                                 //                           fit: BoxFit.cover,
//                                 //                         ),
//                                 //                       ),
//                                 //                     ),
//                                 //                     Padding(
//                                 //                       padding:
//                                 //                           EdgeInsetsDirectional
//                                 //                               .fromSTEB(
//                                 //                                   7.0,
//                                 //                                   0.0,
//                                 //                                   0.0,
//                                 //                                   0.0),
//                                 //                       child: Text(
//                                 //                         'Shai Gilgeous',
//                                 //                         style:
//                                 //                             FlutterFlowTheme.of(
//                                 //                                     context)
//                                 //                                 .titleMedium
//                                 //                                 .override(
//                                 //                                   font: GoogleFonts
//                                 //                                       .poppins(
//                                 //                                     fontWeight: FlutterFlowTheme.of(
//                                 //                                             context)
//                                 //                                         .titleMedium
//                                 //                                         .fontWeight,
//                                 //                                     fontStyle: FlutterFlowTheme.of(
//                                 //                                             context)
//                                 //                                         .titleMedium
//                                 //                                         .fontStyle,
//                                 //                                   ),
//                                 //                                   fontSize:
//                                 //                                       12.0,
//                                 //                                   letterSpacing:
//                                 //                                       0.0,
//                                 //                                   fontWeight: FlutterFlowTheme.of(
//                                 //                                           context)
//                                 //                                       .titleMedium
//                                 //                                       .fontWeight,
//                                 //                                   fontStyle: FlutterFlowTheme.of(
//                                 //                                           context)
//                                 //                                       .titleMedium
//                                 //                                       .fontStyle,
//                                 //                                 ),
//                                 //                       ),
//                                 //                     ),
//                                 //                   ],
//                                 //                 ),
//                                 //               ),
//                                 //             ),
//                                 //             Padding(
//                                 //               padding: EdgeInsetsDirectional
//                                 //                   .fromSTEB(7.0, 0.0, 0.0, 0.0),
//                                 //               child: Text(
//                                 //                 '98',
//                                 //                 style: FlutterFlowTheme.of(
//                                 //                         context)
//                                 //                     .titleMedium
//                                 //                     .override(
//                                 //                       font: GoogleFonts.poppins(
//                                 //                         fontWeight:
//                                 //                             FlutterFlowTheme.of(
//                                 //                                     context)
//                                 //                                 .titleMedium
//                                 //                                 .fontWeight,
//                                 //                         fontStyle:
//                                 //                             FlutterFlowTheme.of(
//                                 //                                     context)
//                                 //                                 .titleMedium
//                                 //                                 .fontStyle,
//                                 //                       ),
//                                 //                       fontSize: 12.0,
//                                 //                       letterSpacing: 0.0,
//                                 //                       fontWeight:
//                                 //                           FlutterFlowTheme.of(
//                                 //                                   context)
//                                 //                               .titleMedium
//                                 //                               .fontWeight,
//                                 //                       fontStyle:
//                                 //                           FlutterFlowTheme.of(
//                                 //                                   context)
//                                 //                               .titleMedium
//                                 //                               .fontStyle,
//                                 //                     ),
//                                 //               ),
//                                 //             ),
//                                 //           ],
//                                 //         ),
//                                 //       ),
//                                 //     ),
//                                 //   ],
//                                 // ),
//
//                                 // Inside your build method, replace the static ListView with this:
//
//                                 Container(
//                                   height:
//                                       MediaQuery.sizeOf(context).height * 0.45,
//                                   child: ListView.builder(
//                                     padding: EdgeInsets.zero,
//                                     shrinkWrap: true,
//                                     itemCount: players.length,
//                                     itemBuilder: (context, index) {
//                                       final player = players[index];
//                                       return Container(
//                                         width: double.infinity,
//                                         // decoration: BoxDecoration(
//                                         //   color:
//                                         //       (Theme.of(context).brightness ==
//                                         //               Brightness.dark)
//                                         //           ? const Color(0xFF4E4E4E)
//                                         //           : Colors.white,
//                                         //   boxShadow: [
//                                         //     const BoxShadow(
//                                         //       blurRadius: 1.0,
//                                         //       color: Color(0x33463838),
//                                         //       offset: Offset(1.0, 2.0),
//                                         //       spreadRadius: 1.0,
//                                         //     )
//                                         //   ],
//                                         // ),
//
//                                         decoration: BoxDecoration(
//                                           color: Theme.of(context).brightness == Brightness.dark
//                                               ? (index.isEven ? Color(0xFF3D3D3D) : Color(0xFF131313))
//                                               : (index.isEven ? Color(0xFFEAEAEA) : Color(0xFFFFFFFF)),
//                                           boxShadow: [
//                                             const BoxShadow(
//                                               blurRadius: 1.0,
//                                               color: Color(0x33463838),
//                                               offset: Offset(1.0, 2.0),
//                                               spreadRadius: 1.0,
//                                             )
//                                           ],
//                                         ),
//
//                                         child: Padding(
//                                           padding:
//                                               const EdgeInsetsDirectional.fromSTEB(
//                                                   10.0, 7.0, 10.0, 7.0),
//                                           child: Row(
//                                             mainAxisSize: MainAxisSize.max,
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.start,
//                                             children: [
//                                               Row(
//                                                 mainAxisSize: MainAxisSize.max,
//                                                 children: [
//                                                   const FaIcon(
//                                                     FontAwesomeIcons.solidStar,
//                                                     color: Color(0xFFFFBC06),
//                                                     size: 18.0,
//                                                   ),
//                                                   Padding(
//                                                     padding:
//                                                         const EdgeInsetsDirectional
//                                                             .fromSTEB(7.0, 0.0,
//                                                                 0.0, 0.0),
//                                                     child: Text(
//                                                       getJsonField(
//                                                               player, r'$.rank')
//                                                           .toString(),
//                                                       style:
//                                                           FlutterFlowTheme.of(
//                                                                   context)
//                                                               .titleMedium
//                                                               .override(
//                                                                 font: GoogleFonts
//                                                                     .poppins(
//                                                                   fontWeight: FlutterFlowTheme.of(
//                                                                           context)
//                                                                       .titleMedium
//                                                                       .fontWeight,
//                                                                   fontStyle: FlutterFlowTheme.of(
//                                                                           context)
//                                                                       .titleMedium
//                                                                       .fontStyle,
//                                                                 ),
//                                                                 letterSpacing:
//                                                                     0.0,
//                                                                 fontWeight: FlutterFlowTheme.of(
//                                                                         context)
//                                                                     .titleMedium
//                                                                     .fontWeight,
//                                                                 fontStyle: FlutterFlowTheme.of(
//                                                                         context)
//                                                                     .titleMedium
//                                                                     .fontStyle,
//                                                               ),
//                                                     ),
//                                                   ),
//                                                 ],
//                                               ),
//                                               Expanded(
//                                                 child: Padding(
//                                                   padding: const EdgeInsetsDirectional
//                                                       .fromSTEB(
//                                                           40.0, 0.0, 0.0, 0.0),
//                                                   child: Row(
//                                                     mainAxisSize:
//                                                         MainAxisSize.max,
//                                                     children: [
//                                                       Container(
//                                                         width: 30.0,
//                                                         height: 30.0,
//                                                         clipBehavior:
//                                                             Clip.antiAlias,
//                                                         decoration:
//                                                             const BoxDecoration(
//                                                           shape:
//                                                               BoxShape.circle,
//                                                         ),
//                                                         child: Image.network(
//                                                           getJsonField(player,
//                                                               r'$.image'),
//
//                                                           // 'https://picsum.photos/seed/${getJsonField(player, r'$.player_id')}/600',
//                                                           // Use player_id for unique avatar
//                                                           fit: BoxFit.cover,
//                                                           errorBuilder: (context,
//                                                                   error,
//                                                                   stackTrace) =>
//                                                               Image.asset(
//                                                                   'assets/images/error_image.webp',
//                                                                   fit: BoxFit
//                                                                       .cover),
//                                                         ),
//                                                       ),
//                                                       Padding(
//                                                         padding:
//                                                             const EdgeInsetsDirectional
//                                                                 .fromSTEB(
//                                                                     7.0,
//                                                                     0.0,
//                                                                     0.0,
//                                                                     0.0),
//                                                         child: Text(
//                                                           getJsonField(player,
//                                                                   r'$.player_name')
//                                                               .toString(),
//                                                           style: FlutterFlowTheme
//                                                                   .of(context)
//                                                               .titleMedium
//                                                               .override(
//                                                                 font: GoogleFonts
//                                                                     .poppins(
//                                                                   fontWeight: FlutterFlowTheme.of(
//                                                                           context)
//                                                                       .titleMedium
//                                                                       .fontWeight,
//                                                                   fontStyle: FlutterFlowTheme.of(
//                                                                           context)
//                                                                       .titleMedium
//                                                                       .fontStyle,
//                                                                 ),
//                                                                 fontSize: 12.0,
//                                                                 letterSpacing:
//                                                                     0.0,
//                                                                 fontWeight: FlutterFlowTheme.of(
//                                                                         context)
//                                                                     .titleMedium
//                                                                     .fontWeight,
//                                                                 fontStyle: FlutterFlowTheme.of(
//                                                                         context)
//                                                                     .titleMedium
//                                                                     .fontStyle,
//                                                               ),
//                                                         ),
//                                                       ),
//                                                     ],
//                                                   ),
//                                                 ),
//                                               ),
//                                               Padding(
//                                                 padding: const EdgeInsetsDirectional
//                                                     .fromSTEB(
//                                                         7.0, 0.0, 0.0, 0.0),
//                                                 child: Text(
//                                                   // getJsonField(player, r'$.total_value').toString(),
//                                                   (getJsonField(player,
//                                                                   r'$.total_value')
//                                                               as num?)
//                                                           ?.toStringAsFixed(
//                                                               2) ??
//                                                       '0.00',
//
//                                                   style: FlutterFlowTheme.of(
//                                                           context)
//                                                       .titleMedium
//                                                       .override(
//                                                         font:
//                                                             GoogleFonts.poppins(
//                                                           fontWeight:
//                                                               FlutterFlowTheme.of(
//                                                                       context)
//                                                                   .titleMedium
//                                                                   .fontWeight,
//                                                           fontStyle:
//                                                               FlutterFlowTheme.of(
//                                                                       context)
//                                                                   .titleMedium
//                                                                   .fontStyle,
//                                                         ),
//                                                         fontSize: 12.0,
//                                                         letterSpacing: 0.0,
//                                                         fontWeight:
//                                                             FlutterFlowTheme.of(
//                                                                     context)
//                                                                 .titleMedium
//                                                                 .fontWeight,
//                                                         fontStyle:
//                                                             FlutterFlowTheme.of(
//                                                                     context)
//                                                                 .titleMedium
//                                                                 .fontStyle,
//                                                       ),
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                       );
//                                     },
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'play_with_friend_ranking_model.dart';
export 'play_with_friend_ranking_model.dart';

class PlayWithFriendRankingWidget extends StatefulWidget {
  const PlayWithFriendRankingWidget({
    super.key,
    int? teamId,
  }) : teamId = teamId ?? 0;

  final int teamId;

  static String routeName = 'PlayWithFriendRanking';
  static String routePath = '/playWithFriendRanking';

  @override
  State<PlayWithFriendRankingWidget> createState() =>
      _PlayWithFriendRankingWidgetState();
}

class _PlayWithFriendRankingWidgetState
    extends State<PlayWithFriendRankingWidget> with RouteAware {
  late PlayWithFriendRankingModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PlayWithFriendRankingModel());

    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() => isLoading = true);
      _model.apiResultk4i = await DashboardGroup.teamRankingDetailsCall.call(
        teamId: widget.teamId,
        authToken: FFAppState().authToken,
      );
      setState(() => isLoading = false);

      if ((_model.apiResultk4i?.succeeded ?? true)) {
        safeSetState(() {});
      }
    });
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    _model.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(PlayWithFriendRankingWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    _model.widget = widget;
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
      debugLogWidgetClass(_model);
    }
  }

  @override
  void didPush() {
    if (mounted && DebugFlutterFlowModelContext.maybeOf(context) == null) {
      setState(() => _model.isRouteVisible = true);
      debugLogWidgetClass(_model);
    }
  }

  @override
  void didPop() {
    _model.isRouteVisible = false;
  }

  @override
  void didPushNext() {
    _model.isRouteVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    final players = getJsonField(_model.apiResultk4i?.jsonBody, r'$.data')
    as List<dynamic>? ??
        [];

    print('Team ID iss>>>>>>: ${widget.teamId}');

    DebugFlutterFlowModelContext.maybeOf(context)
        ?.parentModelCallback
        ?.call(_model);
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Stack(
        children: [
          Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Stack(
              alignment: const AlignmentDirectional(0.0, 1.0),
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    Theme.of(context).brightness == Brightness.dark
                        ? 'assets/images/commonBg.png'
                        : 'assets/images/plain_whiteBg.png',
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16.0, 40.0, 16.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.safePop();
                            },
                            child: Container(
                              width: 40.0,
                              height: 40.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).backBtnClr,
                                boxShadow: const [
                                  BoxShadow(
                                    blurRadius: 4.0,
                                    color: Color(0x335D4E4E),
                                    offset: Offset(
                                      0.0,
                                      2.0,
                                    ),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(12.0),
                                border: Border.all(
                                  color: (Theme.of(context).brightness ==
                                      Brightness.dark) ==
                                      true
                                      ? Colors.black
                                      : const Color(0xD5999999),
                                ),
                              ),
                              child: Icon(
                                Icons.arrow_back_rounded,
                                color: FlutterFlowTheme.of(context).tertiary,
                                size: 24.0,
                              ),
                            ),
                          ),
                          SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'team',
                                  style: FlutterFlowTheme.of(context)
                                      .customTextStyle1
                                      .override(
                                    fontFamily: 'good times',
                                    color:
                                    FlutterFlowTheme.of(context).tertiary,
                                    fontSize: 24.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                Text(
                                  'Ranking',
                                  style: FlutterFlowTheme.of(context)
                                      .customTextStyle1
                                      .override(
                                    fontFamily: 'good times',
                                    color: const Color(0xFFEB6027),
                                    fontSize: 24.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                            const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed(AboutScreenWidget.routeName);
                              },
                              child: Container(
                                width: 40.0,
                                height: 40.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).backBtnClr,
                                  boxShadow: const [
                                    BoxShadow(
                                      blurRadius: 4.0,
                                      color: Color(0x335D4E4E),
                                      offset: Offset(
                                        0.0,
                                        2.0,
                                      ),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(12.0),
                                  border: Border.all(
                                    color: (Theme.of(context).brightness ==
                                        Brightness.dark) ==
                                        true
                                        ? Colors.black
                                        : const Color(0xD5999999),
                                  ),
                                ),
                                child: Icon(
                                  FFIcons.kessentialUi1,
                                  color: FlutterFlowTheme.of(context).tertiary,
                                  size: 24.0,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Padding(
                          padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 10.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: FlutterFlowTheme.of(context).tertiary,
                                  ),
                                ),
                                child: Container(
                                    width: 80.0,
                                    height: 80.0,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: Image.network(
                                      '${getJsonField(_model.apiResultk4i?.jsonBody, r'$.logo')}',
                                      errorBuilder: (context, error, stackTrace) =>
                                          Image.asset(
                                              'assets/images/error_image.webp',
                                              fit: BoxFit.fill),
                                    )),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 0.0, 0.0),
                                child: Text(
                                  getJsonField(_model.apiResultk4i?.jsonBody,
                                      r'$.team_name')
                                      .toString(),
                                  style: FlutterFlowTheme.of(context)
                                      .titleLarge
                                      .override(
                                    font: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .fontStyle,
                                    ),
                                    fontSize: 20.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .fontStyle,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    10.0, 10.0, 0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.groups_2,
                                      color: Theme.of(context).brightness ==
                                          Brightness.dark
                                          ? const Color(0xFFC0C0C0)
                                          : const Color(0xFF4D4D4D),
                                      size: 18.0,
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          3.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        '${players.length} Members',
                                        textAlign: TextAlign.start,
                                        style: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .override(
                                          font: GoogleFonts.poppins(
                                            fontWeight:
                                            FlutterFlowTheme.of(context)
                                                .bodySmall
                                                .fontWeight,
                                            fontStyle:
                                            FlutterFlowTheme.of(context)
                                                .bodySmall
                                                .fontStyle,
                                          ),
                                          color: FlutterFlowTheme.of(context)
                                              .tertiary,
                                          letterSpacing: 0.0,
                                          fontWeight:
                                          FlutterFlowTheme.of(context)
                                              .bodySmall
                                              .fontWeight,
                                          fontStyle:
                                          FlutterFlowTheme.of(context)
                                              .bodySmall
                                              .fontStyle,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 14.0, 10.0, 10.0),
                                // child: Row(
                                //   mainAxisSize: MainAxisSize.max,
                                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                //   children: [
                                //     Expanded(
                                //       child: Align(
                                //         alignment: const AlignmentDirectional(0.0, 0.0),
                                //         child: Container(
                                //           height: 36.0,
                                //           decoration: BoxDecoration(
                                //             // gradient: const LinearGradient(
                                //             //   colors: [
                                //             //     Color(0xFF038500),
                                //             //     Color(0xFF40AE3C),
                                //             //     Color(0xFF038500)
                                //             //   ],
                                //             //   stops: [0.0, 0.5, 1.0],
                                //             //   begin: AlignmentDirectional(0.0, 1.0),
                                //             //   end: AlignmentDirectional(0, -1.0),
                                //             // ),
                                //             borderRadius:
                                //             BorderRadius.circular(12.0),
                                //           ),
                                //           child: Align(
                                //             alignment:
                                //             const AlignmentDirectional(0.0, 0.0),
                                //             child: Padding(
                                //               padding:
                                //               const EdgeInsetsDirectional.fromSTEB(
                                //                   10.0, 6.0, 10.0, 6.0),
                                //               child: Row(
                                //                 mainAxisSize: MainAxisSize.max,
                                //                 mainAxisAlignment:
                                //                 MainAxisAlignment.center,
                                //                 children: [
                                //                   const Icon(
                                //                     Icons.remove_red_eye,
                                //                     color: Colors.white,
                                //                     size: 16.0,
                                //                   ),
                                //                   Align(
                                //                     alignment: const AlignmentDirectional(
                                //                         0.0, 0.0),
                                //                     child: Padding(
                                //                       padding: const EdgeInsetsDirectional
                                //                           .fromSTEB(
                                //                           8.0, 0.0, 0.0, 0.0),
                                //                       child: Text(
                                //                         'Ranking',
                                //                         style: FlutterFlowTheme.of(
                                //                             context)
                                //                             .titleMedium
                                //                             .override(
                                //                           font: GoogleFonts
                                //                               .poppins(
                                //                             fontWeight:
                                //                             FontWeight.w500,
                                //                             fontStyle:
                                //                             FlutterFlowTheme.of(
                                //                                 context)
                                //                                 .titleMedium
                                //                                 .fontStyle,
                                //                           ),
                                //                           color: Colors.white,
                                //                           letterSpacing: 0.0,
                                //                           fontWeight:
                                //                           FontWeight.w500,
                                //                           fontStyle:
                                //                           FlutterFlowTheme.of(
                                //                               context)
                                //                               .titleMedium
                                //                               .fontStyle,
                                //                         ),
                                //                       ),
                                //                     ),
                                //                   ),
                                //                 ],
                                //               ),
                                //             ),
                                //           ),
                                //         ),
                                //       ),
                                //     ),
                                //   ],
                                // ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 20.0, 0.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: (Theme.of(context).brightness ==
                                            Brightness.dark) ==
                                            true
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            10.0, 7.0, 10.0, 7.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              'Rank',
                                              style: FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .override(
                                                font: GoogleFonts.baloo2(
                                                  fontWeight: FontWeight.w800,
                                                  fontStyle:
                                                  FlutterFlowTheme.of(
                                                      context)
                                                      .bodyMedium
                                                      .fontStyle,
                                                ),
                                                color:
                                                FlutterFlowTheme.of(context)
                                                    .oposite,
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w800,
                                                fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                              ),
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    40.0, 0.0, 0.0, 0.0),
                                                child: Row(
                                                  mainAxisSize: MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: Text(
                                                        'Player',
                                                        style: FlutterFlowTheme.of(
                                                            context)
                                                            .bodyMedium
                                                            .override(
                                                          font: GoogleFonts
                                                              .baloo2(
                                                            fontWeight:
                                                            FontWeight.w800,
                                                            fontStyle:
                                                            FlutterFlowTheme.of(
                                                                context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                          ),
                                                          color: FlutterFlowTheme
                                                              .of(context)
                                                              .oposite,
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                          FontWeight.w800,
                                                          fontStyle:
                                                          FlutterFlowTheme.of(
                                                              context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                        ),
                                                      ),
                                                    ),
                                                    // Text(
                                                    //   'GOAT Points',
                                                    //   style: FlutterFlowTheme.of(
                                                    //       context)
                                                    //       .bodyMedium
                                                    //       .override(
                                                    //     font:
                                                    //     GoogleFonts.baloo2(
                                                    //       fontWeight:
                                                    //       FontWeight.w800,
                                                    //       fontStyle:
                                                    //       FlutterFlowTheme.of(
                                                    //           context)
                                                    //           .bodyMedium
                                                    //           .fontStyle,
                                                    //     ),
                                                    //     color:
                                                    //     FlutterFlowTheme.of(
                                                    //         context)
                                                    //         .oposite,
                                                    //     fontSize: 16.0,
                                                    //     letterSpacing: 0.0,
                                                    //     fontWeight:
                                                    //     FontWeight.w800,
                                                    //     fontStyle:
                                                    //     FlutterFlowTheme.of(
                                                    //         context)
                                                    //         .bodyMedium
                                                    //         .fontStyle,
                                                    //   ),
                                                    // ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height:
                                      MediaQuery.sizeOf(context).height * 0.5,
                                      child: ListView.builder(
                                        padding: EdgeInsets.zero,
                                        shrinkWrap: true,
                                        itemCount: players.length,
                                        itemBuilder: (context, index) {
                                          final player = players[index];
                                          return Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color: Theme.of(context).brightness == Brightness.dark
                                                  ? (index.isEven ? const Color(0xFF3D3D3D) : const Color(0xFF131313))
                                                  : (index.isEven ? const Color(0xFFEAEAEA) : const Color(0xFFFFFFFF)),
                                              boxShadow: const [
                                                BoxShadow(
                                                  blurRadius: 1.0,
                                                  color: Color(0x33463838),
                                                  offset: Offset(1.0, 2.0),
                                                  spreadRadius: 1.0,
                                                )
                                              ],
                                            ),
                                            child: Padding(
                                              padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 7.0, 10.0, 7.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                MainAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisSize: MainAxisSize.max,
                                                    children: [
                                                      const FaIcon(
                                                        FontAwesomeIcons.solidStar,
                                                        color: Color(0xFFFFBC06),
                                                        size: 18.0,
                                                      ),
                                                      Padding(
                                                        padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(7.0, 0.0,
                                                            0.0, 0.0),
                                                        child: Text(
                                                          getJsonField(
                                                              player, r'$.rank')
                                                              .toString(),
                                                          style:
                                                          FlutterFlowTheme.of(
                                                              context)
                                                              .titleMedium
                                                              .override(
                                                            font: GoogleFonts
                                                                .poppins(
                                                              fontWeight: FlutterFlowTheme.of(
                                                                  context)
                                                                  .titleMedium
                                                                  .fontWeight,
                                                              fontStyle: FlutterFlowTheme.of(
                                                                  context)
                                                                  .titleMedium
                                                                  .fontStyle,
                                                            ),
                                                            letterSpacing:
                                                            0.0,
                                                            fontWeight: FlutterFlowTheme.of(
                                                                context)
                                                                .titleMedium
                                                                .fontWeight,
                                                            fontStyle: FlutterFlowTheme.of(
                                                                context)
                                                                .titleMedium
                                                                .fontStyle,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Expanded(
                                                    child: Padding(
                                                      padding: const EdgeInsetsDirectional
                                                          .fromSTEB(
                                                          40.0, 0.0, 0.0, 0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                        MainAxisSize.max,
                                                        children: [
                                                          Container(
                                                            width: 30.0,
                                                            height: 30.0,
                                                            clipBehavior:
                                                            Clip.antiAlias,
                                                            decoration:
                                                            const BoxDecoration(
                                                              shape:
                                                              BoxShape.circle,
                                                            ),
                                                            child: Image.network(
                                                              getJsonField(player,
                                                                  r'$.image'),
                                                              fit: BoxFit.cover,
                                                              errorBuilder: (context,
                                                                  error,
                                                                  stackTrace) =>
                                                                  Image.asset(
                                                                      'assets/images/error_image.webp',
                                                                      fit: BoxFit
                                                                          .cover),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                7.0,
                                                                0.0,
                                                                0.0,
                                                                0.0),
                                                            child: Text(
                                                              getJsonField(player,
                                                                  r'$.player_name')
                                                                  .toString(),
                                                              style: FlutterFlowTheme
                                                                  .of(context)
                                                                  .titleMedium
                                                                  .override(
                                                                font: GoogleFonts
                                                                    .poppins(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                      context)
                                                                      .titleMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                      context)
                                                                      .titleMedium
                                                                      .fontStyle,
                                                                ),
                                                                fontSize: 12.0,
                                                                letterSpacing:
                                                                0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                    context)
                                                                    .titleMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                    context)
                                                                    .titleMedium
                                                                    .fontStyle,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),

                                                 ///points commented as per client request

                                                  // Padding(
                                                  //   padding: const EdgeInsetsDirectional
                                                  //       .fromSTEB(
                                                  //       7.0, 0.0, 0.0, 0.0),
                                                  //   child: Text(
                                                  //     (getJsonField(player,
                                                  //         r'$.total_value')
                                                  //     as num?)
                                                  //         ?.toStringAsFixed(
                                                  //         2) ??
                                                  //         '0.00',
                                                  //     style: FlutterFlowTheme.of(
                                                  //         context)
                                                  //         .titleMedium
                                                  //         .override(
                                                  //       font:
                                                  //       GoogleFonts.poppins(
                                                  //         fontWeight:
                                                  //         FlutterFlowTheme.of(
                                                  //             context)
                                                  //             .titleMedium
                                                  //             .fontWeight,
                                                  //         fontStyle:
                                                  //         FlutterFlowTheme.of(
                                                  //             context)
                                                  //             .titleMedium
                                                  //             .fontStyle,
                                                  //       ),
                                                  //       fontSize: 12.0,
                                                  //       letterSpacing: 0.0,
                                                  //       fontWeight:
                                                  //       FlutterFlowTheme.of(
                                                  //           context)
                                                  //           .titleMedium
                                                  //           .fontWeight,
                                                  //       fontStyle:
                                                  //       FlutterFlowTheme.of(
                                                  //           context)
                                                  //           .titleMedium
                                                  //           .fontStyle,
                                                  //     ),
                                                  //   ),
                                                  // ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          if (isLoading)
            Container(
              color: Colors.black.withOpacity(0.4),
              width: double.infinity,
              height: double.infinity,
              child: const Center(
                child: SpinKitCubeGrid(
                  color: Color(0xFFEB6027),
                  size: 40.0,
                ),
              ),
            ),
        ],
      ),
    );
  }
}



