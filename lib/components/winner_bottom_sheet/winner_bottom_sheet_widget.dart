// import '/backend/api_requests/api_calls.dart';
// import '/components/gradient_button_custom/gradient_button_custom_widget.dart';
// import '/flutter_flow/flutter_flow_theme.dart';
// import '/flutter_flow/flutter_flow_util.dart';
// import '/flutter_flow/flutter_flow_widgets.dart';
// import 'dart:ui';
// import '/index.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/scheduler.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:provider/provider.dart';
// import 'winner_bottom_sheet_model.dart';
// export 'winner_bottom_sheet_model.dart';
//
// class WinnerBottomSheetWidget extends StatefulWidget {
//   const WinnerBottomSheetWidget({
//     super.key,
//     required this.onContinuePress,
//   });
//
//   final Future Function()? onContinuePress;
//
//   @override
//   State<WinnerBottomSheetWidget> createState() =>
//       _WinnerBottomSheetWidgetState();
// }
//
// class _WinnerBottomSheetWidgetState extends State<WinnerBottomSheetWidget>
//     with RouteAware {
//   late WinnerBottomSheetModel _model;
//
//   @override
//   void setState(VoidCallback callback) {
//     super.setState(callback);
//     _model.onUpdate();
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     _model = createModel(context, () => WinnerBottomSheetModel());
//
//     // On component load action.
//     SchedulerBinding.instance.addPostFrameCallback((_) async {
//       _model.apiResult2kw = await DashboardGroup.minionPlayerScoreCall.call(
//         authToken: FFAppState().authToken,
//       );
//
//       if ((_model.apiResult2kw?.succeeded ?? true)) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text(
//               getJsonField(
//                 (_model.apiResult2kw?.jsonBody ?? ''),
//                 r'''$.message''',
//               ).toString(),
//               style: TextStyle(
//                 color: Colors.white,
//               ),
//             ),
//             duration: Duration(milliseconds: 1200),
//             backgroundColor: Colors.black,
//           ),
//         );
//       }
//     });
//   }
//
//   @override
//   void dispose() {
//     routeObserver.unsubscribe(this);
//
//     _model.maybeDispose();
//
//     super.dispose();
//   }
//
//   @override
//   void didUpdateWidget(WinnerBottomSheetWidget oldWidget) {
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
//     return Align(
//       alignment: AlignmentDirectional(0.0, 1.0),
//       child: Container(
//         width: double.infinity,
//         height: MediaQuery.sizeOf(context).height * 0.8,
//         decoration: BoxDecoration(
//           color: (Theme.of(context).brightness == Brightness.dark) == true
//               ? Color(0xFF1C1C22)
//               : Colors.white,
//           borderRadius: BorderRadius.circular(15.0),
//           border: Border.all(
//             color: Color(0xFF4E4E4E),
//           ),
//         ),
//         child: Align(
//           alignment: AlignmentDirectional(0.0, 1.0),
//           child: Padding(
//             padding: EdgeInsetsDirectional.fromSTEB(20.0, 25.0, 20.0, 25.0),
//             child: SingleChildScrollView(
//               child: Column(
//                 mainAxisSize: MainAxisSize.max,
//                 children: [
//                   Container(
//                     width: 70.0,
//                     height: 70.0,
//                     decoration: BoxDecoration(
//                       color: Color(0x5EDD7325),
//                       shape: BoxShape.circle,
//                     ),
//                     child: ClipRRect(
//                       borderRadius: BorderRadius.circular(8.0),
//                       child: Image.asset(
//                         Theme.of(context).brightness == Brightness.dark
//                             ? 'assets/images/badge.png'
//                             : 'assets/images/Achievement_1.png',
//                         fit: BoxFit.scaleDown,
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding:
//                         EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
//                     child: Text(
//                       'Here your result',
//                       style: FlutterFlowTheme.of(context).titleLarge.override(
//                             font: GoogleFonts.poppins(
//                               fontWeight: FontWeight.w600,
//                               fontStyle: FlutterFlowTheme.of(context)
//                                   .titleLarge
//                                   .fontStyle,
//                             ),
//                             fontSize: 22.0,
//                             letterSpacing: 0.0,
//                             fontWeight: FontWeight.w600,
//                             fontStyle: FlutterFlowTheme.of(context)
//                                 .titleLarge
//                                 .fontStyle,
//                           ),
//                     ),
//                   ),
//                   Row(
//                     mainAxisSize: MainAxisSize.max,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Padding(
//                         padding:
//                             EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
//                         child: Text(
//                           '2',
//                           style:
//                               FlutterFlowTheme.of(context).titleLarge.override(
//                                     font: GoogleFonts.poppins(
//                                       fontWeight: FontWeight.bold,
//                                       fontStyle: FlutterFlowTheme.of(context)
//                                           .titleLarge
//                                           .fontStyle,
//                                     ),
//                                     color: Color(0xFFDF7D35),
//                                     fontSize: 30.0,
//                                     letterSpacing: 0.0,
//                                     fontWeight: FontWeight.bold,
//                                     fontStyle: FlutterFlowTheme.of(context)
//                                         .titleLarge
//                                         .fontStyle,
//                                   ),
//                         ),
//                       ),
//                       Padding(
//                         padding:
//                             EdgeInsetsDirectional.fromSTEB(3.0, 12.0, 3.0, 0.0),
//                         child: Text(
//                           '/',
//                           style:
//                               FlutterFlowTheme.of(context).titleLarge.override(
//                                     font: GoogleFonts.poppins(
//                                       fontWeight: FontWeight.bold,
//                                       fontStyle: FlutterFlowTheme.of(context)
//                                           .titleLarge
//                                           .fontStyle,
//                                     ),
//                                     color: Color(0xFFDF7D35),
//                                     fontSize: 30.0,
//                                     letterSpacing: 0.0,
//                                     fontWeight: FontWeight.bold,
//                                     fontStyle: FlutterFlowTheme.of(context)
//                                         .titleLarge
//                                         .fontStyle,
//                                   ),
//                         ),
//                       ),
//                       Padding(
//                         padding:
//                             EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
//                         child: Text(
//                           '4',
//                           style:
//                               FlutterFlowTheme.of(context).titleLarge.override(
//                                     font: GoogleFonts.poppins(
//                                       fontWeight: FontWeight.bold,
//                                       fontStyle: FlutterFlowTheme.of(context)
//                                           .titleLarge
//                                           .fontStyle,
//                                     ),
//                                     color: Color(0xFFDF7D35),
//                                     fontSize: 30.0,
//                                     letterSpacing: 0.0,
//                                     fontWeight: FontWeight.bold,
//                                     fontStyle: FlutterFlowTheme.of(context)
//                                         .titleLarge
//                                         .fontStyle,
//                                   ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   Padding(
//                     padding:
//                         EdgeInsetsDirectional.fromSTEB(0.0, 14.0, 0.0, 0.0),
//                     child: Text(
//                       'Keep learning about the players\nhere your result',
//                       textAlign: TextAlign.center,
//                       style: FlutterFlowTheme.of(context).titleLarge.override(
//                             font: GoogleFonts.poppins(
//                               fontWeight: FlutterFlowTheme.of(context)
//                                   .titleLarge
//                                   .fontWeight,
//                               fontStyle: FlutterFlowTheme.of(context)
//                                   .titleLarge
//                                   .fontStyle,
//                             ),
//                             color: (Theme.of(context).brightness ==
//                                         Brightness.dark) ==
//                                     true
//                                 ? Color(0xA7FFFFFF)
//                                 : Color(0xA6000000),
//                             fontSize: 15.0,
//                             letterSpacing: 0.0,
//                             fontWeight: FlutterFlowTheme.of(context)
//                                 .titleLarge
//                                 .fontWeight,
//                             fontStyle: FlutterFlowTheme.of(context)
//                                 .titleLarge
//                                 .fontStyle,
//                           ),
//                     ),
//                   ),
//                   Padding(
//                     padding:
//                         EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
//                     child: Container(
//                       width: double.infinity,
//                       decoration: BoxDecoration(
//                         color: Color(0xFF038500),
//                         borderRadius: BorderRadius.circular(12.0),
//                         border: Border.all(
//                           color: Color(0xFF4E4E4E),
//                         ),
//                       ),
//                       child: Align(
//                         alignment: AlignmentDirectional(0.0, 0.0),
//                         child: Padding(
//                           padding: EdgeInsetsDirectional.fromSTEB(
//                               0.0, 15.0, 0.0, 15.0),
//                           child: Text(
//                             'Giannis Antetokounmpo',
//                             style: FlutterFlowTheme.of(context)
//                                 .titleLarge
//                                 .override(
//                                   font: GoogleFonts.poppins(
//                                     fontWeight: FlutterFlowTheme.of(context)
//                                         .titleLarge
//                                         .fontWeight,
//                                     fontStyle: FlutterFlowTheme.of(context)
//                                         .titleLarge
//                                         .fontStyle,
//                                   ),
//                                   color: Colors.white,
//                                   letterSpacing: 0.0,
//                                   fontWeight: FlutterFlowTheme.of(context)
//                                       .titleLarge
//                                       .fontWeight,
//                                   fontStyle: FlutterFlowTheme.of(context)
//                                       .titleLarge
//                                       .fontStyle,
//                                 ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding:
//                         EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
//                     child: Container(
//                       width: double.infinity,
//                       decoration: BoxDecoration(
//                         color: Color(0xFF038500),
//                         borderRadius: BorderRadius.circular(12.0),
//                         border: Border.all(
//                           color: Color(0xFF4E4E4E),
//                         ),
//                       ),
//                       child: Align(
//                         alignment: AlignmentDirectional(0.0, 0.0),
//                         child: Padding(
//                           padding: EdgeInsetsDirectional.fromSTEB(
//                               0.0, 15.0, 0.0, 15.0),
//                           child: Text(
//                             'Giannis Antetokounmpo',
//                             style: FlutterFlowTheme.of(context)
//                                 .titleLarge
//                                 .override(
//                                   font: GoogleFonts.poppins(
//                                     fontWeight: FlutterFlowTheme.of(context)
//                                         .titleLarge
//                                         .fontWeight,
//                                     fontStyle: FlutterFlowTheme.of(context)
//                                         .titleLarge
//                                         .fontStyle,
//                                   ),
//                                   color: Colors.white,
//                                   letterSpacing: 0.0,
//                                   fontWeight: FlutterFlowTheme.of(context)
//                                       .titleLarge
//                                       .fontWeight,
//                                   fontStyle: FlutterFlowTheme.of(context)
//                                       .titleLarge
//                                       .fontStyle,
//                                 ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding:
//                         EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
//                     child: Container(
//                       width: double.infinity,
//                       decoration: BoxDecoration(
//                         color: Color(0xFFEA1414),
//                         borderRadius: BorderRadius.circular(12.0),
//                         border: Border.all(
//                           color: Color(0xFF4E4E4E),
//                         ),
//                       ),
//                       child: Align(
//                         alignment: AlignmentDirectional(0.0, 0.0),
//                         child: Padding(
//                           padding: EdgeInsetsDirectional.fromSTEB(
//                               0.0, 15.0, 0.0, 15.0),
//                           child: Text(
//                             'Giannis Antetokounmpo',
//                             style: FlutterFlowTheme.of(context)
//                                 .titleLarge
//                                 .override(
//                                   font: GoogleFonts.poppins(
//                                     fontWeight: FlutterFlowTheme.of(context)
//                                         .titleLarge
//                                         .fontWeight,
//                                     fontStyle: FlutterFlowTheme.of(context)
//                                         .titleLarge
//                                         .fontStyle,
//                                   ),
//                                   color: Colors.white,
//                                   letterSpacing: 0.0,
//                                   fontWeight: FlutterFlowTheme.of(context)
//                                       .titleLarge
//                                       .fontWeight,
//                                   fontStyle: FlutterFlowTheme.of(context)
//                                       .titleLarge
//                                       .fontStyle,
//                                 ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding:
//                         EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
//                     child: Container(
//                       width: double.infinity,
//                       decoration: BoxDecoration(
//                         color: Color(0xFFEA1414),
//                         borderRadius: BorderRadius.circular(12.0),
//                         border: Border.all(
//                           color: Color(0xFF4E4E4E),
//                         ),
//                       ),
//                       child: Align(
//                         alignment: AlignmentDirectional(0.0, 0.0),
//                         child: Padding(
//                           padding: EdgeInsetsDirectional.fromSTEB(
//                               0.0, 15.0, 0.0, 15.0),
//                           child: Text(
//                             'Giannis Antetokounmpo',
//                             style: FlutterFlowTheme.of(context)
//                                 .titleLarge
//                                 .override(
//                                   font: GoogleFonts.poppins(
//                                     fontWeight: FlutterFlowTheme.of(context)
//                                         .titleLarge
//                                         .fontWeight,
//                                     fontStyle: FlutterFlowTheme.of(context)
//                                         .titleLarge
//                                         .fontStyle,
//                                   ),
//                                   color: Colors.white,
//                                   letterSpacing: 0.0,
//                                   fontWeight: FlutterFlowTheme.of(context)
//                                       .titleLarge
//                                       .fontWeight,
//                                   fontStyle: FlutterFlowTheme.of(context)
//                                       .titleLarge
//                                       .fontStyle,
//                                 ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   InkWell(
//                     splashColor: Colors.transparent,
//                     focusColor: Colors.transparent,
//                     hoverColor: Colors.transparent,
//                     highlightColor: Colors.transparent,
//                     onTap: () async {
//                       context.pushNamed(HomePageWidget.routeName);
//                     },
//                     child: Container(
//                       decoration: BoxDecoration(),
//                       child: Padding(
//                         padding: EdgeInsetsDirectional.fromSTEB(
//                             30.0, 25.0, 30.0, 0.0),
//                         child: wrapWithModel(
//                           model: _model.gradientButtonCustomModel,
//                           updateCallback: () => safeSetState(() {}),
//                           child: Builder(builder: (_) {
//                             return DebugFlutterFlowModelContext(
//                               rootModel: _model.rootModel,
//                               child: GradientButtonCustomWidget(
//                                 text: 'Continue',
//                               ),
//                             );
//                           }),
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
//     );
//   }
// }



