// // import '/backend/api_requests/api_calls.dart';
// // import '/flutter_flow/flutter_flow_theme.dart';
// // import '/flutter_flow/flutter_flow_timer.dart';
// // import '/flutter_flow/flutter_flow_util.dart';
// // import '/flutter_flow/flutter_flow_widgets.dart';
// // import 'dart:ui';
// // import '/custom_code/actions/index.dart' as actions;
// // import '/index.dart';
// // import 'package:pin_code_fields/pin_code_fields.dart';
// // import 'package:stop_watch_timer/stop_watch_timer.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter/scheduler.dart';
// // import 'package:flutter_spinkit/flutter_spinkit.dart';
// // import 'package:google_fonts/google_fonts.dart';
// // import 'package:provider/provider.dart';
// // import 'otp_model.dart';
// // export 'otp_model.dart';
// //
// // class OtpWidget extends StatefulWidget {
// //   const OtpWidget({
// //     super.key,
// //     required this.email,
// //     this.user,
// //   });
// //
// //   final String? email;
// //   final int? user;
// //
// //   static String routeName = 'otp';
// //   static String routePath = '/otp';
// //
// //   @override
// //   State<OtpWidget> createState() => _OtpWidgetState();
// // }
// //
// // class _OtpWidgetState extends State<OtpWidget> with RouteAware {
// //   late OtpModel _model;
// //
// //   final scaffoldKey = GlobalKey<ScaffoldState>();
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //     _model = createModel(context, () => OtpModel());
// //
// //     // On page load action.
// //     SchedulerBinding.instance.addPostFrameCallback((_) async {
// //       _model.fcmToken = await actions.getFcmToken();
// //       _model.deviceToken = _model.fcmToken!;
// //       safeSetState(() {});
// //       _model.timerController.onStartTimer();
// //     });
// //
// //     _model.pinCodeFocusNode ??= FocusNode();
// //
// //     WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
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
// //   void didUpdateWidget(OtpWidget oldWidget) {
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
// //     return GestureDetector(
// //       onTap: () {
// //         FocusScope.of(context).unfocus();
// //         FocusManager.instance.primaryFocus?.unfocus();
// //       },
// //       child: Scaffold(
// //         key: scaffoldKey,
// //         backgroundColor: FlutterFlowTheme.of(context).oposite,
// //         body: Stack(
// //           children: [
// //             Align(
// //               alignment: AlignmentDirectional(0.0, 0.0),
// //               child: ClipRRect(
// //                 borderRadius: BorderRadius.circular(8.0),
// //                 child: Image.asset(
// //                   Theme.of(context).brightness == Brightness.dark
// //                       ? 'assets/images/forgotBg.png'
// //                       : 'assets/images/plain_whiteBg.png',
// //                   width: double.infinity,
// //                   height: double.infinity,
// //                   fit: BoxFit.cover,
// //                 ),
// //               ),
// //             ),
// //             Padding(
// //               padding: EdgeInsetsDirectional.fromSTEB(16.0, 40.0, 16.0, 0.0),
// //               child: Column(
// //                 mainAxisSize: MainAxisSize.min,
// //                 crossAxisAlignment: CrossAxisAlignment.start,
// //                 children: [
// //                   Row(
// //                     mainAxisSize: MainAxisSize.max,
// //                     children: [
// //                       InkWell(
// //                         splashColor: Colors.transparent,
// //                         focusColor: Colors.transparent,
// //                         hoverColor: Colors.transparent,
// //                         highlightColor: Colors.transparent,
// //                         onTap: () async {
// //                           context.safePop();
// //                         },
// //                         child: Container(
// //                           width: 40.0,
// //                           height: 40.0,
// //                           decoration: BoxDecoration(
// //                             color: FlutterFlowTheme.of(context).oposite,
// //                             boxShadow: [
// //                               BoxShadow(
// //                                 blurRadius: 4.0,
// //                                 color: (Theme.of(context).brightness ==
// //                                             Brightness.dark) ==
// //                                         true
// //                                     ? Color(0xFF323131)
// //                                     : Colors.white,
// //                                 offset: Offset(
// //                                   0.0,
// //                                   2.0,
// //                                 ),
// //                               )
// //                             ],
// //                             borderRadius: BorderRadius.circular(12.0),
// //                             border: Border.all(
// //                               color: (Theme.of(context).brightness ==
// //                                           Brightness.dark) ==
// //                                       true
// //                                   ? Colors.transparent
// //                                   : Color(0xD5999999),
// //                             ),
// //                           ),
// //                           child: Icon(
// //                             Icons.arrow_back_rounded,
// //                             color: FlutterFlowTheme.of(context).tertiary,
// //                             size: 24.0,
// //                           ),
// //                         ),
// //                       ),
// //                       Expanded(
// //                         child: Padding(
// //                           padding: EdgeInsetsDirectional.fromSTEB(
// //                               0.0, 0.0, 24.0, 0.0),
// //                           child: SingleChildScrollView(
// //                             child: Column(
// //                               mainAxisSize: MainAxisSize.max,
// //                               mainAxisAlignment: MainAxisAlignment.center,
// //                               crossAxisAlignment: CrossAxisAlignment.center,
// //                               children: [
// //                                 Text(
// //                                   'OTP',
// //                                   style: FlutterFlowTheme.of(context)
// //                                       .customTextStyle1
// //                                       .override(
// //                                         fontFamily: 'good times',
// //                                         color: FlutterFlowTheme.of(context)
// //                                             .tertiary,
// //                                         fontSize: 24.0,
// //                                         letterSpacing: 0.0,
// //                                         fontWeight: FontWeight.normal,
// //                                       ),
// //                                 ),
// //                                 Text(
// //                                   'verification',
// //                                   style: FlutterFlowTheme.of(context)
// //                                       .customTextStyle1
// //                                       .override(
// //                                         fontFamily: 'good times',
// //                                         color: Color(0xFFEB6027),
// //                                         fontSize: 24.0,
// //                                         letterSpacing: 0.0,
// //                                         fontWeight: FontWeight.normal,
// //                                       ),
// //                                 ),
// //                               ],
// //                             ),
// //                           ),
// //                         ),
// //                       ),
// //                     ],
// //                   ),
// //                   Align(
// //                     alignment: AlignmentDirectional(0.0, 0.0),
// //                     child: Padding(
// //                       padding:
// //                           EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 0.0),
// //                       child: Text(
// //                         'Enter the code from the mail\nwe sent on your email',
// //                         textAlign: TextAlign.center,
// //                         style: FlutterFlowTheme.of(context)
// //                             .titleMedium
// //                             .override(
// //                               font: GoogleFonts.poppins(
// //                                 fontWeight: FlutterFlowTheme.of(context)
// //                                     .titleMedium
// //                                     .fontWeight,
// //                                 fontStyle: FlutterFlowTheme.of(context)
// //                                     .titleMedium
// //                                     .fontStyle,
// //                               ),
// //                               color: FlutterFlowTheme.of(context).lightWhite,
// //                               letterSpacing: 0.0,
// //                               fontWeight: FlutterFlowTheme.of(context)
// //                                   .titleMedium
// //                                   .fontWeight,
// //                               fontStyle: FlutterFlowTheme.of(context)
// //                                   .titleMedium
// //                                   .fontStyle,
// //                             ),
// //                       ),
// //                     ),
// //                   ),
// //                   Form(
// //                     key: _model.formKey,
// //                     autovalidateMode: AutovalidateMode.disabled,
// //                     child: Container(
// //                       width: double.infinity,
// //                       height: 110.0,
// //                       decoration: BoxDecoration(),
// //                       child: Opacity(
// //                         opacity: 0.7,
// //                         child: Padding(
// //                           padding: EdgeInsetsDirectional.fromSTEB(
// //                               0.0, 20.0, 0.0, 10.0),
// //                           child: PinCodeTextField(
// //                             autoDisposeControllers: false,
// //                             appContext: context,
// //                             length: 6,
// //                             textStyle: FlutterFlowTheme.of(context)
// //                                 .bodyLarge
// //                                 .override(
// //                                   font: GoogleFonts.bebasNeue(
// //                                     fontWeight: FlutterFlowTheme.of(context)
// //                                         .bodyLarge
// //                                         .fontWeight,
// //                                     fontStyle: FlutterFlowTheme.of(context)
// //                                         .bodyLarge
// //                                         .fontStyle,
// //                                   ),
// //                                   color: FlutterFlowTheme.of(context).tertiary,
// //                                   letterSpacing: 0.0,
// //                                   fontWeight: FlutterFlowTheme.of(context)
// //                                       .bodyLarge
// //                                       .fontWeight,
// //                                   fontStyle: FlutterFlowTheme.of(context)
// //                                       .bodyLarge
// //                                       .fontStyle,
// //                                 ),
// //                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                             enableActiveFill: false,
// //                             autoFocus: true,
// //                             focusNode: _model.pinCodeFocusNode,
// //                             enablePinAutofill: false,
// //                             errorTextSpace: 16.0,
// //                             showCursor: true,
// //                             cursorColor: FlutterFlowTheme.of(context).primary,
// //                             obscureText: false,
// //                             hintCharacter: '-',
// //                             keyboardType: TextInputType.number,
// //                             pinTheme: PinTheme(
// //                               fieldHeight: 50.0,
// //                               fieldWidth: 50.0,
// //                               borderWidth: 1.0,
// //                               borderRadius: BorderRadius.only(
// //                                 bottomLeft: Radius.circular(8.0),
// //                                 bottomRight: Radius.circular(8.0),
// //                                 topLeft: Radius.circular(8.0),
// //                                 topRight: Radius.circular(8.0),
// //                               ),
// //                               shape: PinCodeFieldShape.box,
// //                               activeColor: FlutterFlowTheme.of(context).peach,
// //                               inactiveColor: Color(0x4EB4B3B3),
// //                               selectedColor:
// //                                   FlutterFlowTheme.of(context).primary,
// //                             ),
// //                             controller: _model.pinCodeController,
// //                             onChanged: (_) {},
// //                             autovalidateMode: AutovalidateMode.disabled,
// //                             validator: _model.pinCodeControllerValidator
// //                                 .asValidator(context),
// //                           ),
// //                         ),
// //                       ),
// //                     ),
// //                   ),
// //                   Padding(
// //                     padding:
// //                         EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
// //                     child: Container(
// //                       width: double.infinity,
// //                       height: 47.0,
// //                       decoration: BoxDecoration(
// //                         gradient: LinearGradient(
// //                           colors: [
// //                             FlutterFlowTheme.of(context).peach,
// //                             Color(0xFFE09B6E)
// //                           ],
// //                           stops: [0.0, 1.0],
// //                           begin: AlignmentDirectional(0.0, -1.0),
// //                           end: AlignmentDirectional(0, 1.0),
// //                         ),
// //                         borderRadius: BorderRadius.circular(12.0),
// //                       ),
// //                       child: Padding(
// //                         padding:
// //                             EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 0.0),
// //                         child: FFButtonWidget(
// //                           onPressed: () async {
// //                             var _shouldSetState = false;
// //                             _model.validate = true;
// //                             if (_model.formKey.currentState == null ||
// //                                 !_model.formKey.currentState!.validate()) {
// //                               safeSetState(() => _model.validate = false);
// //                               return;
// //                             }
// //                             _shouldSetState = true;
// //                             if (_model.validate == true) {
// //                               if (FFAppState().navigationType.toString() ==
// //                                   '2') {
// //                                 _model.forgotRes =
// //                                     await AuthGroup.forgotOtpVerifyCall.call(
// //                                   otp: int.tryParse(
// //                                       _model.pinCodeController!.text),
// //                                   userId: widget!.user,
// //                                 );
// //
// //                                 _shouldSetState = true;
// //                                 if ((_model.forgotRes?.succeeded ?? true) ==
// //                                     true) {
// //                                   ScaffoldMessenger.of(context).showSnackBar(
// //                                     SnackBar(
// //                                       content: Text(
// //                                         getJsonField(
// //                                           (_model.forgotRes?.jsonBody ?? ''),
// //                                           r'''$.message''',
// //                                         ).toString(),
// //                                         style: FlutterFlowTheme.of(context)
// //                                             .titleMedium
// //                                             .override(
// //                                               font: GoogleFonts.poppins(
// //                                                 fontWeight:
// //                                                     FlutterFlowTheme.of(context)
// //                                                         .titleMedium
// //                                                         .fontWeight,
// //                                                 fontStyle:
// //                                                     FlutterFlowTheme.of(context)
// //                                                         .titleMedium
// //                                                         .fontStyle,
// //                                               ),
// //                                               color: Colors.white,
// //                                               letterSpacing: 0.0,
// //                                               fontWeight:
// //                                                   FlutterFlowTheme.of(context)
// //                                                       .titleMedium
// //                                                       .fontWeight,
// //                                               fontStyle:
// //                                                   FlutterFlowTheme.of(context)
// //                                                       .titleMedium
// //                                                       .fontStyle,
// //                                             ),
// //                                       ),
// //                                       duration: Duration(milliseconds: 4000),
// //                                       backgroundColor: Colors.black,
// //                                     ),
// //                                   );
// //                                 } else {
// //                                   ScaffoldMessenger.of(context).showSnackBar(
// //                                     SnackBar(
// //                                       content: Text(
// //                                         getJsonField(
// //                                           (_model.forgotRes?.jsonBody ?? ''),
// //                                           r'''$.message''',
// //                                         ).toString(),
// //                                         style: FlutterFlowTheme.of(context)
// //                                             .titleMedium
// //                                             .override(
// //                                               font: GoogleFonts.poppins(
// //                                                 fontWeight:
// //                                                     FlutterFlowTheme.of(context)
// //                                                         .titleMedium
// //                                                         .fontWeight,
// //                                                 fontStyle:
// //                                                     FlutterFlowTheme.of(context)
// //                                                         .titleMedium
// //                                                         .fontStyle,
// //                                               ),
// //                                               color: Colors.white,
// //                                               letterSpacing: 0.0,
// //                                               fontWeight:
// //                                                   FlutterFlowTheme.of(context)
// //                                                       .titleMedium
// //                                                       .fontWeight,
// //                                               fontStyle:
// //                                                   FlutterFlowTheme.of(context)
// //                                                       .titleMedium
// //                                                       .fontStyle,
// //                                             ),
// //                                       ),
// //                                       duration: Duration(milliseconds: 4000),
// //                                       backgroundColor: Colors.black,
// //                                     ),
// //                                   );
// //                                   if (_shouldSetState) safeSetState(() {});
// //                                   return;
// //                                 }
// //
// //                                 context.goNamed(
// //                                   ChangePasswordWidget.routeName,
// //                                   queryParameters: {
// //                                     'userId': serializeParam(
// //                                       widget!.user,
// //                                       ParamType.int,
// //                                     ),
// //                                   }.withoutNulls,
// //                                 );
// //
// //                                 FFAppState().navigationType = 1;
// //                               } else {
// //                                 _model.verifyResponse =
// //                                     await AuthGroup.otpVerifyCall.call(
// //                                   email: widget!.email,
// //                                   otp: int.tryParse(
// //                                       _model.pinCodeController!.text),
// //                                   fcmToken: _model.deviceToken,
// //                                 );
// //
// //                                 _shouldSetState = true;
// //                                 if ((_model.verifyResponse?.succeeded ??
// //                                         true) ==
// //                                     true) {
// //                                   ScaffoldMessenger.of(context).showSnackBar(
// //                                     SnackBar(
// //                                       content: Text(
// //                                         getJsonField(
// //                                           (_model.verifyResponse?.jsonBody ??
// //                                               ''),
// //                                           r'''$.message''',
// //                                         ).toString(),
// //                                         style: FlutterFlowTheme.of(context)
// //                                             .titleMedium
// //                                             .override(
// //                                               font: GoogleFonts.poppins(
// //                                                 fontWeight:
// //                                                     FlutterFlowTheme.of(context)
// //                                                         .titleMedium
// //                                                         .fontWeight,
// //                                                 fontStyle:
// //                                                     FlutterFlowTheme.of(context)
// //                                                         .titleMedium
// //                                                         .fontStyle,
// //                                               ),
// //                                               color: Colors.white,
// //                                               letterSpacing: 0.0,
// //                                               fontWeight:
// //                                                   FlutterFlowTheme.of(context)
// //                                                       .titleMedium
// //                                                       .fontWeight,
// //                                               fontStyle:
// //                                                   FlutterFlowTheme.of(context)
// //                                                       .titleMedium
// //                                                       .fontStyle,
// //                                             ),
// //                                       ),
// //                                       duration: Duration(milliseconds: 4000),
// //                                       backgroundColor: Colors.black,
// //                                     ),
// //                                   );
// //                                   safeSetState(() {
// //                                     _model.pinCodeController?.clear();
// //                                   });
// //                                   FFAppState().authToken = getJsonField(
// //                                     (_model.verifyResponse?.jsonBody ?? ''),
// //                                     r'''$.token''',
// //                                   ).toString();
// //                                   safeSetState(() {});
// //                                 } else {
// //                                   ScaffoldMessenger.of(context).showSnackBar(
// //                                     SnackBar(
// //                                       content: Text(
// //                                         getJsonField(
// //                                           (_model.verifyResponse?.jsonBody ??
// //                                               ''),
// //                                           r'''$.message''',
// //                                         ).toString(),
// //                                         style: FlutterFlowTheme.of(context)
// //                                             .titleMedium
// //                                             .override(
// //                                               font: GoogleFonts.poppins(
// //                                                 fontWeight:
// //                                                     FlutterFlowTheme.of(context)
// //                                                         .titleMedium
// //                                                         .fontWeight,
// //                                                 fontStyle:
// //                                                     FlutterFlowTheme.of(context)
// //                                                         .titleMedium
// //                                                         .fontStyle,
// //                                               ),
// //                                               color: Colors.white,
// //                                               letterSpacing: 0.0,
// //                                               fontWeight:
// //                                                   FlutterFlowTheme.of(context)
// //                                                       .titleMedium
// //                                                       .fontWeight,
// //                                               fontStyle:
// //                                                   FlutterFlowTheme.of(context)
// //                                                       .titleMedium
// //                                                       .fontStyle,
// //                                             ),
// //                                       ),
// //                                       duration: Duration(milliseconds: 4000),
// //                                       backgroundColor: Colors.black,
// //                                     ),
// //                                   );
// //                                   if (_shouldSetState) safeSetState(() {});
// //                                   return;
// //                                 }
// //
// //                                 context.goNamed(HomeOnboardingWidget.routeName);
// //
// //                                 if (_shouldSetState) safeSetState(() {});
// //                                 return;
// //                               }
// //
// //                               if (_shouldSetState) safeSetState(() {});
// //                               return;
// //                             } else {
// //                               if (_shouldSetState) safeSetState(() {});
// //                               return;
// //                             }
// //
// //                             if (_shouldSetState) safeSetState(() {});
// //                           },
// //                           text: 'Verify',
// //                           options: FFButtonOptions(
// //                             width: double.infinity,
// //                             height: 47.0,
// //                             padding: EdgeInsetsDirectional.fromSTEB(
// //                                 16.0, 0.0, 16.0, 0.0),
// //                             iconPadding: EdgeInsetsDirectional.fromSTEB(
// //                                 0.0, 10.0, 0.0, 0.0),
// //                             color: Color(0x00CD4A20),
// //                             textStyle: FlutterFlowTheme.of(context)
// //                                 .titleLarge
// //                                 .override(
// //                                   font: GoogleFonts.poppins(
// //                                     fontWeight: FlutterFlowTheme.of(context)
// //                                         .titleLarge
// //                                         .fontWeight,
// //                                     fontStyle: FlutterFlowTheme.of(context)
// //                                         .titleLarge
// //                                         .fontStyle,
// //                                   ),
// //                                   color: Colors.white,
// //                                   letterSpacing: 0.0,
// //                                   fontWeight: FlutterFlowTheme.of(context)
// //                                       .titleLarge
// //                                       .fontWeight,
// //                                   fontStyle: FlutterFlowTheme.of(context)
// //                                       .titleLarge
// //                                       .fontStyle,
// //                                 ),
// //                             elevation: 0.0,
// //                             borderRadius: BorderRadius.circular(8.0),
// //                           ),
// //                         ),
// //                       ),
// //                     ),
// //                   ),
// //                   Row(
// //                     mainAxisSize: MainAxisSize.max,
// //                     mainAxisAlignment: MainAxisAlignment.center,
// //                     crossAxisAlignment: CrossAxisAlignment.end,
// //                     children: [
// //                       Align(
// //                         alignment: AlignmentDirectional(0.0, 0.0),
// //                         child: Padding(
// //                           padding: EdgeInsetsDirectional.fromSTEB(
// //                               0.0, 16.0, 0.0, 0.0),
// //                           child: Text(
// //                             'Resend OTP in ',
// //                             style: FlutterFlowTheme.of(context)
// //                                 .titleMedium
// //                                 .override(
// //                                   font: GoogleFonts.poppins(
// //                                     fontWeight: FlutterFlowTheme.of(context)
// //                                         .titleMedium
// //                                         .fontWeight,
// //                                     fontStyle: FlutterFlowTheme.of(context)
// //                                         .titleMedium
// //                                         .fontStyle,
// //                                   ),
// //                                   color:
// //                                       FlutterFlowTheme.of(context).lightWhite,
// //                                   letterSpacing: 0.0,
// //                                   fontWeight: FlutterFlowTheme.of(context)
// //                                       .titleMedium
// //                                       .fontWeight,
// //                                   fontStyle: FlutterFlowTheme.of(context)
// //                                       .titleMedium
// //                                       .fontStyle,
// //                                 ),
// //                           ),
// //                         ),
// //                       ),
// //                       Align(
// //                         alignment: AlignmentDirectional(0.0, 0.0),
// //                         child: FlutterFlowTimer(
// //                           initialTime: _model.timerInitialTimeMs,
// //                           getDisplayTime: (value) =>
// //                               StopWatchTimer.getDisplayTime(
// //                             value,
// //                             hours: false,
// //                             milliSecond: false,
// //                           ),
// //                           controller: _model.timerController,
// //                           updateStateInterval: Duration(milliseconds: 1000),
// //                           onChanged: (value, displayTime, shouldUpdate) {
// //                             _model.timerMilliseconds = value;
// //                             _model.timerValue = displayTime;
// //                             if (shouldUpdate) safeSetState(() {});
// //                           },
// //                           textAlign: TextAlign.start,
// //                           style: FlutterFlowTheme.of(context)
// //                               .headlineSmall
// //                               .override(
// //                                 font: GoogleFonts.poppins(
// //                                   fontWeight: FontWeight.normal,
// //                                   fontStyle: FlutterFlowTheme.of(context)
// //                                       .headlineSmall
// //                                       .fontStyle,
// //                                 ),
// //                                 color: FlutterFlowTheme.of(context).lightWhite,
// //                                 fontSize: 15.0,
// //                                 letterSpacing: 0.0,
// //                                 fontWeight: FontWeight.normal,
// //                                 fontStyle: FlutterFlowTheme.of(context)
// //                                     .headlineSmall
// //                                     .fontStyle,
// //                               ),
// //                         ),
// //                       ),
// //                     ],
// //                   ),
// //                 ],
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
//
//
//
// ///2
// import '/backend/api_requests/api_calls.dart';
// import '/flutter_flow/flutter_flow_theme.dart';
// import '/flutter_flow/flutter_flow_timer.dart';
// import '/flutter_flow/flutter_flow_util.dart';
// import '/flutter_flow/flutter_flow_widgets.dart';
// import 'dart:ui';
// import '/custom_code/actions/index.dart' as actions;
// import '/index.dart';
// import 'package:pin_code_fields/pin_code_fields.dart';
// import 'package:stop_watch_timer/stop_watch_timer.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/scheduler.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:provider/provider.dart';
// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'otp_model.dart';
// export 'otp_model.dart';
//
// class OtpWidget extends StatefulWidget {
//   const OtpWidget({
//     super.key,
//     required this.email,
//     this.user,
//   });
//
//   final String? email;
//   final int? user;
//
//   static String routeName = 'otp';
//   static String routePath = '/otp';
//
//   @override
//   State<OtpWidget> createState() => _OtpWidgetState();
// }
//
// class _OtpWidgetState extends State<OtpWidget> with RouteAware {
//   late OtpModel _model;
//   final scaffoldKey = GlobalKey<ScaffoldState>();
//
//   bool _showResend = false;
//   bool _isResending = false;
//
//   @override
//   void initState() {
//     super.initState();
//     _model = createModel(context, () => OtpModel());
//
//     SchedulerBinding.instance.addPostFrameCallback((_) async {
//       _model.fcmToken = await actions.getFcmToken();
//       _model.deviceToken = _model.fcmToken!;
//       safeSetState(() {});
//       _model.timerController.onStartTimer();
//     });
//
//     _model.pinCodeFocusNode ??= FocusNode();
//   }
//
//   @override
//   void dispose() {
//     routeObserver.unsubscribe(this);
//     _model.dispose();
//     super.dispose();
//   }
//
//   Future<void> _resendOtp() async {
//     if (widget.email == null) return;
//     setState(() {
//       _isResending = true;
//     });
//
//     try {
//       final response = await http.post(
//         Uri.parse('https://votethegoat.ezxdemo.com/api/resend-otp'),
//         headers: {'Content-Type': 'application/json'},
//         body: jsonEncode({'email': widget.email}),
//       );
//
//       if (response.statusCode == 200) {
//         final data = jsonDecode(response.body);
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text(data['message'] ?? 'OTP resent successfully'),
//             backgroundColor: Colors.green,
//           ),
//         );
//
//         _model.timerController.onResetTimer();
//         _model.timerController.onStartTimer();
//         setState(() {
//           _showResend = false;
//         });
//       } else {
//         final data = jsonDecode(response.body);
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text(data['message'] ?? 'Failed to resend OTP'),
//             backgroundColor: Colors.red,
//           ),
//         );
//       }
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text('Something went wrong. Please try again.'),
//           backgroundColor: Colors.red,
//         ),
//       );
//     } finally {
//       setState(() {
//         _isResending = false;
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     context.watch<FFAppState>();
//
//     return GestureDetector(
//       onTap: () {
//         FocusScope.of(context).unfocus();
//       },
//       child: Scaffold(
//         key: scaffoldKey,
//         backgroundColor: FlutterFlowTheme.of(context).oposite,
//         body: Stack(
//           children: [
//             Align(
//               alignment: AlignmentDirectional(0.0, 0.0),
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(8.0),
//                 child: Image.asset(
//                   Theme.of(context).brightness == Brightness.dark
//                       ? 'assets/images/forgotBg.png'
//                       : 'assets/images/plain_whiteBg.png',
//                   width: double.infinity,
//                   height: double.infinity,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//             Padding(
//               padding:
//               const EdgeInsetsDirectional.fromSTEB(16.0, 40.0, 16.0, 0.0),
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // ======= Header =======
//                   Row(
//                     children: [
//                       InkWell(
//                         onTap: () => context.safePop(),
//                         child: Container(
//                           width: 40.0,
//                           height: 40.0,
//                           decoration: BoxDecoration(
//                             color: FlutterFlowTheme.of(context).oposite,
//                             borderRadius: BorderRadius.circular(12.0),
//                             border: Border.all(
//                               color: Theme.of(context).brightness ==
//                                   Brightness.dark
//                                   ? Colors.transparent
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
//                       const Spacer(),
//                       Column(
//                         children: [
//                           Text(
//                             'OTP',
//                             style: FlutterFlowTheme.of(context)
//                                 .customTextStyle1
//                                 .override(
//                               fontFamily: 'good times',
//                               color:
//                               FlutterFlowTheme.of(context).tertiary,
//                               fontSize: 24.0,
//                             ),
//                           ),
//                           Text(
//                             'verification',
//                             style: FlutterFlowTheme.of(context)
//                                 .customTextStyle1
//                                 .override(
//                               fontFamily: 'good times',
//                               color: const Color(0xFFEB6027),
//                               fontSize: 24.0,
//                             ),
//                           ),
//                         ],
//                       ),
//                       const Spacer(),
//                     ],
//                   ),
//
//                   // ======= Instruction =======
//                   Align(
//                     alignment: Alignment.center,
//                     child: Padding(
//                       padding:
//                       const EdgeInsetsDirectional.fromSTEB(0, 40.0, 0, 0),
//                       child: Text(
//                         'Enter the code from the mail\nwe sent to your email',
//                         textAlign: TextAlign.center,
//                         style: FlutterFlowTheme.of(context)
//                             .titleMedium
//                             .override(
//                           font: GoogleFonts.poppins(),
//                           color: FlutterFlowTheme.of(context).lightWhite,
//                         ),
//                       ),
//                     ),
//                   ),
//
//                   // ======= OTP Field =======
//                   Padding(
//                     padding:
//                     const EdgeInsetsDirectional.fromSTEB(0, 20.0, 0, 10.0),
//                     child: PinCodeTextField(
//                       appContext: context,
//                       length: 6,
//                       textStyle:
//                       FlutterFlowTheme.of(context).bodyLarge.override(
//                         font: GoogleFonts.bebasNeue(),
//                         color: FlutterFlowTheme.of(context).tertiary,
//                       ),
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       focusNode: _model.pinCodeFocusNode,
//                       controller: _model.pinCodeController,
//                       showCursor: true,
//                       cursorColor: FlutterFlowTheme.of(context).primary,
//                       keyboardType: TextInputType.number,
//                       pinTheme: PinTheme(
//                         fieldHeight: 50.0,
//                         fieldWidth: 50.0,
//                         borderRadius: BorderRadius.circular(8.0),
//                         shape: PinCodeFieldShape.box,
//                         activeColor: FlutterFlowTheme.of(context).peach,
//                         inactiveColor: const Color(0x4EB4B3B3),
//                         selectedColor: FlutterFlowTheme.of(context).primary,
//                       ),
//                       onChanged: (_) {},
//                     ),
//                   ),
//
//                   // ======= Verify Button =======
//                   Container(
//                     width: double.infinity,
//                     height: 47.0,
//                     decoration: BoxDecoration(
//                       gradient: LinearGradient(
//                         colors: [
//                           FlutterFlowTheme.of(context).peach,
//                           const Color(0xFFE09B6E)
//                         ],
//                         begin: Alignment.topCenter,
//                         end: Alignment.bottomCenter,
//                       ),
//                       borderRadius: BorderRadius.circular(12.0),
//                     ),
//                     child: FFButtonWidget(
//                       onPressed: () async {
//                         var _shouldSetState = false;
//                         _model.validate = true;
//                         if (_model.formKey.currentState == null ||
//                             !_model.formKey.currentState!.validate()) {
//                           safeSetState(() => _model.validate = false);
//                           return;
//                         }
//                         _shouldSetState = true;
//                         if (_model.validate == true) {
//                           if (FFAppState().navigationType.toString() == '2') {
//                             _model.forgotRes =
//                             await AuthGroup.forgotOtpVerifyCall.call(
//                               otp: int.tryParse(
//                                   _model.pinCodeController!.text),
//                               userId: widget.user,
//                             );
//
//                             _shouldSetState = true;
//                             if ((_model.forgotRes?.succeeded ?? true)) {
//                               ScaffoldMessenger.of(context).showSnackBar(
//                                 SnackBar(
//                                   content: Text(
//                                     getJsonField(
//                                       (_model.forgotRes?.jsonBody ?? ''),
//                                       r'''$.message''',
//                                     ).toString(),
//                                   ),
//                                   backgroundColor: Colors.black,
//                                 ),
//                               );
//                             } else {
//                               ScaffoldMessenger.of(context).showSnackBar(
//                                 SnackBar(
//                                   content: Text(
//                                     getJsonField(
//                                       (_model.forgotRes?.jsonBody ?? ''),
//                                       r'''$.message''',
//                                     ).toString(),
//                                   ),
//                                   backgroundColor: Colors.black,
//                                 ),
//                               );
//                               if (_shouldSetState) safeSetState(() {});
//                               return;
//                             }
//
//                             context.goNamed(
//                               ChangePasswordWidget.routeName,
//                               queryParameters: {
//                                 'userId': serializeParam(
//                                   widget.user,
//                                   ParamType.int,
//                                 ),
//                               }.withoutNulls,
//                             );
//                             FFAppState().navigationType = 1;
//                           } else {
//                             _model.verifyResponse =
//                             await AuthGroup.otpVerifyCall.call(
//                               email: widget.email,
//                               otp: int.tryParse(
//                                   _model.pinCodeController!.text),
//                               fcmToken: _model.deviceToken,
//                             );
//
//                             _shouldSetState = true;
//                             if ((_model.verifyResponse?.succeeded ?? true)) {
//                               ScaffoldMessenger.of(context).showSnackBar(
//                                 SnackBar(
//                                   content: Text(
//                                     getJsonField(
//                                       (_model.verifyResponse?.jsonBody ?? ''),
//                                       r'''$.message''',
//                                     ).toString(),
//                                   ),
//                                   backgroundColor: Colors.black,
//                                 ),
//                               );
//                               safeSetState(() {
//                                 _model.pinCodeController?.clear();
//                               });
//                               FFAppState().authToken = getJsonField(
//                                 (_model.verifyResponse?.jsonBody ?? ''),
//                                 r'''$.token''',
//                               ).toString();
//                               safeSetState(() {});
//                             } else {
//                               ScaffoldMessenger.of(context).showSnackBar(
//                                 SnackBar(
//                                   content: Text(
//                                     getJsonField(
//                                       (_model.verifyResponse?.jsonBody ?? ''),
//                                       r'''$.message''',
//                                     ).toString(),
//                                   ),
//                                   backgroundColor: Colors.black,
//                                 ),
//                               );
//                               if (_shouldSetState) safeSetState(() {});
//                               return;
//                             }
//
//                             context.goNamed(HomeOnboardingWidget.routeName);
//
//                             if (_shouldSetState) safeSetState(() {});
//                             return;
//                           }
//
//                           if (_shouldSetState) safeSetState(() {});
//                           return;
//                         } else {
//                           if (_shouldSetState) safeSetState(() {});
//                           return;
//                         }
//
//                         if (_shouldSetState) safeSetState(() {});
//                       },
//                       text: 'Verify',
//                       options: FFButtonOptions(
//                         width: double.infinity,
//                         height: 47.0,
//                         color: Colors.transparent,
//                         textStyle:
//                         FlutterFlowTheme.of(context).titleLarge.override(
//                           font: GoogleFonts.poppins(),
//                           color: Colors.white,
//                         ),
//                         elevation: 0.0,
//                         borderRadius: BorderRadius.circular(8.0),
//                       ),
//                     ),
//                   ),
//
//                   const SizedBox(height: 16),
//
//                   // ======= Timer or Resend =======
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       if (!_showResend) ...[
//                         Text(
//                           'Resend OTP in ',
//                           style: FlutterFlowTheme.of(context)
//                               .titleMedium
//                               .override(
//                             font: GoogleFonts.poppins(),
//                             color:
//                             FlutterFlowTheme.of(context).lightWhite,
//                           ),
//                         ),
//                         FlutterFlowTimer(
//                           initialTime: _model.timerInitialTimeMs,
//                           getDisplayTime: (value) =>
//                               StopWatchTimer.getDisplayTime(
//                                 value,
//                                 hours: false,
//                                 milliSecond: false,
//                               ),
//                           controller: _model.timerController,
//                           updateStateInterval:
//                           const Duration(milliseconds: 1000),
//                           onChanged:
//                               (value, displayTime, shouldUpdate) {
//                             _model.timerMilliseconds = value;
//                             _model.timerValue = displayTime;
//                             if (shouldUpdate) safeSetState(() {});
//                           },
//                           onEnded: () {
//                             setState(() {
//                               _showResend = true;
//                             });
//                           },
//                           textAlign: TextAlign.start,
//                           style: FlutterFlowTheme.of(context)
//                               .headlineSmall
//                               .override(
//                             font: GoogleFonts.poppins(),
//                             color:
//                             FlutterFlowTheme.of(context).lightWhite,
//                             fontSize: 15.0,
//                           ),
//                         ),
//                       ] else ...[
//                         InkWell(
//                           onTap: _isResending ? null : _resendOtp,
//                           child: Text(
//                             _isResending
//                                 ? 'Resending...'
//                                 : 'Resend OTP',
//                             style: FlutterFlowTheme.of(context)
//                                 .titleMedium
//                                 .override(
//                               font: GoogleFonts.poppins(
//                                 fontWeight: FontWeight.bold,
//                               ),
//                               color: FlutterFlowTheme.of(context).primary,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ],
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


///2
library;

import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'otp_model.dart';
export 'otp_model.dart';

class OtpWidget extends StatefulWidget {
  const OtpWidget({
    super.key,
    required this.email,
    this.user,
  });

  final String? email;
  final int? user;

  static String routeName = 'otp';
  static String routePath = '/otp';

  @override
  State<OtpWidget> createState() => _OtpWidgetState();
}

class _OtpWidgetState extends State<OtpWidget> with RouteAware {
  late OtpModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  bool _showResend = false;
  bool _isResending = false;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OtpModel());

    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.fcmToken = await actions.getFcmToken();
      _model.deviceToken = _model.fcmToken!;
      safeSetState(() {});
      _model.timerController.onStartTimer();
    });

    _model.pinCodeFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    _model.dispose();
    super.dispose();
  }

  Future<void> _resendOtp() async {
    if (widget.email == null) return;
    setState(() {
      _isResending = true;
    });

    try {
      final response = await http.post(
        Uri.parse('https://votethegoat.ezxdemo.com/api/resend-otp'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': widget.email}),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(data['message'] ?? 'OTP resent successfully'),
            backgroundColor: Colors.green,
          ),
        );

        _model.timerController.onResetTimer();
        _model.timerController.onStartTimer();
        setState(() {
          _showResend = false;
        });
      } else {
        final data = jsonDecode(response.body);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(data['message'] ?? 'Failed to resend OTP'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Something went wrong. Please try again.'),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      setState(() {
        _isResending = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).oposite,
        body: Stack(
          children: [
            Align(
              alignment: const AlignmentDirectional(0.0, 0.0),
              child: ClipRRect(
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
            ),
            Padding(
              padding:
              const EdgeInsetsDirectional.fromSTEB(16.0, 40.0, 16.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ======= Header =======
                  Row(
                    children: [
                      InkWell(
                        onTap: () => context.safePop(),
                        child: Container(
                          width: 40.0,
                          height: 40.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).oposite,
                            borderRadius: BorderRadius.circular(12.0),
                            border: Border.all(
                              color: Theme.of(context).brightness ==
                                  Brightness.dark
                                  ? Colors.transparent
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
                      const Spacer(),
                      Column(
                        children: [
                          Text(
                            'OTP',
                            style: FlutterFlowTheme.of(context)
                                .customTextStyle1
                                .override(
                              fontFamily: 'good times',
                              color:
                              FlutterFlowTheme.of(context).tertiary,
                              fontSize: 24.0,
                            ),
                          ),
                          Text(
                            'verification',
                            style: FlutterFlowTheme.of(context)
                                .customTextStyle1
                                .override(
                              fontFamily: 'good times',
                              color: const Color(0xFFEB6027),
                              fontSize: 24.0,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                    ],
                  ),

                  // ======= Instruction =======
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding:
                      const EdgeInsetsDirectional.fromSTEB(0, 40.0, 0, 0),
                      child: Text(
                        'Enter the code from the mail\nwe sent to your email',
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context)
                            .titleMedium
                            .override(
                          font: GoogleFonts.poppins(),
                          color: FlutterFlowTheme.of(context).lightWhite,
                        ),
                      ),
                    ),
                  ),

                  // ======= OTP Field =======
                  Padding(
                    padding:
                    const EdgeInsetsDirectional.fromSTEB(0, 20.0, 0, 10.0),
                    child: Form(
                      key: _model.formKey,

                      child: PinCodeTextField(
                        appContext: context,
                        length: 6,
                        textStyle:
                        FlutterFlowTheme.of(context).bodyLarge.override(
                          font: GoogleFonts.bebasNeue(),
                          color: FlutterFlowTheme.of(context).tertiary,
                        ),
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        focusNode: _model.pinCodeFocusNode,
                        controller: _model.pinCodeController,
                        showCursor: true,
                        cursorColor: FlutterFlowTheme.of(context).primary,
                        keyboardType: TextInputType.number,
                        pinTheme: PinTheme(
                          fieldHeight: 50.0,
                          fieldWidth: 50.0,
                          borderRadius: BorderRadius.circular(8.0),
                          shape: PinCodeFieldShape.box,
                          activeColor: FlutterFlowTheme.of(context).peach,
                          inactiveColor: const Color(0x4EB4B3B3),
                          selectedColor: FlutterFlowTheme.of(context).primary,
                        ),
                        onChanged: (_) {},
                      ),
                    ),
                  ),

                  // ======= Verify Button =======
                  Container(
                    width: double.infinity,
                    height: 47.0,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          FlutterFlowTheme.of(context).peach,
                          const Color(0xFFE09B6E)
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: FFButtonWidget(
                      onPressed: () async {
                        var shouldSetState = false;
                        _model.validate = true;
                        if (_model.formKey.currentState == null ||
                            !_model.formKey.currentState!.validate()) {
                          safeSetState(() => _model.validate = false);
                          return;
                        }
                        shouldSetState = true;
                        if (_model.validate == true) {
                          if (FFAppState().navigationType.toString() == '2') {
                            _model.forgotRes =
                            await AuthGroup.forgotOtpVerifyCall.call(
                              otp: int.tryParse(
                                  _model.pinCodeController!.text),
                              userId: widget.user,
                            );

                            shouldSetState = true;
                            if ((_model.forgotRes?.succeeded ?? true)) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    getJsonField(
                                      (_model.forgotRes?.jsonBody ?? ''),
                                      r'''$.message''',
                                    ).toString(),
                                  ),
                                  backgroundColor: Colors.black,
                                ),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    getJsonField(
                                      (_model.forgotRes?.jsonBody ?? ''),
                                      r'''$.message''',
                                    ).toString(),
                                  ),
                                  backgroundColor: Colors.black,
                                ),
                              );
                              if (shouldSetState) safeSetState(() {});
                              return;
                            }

                            context.goNamed(
                              ChangePasswordWidget.routeName,
                              queryParameters: {
                                'userId': serializeParam(
                                  widget.user,
                                  ParamType.int,
                                ),
                              }.withoutNulls,
                            );
                            FFAppState().navigationType = 1;
                          } else {
                            _model.verifyResponse =
                            await AuthGroup.otpVerifyCall.call(
                              email: widget.email,
                              otp: int.tryParse(
                                  _model.pinCodeController!.text),
                              fcmToken: _model.deviceToken,
                            );

                            shouldSetState = true;
                            if ((_model.verifyResponse?.succeeded ?? true)) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    getJsonField(
                                      (_model.verifyResponse?.jsonBody ?? ''),
                                      r'''$.message''',
                                    ).toString(),
                                  ),
                                  backgroundColor: Colors.black,
                                ),
                              );
                              safeSetState(() {
                                _model.pinCodeController?.clear();
                              });
                              FFAppState().authToken = getJsonField(
                                (_model.verifyResponse?.jsonBody ?? ''),
                                r'''$.token''',
                              ).toString();

                              print('Saved token: ${FFAppState().authToken}');
                              safeSetState(() {});
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    getJsonField(
                                      (_model.verifyResponse?.jsonBody ?? ''),
                                      r'''$.message''',
                                    ).toString(),
                                  ),
                                  backgroundColor: Colors.black,
                                ),
                              );
                              if (shouldSetState) safeSetState(() {});
                              return;
                            }

                            context.goNamed(HomeOnboardingWidget.routeName);

                            if (shouldSetState) safeSetState(() {});
                            return;
                          }

                          if (shouldSetState) safeSetState(() {});
                          return;
                        } else {
                          if (shouldSetState) safeSetState(() {});
                          return;
                        }

                        if (shouldSetState) safeSetState(() {});
                      },
                      text: 'Verify',
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 47.0,
                        color: Colors.transparent,
                        textStyle:
                        FlutterFlowTheme.of(context).titleLarge.override(
                          font: GoogleFonts.poppins(),
                          color: Colors.white,
                        ),
                        elevation: 0.0,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // ======= Timer or Resend =======
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (!_showResend) ...[
                        Text(
                          'Resend OTP in ',
                          style: FlutterFlowTheme.of(context)
                              .titleMedium
                              .override(
                            font: GoogleFonts.poppins(),
                            color:
                            FlutterFlowTheme.of(context).lightWhite,
                          ),
                        ),
                        FlutterFlowTimer(
                          initialTime: _model.timerInitialTimeMs,
                          getDisplayTime: (value) =>
                              StopWatchTimer.getDisplayTime(
                                value,
                                hours: false,
                                milliSecond: false,
                              ),
                          controller: _model.timerController,
                          updateStateInterval:
                          const Duration(milliseconds: 1000),
                          onChanged:
                              (value, displayTime, shouldUpdate) {
                            _model.timerMilliseconds = value;
                            _model.timerValue = displayTime;
                            if (shouldUpdate) safeSetState(() {});
                          },
                          onEnded: () {
                            setState(() {
                              _showResend = true;
                            });
                          },
                          textAlign: TextAlign.start,
                          style: FlutterFlowTheme.of(context)
                              .headlineSmall
                              .override(
                            font: GoogleFonts.poppins(),
                            color:
                            FlutterFlowTheme.of(context).lightWhite,
                            fontSize: 15.0,
                          ),
                        ),
                      ] else ...[
                        InkWell(
                          onTap: _isResending ? null : _resendOtp,
                          child: Text(
                            _isResending
                                ? 'Resending...'
                                : 'Resend OTP',
                            style: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                              font: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                              ),
                              color: FlutterFlowTheme.of(context).primary,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
