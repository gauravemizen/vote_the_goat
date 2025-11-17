// import '/backend/api_requests/api_calls.dart';
// import '/components/gradient_button_custom/gradient_button_custom_widget.dart';
// import '/flutter_flow/flutter_flow_theme.dart';
// import '/flutter_flow/flutter_flow_timer.dart';
// import '/flutter_flow/flutter_flow_util.dart';
// import '/flutter_flow/flutter_flow_widgets.dart';
// import 'dart:ui';
// import '/custom_code/widgets/index.dart' as custom_widgets;
// import '/index.dart';
// import 'package:stop_watch_timer/stop_watch_timer.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/scheduler.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:percent_indicator/percent_indicator.dart';
// import 'package:provider/provider.dart';
// import 'contest_question_model.dart';
// export 'contest_question_model.dart';
//
// class ContestQuestionWidget extends StatefulWidget {
//   const ContestQuestionWidget({
//     super.key,
//     required this.contestId,
//   });
//
//   final int? contestId;
//
//   static String routeName = 'ContestQuestion';
//   static String routePath = '/contestQuestion';
//
//   @override
//   State<ContestQuestionWidget> createState() => _ContestQuestionWidgetState();
// }
//
// class _ContestQuestionWidgetState extends State<ContestQuestionWidget>
//     with RouteAware {
//   late ContestQuestionModel _model;
//
//   final scaffoldKey = GlobalKey<ScaffoldState>();
//
//   @override
//   void initState() {
//     super.initState();
//     _model = createModel(context, () => ContestQuestionModel());
//
//     // On page load action.
//     SchedulerBinding.instance.addPostFrameCallback((_) async {
//       _model.isLoading = true;
//       safeSetState(() {});
//       _model.apiResultglp = await DashboardGroup.contestQuestionCall.call(
//         contestId: widget!.contestId,
//         authToken: FFAppState().authToken,
//       );
//
//       if ((_model.apiResultglp?.succeeded ?? true)) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text(
//               getJsonField(
//                 (_model.apiResultglp?.jsonBody ?? ''),
//                 r'''$.message''',
//               ).toString(),
//               style: const TextStyle(
//                 color: Colors.white,
//               ),
//             ),
//             duration: const Duration(milliseconds: 1750),
//             backgroundColor: Colors.black,
//           ),
//         );
//         _model.timerController.onStartTimer();
//         _model.questionType = getJsonField(
//           DashboardGroup.contestQuestionCall
//               .questions(
//                 (_model.apiResultglp?.jsonBody ?? ''),
//               )!
//               .elementAtOrNull(_model.questionIndex!),
//           r'''$.type''',
//         );
//         _model.isLoading = false;
//         safeSetState(() {});
//         safeSetState(() {});
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text(
//               getJsonField(
//                 (_model.apiResultglp?.jsonBody ?? ''),
//                 r'''$.message''',
//               ).toString(),
//               style: const TextStyle(
//                 color: Colors.white,
//               ),
//             ),
//             duration: const Duration(milliseconds: 1750),
//             backgroundColor: Colors.black,
//           ),
//         );
//       }
//     });
//
//     _model.textController ??= TextEditingController()
//       ..addListener(() {
//         debugLogWidgetClass(_model);
//       });
//     _model.textFieldFocusNode ??= FocusNode();
//
//     WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
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
//   void didUpdateWidget(ContestQuestionWidget oldWidget) {
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
//         backgroundColor: FlutterFlowTheme.of(context).oposite,
//         body: Stack(
//           children: [
//             ClipRRect(
//               borderRadius: BorderRadius.circular(8.0),
//               child: Image.asset(
//                 Theme.of(context).brightness == Brightness.dark
//                     ? 'assets/images/forgotBg.png'
//                     : 'assets/images/plain_whiteBg.png',
//                 width: double.infinity,
//                 height: double.infinity,
//                 fit: BoxFit.cover,
//               ),
//             ),
//             if (!_model.isLoading)
//               Padding(
//                 padding: const EdgeInsetsDirectional.fromSTEB(16.0, 40.0, 16.0, 0.0),
//                 child: Column(
//                   mainAxisSize: MainAxisSize.max,
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     Row(
//                       mainAxisSize: MainAxisSize.max,
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Container(
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
//                           ),
//                           child: InkWell(
//                             splashColor: Colors.transparent,
//                             focusColor: Colors.transparent,
//                             hoverColor: Colors.transparent,
//                             highlightColor: Colors.transparent,
//                             onTap: () async {
//                               context.safePop();
//                             },
//                             child: Icon(
//                               Icons.arrow_back_rounded,
//                               color: FlutterFlowTheme.of(context).tertiary,
//                               size: 24.0,
//                             ),
//                           ),
//                         ),
//                         Row(
//                           mainAxisSize: MainAxisSize.max,
//                           children: [
//                             Text(
//                               'Con',
//                               style: FlutterFlowTheme.of(context)
//                                   .customTextStyle1
//                                   .override(
//                                     fontFamily: 'good times',
//                                     color:
//                                         FlutterFlowTheme.of(context).tertiary,
//                                     fontSize: 24.0,
//                                     letterSpacing: 0.0,
//                                     fontWeight: FontWeight.normal,
//                                   ),
//                             ),
//                             Text(
//                               't',
//                               style: FlutterFlowTheme.of(context)
//                                   .customTextStyle1
//                                   .override(
//                                     fontFamily: 'good times',
//                                     color: const Color(0xFFEB6027),
//                                     fontSize: 24.0,
//                                     letterSpacing: 0.0,
//                                     fontWeight: FontWeight.normal,
//                                   ),
//                             ),
//                             Text(
//                               'est',
//                               style: FlutterFlowTheme.of(context)
//                                   .customTextStyle1
//                                   .override(
//                                     fontFamily: 'good times',
//                                     color:
//                                         FlutterFlowTheme.of(context).tertiary,
//                                     fontSize: 24.0,
//                                     letterSpacing: 0.0,
//                                     fontWeight: FontWeight.normal,
//                                   ),
//                             ),
//                           ],
//                         ),
//                         Padding(
//                           padding: const EdgeInsetsDirectional.fromSTEB(
//                               8.0, 0.0, 0.0, 0.0),
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
//                             ),
//                             child: InkWell(
//                               splashColor: Colors.transparent,
//                               focusColor: Colors.transparent,
//                               hoverColor: Colors.transparent,
//                               highlightColor: Colors.transparent,
//                               onTap: () async {
//                                 context.pushNamed(AboutScreenWidget.routeName);
//                               },
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
//                           const EdgeInsetsDirectional.fromSTEB(0.0, 25.0, 0.0, 10.0),
//                       child: LinearPercentIndicator(
//                         percent: (_model.questionIndex != null) &&
//                                 (DashboardGroup.contestQuestionCall.questions(
//                                           (_model.apiResultglp?.jsonBody ?? ''),
//                                         ) !=
//                                         null &&
//                                     (DashboardGroup.contestQuestionCall
//                                             .questions(
//                                       (_model.apiResultglp?.jsonBody ?? ''),
//                                     ))!
//                                         .isNotEmpty)
//                             ? getJsonField(
//                                 DashboardGroup.contestQuestionCall
//                                     .questions(
//                                       (_model.apiResultglp?.jsonBody ?? ''),
//                                     )!
//                                     .elementAtOrNull(_model.questionIndex!),
//                                 r'''$.progress_value''',
//                               )
//                             : 0.0,
//                         lineHeight: 8.0,
//                         animation: true,
//                         animateFromLastPercent: true,
//                         progressColor: FlutterFlowTheme.of(context).lightPeach,
//                         backgroundColor:
//                             (Theme.of(context).brightness == Brightness.dark) ==
//                                     true
//                                 ? const Color(0xFF39393D)
//                                 : const Color(0xFFE5E5E5),
//                         barRadius: const Radius.circular(10.0),
//                         padding: EdgeInsets.zero,
//                       ),
//                     ),
//                     Row(
//                       mainAxisSize: MainAxisSize.max,
//                       children: [
//                         Row(
//                           mainAxisSize: MainAxisSize.max,
//                           children: [
//                             Text(
//                               'Questions',
//                               style: FlutterFlowTheme.of(context)
//                                   .bodySmall
//                                   .override(
//                                     font: GoogleFonts.poppins(
//                                       fontWeight: FlutterFlowTheme.of(context)
//                                           .bodySmall
//                                           .fontWeight,
//                                       fontStyle: FlutterFlowTheme.of(context)
//                                           .bodySmall
//                                           .fontStyle,
//                                     ),
//                                     color:
//                                         FlutterFlowTheme.of(context).tertiary,
//                                     fontSize: 10.0,
//                                     letterSpacing: 0.0,
//                                     fontWeight: FlutterFlowTheme.of(context)
//                                         .bodySmall
//                                         .fontWeight,
//                                     fontStyle: FlutterFlowTheme.of(context)
//                                         .bodySmall
//                                         .fontStyle,
//                                   ),
//                             ),
//                             Padding(
//                               padding: const EdgeInsetsDirectional.fromSTEB(
//                                   2.0, 0.0, 2.0, 0.0),
//                               child: Text(
//                                 _model.questionNo.toString(),
//                                 style: FlutterFlowTheme.of(context)
//                                     .bodySmall
//                                     .override(
//                                       font: GoogleFonts.poppins(
//                                         fontWeight: FlutterFlowTheme.of(context)
//                                             .bodySmall
//                                             .fontWeight,
//                                         fontStyle: FlutterFlowTheme.of(context)
//                                             .bodySmall
//                                             .fontStyle,
//                                       ),
//                                       color:
//                                           FlutterFlowTheme.of(context).tertiary,
//                                       fontSize: 10.0,
//                                       letterSpacing: 0.0,
//                                       fontWeight: FlutterFlowTheme.of(context)
//                                           .bodySmall
//                                           .fontWeight,
//                                       fontStyle: FlutterFlowTheme.of(context)
//                                           .bodySmall
//                                           .fontStyle,
//                                     ),
//                               ),
//                             ),
//                             Text(
//                               'of',
//                               style: FlutterFlowTheme.of(context)
//                                   .bodySmall
//                                   .override(
//                                     font: GoogleFonts.poppins(
//                                       fontWeight: FlutterFlowTheme.of(context)
//                                           .bodySmall
//                                           .fontWeight,
//                                       fontStyle: FlutterFlowTheme.of(context)
//                                           .bodySmall
//                                           .fontStyle,
//                                     ),
//                                     color:
//                                         FlutterFlowTheme.of(context).tertiary,
//                                     fontSize: 10.0,
//                                     letterSpacing: 0.0,
//                                     fontWeight: FlutterFlowTheme.of(context)
//                                         .bodySmall
//                                         .fontWeight,
//                                     fontStyle: FlutterFlowTheme.of(context)
//                                         .bodySmall
//                                         .fontStyle,
//                                   ),
//                             ),
//                             Padding(
//                               padding: const EdgeInsetsDirectional.fromSTEB(
//                                   2.0, 0.0, 2.0, 0.0),
//                               child: Text(
//                                 valueOrDefault<String>(
//                                   DashboardGroup.contestQuestionCall
//                                       .questions(
//                                         (_model.apiResultglp?.jsonBody ?? ''),
//                                       )
//                                       ?.length
//                                       ?.toString(),
//                                   '0',
//                                 ),
//                                 style: FlutterFlowTheme.of(context)
//                                     .bodySmall
//                                     .override(
//                                       font: GoogleFonts.poppins(
//                                         fontWeight: FlutterFlowTheme.of(context)
//                                             .bodySmall
//                                             .fontWeight,
//                                         fontStyle: FlutterFlowTheme.of(context)
//                                             .bodySmall
//                                             .fontStyle,
//                                       ),
//                                       color:
//                                           FlutterFlowTheme.of(context).tertiary,
//                                       fontSize: 10.0,
//                                       letterSpacing: 0.0,
//                                       fontWeight: FlutterFlowTheme.of(context)
//                                           .bodySmall
//                                           .fontWeight,
//                                       fontStyle: FlutterFlowTheme.of(context)
//                                           .bodySmall
//                                           .fontStyle,
//                                     ),
//                               ),
//                             ),
//                           ],
//                         ),
//                         Expanded(
//                           child: Align(
//                             alignment: const AlignmentDirectional(1.0, 0.0),
//                             child: Row(
//                               mainAxisSize: MainAxisSize.max,
//                               mainAxisAlignment: MainAxisAlignment.end,
//                               children: [
//                                 Opacity(
//                                   opacity: 0.9,
//                                   child: Padding(
//                                     padding: const EdgeInsetsDirectional.fromSTEB(
//                                         0.0, 0.0, 5.0, 0.0),
//                                     child: Icon(
//                                       Icons.timer_outlined,
//                                       color:
//                                           FlutterFlowTheme.of(context).tertiary,
//                                       size: 18.0,
//                                     ),
//                                   ),
//                                 ),
//                                 FlutterFlowTimer(
//                                   initialTime: _model.timerInitialTimeMs,
//                                   getDisplayTime: (value) =>
//                                       StopWatchTimer.getDisplayTime(
//                                     value,
//                                     hours: false,
//                                     milliSecond: false,
//                                   ),
//                                   controller: _model.timerController,
//                                   updateStateInterval:
//                                       const Duration(milliseconds: 1000),
//                                   onChanged:
//                                       (value, displayTime, shouldUpdate) {
//                                     _model.timerMilliseconds = value;
//                                     _model.timerValue = displayTime;
//                                     if (shouldUpdate) safeSetState(() {});
//                                   },
//                                   textAlign: TextAlign.start,
//                                   style: FlutterFlowTheme.of(context)
//                                       .titleMedium
//                                       .override(
//                                         font: GoogleFonts.poppins(
//                                           fontWeight:
//                                               FlutterFlowTheme.of(context)
//                                                   .titleMedium
//                                                   .fontWeight,
//                                           fontStyle:
//                                               FlutterFlowTheme.of(context)
//                                                   .titleMedium
//                                                   .fontStyle,
//                                         ),
//                                         fontSize: 10.0,
//                                         letterSpacing: 0.0,
//                                         fontWeight: FlutterFlowTheme.of(context)
//                                             .titleMedium
//                                             .fontWeight,
//                                         fontStyle: FlutterFlowTheme.of(context)
//                                             .titleMedium
//                                             .fontStyle,
//                                       ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     Padding(
//                       padding:
//                           const EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 0.0),
//                       child: Text(
//                         (_model.questionIndex != null) &&
//                                 (DashboardGroup.contestQuestionCall.questions(
//                                           (_model.apiResultglp?.jsonBody ?? ''),
//                                         ) !=
//                                         null &&
//                                     (DashboardGroup.contestQuestionCall
//                                             .questions(
//                                       (_model.apiResultglp?.jsonBody ?? ''),
//                                     ))!
//                                         .isNotEmpty)
//                             ? getJsonField(
//                                 DashboardGroup.contestQuestionCall
//                                     .questions(
//                                       (_model.apiResultglp?.jsonBody ?? ''),
//                                     )!
//                                     .elementAtOrNull(_model.questionIndex!),
//                                 r'''$.question''',
//                               ).toString()
//                             : 'No Question Available',
//                         textAlign: TextAlign.center,
//                         style:
//                             FlutterFlowTheme.of(context).headlineLarge.override(
//                                   font: GoogleFonts.poppins(
//                                     fontWeight: FontWeight.w600,
//                                     fontStyle: FlutterFlowTheme.of(context)
//                                         .headlineLarge
//                                         .fontStyle,
//                                   ),
//                                   letterSpacing: 0.0,
//                                   fontWeight: FontWeight.w600,
//                                   fontStyle: FlutterFlowTheme.of(context)
//                                       .headlineLarge
//                                       .fontStyle,
//                                 ),
//                       ),
//                     ),
//                     if (!_model.isLoading)
//                       Padding(
//                         padding:
//                             const EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
//                         child: Builder(
//                           builder: (context) {
//                             if (_model.questionType == 2) {
//                               return Visibility(
//                                 visible: _model.questionType == 2,
//                                 child: Builder(
//                                   builder: (context) {
//                                     final options = getJsonField(
//                                       DashboardGroup.contestQuestionCall
//                                           .questions(
//                                             (_model.apiResultglp?.jsonBody ??
//                                                 ''),
//                                           )
//                                           ?.elementAtOrNull(
//                                               _model.questionIndex!),
//                                       r'''$.options''',
//                                     ).toList();
//                                     _model.debugGeneratorVariables[
//                                             'options${options.length > 100 ? ' (first 100)' : ''}'] =
//                                         debugSerializeParam(
//                                       options.take(100),
//                                       ParamType.JSON,
//                                       isList: true,
//                                       link:
//                                           'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=ContestQuestion',
//                                       name: 'dynamic',
//                                       nullable: false,
//                                     );
//                                     debugLogWidgetClass(_model);
//
//                                     return ListView.builder(
//                                       padding: EdgeInsets.zero,
//                                       shrinkWrap: true,
//                                       scrollDirection: Axis.vertical,
//                                       itemCount: options.length,
//                                       itemBuilder: (context, optionsIndex) {
//                                         final optionsItem =
//                                             options[optionsIndex];
//                                         return Padding(
//                                           padding:
//                                               const EdgeInsetsDirectional.fromSTEB(
//                                                   0.0, 20.0, 0.0, 0.0),
//                                           child: InkWell(
//                                             splashColor: Colors.transparent,
//                                             focusColor: Colors.transparent,
//                                             hoverColor: Colors.transparent,
//                                             highlightColor: Colors.transparent,
//                                             onTap: () async {
//                                               if (_model.selectedIndex ==
//                                                   optionsIndex) {
//                                                 _model.selectedIndex = -1;
//                                                 safeSetState(() {});
//                                               } else {
//                                                 _model.selectedIndex =
//                                                     optionsIndex;
//                                                 _model.selectedId =
//                                                     getJsonField(
//                                                   optionsItem,
//                                                   r'''$.id''',
//                                                 );
//                                                 safeSetState(() {});
//                                               }
//                                             },
//                                             child: Container(
//                                               width: double.infinity,
//                                               decoration: BoxDecoration(
//                                                 color: (Theme.of(context)
//                                                                 .brightness ==
//                                                             Brightness.dark) ==
//                                                         true
//                                                     ? (_model.selectedIndex ==
//                                                             optionsIndex
//                                                         ? const Color(0xFF038500)
//                                                         : const Color(0xFF1C1C22))
//                                                     : (_model.selectedIndex ==
//                                                             optionsIndex
//                                                         ? const Color(0xFF038500)
//                                                         : const Color(0xFFF0F0F0)),
//                                                 borderRadius:
//                                                     BorderRadius.circular(12.0),
//                                                 border: Border.all(
//                                                   color: (Theme.of(context)
//                                                                   .brightness ==
//                                                               Brightness
//                                                                   .dark) ==
//                                                           true
//                                                       ? const Color(0xFF4E4E4E)
//                                                       : const Color(0xFFC0C0C0),
//                                                 ),
//                                               ),
//                                               child: Row(
//                                                 mainAxisSize: MainAxisSize.max,
//                                                 children: [
//                                                   if (_model.selectedIndex !=
//                                                       optionsIndex)
//                                                     Padding(
//                                                       padding:
//                                                           const EdgeInsetsDirectional
//                                                               .fromSTEB(
//                                                                   16.0,
//                                                                   0.0,
//                                                                   0.0,
//                                                                   0.0),
//                                                       child: Container(
//                                                         decoration:
//                                                             BoxDecoration(
//                                                           color: (Theme.of(context)
//                                                                           .brightness ==
//                                                                       Brightness
//                                                                           .dark) ==
//                                                                   true
//                                                               ? const Color(
//                                                                   0xFF39393D)
//                                                               : const Color(
//                                                                   0xFFE5E5E5),
//                                                           shape:
//                                                               BoxShape.circle,
//                                                           border: Border.all(
//                                                             color: (Theme.of(context)
//                                                                             .brightness ==
//                                                                         Brightness
//                                                                             .dark) ==
//                                                                     true
//                                                                 ? const Color(
//                                                                     0xFF4E4E4E)
//                                                                 : Colors
//                                                                     .transparent,
//                                                           ),
//                                                         ),
//                                                         child: Padding(
//                                                           padding:
//                                                               const EdgeInsetsDirectional
//                                                                   .fromSTEB(
//                                                                       12.0,
//                                                                       5.0,
//                                                                       12.0,
//                                                                       5.0),
//                                                           child: Text(
//                                                             getJsonField(
//                                                               optionsItem,
//                                                               r'''$.lable''',
//                                                             ).toString(),
//                                                             style: FlutterFlowTheme
//                                                                     .of(context)
//                                                                 .titleLarge
//                                                                 .override(
//                                                                   font: GoogleFonts
//                                                                       .poppins(
//                                                                     fontWeight:
//                                                                         FontWeight
//                                                                             .w600,
//                                                                     fontStyle: FlutterFlowTheme.of(
//                                                                             context)
//                                                                         .titleLarge
//                                                                         .fontStyle,
//                                                                   ),
//                                                                   color: FlutterFlowTheme.of(
//                                                                           context)
//                                                                       .tertiary,
//                                                                   letterSpacing:
//                                                                       0.0,
//                                                                   fontWeight:
//                                                                       FontWeight
//                                                                           .w600,
//                                                                   fontStyle: FlutterFlowTheme.of(
//                                                                           context)
//                                                                       .titleLarge
//                                                                       .fontStyle,
//                                                                 ),
//                                                           ),
//                                                         ),
//                                                       ),
//                                                     ),
//                                                   if (_model.selectedIndex ==
//                                                       optionsIndex)
//                                                     Padding(
//                                                       padding:
//                                                           const EdgeInsetsDirectional
//                                                               .fromSTEB(
//                                                                   16.0,
//                                                                   0.0,
//                                                                   0.0,
//                                                                   0.0),
//                                                       child: Container(
//                                                         decoration:
//                                                             BoxDecoration(
//                                                           color: Colors.white,
//                                                           shape:
//                                                               BoxShape.circle,
//                                                           border: Border.all(
//                                                             color: (Theme.of(context)
//                                                                             .brightness ==
//                                                                         Brightness
//                                                                             .dark) ==
//                                                                     true
//                                                                 ? Colors.white
//                                                                 : Colors.white,
//                                                           ),
//                                                         ),
//                                                         child: const Padding(
//                                                           padding:
//                                                               EdgeInsetsDirectional
//                                                                   .fromSTEB(
//                                                                       12.0,
//                                                                       5.0,
//                                                                       12.0,
//                                                                       5.0),
//                                                           child: FaIcon(
//                                                             FontAwesomeIcons
//                                                                 .check,
//                                                             color: Color(
//                                                                 0xFF038500),
//                                                             size: 20.0,
//                                                           ),
//                                                         ),
//                                                       ),
//                                                     ),
//                                                   Align(
//                                                     alignment:
//                                                         const AlignmentDirectional(
//                                                             0.0, 0.0),
//                                                     child: Padding(
//                                                       padding:
//                                                           const EdgeInsetsDirectional
//                                                               .fromSTEB(
//                                                                   16.0,
//                                                                   15.0,
//                                                                   0.0,
//                                                                   15.0),
//                                                       child: Text(
//                                                         getJsonField(
//                                                           optionsItem,
//                                                           r'''$.options''',
//                                                         ).toString(),
//                                                         style:
//                                                             FlutterFlowTheme.of(
//                                                                     context)
//                                                                 .titleLarge
//                                                                 .override(
//                                                                   font: GoogleFonts
//                                                                       .poppins(
//                                                                     fontWeight: FlutterFlowTheme.of(
//                                                                             context)
//                                                                         .titleLarge
//                                                                         .fontWeight,
//                                                                     fontStyle: FlutterFlowTheme.of(
//                                                                             context)
//                                                                         .titleLarge
//                                                                         .fontStyle,
//                                                                   ),
//                                                                   letterSpacing:
//                                                                       0.0,
//                                                                   fontWeight: FlutterFlowTheme.of(
//                                                                           context)
//                                                                       .titleLarge
//                                                                       .fontWeight,
//                                                                   fontStyle: FlutterFlowTheme.of(
//                                                                           context)
//                                                                       .titleLarge
//                                                                       .fontStyle,
//                                                                 ),
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 ],
//                                               ),
//                                             ),
//                                           ),
//                                         );
//                                       },
//                                     );
//                                   },
//                                 ),
//                               );
//                             } else {
//                               return Padding(
//                                 padding: const EdgeInsetsDirectional.fromSTEB(
//                                     0.0, 20.0, 0.0, 0.0),
//                                 child: Container(
//                                   width: double.infinity,
//                                   child: TextFormField(
//                                     controller: _model.textController,
//                                     focusNode: _model.textFieldFocusNode,
//                                     autofocus: false,
//                                     obscureText: false,
//                                     decoration: InputDecoration(
//                                       isDense: true,
//                                       labelStyle: FlutterFlowTheme.of(context)
//                                           .labelMedium
//                                           .override(
//                                             font: GoogleFonts.poppins(
//                                               fontWeight:
//                                                   FlutterFlowTheme.of(context)
//                                                       .labelMedium
//                                                       .fontWeight,
//                                               fontStyle:
//                                                   FlutterFlowTheme.of(context)
//                                                       .labelMedium
//                                                       .fontStyle,
//                                             ),
//                                             letterSpacing: 0.0,
//                                             fontWeight:
//                                                 FlutterFlowTheme.of(context)
//                                                     .labelMedium
//                                                     .fontWeight,
//                                             fontStyle:
//                                                 FlutterFlowTheme.of(context)
//                                                     .labelMedium
//                                                     .fontStyle,
//                                           ),
//                                       hintText: 'Write answer here...',
//                                       hintStyle: FlutterFlowTheme.of(context)
//                                           .labelMedium
//                                           .override(
//                                             font: GoogleFonts.poppins(
//                                               fontWeight: FontWeight.w300,
//                                               fontStyle:
//                                                   FlutterFlowTheme.of(context)
//                                                       .labelMedium
//                                                       .fontStyle,
//                                             ),
//                                             letterSpacing: 0.0,
//                                             fontWeight: FontWeight.w300,
//                                             fontStyle:
//                                                 FlutterFlowTheme.of(context)
//                                                     .labelMedium
//                                                     .fontStyle,
//                                           ),
//                                       enabledBorder: OutlineInputBorder(
//                                         borderSide: BorderSide(
//                                           color: Theme.of(context).brightness ==
//                                                   Brightness.dark
//                                               ? const Color(0x32FFFFFF)
//                                               : const Color(0x33000000),
//                                           width: 1.0,
//                                         ),
//                                         borderRadius:
//                                             BorderRadius.circular(8.0),
//                                       ),
//                                       focusedBorder: OutlineInputBorder(
//                                         borderSide: BorderSide(
//                                           color: Theme.of(context).brightness ==
//                                                   Brightness.dark
//                                               ? const Color(0x32FFFFFF)
//                                               : const Color(0x33000000),
//                                           width: 1.0,
//                                         ),
//                                         borderRadius:
//                                             BorderRadius.circular(8.0),
//                                       ),
//                                       errorBorder: OutlineInputBorder(
//                                         borderSide: BorderSide(
//                                           color: FlutterFlowTheme.of(context)
//                                               .error,
//                                           width: 1.0,
//                                         ),
//                                         borderRadius:
//                                             BorderRadius.circular(8.0),
//                                       ),
//                                       focusedErrorBorder: OutlineInputBorder(
//                                         borderSide: BorderSide(
//                                           color: FlutterFlowTheme.of(context)
//                                               .error,
//                                           width: 1.0,
//                                         ),
//                                         borderRadius:
//                                             BorderRadius.circular(8.0),
//                                       ),
//                                       filled: true,
//                                       fillColor: FlutterFlowTheme.of(context)
//                                           .secondaryBackground,
//                                     ),
//                                     style: FlutterFlowTheme.of(context)
//                                         .titleLarge
//                                         .override(
//                                           font: GoogleFonts.poppins(
//                                             fontWeight: FontWeight.w600,
//                                             fontStyle:
//                                                 FlutterFlowTheme.of(context)
//                                                     .titleLarge
//                                                     .fontStyle,
//                                           ),
//                                           letterSpacing: 0.0,
//                                           fontWeight: FontWeight.w600,
//                                           fontStyle:
//                                               FlutterFlowTheme.of(context)
//                                                   .titleLarge
//                                                   .fontStyle,
//                                         ),
//                                     maxLines: 6,
//                                     minLines: 6,
//                                     cursorColor: FlutterFlowTheme.of(context)
//                                         .primaryText,
//                                     enableInteractiveSelection: true,
//                                     validator: _model.textControllerValidator
//                                         .asValidator(context),
//                                   ),
//                                 ),
//                               );
//                             }
//                           },
//                         ),
//                       ),
//                     Expanded(
//                       child: Align(
//                         alignment: const AlignmentDirectional(0.0, 1.0),
//                         child: Padding(
//                           padding: const EdgeInsetsDirectional.fromSTEB(
//                               0.0, 0.0, 0.0, 40.0),
//                           child: InkWell(
//                             splashColor: Colors.transparent,
//                             focusColor: Colors.transparent,
//                             hoverColor: Colors.transparent,
//                             highlightColor: Colors.transparent,
//                             onTap: () async {},
//                             child: Container(
//                               decoration: const BoxDecoration(),
//                               child: InkWell(
//                                 splashColor: Colors.transparent,
//                                 focusColor: Colors.transparent,
//                                 hoverColor: Colors.transparent,
//                                 highlightColor: Colors.transparent,
//                                 onTap: () async {
//                                   _model.submitAnsRes = await DashboardGroup
//                                       .contestSubmitAnswersCall
//                                       .call(
//                                     authToken: FFAppState().authToken,
//                                     questionId: getJsonField(
//                                       DashboardGroup.contestQuestionCall
//                                           .questions(
//                                             (_model.apiResultglp?.jsonBody ??
//                                                 ''),
//                                           )
//                                           ?.elementAtOrNull(
//                                               _model.questionIndex!),
//                                       r'''$.id''',
//                                     ),
//                                     optionId: _model.selectedId,
//                                     answer: _model.textController.text,
//                                   );
//
//                                   if ((_model.submitAnsRes?.succeeded ??
//                                           true) ==
//                                       true) {
//                                     if (_model.questionNo ==
//                                         DashboardGroup.contestQuestionCall
//                                             .questions(
//                                               (_model.apiResultglp?.jsonBody ??
//                                                   ''),
//                                             )
//                                             ?.length) {
//                                       context.goNamed(
//                                         ContestResultWidget.routeName,
//                                         queryParameters: {
//                                           'contestId': serializeParam(
//                                             widget!.contestId,
//                                             ParamType.int,
//                                           ),
//                                         }.withoutNulls,
//                                       );
//                                     } else {
//                                       _model.questionIndex =
//                                           _model.questionIndex! + 1;
//                                       _model.questionNo = _model.questionNo + 1;
//                                       _model.questionType = getJsonField(
//                                         DashboardGroup.contestQuestionCall
//                                             .questions(
//                                               (_model.apiResultglp?.jsonBody ??
//                                                   ''),
//                                             )!
//                                             .elementAtOrNull(
//                                                 _model.questionIndex!),
//                                         r'''$.type''',
//                                       );
//                                       _model.selectedIndex = -1;
//                                       safeSetState(() {});
//                                       safeSetState(() {
//                                         _model.textController?.clear();
//                                       });
//                                     }
//                                   } else {
//                                     ScaffoldMessenger.of(context).showSnackBar(
//                                       SnackBar(
//                                         content: Text(
//                                           getJsonField(
//                                             (_model.submitAnsRes?.jsonBody ??
//                                                 ''),
//                                             r'''$.message''',
//                                           ).toString(),
//                                           style: const TextStyle(
//                                             color: Colors.white,
//                                           ),
//                                         ),
//                                         duration: const Duration(milliseconds: 1550),
//                                         backgroundColor: Colors.black,
//                                       ),
//                                     );
//                                   }
//
//                                   safeSetState(() {});
//                                 },
//                                 child: wrapWithModel(
//                                   model: _model.gradientButtonCustomModel,
//                                   updateCallback: () => safeSetState(() {}),
//                                   child: Builder(builder: (_) {
//                                     return DebugFlutterFlowModelContext(
//                                       rootModel: _model.rootModel,
//                                       child: GradientButtonCustomWidget(
//                                         text: _model.questionNo ==
//                                                 DashboardGroup
//                                                     .contestQuestionCall
//                                                     .questions(
//                                                       (_model.apiResultglp
//                                                               ?.jsonBody ??
//                                                           ''),
//                                                     )
//                                                     ?.length
//                                             ? 'Finish'
//                                             : 'Continue',
//                                       ),
//                                     );
//                                   }),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
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


///2 copilot version
// import '/backend/api_requests/api_calls.dart';
// import '/components/gradient_button_custom/gradient_button_custom_widget.dart';
// import '/flutter_flow/flutter_flow_theme.dart';
// import '/flutter_flow/flutter_flow_timer.dart';
// import '/flutter_flow/flutter_flow_util.dart';
// import '/flutter_flow/flutter_flow_widgets.dart';
// import 'dart:ui';
// import '/custom_code/widgets/index.dart' as custom_widgets;
// import '/index.dart';
// import 'package:stop_watch_timer/stop_watch_timer.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/scheduler.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:percent_indicator/percent_indicator.dart';
// import 'package:provider/provider.dart';
// import 'contest_question_model.dart';
// export 'contest_question_model.dart';
//
// class ContestQuestionWidget extends StatefulWidget {
//   const ContestQuestionWidget({
//     super.key,
//     required this.contestId,
//   });
//
//   final int? contestId;
//
//   static String routeName = 'ContestQuestion';
//   static String routePath = '/contestQuestion';
//
//   @override
//   State<ContestQuestionWidget> createState() => _ContestQuestionWidgetState();
// }
//
// class _ContestQuestionWidgetState extends State<ContestQuestionWidget>
//     with RouteAware {
//   late ContestQuestionModel _model;
//
//   final scaffoldKey = GlobalKey<ScaffoldState>();
//
//   @override
//   void initState() {
//     super.initState();
//     _model = createModel(context, () => ContestQuestionModel());
//
//     // On page load action.
//     SchedulerBinding.instance.addPostFrameCallback((_) async {
//       _model.isLoading = true;
//       safeSetState(() {});
//       _model.apiResultglp = await DashboardGroup.contestQuestionCall.call(
//         contestId: widget!.contestId,
//         authToken: FFAppState().authToken,
//       );
//
//       if ((_model.apiResultglp?.succeeded ?? true)) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text(
//               getJsonField(
//                 (_model.apiResultglp?.jsonBody ?? ''),
//                 r'''$.message''',
//               ).toString(),
//               style: const TextStyle(
//                 color: Colors.white,
//               ),
//             ),
//             duration: const Duration(milliseconds: 1750),
//             backgroundColor: Colors.black,
//           ),
//         );
//         _model.timerController.onStartTimer();
//
//         // Set start time for first question using timer
//         _model.questionStartTimeMs = _model.timerMilliseconds;
//
//         _model.questionType = getJsonField(
//           DashboardGroup.contestQuestionCall
//               .questions(
//             (_model.apiResultglp?.jsonBody ?? ''),
//           )!
//               .elementAtOrNull(_model.questionIndex!),
//           r'''$.type''',
//         );
//         _model.isLoading = false;
//         safeSetState(() {});
//         safeSetState(() {});
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text(
//               getJsonField(
//                 (_model.apiResultglp?.jsonBody ?? ''),
//                 r'''$.message''',
//               ).toString(),
//               style: const TextStyle(
//                 color: Colors.white,
//               ),
//             ),
//             duration: const Duration(milliseconds: 1750),
//             backgroundColor: Colors.black,
//           ),
//         );
//       }
//     });
//
//     _model.textController ??= TextEditingController()
//       ..addListener(() {
//         debugLogWidgetClass(_model);
//       });
//     _model.textFieldFocusNode ??= FocusNode();
//
//     WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
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
//   void didUpdateWidget(ContestQuestionWidget oldWidget) {
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
//         backgroundColor: FlutterFlowTheme.of(context).oposite,
//         body: Stack(
//           children: [
//             ClipRRect(
//               borderRadius: BorderRadius.circular(8.0),
//               child: Image.asset(
//                 Theme.of(context).brightness == Brightness.dark
//                     ? 'assets/images/forgotBg.png'
//                     : 'assets/images/plain_whiteBg.png',
//                 width: double.infinity,
//                 height: double.infinity,
//                 fit: BoxFit.cover,
//               ),
//             ),
//             if (!_model.isLoading)
//               Padding(
//                 padding: const EdgeInsetsDirectional.fromSTEB(16.0, 40.0, 16.0, 0.0),
//                 child: Column(
//                   mainAxisSize: MainAxisSize.max,
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     Row(
//                       mainAxisSize: MainAxisSize.max,
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Container(
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
//                           ),
//                           child: InkWell(
//                             splashColor: Colors.transparent,
//                             focusColor: Colors.transparent,
//                             hoverColor: Colors.transparent,
//                             highlightColor: Colors.transparent,
//                             onTap: () async {
//                               context.safePop();
//                             },
//                             child: Icon(
//                               Icons.arrow_back_rounded,
//                               color: FlutterFlowTheme.of(context).tertiary,
//                               size: 24.0,
//                             ),
//                           ),
//                         ),
//                         Row(
//                           mainAxisSize: MainAxisSize.max,
//                           children: [
//                             Text(
//                               'Con',
//                               style: FlutterFlowTheme.of(context)
//                                   .customTextStyle1
//                                   .override(
//                                 fontFamily: 'good times',
//                                 color:
//                                 FlutterFlowTheme.of(context).tertiary,
//                                 fontSize: 24.0,
//                                 letterSpacing: 0.0,
//                                 fontWeight: FontWeight.normal,
//                               ),
//                             ),
//                             Text(
//                               't',
//                               style: FlutterFlowTheme.of(context)
//                                   .customTextStyle1
//                                   .override(
//                                 fontFamily: 'good times',
//                                 color: const Color(0xFFEB6027),
//                                 fontSize: 24.0,
//                                 letterSpacing: 0.0,
//                                 fontWeight: FontWeight.normal,
//                               ),
//                             ),
//                             Text(
//                               'est',
//                               style: FlutterFlowTheme.of(context)
//                                   .customTextStyle1
//                                   .override(
//                                 fontFamily: 'good times',
//                                 color:
//                                 FlutterFlowTheme.of(context).tertiary,
//                                 fontSize: 24.0,
//                                 letterSpacing: 0.0,
//                                 fontWeight: FontWeight.normal,
//                               ),
//                             ),
//                           ],
//                         ),
//                         Padding(
//                           padding: const EdgeInsetsDirectional.fromSTEB(
//                               8.0, 0.0, 0.0, 0.0),
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
//                             ),
//                             child: InkWell(
//                               splashColor: Colors.transparent,
//                               focusColor: Colors.transparent,
//                               hoverColor: Colors.transparent,
//                               highlightColor: Colors.transparent,
//                               onTap: () async {
//                                 context.pushNamed(AboutScreenWidget.routeName);
//                               },
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
//                       const EdgeInsetsDirectional.fromSTEB(0.0, 25.0, 0.0, 10.0),
//                       child: LinearPercentIndicator(
//                         percent: (_model.questionIndex != null) &&
//                             (DashboardGroup.contestQuestionCall.questions(
//                               (_model.apiResultglp?.jsonBody ?? ''),
//                             ) !=
//                                 null &&
//                                 (DashboardGroup.contestQuestionCall
//                                     .questions(
//                                   (_model.apiResultglp?.jsonBody ?? ''),
//                                 ))!
//                                     .isNotEmpty)
//                             ? getJsonField(
//                           DashboardGroup.contestQuestionCall
//                               .questions(
//                             (_model.apiResultglp?.jsonBody ?? ''),
//                           )!
//                               .elementAtOrNull(_model.questionIndex!),
//                           r'''$.progress_value''',
//                         )
//                             : 0.0,
//                         lineHeight: 8.0,
//                         animation: true,
//                         animateFromLastPercent: true,
//                         progressColor: FlutterFlowTheme.of(context).lightPeach,
//                         backgroundColor:
//                         (Theme.of(context).brightness == Brightness.dark) ==
//                             true
//                             ? const Color(0xFF39393D)
//                             : const Color(0xFFE5E5E5),
//                         barRadius: const Radius.circular(10.0),
//                         padding: EdgeInsets.zero,
//                       ),
//                     ),
//                     Row(
//                       mainAxisSize: MainAxisSize.max,
//                       children: [
//                         Row(
//                           mainAxisSize: MainAxisSize.max,
//                           children: [
//                             Text(
//                               'Questions',
//                               style: FlutterFlowTheme.of(context)
//                                   .bodySmall
//                                   .override(
//                                 font: GoogleFonts.poppins(
//                                   fontWeight: FlutterFlowTheme.of(context)
//                                       .bodySmall
//                                       .fontWeight,
//                                   fontStyle: FlutterFlowTheme.of(context)
//                                       .bodySmall
//                                       .fontStyle,
//                                 ),
//                                 color:
//                                 FlutterFlowTheme.of(context).tertiary,
//                                 fontSize: 10.0,
//                                 letterSpacing: 0.0,
//                                 fontWeight: FlutterFlowTheme.of(context)
//                                     .bodySmall
//                                     .fontWeight,
//                                 fontStyle: FlutterFlowTheme.of(context)
//                                     .bodySmall
//                                     .fontStyle,
//                               ),
//                             ),
//                             Padding(
//                               padding: const EdgeInsetsDirectional.fromSTEB(
//                                   2.0, 0.0, 2.0, 0.0),
//                               child: Text(
//                                 _model.questionNo.toString(),
//                                 style: FlutterFlowTheme.of(context)
//                                     .bodySmall
//                                     .override(
//                                   font: GoogleFonts.poppins(
//                                     fontWeight: FlutterFlowTheme.of(context)
//                                         .bodySmall
//                                         .fontWeight,
//                                     fontStyle: FlutterFlowTheme.of(context)
//                                         .bodySmall
//                                         .fontStyle,
//                                   ),
//                                   color:
//                                   FlutterFlowTheme.of(context).tertiary,
//                                   fontSize: 10.0,
//                                   letterSpacing: 0.0,
//                                   fontWeight: FlutterFlowTheme.of(context)
//                                       .bodySmall
//                                       .fontWeight,
//                                   fontStyle: FlutterFlowTheme.of(context)
//                                       .bodySmall
//                                       .fontStyle,
//                                 ),
//                               ),
//                             ),
//                             Text(
//                               'of',
//                               style: FlutterFlowTheme.of(context)
//                                   .bodySmall
//                                   .override(
//                                 font: GoogleFonts.poppins(
//                                   fontWeight: FlutterFlowTheme.of(context)
//                                       .bodySmall
//                                       .fontWeight,
//                                   fontStyle: FlutterFlowTheme.of(context)
//                                       .bodySmall
//                                       .fontStyle,
//                                 ),
//                                 color:
//                                 FlutterFlowTheme.of(context).tertiary,
//                                 fontSize: 10.0,
//                                 letterSpacing: 0.0,
//                                 fontWeight: FlutterFlowTheme.of(context)
//                                     .bodySmall
//                                     .fontWeight,
//                                 fontStyle: FlutterFlowTheme.of(context)
//                                     .bodySmall
//                                     .fontStyle,
//                               ),
//                             ),
//                             Padding(
//                               padding: const EdgeInsetsDirectional.fromSTEB(
//                                   2.0, 0.0, 2.0, 0.0),
//                               child: Text(
//                                 valueOrDefault<String>(
//                                   DashboardGroup.contestQuestionCall
//                                       .questions(
//                                     (_model.apiResultglp?.jsonBody ?? ''),
//                                   )
//                                       ?.length
//                                       ?.toString(),
//                                   '0',
//                                 ),
//                                 style: FlutterFlowTheme.of(context)
//                                     .bodySmall
//                                     .override(
//                                   font: GoogleFonts.poppins(
//                                     fontWeight: FlutterFlowTheme.of(context)
//                                         .bodySmall
//                                         .fontWeight,
//                                     fontStyle: FlutterFlowTheme.of(context)
//                                         .bodySmall
//                                         .fontStyle,
//                                   ),
//                                   color:
//                                   FlutterFlowTheme.of(context).tertiary,
//                                   fontSize: 10.0,
//                                   letterSpacing: 0.0,
//                                   fontWeight: FlutterFlowTheme.of(context)
//                                       .bodySmall
//                                       .fontWeight,
//                                   fontStyle: FlutterFlowTheme.of(context)
//                                       .bodySmall
//                                       .fontStyle,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                         Expanded(
//                           child: Align(
//                             alignment: const AlignmentDirectional(1.0, 0.0),
//                             child: Row(
//                               mainAxisSize: MainAxisSize.max,
//                               mainAxisAlignment: MainAxisAlignment.end,
//                               children: [
//                                 Opacity(
//                                   opacity: 0.9,
//                                   child: Padding(
//                                     padding: const EdgeInsetsDirectional.fromSTEB(
//                                         0.0, 0.0, 5.0, 0.0),
//                                     child: Icon(
//                                       Icons.timer_outlined,
//                                       color:
//                                       FlutterFlowTheme.of(context).tertiary,
//                                       size: 18.0,
//                                     ),
//                                   ),
//                                 ),
//                                 FlutterFlowTimer(
//                                   initialTime: _model.timerInitialTimeMs,
//                                   getDisplayTime: (value) =>
//                                       StopWatchTimer.getDisplayTime(
//                                         value,
//                                         hours: false,
//                                         milliSecond: false,
//                                       ),
//                                   controller: _model.timerController,
//                                   updateStateInterval:
//                                   const Duration(milliseconds: 1000),
//                                   onChanged:
//                                       (value, displayTime, shouldUpdate) {
//                                     _model.timerMilliseconds = value;
//                                     _model.timerValue = displayTime;
//                                     if (shouldUpdate) safeSetState(() {});
//                                   },
//                                   textAlign: TextAlign.start,
//                                   style: FlutterFlowTheme.of(context)
//                                       .titleMedium
//                                       .override(
//                                     font: GoogleFonts.poppins(
//                                       fontWeight:
//                                       FlutterFlowTheme.of(context)
//                                           .titleMedium
//                                           .fontWeight,
//                                       fontStyle:
//                                       FlutterFlowTheme.of(context)
//                                           .titleMedium
//                                           .fontStyle,
//                                     ),
//                                     fontSize: 10.0,
//                                     letterSpacing: 0.0,
//                                     fontWeight: FlutterFlowTheme.of(context)
//                                         .titleMedium
//                                         .fontWeight,
//                                     fontStyle: FlutterFlowTheme.of(context)
//                                         .titleMedium
//                                         .fontStyle,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     Padding(
//                       padding:
//                       const EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 0.0),
//                       child: Text(
//                         (_model.questionIndex != null) &&
//                             (DashboardGroup.contestQuestionCall.questions(
//                               (_model.apiResultglp?.jsonBody ?? ''),
//                             ) !=
//                                 null &&
//                                 (DashboardGroup.contestQuestionCall
//                                     .questions(
//                                   (_model.apiResultglp?.jsonBody ?? ''),
//                                 ))!
//                                     .isNotEmpty)
//                             ? getJsonField(
//                           DashboardGroup.contestQuestionCall
//                               .questions(
//                             (_model.apiResultglp?.jsonBody ?? ''),
//                           )!
//                               .elementAtOrNull(_model.questionIndex!),
//                           r'''$.question''',
//                         ).toString()
//                             : 'No Question Available',
//                         textAlign: TextAlign.center,
//                         style:
//                         FlutterFlowTheme.of(context).headlineLarge.override(
//                           font: GoogleFonts.poppins(
//                             fontWeight: FontWeight.w600,
//                             fontStyle: FlutterFlowTheme.of(context)
//                                 .headlineLarge
//                                 .fontStyle,
//                           ),
//                           letterSpacing: 0.0,
//                           fontWeight: FontWeight.w600,
//                           fontStyle: FlutterFlowTheme.of(context)
//                               .headlineLarge
//                               .fontStyle,
//                         ),
//                       ),
//                     ),
//                     if (!_model.isLoading)
//                       Padding(
//                         padding:
//                         const EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
//                         child: Builder(
//                           builder: (context) {
//                             if (_model.questionType == 2) {
//                               return Visibility(
//                                 visible: _model.questionType == 2,
//                                 child: Builder(
//                                   builder: (context) {
//                                     final options = getJsonField(
//                                       DashboardGroup.contestQuestionCall
//                                           .questions(
//                                         (_model.apiResultglp?.jsonBody ??
//                                             ''),
//                                       )
//                                           ?.elementAtOrNull(
//                                           _model.questionIndex!),
//                                       r'''$.options''',
//                                     ).toList();
//                                     _model.debugGeneratorVariables[
//                                     'options${options.length > 100 ? ' (first 100)' : ''}'] =
//                                         debugSerializeParam(
//                                           options.take(100),
//                                           ParamType.JSON,
//                                           isList: true,
//                                           link:
//                                           'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=ContestQuestion',
//                                           name: 'dynamic',
//                                           nullable: false,
//                                         );
//                                     debugLogWidgetClass(_model);
//
//                                     return ListView.builder(
//                                       padding: EdgeInsets.zero,
//                                       shrinkWrap: true,
//                                       scrollDirection: Axis.vertical,
//                                       itemCount: options.length,
//                                       itemBuilder: (context, optionsIndex) {
//                                         final optionsItem =
//                                         options[optionsIndex];
//                                         return Padding(
//                                           padding:
//                                           const EdgeInsetsDirectional.fromSTEB(
//                                               0.0, 20.0, 0.0, 0.0),
//                                           child: InkWell(
//                                             splashColor: Colors.transparent,
//                                             focusColor: Colors.transparent,
//                                             hoverColor: Colors.transparent,
//                                             highlightColor: Colors.transparent,
//                                             onTap: () async {
//                                               if (_model.selectedIndex ==
//                                                   optionsIndex) {
//                                                 _model.selectedIndex = -1;
//                                                 safeSetState(() {});
//                                               } else {
//                                                 _model.selectedIndex =
//                                                     optionsIndex;
//                                                 _model.selectedId =
//                                                     getJsonField(
//                                                       optionsItem,
//                                                       r'''$.id''',
//                                                     );
//                                                 safeSetState(() {});
//                                               }
//                                             },
//                                             child: Container(
//                                               width: double.infinity,
//                                               decoration: BoxDecoration(
//                                                 color: (Theme.of(context)
//                                                     .brightness ==
//                                                     Brightness.dark) ==
//                                                     true
//                                                     ? (_model.selectedIndex ==
//                                                     optionsIndex
//                                                     ? const Color(0xFF038500)
//                                                     : const Color(0xFF1C1C22))
//                                                     : (_model.selectedIndex ==
//                                                     optionsIndex
//                                                     ? const Color(0xFF038500)
//                                                     : const Color(0xFFF0F0F0)),
//                                                 borderRadius:
//                                                 BorderRadius.circular(12.0),
//                                                 border: Border.all(
//                                                   color: (Theme.of(context)
//                                                       .brightness ==
//                                                       Brightness
//                                                           .dark) ==
//                                                       true
//                                                       ? const Color(0xFF4E4E4E)
//                                                       : const Color(0xFFC0C0C0),
//                                                 ),
//                                               ),
//                                               child: Row(
//                                                 mainAxisSize: MainAxisSize.max,
//                                                 children: [
//                                                   if (_model.selectedIndex !=
//                                                       optionsIndex)
//                                                     Padding(
//                                                       padding:
//                                                       const EdgeInsetsDirectional
//                                                           .fromSTEB(
//                                                           16.0,
//                                                           0.0,
//                                                           0.0,
//                                                           0.0),
//                                                       child: Container(
//                                                         decoration:
//                                                         BoxDecoration(
//                                                           color: (Theme.of(context)
//                                                               .brightness ==
//                                                               Brightness
//                                                                   .dark) ==
//                                                               true
//                                                               ? const Color(
//                                                               0xFF39393D)
//                                                               : const Color(
//                                                               0xFFE5E5E5),
//                                                           shape:
//                                                           BoxShape.circle,
//                                                           border: Border.all(
//                                                             color: (Theme.of(context)
//                                                                 .brightness ==
//                                                                 Brightness
//                                                                     .dark) ==
//                                                                 true
//                                                                 ? const Color(
//                                                                 0xFF4E4E4E)
//                                                                 : Colors
//                                                                 .transparent,
//                                                           ),
//                                                         ),
//                                                         child: Padding(
//                                                           padding:
//                                                           const EdgeInsetsDirectional
//                                                               .fromSTEB(
//                                                               12.0,
//                                                               5.0,
//                                                               12.0,
//                                                               5.0),
//                                                           child: Text(
//                                                             getJsonField(
//                                                               optionsItem,
//                                                               r'''$.lable''',
//                                                             ).toString(),
//                                                             style: FlutterFlowTheme
//                                                                 .of(context)
//                                                                 .titleLarge
//                                                                 .override(
//                                                               font: GoogleFonts
//                                                                   .poppins(
//                                                                 fontWeight:
//                                                                 FontWeight
//                                                                     .w600,
//                                                                 fontStyle: FlutterFlowTheme.of(
//                                                                     context)
//                                                                     .titleLarge
//                                                                     .fontStyle,
//                                                               ),
//                                                               color: FlutterFlowTheme.of(
//                                                                   context)
//                                                                   .tertiary,
//                                                               letterSpacing:
//                                                               0.0,
//                                                               fontWeight:
//                                                               FontWeight
//                                                                   .w600,
//                                                               fontStyle: FlutterFlowTheme.of(
//                                                                   context)
//                                                                   .titleLarge
//                                                                   .fontStyle,
//                                                             ),
//                                                           ),
//                                                         ),
//                                                       ),
//                                                     ),
//                                                   if (_model.selectedIndex ==
//                                                       optionsIndex)
//                                                     Padding(
//                                                       padding:
//                                                       const EdgeInsetsDirectional
//                                                           .fromSTEB(
//                                                           16.0,
//                                                           0.0,
//                                                           0.0,
//                                                           0.0),
//                                                       child: Container(
//                                                         decoration:
//                                                         BoxDecoration(
//                                                           color: Colors.white,
//                                                           shape:
//                                                           BoxShape.circle,
//                                                           border: Border.all(
//                                                             color: (Theme.of(context)
//                                                                 .brightness ==
//                                                                 Brightness
//                                                                     .dark) ==
//                                                                 true
//                                                                 ? Colors.white
//                                                                 : Colors.white,
//                                                           ),
//                                                         ),
//                                                         child: const Padding(
//                                                           padding:
//                                                           EdgeInsetsDirectional
//                                                               .fromSTEB(
//                                                               12.0,
//                                                               5.0,
//                                                               12.0,
//                                                               5.0),
//                                                           child: FaIcon(
//                                                             FontAwesomeIcons
//                                                                 .check,
//                                                             color: Color(
//                                                                 0xFF038500),
//                                                             size: 20.0,
//                                                           ),
//                                                         ),
//                                                       ),
//                                                     ),
//                                                   Align(
//                                                     alignment:
//                                                     const AlignmentDirectional(
//                                                         0.0, 0.0),
//                                                     child: Padding(
//                                                       padding:
//                                                       const EdgeInsetsDirectional
//                                                           .fromSTEB(
//                                                           16.0,
//                                                           15.0,
//                                                           0.0,
//                                                           15.0),
//                                                       child: Text(
//                                                         getJsonField(
//                                                           optionsItem,
//                                                           r'''$.options''',
//                                                         ).toString(),
//                                                         style:
//                                                         FlutterFlowTheme.of(
//                                                             context)
//                                                             .titleLarge
//                                                             .override(
//                                                           font: GoogleFonts
//                                                               .poppins(
//                                                             fontWeight: FlutterFlowTheme.of(
//                                                                 context)
//                                                                 .titleLarge
//                                                                 .fontWeight,
//                                                             fontStyle: FlutterFlowTheme.of(
//                                                                 context)
//                                                                 .titleLarge
//                                                                 .fontStyle,
//                                                           ),
//                                                           letterSpacing:
//                                                           0.0,
//                                                           fontWeight: FlutterFlowTheme.of(
//                                                               context)
//                                                               .titleLarge
//                                                               .fontWeight,
//                                                           fontStyle: FlutterFlowTheme.of(
//                                                               context)
//                                                               .titleLarge
//                                                               .fontStyle,
//                                                         ),
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 ],
//                                               ),
//                                             ),
//                                           ),
//                                         );
//                                       },
//                                     );
//                                   },
//                                 ),
//                               );
//                             } else {
//                               return Padding(
//                                 padding: const EdgeInsetsDirectional.fromSTEB(
//                                     0.0, 20.0, 0.0, 0.0),
//                                 child: Container(
//                                   width: double.infinity,
//                                   child: TextFormField(
//                                     controller: _model.textController,
//                                     focusNode: _model.textFieldFocusNode,
//                                     autofocus: false,
//                                     obscureText: false,
//                                     decoration: InputDecoration(
//                                       isDense: true,
//                                       labelStyle: FlutterFlowTheme.of(context)
//                                           .labelMedium
//                                           .override(
//                                         font: GoogleFonts.poppins(
//                                           fontWeight:
//                                           FlutterFlowTheme.of(context)
//                                               .labelMedium
//                                               .fontWeight,
//                                           fontStyle:
//                                           FlutterFlowTheme.of(context)
//                                               .labelMedium
//                                               .fontStyle,
//                                         ),
//                                         letterSpacing: 0.0,
//                                         fontWeight:
//                                         FlutterFlowTheme.of(context)
//                                             .labelMedium
//                                             .fontWeight,
//                                         fontStyle:
//                                         FlutterFlowTheme.of(context)
//                                             .labelMedium
//                                             .fontStyle,
//                                       ),
//                                       hintText: 'Write answer here...',
//                                       hintStyle: FlutterFlowTheme.of(context)
//                                           .labelMedium
//                                           .override(
//                                         font: GoogleFonts.poppins(
//                                           fontWeight: FontWeight.w300,
//                                           fontStyle:
//                                           FlutterFlowTheme.of(context)
//                                               .labelMedium
//                                               .fontStyle,
//                                         ),
//                                         letterSpacing: 0.0,
//                                         fontWeight: FontWeight.w300,
//                                         fontStyle:
//                                         FlutterFlowTheme.of(context)
//                                             .labelMedium
//                                             .fontStyle,
//                                       ),
//                                       enabledBorder: OutlineInputBorder(
//                                         borderSide: BorderSide(
//                                           color: Theme.of(context).brightness ==
//                                               Brightness.dark
//                                               ? const Color(0x32FFFFFF)
//                                               : const Color(0x33000000),
//                                           width: 1.0,
//                                         ),
//                                         borderRadius:
//                                         BorderRadius.circular(8.0),
//                                       ),
//                                       focusedBorder: OutlineInputBorder(
//                                         borderSide: BorderSide(
//                                           color: Theme.of(context).brightness ==
//                                               Brightness.dark
//                                               ? const Color(0x32FFFFFF)
//                                               : const Color(0x33000000),
//                                           width: 1.0,
//                                         ),
//                                         borderRadius:
//                                         BorderRadius.circular(8.0),
//                                       ),
//                                       errorBorder: OutlineInputBorder(
//                                         borderSide: BorderSide(
//                                           color: FlutterFlowTheme.of(context)
//                                               .error,
//                                           width: 1.0,
//                                         ),
//                                         borderRadius:
//                                         BorderRadius.circular(8.0),
//                                       ),
//                                       focusedErrorBorder: OutlineInputBorder(
//                                         borderSide: BorderSide(
//                                           color: FlutterFlowTheme.of(context)
//                                               .error,
//                                           width: 1.0,
//                                         ),
//                                         borderRadius:
//                                         BorderRadius.circular(8.0),
//                                       ),
//                                       filled: true,
//                                       fillColor: FlutterFlowTheme.of(context)
//                                           .secondaryBackground,
//                                     ),
//                                     style: FlutterFlowTheme.of(context)
//                                         .titleLarge
//                                         .override(
//                                       font: GoogleFonts.poppins(
//                                         fontWeight: FontWeight.w600,
//                                         fontStyle:
//                                         FlutterFlowTheme.of(context)
//                                             .titleLarge
//                                             .fontStyle,
//                                       ),
//                                       letterSpacing: 0.0,
//                                       fontWeight: FontWeight.w600,
//                                       fontStyle:
//                                       FlutterFlowTheme.of(context)
//                                           .titleLarge
//                                           .fontStyle,
//                                     ),
//                                     maxLines: 6,
//                                     minLines: 6,
//                                     cursorColor: FlutterFlowTheme.of(context)
//                                         .primaryText,
//                                     enableInteractiveSelection: true,
//                                     validator: _model.textControllerValidator
//                                         .asValidator(context),
//                                   ),
//                                 ),
//                               );
//                             }
//                           },
//                         ),
//                       ),
//                     Expanded(
//                       child: Align(
//                         alignment: const AlignmentDirectional(0.0, 1.0),
//                         child: Padding(
//                           padding: const EdgeInsetsDirectional.fromSTEB(
//                               0.0, 0.0, 0.0, 40.0),
//                           child: InkWell(
//                             splashColor: Colors.transparent,
//                             focusColor: Colors.transparent,
//                             hoverColor: Colors.transparent,
//                             highlightColor: Colors.transparent,
//                             onTap: () async {},
//                             child: Container(
//                               decoration: const BoxDecoration(),
//                               child: InkWell(
//                                 splashColor: Colors.transparent,
//                                 focusColor: Colors.transparent,
//                                 hoverColor: Colors.transparent,
//                                 highlightColor: Colors.transparent,
//                                 onTap: () async {
//                                   // Calculate time spent on current question (in seconds)
//                                   int timeSpentOnQuestion = 0;
//                                   if (_model.questionStartTimeMs != null) {
//                                     timeSpentOnQuestion = ((_model.timerMilliseconds - _model.questionStartTimeMs!) / 1000).round();
//                                   }
//
//                                   print('=== CONTINUE BUTTON TAPPED ===');
//                                   print('Current timer value: ${_model.timerMilliseconds} ms');
//                                   print('Question start timeee: ${_model.questionStartTimeMs} ms');
//                                   print('Time spent on question: $timeSpentOnQuestion seconds');
//                                   print('Current question index: ${_model.questionIndex}');
//                                   print('Current question number: ${_model.questionNo}');
//
//
//                                   _model.submitAnsRes = await DashboardGroup
//                                       .contestSubmitAnswersCall
//                                       .call(
//                                     authToken: FFAppState().authToken,
//                                     questionId: getJsonField(
//                                       DashboardGroup.contestQuestionCall
//                                           .questions(
//                                         (_model.apiResultglp?.jsonBody ??
//                                             ''),
//                                       )
//                                           ?.elementAtOrNull(
//                                           _model.questionIndex!),
//                                       r'''$.id''',
//                                     ),
//                                     optionId: _model.selectedId,
//                                     answer: _model.textController.text,
//                                     timeSpent: timeSpentOnQuestion,
//                                   );
//
//                                   if ((_model.submitAnsRes?.succeeded ??
//                                       true) ==
//                                       true) {
//                                     if (_model.questionNo ==
//                                         DashboardGroup.contestQuestionCall
//                                             .questions(
//                                           (_model.apiResultglp?.jsonBody ??
//                                               ''),
//                                         )
//                                             ?.length) {
//                                       context.goNamed(
//                                         ContestResultWidget.routeName,
//                                         queryParameters: {
//                                           'contestId': serializeParam(
//                                             widget!.contestId,
//                                             ParamType.int,
//                                           ),
//                                         }.withoutNulls,
//                                       );
//                                     } else {
//                                       _model.questionIndex =
//                                           _model.questionIndex! + 1;
//                                       _model.questionNo = _model.questionNo + 1;
//                                       _model.questionType = getJsonField(
//                                         DashboardGroup.contestQuestionCall
//                                             .questions(
//                                           (_model.apiResultglp?.jsonBody ??
//                                               ''),
//                                         )!
//                                             .elementAtOrNull(
//                                             _model.questionIndex!),
//                                         r'''$.type''',
//                                       );
//                                       _model.selectedIndex = -1;
//
//                                       // Set start time for next question using current timer value
//                                       _model.questionStartTimeMs = _model.timerMilliseconds;
//
//                                       safeSetState(() {});
//                                       safeSetState(() {
//                                         _model.textController?.clear();
//                                       });
//                                     }
//                                   } else {
//                                     ScaffoldMessenger.of(context).showSnackBar(
//                                       SnackBar(
//                                         content: Text(
//                                           getJsonField(
//                                             (_model.submitAnsRes?.jsonBody ??
//                                                 ''),
//                                             r'''$.message''',
//                                           ).toString(),
//                                           style: const TextStyle(
//                                             color: Colors.white,
//                                           ),
//                                         ),
//                                         duration: const Duration(milliseconds: 1550),
//                                         backgroundColor: Colors.black,
//                                       ),
//                                     );
//                                   }
//
//                                   safeSetState(() {});
//                                 },
//                                 child: wrapWithModel(
//                                   model: _model.gradientButtonCustomModel,
//                                   updateCallback: () => safeSetState(() {}),
//                                   child: Builder(builder: (_) {
//                                     return DebugFlutterFlowModelContext(
//                                       rootModel: _model.rootModel,
//                                       child: GradientButtonCustomWidget(
//                                         text: _model.questionNo ==
//                                             DashboardGroup
//                                                 .contestQuestionCall
//                                                 .questions(
//                                               (_model.apiResultglp
//                                                   ?.jsonBody ??
//                                                   ''),
//                                             )
//                                                 ?.length
//                                             ? 'Finish'
//                                             : 'Continue',
//                                       ),
//                                     );
//                                   }),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
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
import '/components/gradient_button_custom/gradient_button_custom_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/index.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'contest_question_model.dart';
export 'contest_question_model.dart';

class ContestQuestionWidget extends StatefulWidget {
  const ContestQuestionWidget({
    super.key,
    required this.contestId,
  });

  final int? contestId;

  static String routeName = 'ContestQuestion';
  static String routePath = '/contestQuestion';

  @override
  State<ContestQuestionWidget> createState() => _ContestQuestionWidgetState();
}

class _ContestQuestionWidgetState extends State<ContestQuestionWidget>
    with RouteAware {
  late ContestQuestionModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ContestQuestionModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.isLoading = true;
      safeSetState(() {});

      print('=== CONTEST STARTED ===');
      print('Contest ID: ${widget.contestId}');

      _model.apiResultglp = await DashboardGroup.contestQuestionCall.call(
        contestId: widget.contestId,
        authToken: FFAppState().authToken,
      );

      if ((_model.apiResultglp?.succeeded ?? true)) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              getJsonField(
                (_model.apiResultglp?.jsonBody ?? ''),
                r'''$.message''',
              ).toString(),
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
            duration: const Duration(milliseconds: 1750),
            backgroundColor: Colors.black,
          ),
        );

        // Start the timer
        _model.timerController.onStartTimer();

        print('=== TIMER STARTED ===');
        print('Timer initial value: ${_model.timerInitialTimeMs} ms');

        // Set start time for first question - wait a moment for timer to initialize
        await Future.delayed(const Duration(milliseconds: 100));
        _model.questionStartTimeMs = _model.timerMilliseconds;

        print('=== FIRST QUESTION LOADED ===');
        print('Question start time set to: ${_model.questionStartTimeMs} ms');
        print('Current timer value: ${_model.timerMilliseconds} ms');
        print('Question index: ${_model.questionIndex}');
        print('Question number: ${_model.questionNo}');

        _model.questionType = getJsonField(
          DashboardGroup.contestQuestionCall
              .questions(
            (_model.apiResultglp?.jsonBody ?? ''),
          )!
              .elementAtOrNull(_model.questionIndex!),
          r'''$.type''',
        );

        print('Question type: ${_model.questionType}');

        _model.isLoading = false;
        safeSetState(() {});
      } else {
        print('=== API CALL FAILED ===');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              getJsonField(
                (_model.apiResultglp?.jsonBody ?? ''),
                r'''$.message''',
              ).toString(),
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
            duration: const Duration(milliseconds: 1750),
            backgroundColor: Colors.black,
          ),
        );
      }
    });

    _model.textController ??= TextEditingController()
      ..addListener(() {
        debugLogWidgetClass(_model);
      });
    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    _model.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(ContestQuestionWidget oldWidget) {
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
        backgroundColor: FlutterFlowTheme.of(context).oposite,
        body: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                Theme.of(context).brightness == Brightness.dark
                    ? 'assets/images/forgotBg.png'
                    : 'assets/images/plain_whiteBg.png',
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            if (!_model.isLoading)
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 40.0, 16.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
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
                            boxShadow: const [
                              BoxShadow(
                                blurRadius: 4.0,
                                color: Color(0x335D4E4E),
                                offset: Offset(0.0, 2.0),
                              )
                            ],
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              print('=== BACK BUTTON PRESSED ===');
                              print('User exiting contest at question ${_model.questionNo}');
                              context.safePop();
                            },
                            child: Icon(
                              Icons.arrow_back_rounded,
                              color: FlutterFlowTheme.of(context).tertiary,
                              size: 24.0,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'Con',
                              style: FlutterFlowTheme.of(context)
                                  .customTextStyle1
                                  .override(
                                fontFamily: 'good times',
                                color: FlutterFlowTheme.of(context).tertiary,
                                fontSize: 24.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            Text(
                              't',
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
                            Text(
                              'est',
                              style: FlutterFlowTheme.of(context)
                                  .customTextStyle1
                                  .override(
                                fontFamily: 'good times',
                                color: FlutterFlowTheme.of(context).tertiary,
                                fontSize: 24.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                          child: Container(
                            width: 40.0,
                            height: 40.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).backBtnClr,
                              boxShadow: const [
                                BoxShadow(
                                  blurRadius: 4.0,
                                  color: Color(0x335D4E4E),
                                  offset: Offset(0.0, 2.0),
                                )
                              ],
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed(AboutScreenWidget.routeName);
                              },
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
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 25.0, 0.0, 10.0),
                      child: LinearPercentIndicator(
                        percent: (_model.questionIndex != null) &&
                            (DashboardGroup.contestQuestionCall.questions(
                              (_model.apiResultglp?.jsonBody ?? ''),
                            ) != null &&
                                (DashboardGroup.contestQuestionCall.questions(
                                  (_model.apiResultglp?.jsonBody ?? ''),
                                ))!.isNotEmpty)
                            ? getJsonField(
                          DashboardGroup.contestQuestionCall
                              .questions((_model.apiResultglp?.jsonBody ?? ''),)!
                              .elementAtOrNull(_model.questionIndex!),
                          r'''$.progress_value''',
                        )
                            : 0.0,
                        lineHeight: 8.0,
                        animation: true,
                        animateFromLastPercent: true,
                        progressColor: FlutterFlowTheme.of(context).lightPeach,
                        backgroundColor: (Theme.of(context).brightness == Brightness.dark) == true
                            ? const Color(0xFF39393D)
                            : const Color(0xFFE5E5E5),
                        barRadius: const Radius.circular(10.0),
                        padding: EdgeInsets.zero,
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'Questions',
                              style: FlutterFlowTheme.of(context).bodySmall.override(
                                font: GoogleFonts.poppins(),
                                color: FlutterFlowTheme.of(context).tertiary,
                                fontSize: 10.0,
                                letterSpacing: 0.0,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 2.0, 0.0),
                              child: Text(
                                _model.questionNo.toString(),
                                style: FlutterFlowTheme.of(context).bodySmall.override(
                                  font: GoogleFonts.poppins(),
                                  color: FlutterFlowTheme.of(context).tertiary,
                                  fontSize: 10.0,
                                  letterSpacing: 0.0,
                                ),
                              ),
                            ),
                            Text(
                              'of',
                              style: FlutterFlowTheme.of(context).bodySmall.override(
                                font: GoogleFonts.poppins(),
                                color: FlutterFlowTheme.of(context).tertiary,
                                fontSize: 10.0,
                                letterSpacing: 0.0,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 2.0, 0.0),
                              child: Text(
                                valueOrDefault<String>(
                                  DashboardGroup.contestQuestionCall
                                      .questions((_model.apiResultglp?.jsonBody ?? ''),)
                                      ?.length
                                      .toString(),
                                  '0',
                                ),
                                style: FlutterFlowTheme.of(context).bodySmall.override(
                                  font: GoogleFonts.poppins(),
                                  color: FlutterFlowTheme.of(context).tertiary,
                                  fontSize: 10.0,
                                  letterSpacing: 0.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: Align(
                            alignment: const AlignmentDirectional(1.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Opacity(
                                  opacity: 0.9,
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                                    child: Icon(
                                      Icons.timer_outlined,
                                      color: FlutterFlowTheme.of(context).tertiary,
                                      size: 18.0,
                                    ),
                                  ),
                                ),
                                FlutterFlowTimer(
                                  initialTime: _model.timerInitialTimeMs,
                                  getDisplayTime: (value) => StopWatchTimer.getDisplayTime(
                                    value,
                                    hours: false,
                                    milliSecond: false,
                                  ),
                                  controller: _model.timerController,
                                  updateStateInterval: const Duration(milliseconds: 1000),
                                  onChanged: (value, displayTime, shouldUpdate) {
                                    _model.timerMilliseconds = value;
                                    _model.timerValue = displayTime;
                                    if (shouldUpdate) safeSetState(() {});
                                  },
                                  textAlign: TextAlign.start,
                                  style: FlutterFlowTheme.of(context).titleMedium.override(
                                    font: GoogleFonts.poppins(),
                                    fontSize: 10.0,
                                    letterSpacing: 0.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 0.0),
                      child: Text(
                        (_model.questionIndex != null) &&
                            (DashboardGroup.contestQuestionCall.questions(
                              (_model.apiResultglp?.jsonBody ?? ''),
                            ) != null &&
                                (DashboardGroup.contestQuestionCall.questions(
                                  (_model.apiResultglp?.jsonBody ?? ''),
                                ))!.isNotEmpty)
                            ? getJsonField(
                          DashboardGroup.contestQuestionCall
                              .questions((_model.apiResultglp?.jsonBody ?? ''),)!
                              .elementAtOrNull(_model.questionIndex!),
                          r'''$.question''',
                        ).toString()
                            : 'No Question Available',
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).headlineLarge.override(
                          font: GoogleFonts.poppins(fontWeight: FontWeight.w600),
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    if (!_model.isLoading)
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                        child: Builder(
                          builder: (context) {
                            if (_model.questionType == 2) {
                              return Visibility(
                                visible: _model.questionType == 2,
                                child: Builder(
                                  builder: (context) {
                                    final options = getJsonField(
                                      DashboardGroup.contestQuestionCall
                                          .questions((_model.apiResultglp?.jsonBody ?? ''),)
                                          ?.elementAtOrNull(_model.questionIndex!),
                                      r'''$.options''',
                                    ).toList();

                                    return ListView.builder(
                                      padding: EdgeInsets.zero,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount: options.length,
                                      itemBuilder: (context, optionsIndex) {
                                        final optionsItem = options[optionsIndex];
                                        return Padding(
                                          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              print('=== OPTION SELECTED ===');
                                              print('Option index: $optionsIndex');
                                              print('Option ID: ${getJsonField(optionsItem, r'''$.id''')}');
                                              print('Option text: ${getJsonField(optionsItem, r'''$.options''')}');

                                              if (_model.selectedIndex == optionsIndex) {
                                                _model.selectedIndex = -1;
                                                _model.selectedId = null;
                                                print('Option deselected');
                                                safeSetState(() {});
                                              } else {
                                                _model.selectedIndex = optionsIndex;
                                                _model.selectedId = getJsonField(optionsItem, r'''$.id''');
                                                print('Option selected with ID: ${_model.selectedId}');
                                                safeSetState(() {});
                                              }
                                            },
                                            child: Container(
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                color: (Theme.of(context).brightness == Brightness.dark) == true
                                                    ? (_model.selectedIndex == optionsIndex
                                                    ? const Color(0xFF038500)
                                                    : const Color(0xFF1C1C22))
                                                    : (_model.selectedIndex == optionsIndex
                                                    ? const Color(0xFF038500)
                                                    : const Color(0xFFF0F0F0)),
                                                borderRadius: BorderRadius.circular(12.0),
                                                border: Border.all(
                                                  color: (Theme.of(context).brightness == Brightness.dark) == true
                                                      ? const Color(0xFF4E4E4E)
                                                      : const Color(0xFFC0C0C0),
                                                ),
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  if (_model.selectedIndex != optionsIndex)
                                                    Padding(
                                                      padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                                                      child: Container(
                                                        decoration: BoxDecoration(
                                                          color: (Theme.of(context).brightness == Brightness.dark) == true
                                                              ? const Color(0xFF39393D)
                                                              : const Color(0xFFE5E5E5),
                                                          shape: BoxShape.circle,
                                                          border: Border.all(
                                                            color:
                                                            (Theme.of(context).brightness == Brightness.dark) == true
                                                                ? const Color(0xFF4E4E4E)
                                                                : Colors.transparent,
                                                          ),
                                                        ),
                                                        child: Padding(
                                                          padding: const EdgeInsetsDirectional.fromSTEB(12.0, 5.0, 12.0, 5.0),
                                                          child: Text(
                                                            getJsonField(optionsItem, r'''$.lable''').toString(),
                                                            style: FlutterFlowTheme.of(context).titleLarge.override(
                                                              font: GoogleFonts.poppins(fontWeight: FontWeight.w600),
                                                              color: FlutterFlowTheme.of(context).tertiary,
                                                              letterSpacing: 0.0,
                                                              fontWeight: FontWeight.w600,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  if (_model.selectedIndex == optionsIndex)
                                                    Padding(
                                                      padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                                                      child: Container(
                                                        decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          shape: BoxShape.circle,
                                                          border: Border.all(color: Colors.white),
                                                        ),
                                                        child: const Padding(
                                                          padding: EdgeInsetsDirectional.fromSTEB(12.0, 5.0, 12.0, 5.0),
                                                          child: FaIcon(
                                                            FontAwesomeIcons.check,
                                                            color: Color(0xFF038500),
                                                            size: 20.0,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  Align(
                                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                                    child: Padding(
                                                      padding: const EdgeInsetsDirectional.fromSTEB(16.0, 15.0, 0.0, 15.0),
                                                      child: Text(
                                                        getJsonField(optionsItem, r'''$.options''').toString(),
                                                        style: FlutterFlowTheme.of(context).titleLarge.override(
                                                          font: GoogleFonts.poppins(),
                                                          letterSpacing: 0.0,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              );
                            } else {
                              return Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                                child: SizedBox(
                                  width: double.infinity,
                                  child: TextFormField(
                                    controller: _model.textController,
                                    focusNode: _model.textFieldFocusNode,
                                    autofocus: false,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      isDense: true,
                                      labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                        font: GoogleFonts.poppins(),
                                        letterSpacing: 0.0,
                                      ),
                                      hintText: 'Write answer here...',
                                      hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                        font: GoogleFonts.poppins(fontWeight: FontWeight.w300),
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w300,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Theme.of(context).brightness == Brightness.dark
                                              ? const Color(0x32FFFFFF)
                                              : const Color(0x33000000),
                                          width: 1.0,
                                        ),
                                        borderRadius: BorderRadius.circular(8.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Theme.of(context).brightness == Brightness.dark
                                              ? const Color(0x32FFFFFF)
                                              : const Color(0x33000000),
                                          width: 1.0,
                                        ),
                                        borderRadius: BorderRadius.circular(8.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context).error,
                                          width: 1.0,
                                        ),
                                        borderRadius: BorderRadius.circular(8.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context).error,
                                          width: 1.0,
                                        ),
                                        borderRadius: BorderRadius.circular(8.0),
                                      ),
                                      filled: true,
                                      fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                    ),
                                    style: FlutterFlowTheme.of(context).titleLarge.override(
                                      font: GoogleFonts.poppins(fontWeight: FontWeight.w600),
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    maxLines: 6,
                                    minLines: 6,
                                    cursorColor: FlutterFlowTheme.of(context).primaryText,
                                    enableInteractiveSelection: true,
                                    validator: _model.textControllerValidator.asValidator(context),
                                    onChanged: (value) {
                                      print('=== TEXT INPUT CHANGED ===');
                                      print('Answer text: $value');
                                      print('Answer length: ${value.length}');
                                    },
                                  ),
                                ),
                              );
                            }
                          },
                        ),
                      ),
                    Expanded(
                      child: Align(
                        alignment: const AlignmentDirectional(0.0, 1.0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 40.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              // Calculate time spent on current question (in seconds)
                              int timeSpentOnQuestion = 0;
                              if (_model.questionStartTimeMs != null) {
                                timeSpentOnQuestion = ((_model.timerMilliseconds - _model.questionStartTimeMs!) / 1000).round();
                              }

                              debugPrint('=== CONTINUE BUTTON TAPPED ===');
                              debugPrint('Current timer value: ${_model.timerMilliseconds} ms');
                              debugPrint('Question start time: ${_model.questionStartTimeMs} ms');
                              debugPrint('Time spent on question: $timeSpentOnQuestion seconds');
                              debugPrint('Current question index: ${_model.questionIndex}');
                              debugPrint('Current question number: ${_model.questionNo}');
                              debugPrint('Selected option ID: ${_model.selectedId}');
                              debugPrint('Text answer: "${_model.textController.text}"');
                              debugPrint('Question type: ${_model.questionType}');



                              // Print API request body data
                              var questionId = getJsonField(
                                DashboardGroup.contestQuestionCall.questions(
                                  (_model.apiResultglp?.jsonBody ?? ''),
                                )?.elementAtOrNull(_model.questionIndex!),
                                r'''$.id''',
                              );

                              debugPrint('=== API REQUEST BODY DATA ===');
                              debugPrint('Auth Token: ${FFAppState().authToken}');
                              debugPrint('Question ID: $questionId');
                              debugPrint('Option ID: ${_model.selectedId}');
                              debugPrint('Answer Text: ${_model.textController.text}');
                              debugPrint('Time Spent: $timeSpentOnQuestion seconds');
                              debugPrint('================================');

                              _model.submitAnsRes = await DashboardGroup
                                  .contestSubmitAnswersCall
                                  .call(
                                authToken: FFAppState().authToken,
                                questionId: questionId,
                                optionId: _model.selectedId,
                                answer: _model.textController.text,
                                timeSpent: timeSpentOnQuestion,
                              );

                              debugPrint('=== API CALL COMPLETED ===');
                              debugPrint('API success: ${_model.submitAnsRes?.succeeded}');
                              debugPrint('API response body: ${_model.submitAnsRes?.jsonBody}');
                              // Validate answer based on question type
                              bool hasAnswer = false;
                              if (_model.questionType == 2) {
                                // Multiple choice question
                                hasAnswer = _model.selectedId != null;
                                debugPrint('Multiple choice - Has answer: $hasAnswer');
                              } else {
                                // Text question
                                hasAnswer = _model.textController.text.trim().isNotEmpty;
                                debugPrint('Text question - Has answer: $hasAnswer');
                              }

                              if (!hasAnswer) {
                                debugPrint('=== NO ANSWER PROVIDED ===');
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      'Please provide an answer before continuing',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    duration: Duration(milliseconds: 2000),
                                    backgroundColor: Colors.red,
                                  ),
                                );
                                return;
                              }

                              debugPrint('=== SUBMITTING ANSWER ===');

                              _model.submitAnsRes = await DashboardGroup.contestSubmitAnswersCall.call(
                                authToken: FFAppState().authToken,
                                questionId: getJsonField(
                                  DashboardGroup.contestQuestionCall
                                      .questions((_model.apiResultglp?.jsonBody ?? ''),)
                                      ?.elementAtOrNull(_model.questionIndex!),
                                  r'''$.id''',
                                ),
                                optionId: _model.selectedId,
                                answer: _model.textController.text,
                                timeSpent: timeSpentOnQuestion,
                              );

                              debugPrint('=== API RESPONSE ===');
                              debugPrint('API call succeeded: ${_model.submitAnsRes?.succeeded}');
                              debugPrint('Response body: ${_model.submitAnsRes?.jsonBody}');

                              if ((_model.submitAnsRes?.succeeded ?? false) == true) {
                                debugPrint('=== ANSWER SUBMITTED SUCCESSFULLY ===');

                                // Check if this is the last question
                                int totalQuestions = DashboardGroup.contestQuestionCall
                                    .questions((_model.apiResultglp?.jsonBody ?? ''),)?.length ?? 0;
                                bool isLastQuestion = _model.questionNo == totalQuestions;

                                debugPrint('Is last question: $isLastQuestion (${_model.questionNo} of $totalQuestions)');

                                if (isLastQuestion) {
                                  debugPrint('=== CONTEST COMPLETED ===');
                                  debugPrint('Navigating to results page');
                                  context.goNamed(
                                    ContestResultWidget.routeName,
                                    queryParameters: {
                                      'contestId': serializeParam(widget.contestId, ParamType.int),
                                    }.withoutNulls,
                                  );
                                } else {
                                  debugPrint('=== MOVING TO NEXT QUESTION ===');

                                  // Move to next question
                                  _model.questionIndex = _model.questionIndex! + 1;
                                  _model.questionNo = _model.questionNo + 1;

                                  debugPrint('New question index: ${_model.questionIndex}');
                                  debugPrint('New question number: ${_model.questionNo}');

                                  // Get next question type
                                  _model.questionType = getJsonField(
                                    DashboardGroup.contestQuestionCall
                                        .questions((_model.apiResultglp?.jsonBody ?? ''),)!
                                        .elementAtOrNull(_model.questionIndex!),
                                    r'''$.type''',
                                  );

                                  debugPrint('Next question type: ${_model.questionType}');

                                  // Reset UI state
                                  _model.selectedIndex = -1;
                                  _model.selectedId = null;

                                  // Set start time for next question using current timer value
                                  _model.questionStartTimeMs = _model.timerMilliseconds;

                                  debugPrint('=== NEXT QUESTION SETUP ===');
                                  debugPrint('Next question start time: ${_model.questionStartTimeMs} ms');
                                  debugPrint('Reset selected index to: ${_model.selectedIndex}');
                                  debugPrint('Reset selected ID to: ${_model.selectedId}');

                                  safeSetState(() {});
                                  safeSetState(() {
                                    _model.textController?.clear();
                                  });

                                  debugPrint('UI state updated for next question');
                                }
                              } else {
                                debugPrint('=== ANSWER SUBMISSION FAILED ===');
                                String errorMessage = getJsonField(
                                  (_model.submitAnsRes?.jsonBody ?? ''),
                                  r'''$.message''',
                                ).toString();
                                debugPrint('Error message: $errorMessage');

                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      errorMessage,
                                      style: const TextStyle(color: Colors.white),
                                    ),
                                    duration: const Duration(milliseconds: 2000),
                                    backgroundColor: Colors.red,
                                  ),
                                );
                              }

                              safeSetState(() {});
                            },
                            child: Container(
                              decoration: const BoxDecoration(),
                              child: wrapWithModel(
                                model: _model.gradientButtonCustomModel,
                                updateCallback: () => safeSetState(() {}),
                                child: Builder(builder: (_) {
                                  return DebugFlutterFlowModelContext(
                                    rootModel: _model.rootModel,
                                    child: GradientButtonCustomWidget(
                                      text: _model.questionNo ==
                                          DashboardGroup.contestQuestionCall
                                              .questions((_model.apiResultglp?.jsonBody ?? ''),)?.length
                                          ? 'Finish'
                                          : 'Continue',
                                    ),
                                  );
                                }),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
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