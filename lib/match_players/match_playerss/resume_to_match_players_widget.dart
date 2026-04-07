// import 'package:vote_for_goat/match_players/match_playerss/resume_to_match_players_widget.dart';
//
// import '/components/button_small/button_small_widget.dart';
// import '/flutter_flow/flutter_flow_theme.dart';
// import '/flutter_flow/flutter_flow_util.dart';
// import '/flutter_flow/flutter_flow_widgets.dart';
// import 'dart:ui';
// import '/index.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:provider/provider.dart';
// import 'resume_to_match_players_model.dart';
// export 'resume_to_match_players_model.dart';
//
// class ResumeToMatchPlayersWidget extends StatefulWidget {
//   const ResumeToMatchPlayersWidget({super.key});
//
//   static String routeName = 'resumeToMatchPlayers';
//   static String routePath = '/resumeToMatchPlayers';
//
//   @override
//   State<ResumeToMatchPlayersWidget> createState() => _ResumeToMatchPlayersWidgetState();
// }
//
// class _ResumeToMatchPlayersWidgetState extends State<ResumeToMatchPlayersWidget>
//     with RouteAware {
//   late ResumeToMatchPlayersModel _model;
//
//   final scaffoldKey = GlobalKey<ScaffoldState>();
//
//   @override
//   void initState() {
//     super.initState();
//     _model = createModel(context, () => ResumeToMatchPlayersModel());
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
//   void didUpdateWidget(ResumeToMatchPlayersWidget oldWidget) {
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
//                     ? 'assets/images/homeBg.png'
//                     : 'assets/images/light_home_new.png',
//                 width: double.infinity,
//                 height: double.infinity,
//                 fit: BoxFit.fill,
//               ),
//             ),
//             Padding(
//               padding: EdgeInsetsDirectional.fromSTEB(
//                   0.0,
//                   valueOrDefault<double>(
//                     MediaQuery.sizeOf(context).height * 0.69,
//                     0.0,
//                   ),
//                   0.0,
//                   0.0),
//               child: Container(
//                 width: double.infinity,
//                 height: 500.0,
//                 child: Padding(
//                   padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 40.0),
//                   child: Column(
//                     mainAxisSize: MainAxisSize.max,
//                     children: [
//                       Padding(
//                         padding: const EdgeInsetsDirectional.fromSTEB(
//                             16.0, 0.0, 16.0, 0.0),
//                         child: Container(
//                           width: double.infinity,
//                           decoration: BoxDecoration(
//                             color: (Theme.of(context).brightness ==
//                                 Brightness.dark) ==
//                                 true
//                                 ? const Color(0x26FFFFFF)
//                                 : const Color(0xFFC2C4C2),
//                             boxShadow: [
//                               const BoxShadow(
//                                 blurRadius: 4.0,
//                                 color: Color(0x33000000),
//                                 offset: Offset(
//                                   0.0,
//                                   2.0,
//                                 ),
//                               )
//                             ],
//                             borderRadius: BorderRadius.circular(10.0),
//                           ),
//                           child: Column(
//                             mainAxisSize: MainAxisSize.max,
//                             children: [
//                               Padding(
//                                 padding: const EdgeInsetsDirectional.fromSTEB(
//                                     12.0, 16.0, 12.0, 16.0),
//                                 child: Text(
//
//                                 'To access the full functions of Vote The Goat, you need first to complete the Minions Association.\nIf you want to skip it, press the button Auto-Associate ',
//                                   textAlign: TextAlign.center,
//                                   style: FlutterFlowTheme.of(context)
//                                       .bodySmall
//                                       .override(
//                                     font: GoogleFonts.poppins(
//                                       fontWeight: FontWeight.w500,
//                                       fontStyle:
//                                       FlutterFlowTheme.of(context)
//                                           .bodySmall
//                                           .fontStyle,
//                                     ),
//                                     color: FlutterFlowTheme.of(context)
//                                         .tertiary,
//                                     fontSize: 14.0,
//                                     letterSpacing: 0.0,
//                                     fontWeight: FontWeight.w500,
//                                     fontStyle:
//                                     FlutterFlowTheme.of(context)
//                                         .bodySmall
//                                         .fontStyle,
//                                   ),
//                                 ),
//                               ),
//                               InkWell(
//                                 splashColor: Colors.transparent,
//                                 focusColor: Colors.transparent,
//                                 hoverColor: Colors.transparent,
//                                 highlightColor: Colors.transparent,
//                                 onTap: () async {
//                                   context.pushNamed(
//                                       MatchPlayerssWidget.routeName);
//                                 },
//                                 child: Container(
//                                   decoration: const BoxDecoration(),
//                                   child: Padding(
//                                     padding: const EdgeInsetsDirectional.fromSTEB(
//                                         0.0, 0.0, 0.0, 18.0),
//                                     child: wrapWithModel(
//                                       model: _model.buttonSmallModel,
//                                       updateCallback: () =>
//                                           safeSetState(() {}),
//                                       child: Builder(builder: (_) {
//                                         return DebugFlutterFlowModelContext(
//                                           rootModel: _model.rootModel,
//                                           child: const ButtonSmallWidget(
//                                             text: 'BACK TO MINIONS',
//                                             height: 28,
//                                             width: 150,
//                                             fontSize: 12,
//                                             textColor: Colors.white,
//                                           ),
//                                         );
//                                       }),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
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