import '../../nav/nav_widget.dart';
import '/backend/api_requests/api_calls.dart';
import '/components/gradient_button_custom/gradient_button_custom_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'winner_bottom_sheet_model.dart';
export 'winner_bottom_sheet_model.dart';

class WinnerBottomSheetWidget extends StatefulWidget {
  const WinnerBottomSheetWidget({
    super.key,
    required this.onContinuePress,
  });

  final Future Function()? onContinuePress;

  @override
  State<WinnerBottomSheetWidget> createState() =>
      _WinnerBottomSheetWidgetState();
}

class _WinnerBottomSheetWidgetState extends State<WinnerBottomSheetWidget>
    with RouteAware {
  late WinnerBottomSheetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WinnerBottomSheetModel());

    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.apiResult2kw = await DashboardGroup.minionPlayerScoreCall.call(
        authToken: FFAppState().authToken,
      );

      // Parse and store player results
      final results = getJsonField(
        (_model.apiResult2kw?.jsonBody ?? ''),
        r'''$.results''',
      ) as List<dynamic>?;

      if (results != null) {
        _model.playerResults = results.map((item) => {
          'name': item['name'],
          'isCorrect': item['isCorrect'],
        }).toList();
        setState(() {});
      }

      if ((_model.apiResult2kw?.succeeded ?? true)) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              getJsonField(
                (_model.apiResult2kw?.jsonBody ?? ''),
                r'''$.message''',
              ).toString(),
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            duration: Duration(milliseconds: 1200),
            backgroundColor: Colors.black,
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    _model.maybeDispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(WinnerBottomSheetWidget oldWidget) {
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

    return Align(
      alignment: AlignmentDirectional(0.0, 1.0),
      child: Container(
        width: double.infinity,
        height: MediaQuery.sizeOf(context).height * 0.8,
        decoration: BoxDecoration(
          color: (Theme.of(context).brightness == Brightness.dark) == true
              ? Color(0xFF1C1C22)
              : Colors.white,
          borderRadius: BorderRadius.circular(15.0),
          border: Border.all(
            color: Color(0xFF4E4E4E),
          ),
        ),
        child: Align(
          alignment: AlignmentDirectional(0.0, 1.0),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20.0, 25.0, 20.0, 25.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: 70.0,
                    height: 70.0,
                    decoration: BoxDecoration(
                      color: Color(0x5EDD7325),
                      shape: BoxShape.circle,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        Theme.of(context).brightness == Brightness.dark
                            ? 'assets/images/badge.png'
                            : 'assets/images/Achievement_1.png',
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                    EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                    child: Text(
                      'Here your result',
                      style: FlutterFlowTheme.of(context).titleLarge.override(
                        font: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontStyle: FlutterFlowTheme.of(context)
                              .titleLarge
                              .fontStyle,
                        ),
                        fontSize: 22.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w600,
                        fontStyle: FlutterFlowTheme.of(context)
                            .titleLarge
                            .fontStyle,
                      ),
                    ),
                  ),
                  // Example: Show total correct/total
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                        child: Text(
                          '${_model.playerResults.where((p) => p['isCorrect'] == true).length}',
                          style:
                          FlutterFlowTheme.of(context).titleLarge.override(
                            font: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .titleLarge
                                  .fontStyle,
                            ),
                            color: Color(0xFFDF7D35),
                            fontSize: 30.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.bold,
                            fontStyle: FlutterFlowTheme.of(context)
                                .titleLarge
                                .fontStyle,
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                        EdgeInsetsDirectional.fromSTEB(3.0, 12.0, 3.0, 0.0),
                        child: Text(
                          '/',
                          style:
                          FlutterFlowTheme.of(context).titleLarge.override(
                            font: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .titleLarge
                                  .fontStyle,
                            ),
                            color: Color(0xFFDF7D35),
                            fontSize: 30.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.bold,
                            fontStyle: FlutterFlowTheme.of(context)
                                .titleLarge
                                .fontStyle,
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                        child: Text(
                          '${_model.playerResults.length}',
                          style:
                          FlutterFlowTheme.of(context).titleLarge.override(
                            font: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .titleLarge
                                  .fontStyle,
                            ),
                            color: Color(0xFFDF7D35),
                            fontSize: 30.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.bold,
                            fontStyle: FlutterFlowTheme.of(context)
                                .titleLarge
                                .fontStyle,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                    EdgeInsetsDirectional.fromSTEB(0.0, 14.0, 0.0, 0.0),
                    child: Text(
                      'Keep learning about the players\nhere your result',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).titleLarge.override(
                        font: GoogleFonts.poppins(
                          fontWeight: FlutterFlowTheme.of(context)
                              .titleLarge
                              .fontWeight,
                          fontStyle: FlutterFlowTheme.of(context)
                              .titleLarge
                              .fontStyle,
                        ),
                        color: (Theme.of(context).brightness ==
                            Brightness.dark) ==
                            true
                            ? Color(0xA7FFFFFF)
                            : Color(0xA6000000),
                        fontSize: 15.0,
                        letterSpacing: 0.0,
                        fontWeight: FlutterFlowTheme.of(context)
                            .titleLarge
                            .fontWeight,
                        fontStyle: FlutterFlowTheme.of(context)
                            .titleLarge
                            .fontStyle,
                      ),
                    ),
                  ),
                  // Dynamic player results
                  ..._model.playerResults.map((player) {
                    final isCorrect = player['isCorrect'] == true;
                    return Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: isCorrect ? Color(0xFF038500) : Color(0xFFEA1414),
                          borderRadius: BorderRadius.circular(12.0),
                          border: Border.all(
                            color: Color(0xFF4E4E4E),
                          ),
                        ),
                        child: Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 15.0, 0.0, 15.0),
                            child: Text(
                              player['name'] ?? '',
                              style: FlutterFlowTheme.of(context)
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
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      // context.pushNamed(HomePageWidget.routeName);
                      context.goNamed(
                          NavWidget
                              .routeName);
                    },
                    child: Container(
                      decoration: BoxDecoration(),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            30.0, 25.0, 30.0, 0.0),
                        child: wrapWithModel(
                          model: _model.gradientButtonCustomModel,
                          updateCallback: () => safeSetState(() {}),
                          child: Builder(builder: (_) {
                            return DebugFlutterFlowModelContext(
                              rootModel: _model.rootModel,
                              child: GradientButtonCustomWidget(
                                text: 'Continue',
                              ),
                            );
                          }),
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
    );
  }
}