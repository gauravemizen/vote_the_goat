// import '/backend/api_requests/api_calls.dart';
// import '/flutter_flow/flutter_flow_theme.dart';
// import '/flutter_flow/flutter_flow_util.dart';
// import '/flutter_flow/flutter_flow_widgets.dart';
// import 'dart:ui';
// import '/custom_code/widgets/index.dart' as custom_widgets;
// import '/index.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/scheduler.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:provider/provider.dart';
// import 'your_comparisons_model.dart';
// export 'your_comparisons_model.dart';
//
// class YourComparisonsWidget extends StatefulWidget {
//   const YourComparisonsWidget({super.key});
//
//   static String routeName = 'YourComparisons';
//   static String routePath = '/yourComparisons';
//
//   @override
//   State<YourComparisonsWidget> createState() => _YourComparisonsWidgetState();
// }
//
// class _YourComparisonsWidgetState extends State<YourComparisonsWidget>
//     with RouteAware {
//   late YourComparisonsModel _model;
//
//   final scaffoldKey = GlobalKey<ScaffoldState>();
//
//   @override
//   void initState() {
//     super.initState();
//     _model = createModel(context, () => YourComparisonsModel());
//
//     // On page load action.
//     SchedulerBinding.instance.addPostFrameCallback((_) async {
//       _model.isLoading = true;
//       safeSetState(() {});
//       _model.apiResultpzb = await DashboardGroup.comparisonListCall.call(
//         authToken: FFAppState().authToken,
//       );
//
//       if ((_model.apiResultpzb?.succeeded ?? true)) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text(
//               getJsonField(
//                 (_model.apiResultpzb?.jsonBody ?? ''),
//                 r'''$.message''',
//               ).toString(),
//               style: const TextStyle(
//                 color: Colors.white,
//               ),
//             ),
//             duration: const Duration(milliseconds: 2000),
//             backgroundColor: Colors.black,
//           ),
//         );
//         safeSetState(() {});
//         _model.isLoading = false;
//         safeSetState(() {});
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text(
//               getJsonField(
//                 (_model.apiResultpzb?.jsonBody ?? ''),
//                 r'''$.message''',
//               ).toString(),
//               style: const TextStyle(
//                 color: Colors.white,
//               ),
//             ),
//             duration: const Duration(milliseconds: 2000),
//             backgroundColor: Colors.black,
//           ),
//         );
//         _model.isLoading = false;
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
//   void didUpdateWidget(YourComparisonsWidget oldWidget) {
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
//     return GestureDetector(
//       onTap: () {
//         FocusScope.of(context).unfocus();
//         FocusManager.instance.primaryFocus?.unfocus();
//       },
//       child: Scaffold(
//         key: scaffoldKey,
//         backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
//         body: Stack(
//           children: [
//             ClipRRect(
//               borderRadius: BorderRadius.circular(8.0),
//               child: Image.asset(
//                 Theme.of(context).brightness == Brightness.dark
//                     ? 'assets/images/commonBg.png'
//                     : 'assets/images/plain_whiteBg.png',
//                 width: double.infinity,
//                 height: double.infinity,
//                 fit: BoxFit.fill,
//               ),
//             ),
//             Align(
//               alignment: const AlignmentDirectional(0.0, 0.0),
//               child: Padding(
//                 padding: const EdgeInsetsDirectional.fromSTEB(16.0, 40.0, 16.0, 0.0),
//                 child: Column(
//                   mainAxisSize: MainAxisSize.max,
//                   children: [
//                     Row(
//                       mainAxisSize: MainAxisSize.max,
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         InkWell(
//                           splashColor: Colors.transparent,
//                           focusColor: Colors.transparent,
//                           hoverColor: Colors.transparent,
//                           highlightColor: Colors.transparent,
//                           onTap: () async {
//                             context.safePop();
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
//                               Icons.arrow_back_rounded,
//                               color: FlutterFlowTheme.of(context).tertiary,
//                               size: 24.0,
//                             ),
//                           ),
//                         ),
//                         SingleChildScrollView(
//                           child: Column(
//                             mainAxisSize: MainAxisSize.max,
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Text(
//                                 'your',
//                                 style: FlutterFlowTheme.of(context)
//                                     .customTextStyle1
//                                     .override(
//                                       fontFamily: 'good times',
//                                       color:
//                                           FlutterFlowTheme.of(context).tertiary,
//                                       fontSize: 24.0,
//                                       letterSpacing: 0.0,
//                                       fontWeight: FontWeight.normal,
//                                     ),
//                               ),
//                               Text(
//                                 'COMPARISONS',
//                                 style: FlutterFlowTheme.of(context)
//                                     .customTextStyle1
//                                     .override(
//                                       fontFamily: 'good times',
//                                       color: const Color(0xFFEB6027),
//                                       fontSize: 24.0,
//                                       letterSpacing: 0.0,
//                                       fontWeight: FontWeight.normal,
//                                     ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsetsDirectional.fromSTEB(
//                               8.0, 0.0, 0.0, 0.0),
//                           child: InkWell(
//                             splashColor: Colors.transparent,
//                             focusColor: Colors.transparent,
//                             hoverColor: Colors.transparent,
//                             highlightColor: Colors.transparent,
//                             onTap: () async {
//                               context.pushNamed(AboutScreenWidget.routeName);
//                             },
//                             child: Container(
//                               width: 40.0,
//                               height: 40.0,
//                               decoration: BoxDecoration(
//                                 color: FlutterFlowTheme.of(context).backBtnClr,
//                                 boxShadow: [
//                                   const BoxShadow(
//                                     blurRadius: 4.0,
//                                     color: Color(0x335D4E4E),
//                                     offset: Offset(
//                                       0.0,
//                                       2.0,
//                                     ),
//                                   )
//                                 ],
//                                 borderRadius: BorderRadius.circular(12.0),
//                                 border: Border.all(
//                                   color: (Theme.of(context).brightness ==
//                                               Brightness.dark) ==
//                                           true
//                                       ? Colors.black
//                                       : const Color(0xD5999999),
//                                 ),
//                               ),
//                               child: Icon(
//                                 FFIcons.kessentialUi1,
//                                 color: FlutterFlowTheme.of(context).tertiary,
//                                 size: 24.0,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     Padding(
//                       padding:
//                           const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
//                       child: Row(
//                         mainAxisSize: MainAxisSize.max,
//                         children: [
//                           Expanded(
//                             child: Container(
//                               width: double.infinity,
//                               decoration: BoxDecoration(
//                                 color: (Theme.of(context).brightness ==
//                                             Brightness.dark) ==
//                                         true
//                                     ? Colors.white
//                                     : Colors.black,
//                               ),
//                               child: Padding(
//                                 padding: const EdgeInsetsDirectional.fromSTEB(
//                                     10.0, 7.0, 10.0, 7.0),
//                                 child: Row(
//                                   mainAxisSize: MainAxisSize.max,
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceEvenly,
//                                   children: [
//                                     Text(
//                                       'Rank',
//                                       style: FlutterFlowTheme.of(context)
//                                           .bodyMedium
//                                           .override(
//                                             font: GoogleFonts.baloo2(
//                                               fontWeight: FontWeight.w800,
//                                               fontStyle:
//                                                   FlutterFlowTheme.of(context)
//                                                       .bodyMedium
//                                                       .fontStyle,
//                                             ),
//                                             color: FlutterFlowTheme.of(context)
//                                                 .oposite,
//                                             fontSize: 16.0,
//                                             letterSpacing: 0.0,
//                                             fontWeight: FontWeight.w800,
//                                             fontStyle:
//                                                 FlutterFlowTheme.of(context)
//                                                     .bodyMedium
//                                                     .fontStyle,
//                                           ),
//                                     ),
//                                     Expanded(
//                                       child: Padding(
//                                         padding: const EdgeInsetsDirectional.fromSTEB(
//                                             40.0, 0.0, 0.0, 0.0),
//                                         child: Row(
//                                           mainAxisSize: MainAxisSize.min,
//                                           children: [
//                                             Text(
//                                               'Player',
//                                               style: FlutterFlowTheme.of(
//                                                       context)
//                                                   .bodyMedium
//                                                   .override(
//                                                     font: GoogleFonts.baloo2(
//                                                       fontWeight:
//                                                           FontWeight.w800,
//                                                       fontStyle:
//                                                           FlutterFlowTheme.of(
//                                                                   context)
//                                                               .bodyMedium
//                                                               .fontStyle,
//                                                     ),
//                                                     color: FlutterFlowTheme.of(
//                                                             context)
//                                                         .oposite,
//                                                     fontSize: 16.0,
//                                                     letterSpacing: 0.0,
//                                                     fontWeight: FontWeight.w800,
//                                                     fontStyle:
//                                                         FlutterFlowTheme.of(
//                                                                 context)
//                                                             .bodyMedium
//                                                             .fontStyle,
//                                                   ),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     ),
//                                     Expanded(
//                                       child: Row(
//                                         mainAxisSize: MainAxisSize.max,
//                                         children: [
//                                           Expanded(
//                                             child: Text(
//                                               'Win',
//                                               style: FlutterFlowTheme.of(
//                                                       context)
//                                                   .bodyMedium
//                                                   .override(
//                                                     font: GoogleFonts.baloo2(
//                                                       fontWeight:
//                                                           FontWeight.w800,
//                                                       fontStyle:
//                                                           FlutterFlowTheme.of(
//                                                                   context)
//                                                               .bodyMedium
//                                                               .fontStyle,
//                                                     ),
//                                                     color: FlutterFlowTheme.of(
//                                                             context)
//                                                         .oposite,
//                                                     fontSize: 16.0,
//                                                     letterSpacing: 0.0,
//                                                     fontWeight: FontWeight.w800,
//                                                     fontStyle:
//                                                         FlutterFlowTheme.of(
//                                                                 context)
//                                                             .bodyMedium
//                                                             .fontStyle,
//                                                   ),
//                                             ),
//                                           ),
//                                           Expanded(
//                                             child: Text(
//                                               'Lost',
//                                               style: FlutterFlowTheme.of(
//                                                       context)
//                                                   .bodyMedium
//                                                   .override(
//                                                     font: GoogleFonts.baloo2(
//                                                       fontWeight:
//                                                           FontWeight.w800,
//                                                       fontStyle:
//                                                           FlutterFlowTheme.of(
//                                                                   context)
//                                                               .bodyMedium
//                                                               .fontStyle,
//                                                     ),
//                                                     color: FlutterFlowTheme.of(
//                                                             context)
//                                                         .oposite,
//                                                     fontSize: 16.0,
//                                                     letterSpacing: 0.0,
//                                                     fontWeight: FontWeight.w800,
//                                                     fontStyle:
//                                                         FlutterFlowTheme.of(
//                                                                 context)
//                                                             .bodyMedium
//                                                             .fontStyle,
//                                                   ),
//                                             ),
//                                           ),
//                                           Expanded(
//                                             child: Text(
//                                               'W %',
//                                               style: FlutterFlowTheme.of(
//                                                       context)
//                                                   .bodyMedium
//                                                   .override(
//                                                     font: GoogleFonts.baloo2(
//                                                       fontWeight:
//                                                           FontWeight.w800,
//                                                       fontStyle:
//                                                           FlutterFlowTheme.of(
//                                                                   context)
//                                                               .bodyMedium
//                                                               .fontStyle,
//                                                     ),
//                                                     color: FlutterFlowTheme.of(
//                                                             context)
//                                                         .oposite,
//                                                     fontSize: 16.0,
//                                                     letterSpacing: 0.0,
//                                                     fontWeight: FontWeight.w800,
//                                                     fontStyle:
//                                                         FlutterFlowTheme.of(
//                                                                 context)
//                                                             .bodyMedium
//                                                             .fontStyle,
//                                                   ),
//                                             ),
//                                           ),
//                                         ].divide(const SizedBox(width: 10.0)),
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
//                     Container(
//                       width: double.infinity,
//                       height: MediaQuery.sizeOf(context).height * 0.7,
//                       decoration: const BoxDecoration(),
//                       child: Visibility(
//                         visible: !_model.isLoading,
//                         child: Builder(
//                           builder: (context) {
//                             final coparisonList = getJsonField(
//                               (_model.apiResultpzb?.jsonBody ?? ''),
//                               r'''$.data''',
//                             ).toList();
//                             _model.debugGeneratorVariables[
//                                     'coparisonList${coparisonList.length > 100 ? ' (first 100)' : ''}'] =
//                                 debugSerializeParam(
//                               coparisonList.take(100),
//                               ParamType.JSON,
//                               isList: true,
//                               link:
//                                   'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=YourComparisons',
//                               name: 'dynamic',
//                               nullable: false,
//                             );
//                             debugLogWidgetClass(_model);
//
//                             return ListView.builder(
//                               padding: EdgeInsets.zero,
//                               shrinkWrap: true,
//                               scrollDirection: Axis.vertical,
//                               itemCount: coparisonList.length,
//                               itemBuilder: (context, coparisonListIndex) {
//                                 final coparisonListItem =
//                                     coparisonList[coparisonListIndex];
//                                 return Container(
//                                   width: double.infinity,
//                                   decoration: BoxDecoration(
//                                     color: (Theme.of(context).brightness ==
//                                                 Brightness.dark) ==
//                                             true
//                                         ? const Color(0xB2000000)
//                                         : Colors.white,
//                                     boxShadow: [
//                                       const BoxShadow(
//                                         blurRadius: 1.0,
//                                         color: Color(0x33463838),
//                                         offset: Offset(
//                                           1.0,
//                                           2.0,
//                                         ),
//                                         spreadRadius: 1.0,
//                                       )
//                                     ],
//                                   ),
//                                   child: Padding(
//                                     padding: const EdgeInsetsDirectional.fromSTEB(
//                                         10.0, 7.0, 10.0, 7.0),
//                                     child: Row(
//                                       mainAxisSize: MainAxisSize.max,
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.start,
//                                       children: [
//                                         Row(
//                                           mainAxisSize: MainAxisSize.max,
//                                           children: [
//                                             const FaIcon(
//                                               FontAwesomeIcons.solidStar,
//                                               color: Color(0xFFFFBC06),
//                                               size: 18.0,
//                                             ),
//                                             Padding(
//                                               padding: const EdgeInsetsDirectional
//                                                   .fromSTEB(7.0, 0.0, 0.0, 0.0),
//                                               child: Text(
//                                                 getJsonField(
//                                                   coparisonListItem,
//                                                   r'''$.rank''',
//                                                 ).toString(),
//                                                 style: FlutterFlowTheme.of(
//                                                         context)
//                                                     .titleMedium
//                                                     .override(
//                                                       font: GoogleFonts.poppins(
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
//                                                       letterSpacing: 0.0,
//                                                       fontWeight:
//                                                           FlutterFlowTheme.of(
//                                                                   context)
//                                                               .titleMedium
//                                                               .fontWeight,
//                                                       fontStyle:
//                                                           FlutterFlowTheme.of(
//                                                                   context)
//                                                               .titleMedium
//                                                               .fontStyle,
//                                                     ),
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                         Expanded(
//                                           child: Padding(
//                                             padding:
//                                                 const EdgeInsetsDirectional.fromSTEB(
//                                                     20.0, 0.0, 0.0, 0.0),
//                                             child: Row(
//                                               mainAxisSize: MainAxisSize.max,
//                                               children: [
//                                                 Container(
//                                                   width: 30.0,
//                                                   height: 30.0,
//                                                   clipBehavior: Clip.antiAlias,
//                                                   decoration: const BoxDecoration(
//                                                     shape: BoxShape.circle,
//                                                   ),
//                                                   child: Image.network(
//                                                       getJsonField(
//                                                         coparisonListItem,
//                                                         r'''$.player_image''',
//                                                       ).toString(),
//                                                     fit: BoxFit.cover,
//                                                     errorBuilder: (context,
//                                                             error,
//                                                             stackTrace) =>
//                                                         Image.asset(
//                                                       'assets/images/error_image.webp',
//                                                       fit: BoxFit.cover,
//                                                     ),
//                                                   ),
//                                                 ),
//                                                 Expanded(
//                                                   child: Padding(
//                                                     padding:
//                                                         const EdgeInsetsDirectional
//                                                             .fromSTEB(7.0, 0.0,
//                                                                 0.0, 0.0),
//                                                     child: Text(
//                                                       getJsonField(
//                                                         coparisonListItem,
//                                                         r'''$.player_name''',
//                                                       ).toString(),
//                                                       maxLines: 1,
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
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                           ),
//                                         ),
//                                         Expanded(
//                                           child: Padding(
//                                             padding:
//                                                 const EdgeInsetsDirectional.fromSTEB(
//                                                     20.0, 0.0, 0.0, 0.0),
//                                             child: Row(
//                                               mainAxisSize: MainAxisSize.max,
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment.spaceEvenly,
//                                               children: [
//                                                 Expanded(
//                                                   child: Text(
//                                                     getJsonField(
//                                                       coparisonListItem,
//                                                       r'''$.win_count''',
//                                                     ).toString(),
//                                                     style: FlutterFlowTheme.of(
//                                                             context)
//                                                         .titleMedium
//                                                         .override(
//                                                           font: GoogleFonts
//                                                               .poppins(
//                                                             fontWeight:
//                                                                 FlutterFlowTheme.of(
//                                                                         context)
//                                                                     .titleMedium
//                                                                     .fontWeight,
//                                                             fontStyle:
//                                                                 FlutterFlowTheme.of(
//                                                                         context)
//                                                                     .titleMedium
//                                                                     .fontStyle,
//                                                           ),
//                                                           fontSize: 12.0,
//                                                           letterSpacing: 0.0,
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
//                                                   ),
//                                                 ),
//                                                 Expanded(
//                                                   child: Text(
//                                                     getJsonField(
//                                                       coparisonListItem,
//                                                       r'''$.loss_count''',
//                                                     ).toString(),
//                                                     style: FlutterFlowTheme.of(
//                                                             context)
//                                                         .titleMedium
//                                                         .override(
//                                                           font: GoogleFonts
//                                                               .poppins(
//                                                             fontWeight:
//                                                                 FlutterFlowTheme.of(
//                                                                         context)
//                                                                     .titleMedium
//                                                                     .fontWeight,
//                                                             fontStyle:
//                                                                 FlutterFlowTheme.of(
//                                                                         context)
//                                                                     .titleMedium
//                                                                     .fontStyle,
//                                                           ),
//                                                           fontSize: 12.0,
//                                                           letterSpacing: 0.0,
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
//                                                   ),
//                                                 ),
//                                                 Expanded(
//                                                   child: Text(
//                                                     getJsonField(
//                                                       coparisonListItem,
//                                                       r'''$.win_percentage''',
//                                                     ).toString(),
//                                                     style: FlutterFlowTheme.of(
//                                                             context)
//                                                         .titleMedium
//                                                         .override(
//                                                           font: GoogleFonts
//                                                               .poppins(
//                                                             fontWeight:
//                                                                 FlutterFlowTheme.of(
//                                                                         context)
//                                                                     .titleMedium
//                                                                     .fontWeight,
//                                                             fontStyle:
//                                                                 FlutterFlowTheme.of(
//                                                                         context)
//                                                                     .titleMedium
//                                                                     .fontStyle,
//                                                           ),
//                                                           fontSize: 12.0,
//                                                           letterSpacing: 0.0,
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
//                                                   ),
//                                                 ),
//                                               ].divide(const SizedBox(width: 10.0)),
//                                             ),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 );
//                               },
//                             );
//                           },
//                         ),
//                       ),
//                     ),
//                     Container(
//                       decoration: const BoxDecoration(),
//                       child: Padding(
//                         padding:
//                             const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
//                         child: Container(
//                           width: double.infinity,
//                           height: 47.0,
//                           decoration: BoxDecoration(
//                             gradient: LinearGradient(
//                               colors: [
//                                 FlutterFlowTheme.of(context).peach,
//                                 const Color(0xFFE09B6E)
//                               ],
//                               stops: [0.0, 1.0],
//                               begin: const AlignmentDirectional(0.0, -1.0),
//                               end: const AlignmentDirectional(0, 1.0),
//                             ),
//                             borderRadius: BorderRadius.circular(12.0),
//                           ),
//                           child: Padding(
//                             padding: const EdgeInsetsDirectional.fromSTEB(
//                                 0.0, 0.0, 0.0, 4.0),
//                             child: FFButtonWidget(
//                               onPressed: () async {
//                                 _model.apiResulthzz =
//                                     await DashboardGroup.applyrankingCall.call(
//                                   authToken: FFAppState().authToken,
//                                 );
//
//                                 if ((_model.apiResulthzz?.succeeded ?? true)) {
//                                   ScaffoldMessenger.of(context).showSnackBar(
//                                     SnackBar(
//                                       content: Text(
//                                         getJsonField(
//                                           (_model.apiResulthzz?.jsonBody ?? ''),
//                                           r'''$.message''',
//                                         ).toString(),
//                                         style: const TextStyle(
//                                           color: Colors.white,
//                                         ),
//                                       ),
//                                       duration: const Duration(milliseconds: 1650),
//                                       backgroundColor: Colors.black,
//                                     ),
//                                   );
//                                 } else {
//                                   ScaffoldMessenger.of(context).showSnackBar(
//                                     SnackBar(
//                                       content: Text(
//                                         getJsonField(
//                                           (_model.apiResulthzz?.jsonBody ?? ''),
//                                           r'''$.message''',
//                                         ).toString(),
//                                         style: const TextStyle(
//                                           color: Colors.white,
//                                         ),
//                                       ),
//                                       duration: const Duration(milliseconds: 1650),
//                                       backgroundColor: Colors.black,
//                                     ),
//                                   );
//                                 }
//
//                                 safeSetState(() {});
//                               },
//                               text: 'Apply this ranking to Your Ranking',
//                               options: FFButtonOptions(
//                                 width: double.infinity,
//                                 height: 47.0,
//                                 padding: const EdgeInsetsDirectional.fromSTEB(
//                                     16.0, 0.0, 16.0, 0.0),
//                                 iconPadding: const EdgeInsetsDirectional.fromSTEB(
//                                     0.0, 0.0, 0.0, 0.0),
//                                 color: const Color(0x00CD4A20),
//                                 textStyle: FlutterFlowTheme.of(context)
//                                     .titleLarge
//                                     .override(
//                                       font: GoogleFonts.poppins(
//                                         fontWeight: FlutterFlowTheme.of(context)
//                                             .titleLarge
//                                             .fontWeight,
//                                         fontStyle: FlutterFlowTheme.of(context)
//                                             .titleLarge
//                                             .fontStyle,
//                                       ),
//                                       color: Colors.white,
//                                       letterSpacing: 0.0,
//                                       fontWeight: FlutterFlowTheme.of(context)
//                                           .titleLarge
//                                           .fontWeight,
//                                       fontStyle: FlutterFlowTheme.of(context)
//                                           .titleLarge
//                                           .fontStyle,
//                                     ),
//                                 elevation: 0.0,
//                                 borderRadius: BorderRadius.circular(8.0),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             if (_model.isLoading)
//               Align(
//                 alignment: const AlignmentDirectional(0.0, 0.0),
//                 child: Container(
//                   width: 40.0,
//                   height: 40.0,
//                   child: const custom_widgets.CubeGridLoader(
//                     width: 40.0,
//                     height: 40.0,
//                     size: 40.0,
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
library;

import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'your_comparisons_model.dart';
export 'your_comparisons_model.dart';

class YourComparisonsWidget extends StatefulWidget {
  const YourComparisonsWidget({super.key});

  static String routeName = 'YourComparisons';
  static String routePath = '/yourComparisons';

  @override
  State<YourComparisonsWidget> createState() => _YourComparisonsWidgetState();
}

class _YourComparisonsWidgetState extends State<YourComparisonsWidget>
    with RouteAware {
  late YourComparisonsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => YourComparisonsModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.isLoading = true;
      safeSetState(() {});
      _model.apiResultpzb = await DashboardGroup.comparisonListCall.call(
        authToken: FFAppState().authToken,
      );

      if ((_model.apiResultpzb?.succeeded ?? true)) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              getJsonField(
                (_model.apiResultpzb?.jsonBody ?? ''),
                r'''$.message''',
              ).toString(),
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
            duration: const Duration(milliseconds: 2000),
            backgroundColor: Colors.black,
          ),
        );
        safeSetState(() {});
        _model.isLoading = false;
        safeSetState(() {});
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              getJsonField(
                (_model.apiResultpzb?.jsonBody ?? ''),
                r'''$.message''',
              ).toString(),
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
            duration: const Duration(milliseconds: 2000),
            backgroundColor: Colors.black,
          ),
        );
        _model.isLoading = false;
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
  void didUpdateWidget(YourComparisonsWidget oldWidget) {
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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                Theme.of(context).brightness == Brightness.dark
                    ? 'assets/images/commonBg.png'
                    : 'assets/images/plain_whiteBg.png',
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.fill,
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(0.0, 0.0),
              child: Padding(
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
                                'your',
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
                                'COMPARISONS',
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
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              8.0, 0.0, 0.0, 0.0),
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
                    // Updated header with proper alignment
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: (Theme.of(context).brightness == Brightness.dark) == true
                              ? Colors.white
                              : Colors.black,
                        ),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(10.0, 7.0, 10.0, 7.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              // Rank column - fixed width to match data
                              SizedBox(
                                width: 60.0,
                                child: Text(
                                  'Rank',
                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.baloo2(
                                      fontWeight: FontWeight.w800,
                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context).oposite,
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w800,
                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                  ),
                                ),
                              ),
                              // Player column - match the expanded structure
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    'Player',
                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                      font: GoogleFonts.baloo2(
                                        fontWeight: FontWeight.w800,
                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                      ),
                                      color: FlutterFlowTheme.of(context).oposite,
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w800,
                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                    ),
                                  ),
                                ),
                              ),
                              // Stats columns - match the expanded structure
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'Win',
                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                            font: GoogleFonts.baloo2(
                                              fontWeight: FontWeight.w800,
                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                            ),
                                            color: FlutterFlowTheme.of(context).oposite,
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w800,
                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          'Lost',
                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                            font: GoogleFonts.baloo2(
                                              fontWeight: FontWeight.w800,
                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                            ),
                                            color: FlutterFlowTheme.of(context).oposite,
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w800,
                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          'W %',
                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                            font: GoogleFonts.baloo2(
                                              fontWeight: FontWeight.w800,
                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                            ),
                                            color: FlutterFlowTheme.of(context).oposite,
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w800,
                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                          ),
                                        ),
                                      ),
                                    ].divide(const SizedBox(width: 10.0)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    // Updated ListView with aligned data rows
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        // height: MediaQuery.sizeOf(context).height * 0.7,
                        decoration: const BoxDecoration(),
                        child: Visibility(
                          visible: !_model.isLoading,
                          child: Builder(
                            builder: (context) {
                              final coparisonList = getJsonField(
                                (_model.apiResultpzb?.jsonBody ?? ''),
                                r'''$.data''',
                              ).toList();
                              _model.debugGeneratorVariables[
                              'coparisonList${coparisonList.length > 100 ? ' (first 100)' : ''}'] =
                                  debugSerializeParam(
                                    coparisonList.take(100),
                                    ParamType.JSON,
                                    isList: true,
                                    link:
                                    'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=YourComparisons',
                                    name: 'dynamic',
                                    nullable: false,
                                  );
                              debugLogWidgetClass(_model);

                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: coparisonList.length,
                                itemBuilder: (context, coparisonListIndex) {
                                  final coparisonListItem =
                                  coparisonList[coparisonListIndex];
                                  return Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: (Theme.of(context).brightness ==
                                          Brightness.dark) ==
                                          true
                                          ? const Color(0xB2000000)
                                          : Colors.white,
                                      boxShadow: const [
                                        BoxShadow(
                                          blurRadius: 1.0,
                                          color: Color(0x33463838),
                                          offset: Offset(
                                            1.0,
                                            2.0,
                                          ),
                                          spreadRadius: 1.0,
                                        )
                                      ],
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(10.0, 7.0, 10.0, 7.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          // Rank column - fixed width to match header
                                          SizedBox(
                                            width: 60.0,
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                const FaIcon(
                                                  FontAwesomeIcons.solidStar,
                                                  color: Color(0xFFFFBC06),
                                                  size: 18.0,
                                                ),
                                                Expanded(
                                                  child: Padding(
                                                    padding: const EdgeInsetsDirectional.fromSTEB(7.0, 0.0, 0.0, 0.0),
                                                    child: Text(
                                                      getJsonField(coparisonListItem, r'''$.rank''').toString(),
                                                      style: FlutterFlowTheme.of(context).titleMedium.override(
                                                        font: GoogleFonts.poppins(
                                                          fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                          fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                        ),
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                        fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          // Player column - match header structure
                                          Expanded(
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Container(
                                                    width: 30.0,
                                                    height: 30.0,
                                                    clipBehavior: Clip.antiAlias,
                                                    decoration: const BoxDecoration(shape: BoxShape.circle),
                                                    child: Image.network(
                                                      getJsonField(coparisonListItem, r'''$.player_image''').toString(),
                                                      fit: BoxFit.cover,
                                                      errorBuilder: (context, error, stackTrace) => Image.asset(
                                                        'assets/images/error_image.webp',
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Padding(
                                                      padding: const EdgeInsetsDirectional.fromSTEB(7.0, 0.0, 0.0, 0.0),
                                                      child: Text(
                                                        getJsonField(coparisonListItem, r'''$.player_name''').toString(),
                                                        maxLines: 1,
                                                        style: FlutterFlowTheme.of(context).titleMedium.override(
                                                          font: GoogleFonts.poppins(
                                                            fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                            fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                          ),
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                          fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          // Stats columns - match header structure exactly
                                          Expanded(
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      getJsonField(coparisonListItem, r'''$.win_count''').toString(),
                                                      style: FlutterFlowTheme.of(context).titleMedium.override(
                                                        font: GoogleFonts.poppins(
                                                          fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                          fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                        ),
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                        fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Text(
                                                      getJsonField(coparisonListItem, r'''$.loss_count''').toString(),
                                                      style: FlutterFlowTheme.of(context).titleMedium.override(
                                                        font: GoogleFonts.poppins(
                                                          fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                          fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                        ),
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                        fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Text(
                                                      getJsonField(coparisonListItem, r'''$.win_percentage''').toString(),
                                                      style: FlutterFlowTheme.of(context).titleMedium.override(
                                                        font: GoogleFonts.poppins(
                                                          fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                          fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                        ),
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                        fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                      ),
                                                    ),
                                                  ),
                                                ].divide(const SizedBox(width: 10.0)),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(),
                      child: Padding(
                        padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                        child: Container(
                          width: double.infinity,
                          height: 47.0,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                FlutterFlowTheme.of(context).peach,
                                const Color(0xFFE09B6E)
                              ],
                              stops: const [0.0, 1.0],
                              begin: const AlignmentDirectional(0.0, -1.0),
                              end: const AlignmentDirectional(0, 1.0),
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 4.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                _model.apiResulthzz =
                                await DashboardGroup.applyrankingCall.call(
                                  authToken: FFAppState().authToken,
                                );

                                if ((_model.apiResulthzz?.succeeded ?? true)) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        getJsonField(
                                          (_model.apiResulthzz?.jsonBody ?? ''),
                                          r'''$.message''',
                                        ).toString(),
                                        style: const TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                      duration: const Duration(milliseconds: 1650),
                                      backgroundColor: Colors.black,
                                    ),
                                  );
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        getJsonField(
                                          (_model.apiResulthzz?.jsonBody ?? ''),
                                          r'''$.message''',
                                        ).toString(),
                                        style: const TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                      duration: const Duration(milliseconds: 1650),
                                      backgroundColor: Colors.black,
                                    ),
                                  );
                                }

                                safeSetState(() {});
                              },
                              text: 'Apply this ranking to Your Ranking',
                              options: FFButtonOptions(
                                width: double.infinity,
                                height: 47.0,
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: const Color(0x00CD4A20),
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleLarge
                                    .override(
                                  font: GoogleFonts.poppins(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .fontStyle,
                                  ),
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .titleLarge
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleLarge
                                      .fontStyle,
                                ),
                                elevation: 0.0,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 40,)

                  ],
                ),
              ),
            ),
            if (_model.isLoading)
              const Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: SizedBox(
                  width: 40.0,
                  height: 40.0,
                  child: custom_widgets.CubeGridLoader(
                    width: 40.0,
                    height: 40.0,
                    size: 40.0,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}