import '/components/button_small/button_small_widget.dart';
import '/components/log_out/log_out_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'resume_to_match_players_model.dart';
export 'resume_to_match_players_model.dart';

class ResumeToMatchPlayersWidget extends StatefulWidget {
  const ResumeToMatchPlayersWidget({super.key});

  static String routeName = 'resumeToMatchPlayers';
  static String routePath = '/resumeToMatchPlayers';

  @override
  State<ResumeToMatchPlayersWidget> createState() => _ResumeToMatchPlayersWidgetState();
}

class _ResumeToMatchPlayersWidgetState extends State<ResumeToMatchPlayersWidget>
    with RouteAware {
  late ResumeToMatchPlayersModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ResumeToMatchPlayersModel());
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);

    _model.dispose();

    super.dispose();
  }

  @override
  void didUpdateWidget(ResumeToMatchPlayersWidget oldWidget) {
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
                    ? 'assets/images/homeBg.png'
                    : 'assets/images/light_home_new.png',
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.fill,
              ),
            ),
            // Logout icon positioned at top-right
            Positioned(
              top: MediaQuery.of(context).padding.top + 16,
              right: 16,
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  await showDialog(
                    context: context,
                    builder: (dialogContext) {
                      return Dialog(

                        elevation: 0,
                        insetPadding: EdgeInsets.zero,
                        backgroundColor: Colors.transparent,
                        alignment: const AlignmentDirectional(0.0, 0.0)
                            .resolve(Directionality.of(context)),
                        child: GestureDetector(
                          onTap: () => FocusScope.of(context).unfocus(),
                          child: const LogOutWidget(),
                        ),
                      );
                    },
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Icon(
                    Icons.logout,
                    color: FlutterFlowTheme.of(context).tertiary,
                    size: 24.0,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(
                  0.0,
                  valueOrDefault<double>(
                    MediaQuery.sizeOf(context).height * 0.69,
                    0.0,
                  ),
                  0.0,
                  0.0),
              child: SizedBox(
                width: double.infinity,
                height: 500.0,
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 40.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: (Theme.of(context).brightness ==
                                Brightness.dark) ==
                                true
                                ? const Color(0x26FFFFFF)
                                : const Color(0xFFC2C4C2),
                            boxShadow: const [
                              BoxShadow(
                                blurRadius: 4.0,
                                color: Color(0x33000000),
                                offset: Offset(
                                  0.0,
                                  2.0,
                                ),
                              )
                            ],
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    12.0, 16.0, 12.0, 16.0),
                                child: Text(
                                  'To access the full functions of Vote The Goat, you need first to complete the Minions Association.\nIf you want to skip it, press the button Auto-Associate',
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .override(
                                    font: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      fontStyle:
                                      FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context)
                                        .tertiary,
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    fontStyle:
                                    FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .fontStyle,
                                  ),
                                ),
                              ),
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pushNamed(
                                      MatchPlayerssWidget.routeName);
                                },
                                child: Container(
                                  decoration: const BoxDecoration(),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 18.0),
                                    child: wrapWithModel(
                                      model: _model.buttonSmallModel,
                                      updateCallback: () =>
                                          safeSetState(() {}),
                                      child: Builder(builder: (_) {
                                        return DebugFlutterFlowModelContext(
                                          rootModel: _model.rootModel,
                                          child: const ButtonSmallWidget(
                                            text: 'BACK TO MINIONS',
                                            height: 28,
                                            width: 150,
                                            fontSize: 12,
                                            textColor: Colors.white,
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
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
