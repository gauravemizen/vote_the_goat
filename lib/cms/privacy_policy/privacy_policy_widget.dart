// import '/backend/api_requests/api_calls.dart';
// import '/flutter_flow/flutter_flow_theme.dart';
// import '/flutter_flow/flutter_flow_util.dart';
// import '/flutter_flow/flutter_flow_web_view.dart';
// import '/flutter_flow/flutter_flow_widgets.dart';
// import 'dart:ui';
// import '/custom_code/widgets/index.dart' as custom_widgets;
// import 'package:flutter/material.dart';
// import 'package:flutter/scheduler.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:provider/provider.dart';
// import 'privacy_policy_model.dart';
// export 'privacy_policy_model.dart';
//
// class PrivacyPolicyWidget extends StatefulWidget {
//   const PrivacyPolicyWidget({super.key});
//
//   static String routeName = 'privacyPolicy';
//   static String routePath = '/privacyPolicy';
//
//   @override
//   State<PrivacyPolicyWidget> createState() => _PrivacyPolicyWidgetState();
// }
//
// class _PrivacyPolicyWidgetState extends State<PrivacyPolicyWidget>
//     with RouteAware {
//   late PrivacyPolicyModel _model;
//
//   final scaffoldKey = GlobalKey<ScaffoldState>();
//
//   @override
//   void initState() {
//     super.initState();
//     _model = createModel(context, () => PrivacyPolicyModel());
//
//     // On page load action.
//     SchedulerBinding.instance.addPostFrameCallback((_) async {
//       _model.isLoading = true;
//       safeSetState(() {});
//       _model.apiResult48w = await DashboardGroup.privacypolicyCall.call();
//
//       safeSetState(() {});
//       _model.isLoading = false;
//       safeSetState(() {});
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
//   void didUpdateWidget(PrivacyPolicyWidget oldWidget) {
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
//             Padding(
//               padding: EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 0.0),
//               child: Column(
//                 mainAxisSize: MainAxisSize.max,
//                 children: [
//                   Padding(
//                     padding:
//                         EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
//                     child: Row(
//                       mainAxisSize: MainAxisSize.max,
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Container(
//                           width: 40.0,
//                           height: 40.0,
//                           decoration: BoxDecoration(
//                             color: FlutterFlowTheme.of(context).backBtnClr,
//                             boxShadow: [
//                               BoxShadow(
//                                 blurRadius: 4.0,
//                                 color: (Theme.of(context).brightness ==
//                                             Brightness.dark) ==
//                                         true
//                                     ? Color(0x335D4E4E)
//                                     : Colors.white,
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
//                                   ? Colors.transparent
//                                   : Color(0xD5999999),
//                             ),
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
//                         SingleChildScrollView(
//                           child: Column(
//                             mainAxisSize: MainAxisSize.max,
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Text(
//                                 'data &',
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
//                                 'Privacy',
//                                 style: FlutterFlowTheme.of(context)
//                                     .customTextStyle1
//                                     .override(
//                                       fontFamily: 'good times',
//                                       color: Color(0xFFEB6027),
//                                       fontSize: 24.0,
//                                       letterSpacing: 0.0,
//                                       fontWeight: FontWeight.normal,
//                                     ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         Padding(
//                           padding: EdgeInsetsDirectional.fromSTEB(
//                               8.0, 0.0, 0.0, 0.0),
//                           child: Container(
//                             width: 40.0,
//                             height: 40.0,
//                             decoration: BoxDecoration(
//                               color: FlutterFlowTheme.of(context).backBtnClr,
//                               boxShadow: [
//                                 BoxShadow(
//                                   blurRadius: 4.0,
//                                   color: (Theme.of(context).brightness ==
//                                               Brightness.dark) ==
//                                           true
//                                       ? Color(0x335D4E4E)
//                                       : Colors.white,
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
//                                     ? Colors.transparent
//                                     : Color(0xD5999999),
//                               ),
//                             ),
//                             child: Icon(
//                               FFIcons.kessentialUi1,
//                               color: FlutterFlowTheme.of(context).tertiary,
//                               size: 24.0,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   if (!_model.isLoading)
//                     Expanded(
//                       child: Padding(
//                         padding:
//                             EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
//                         child: FlutterFlowWebView(
//                           content: getJsonField(
//                             DashboardGroup.privacypolicyCall.privacyPolicy(
//                               (_model.apiResult48w?.jsonBody ?? ''),
//                             ),
//                             r'''$.description''',
//                           ).toString(),
//                           height: 500.0,
//                           verticalScroll: true,
//                           horizontalScroll: true,
//                           html: true,
//                         ),
//                       ),
//                     ),
//                 ],
//               ),
//             ),
//             if (_model.isLoading)
//               Align(
//                 alignment: AlignmentDirectional(0.0, 0.0),
//                 child: Container(
//                   width: 40.0,
//                   height: 40.0,
//                   child: custom_widgets.CubeGridLoader(
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





import 'package:expandable/expandable.dart';

import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:flutter_html/flutter_html.dart';
import 'privacy_policy_model.dart';
export 'privacy_policy_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PrivacyPolicyWidget extends StatefulWidget {
  const PrivacyPolicyWidget({super.key});

  static String routeName = 'privacyPolicy';
  static String routePath = '/privacyPolicy';

  @override
  State<PrivacyPolicyWidget> createState() => _PrivacyPolicyWidgetState();
}

class _PrivacyPolicyWidgetState extends State<PrivacyPolicyWidget> with RouteAware {
  late PrivacyPolicyModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PrivacyPolicyModel());

    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.isLoading = true;
      safeSetState(() {});
      _model.apiResult48w = await DashboardGroup.privacypolicyCall.call(
        authToken: FFAppState().authToken,
      );
      safeSetState(() {});
      _model.isLoading = false;
      safeSetState(() {});
    });
  }

  // Keep all lifecycle methods same as original...

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).oposite,
        body: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                Theme.of(context).brightness == Brightness.dark
                    ? 'assets/images/Setting.png'
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
                  // Header with back button and FAQ title
                  // Row(
                  //   mainAxisSize: MainAxisSize.max,
                  //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //   children: [
                  //     InkWell(
                  //       onTap: () => context.safePop(),
                  //       child: Container(
                  //         width: 40.0,
                  //         height: 40.0,
                  //         decoration: BoxDecoration(
                  //           color: FlutterFlowTheme.of(context).backBtnClr,
                  //           boxShadow: [
                  //             BoxShadow(
                  //               blurRadius: 4.0,
                  //               color: Theme.of(context).brightness == Brightness.dark
                  //                   ? const Color(0x335D4E4E)
                  //                   : Colors.white,
                  //               offset: const Offset(0.0, 2.0),
                  //             )
                  //           ],
                  //           borderRadius: BorderRadius.circular(12.0),
                  //           border: Border.all(
                  //             color: Theme.of(context).brightness == Brightness.dark
                  //                 ? Colors.transparent
                  //                 : const Color(0xD5999999),
                  //           ),
                  //         ),
                  //         child: Icon(
                  //           Icons.arrow_back_rounded,
                  //           color: FlutterFlowTheme.of(context).tertiary,
                  //           size: 24.0,
                  //         ),
                  //       ),
                  //     ),
                  //     Expanded(
                  //       child: RichText(
                  //         text: TextSpan(
                  //           children: [
                  //             TextSpan(
                  //               text: 'LEGAL',
                  //               style: FlutterFlowTheme.of(context).customTextStyle1.override(
                  //                 fontFamily: 'good times',
                  //                 color: FlutterFlowTheme.of(context).tertiary,
                  //
                  //                 fontSize: 24.0,
                  //                 letterSpacing: 0.0,
                  //               ),
                  //             ),
                  //             TextSpan(
                  //               text: ' & ',
                  //               style: FlutterFlowTheme.of(context).customTextStyle1.override(
                  //                 fontFamily: 'good times',
                  //                 color: const Color(0xFFEB6027),
                  //                 fontSize: 24.0,
                  //                 letterSpacing: 0.0,
                  //               ),
                  //             ),
                  //             TextSpan(
                  //               text: 'privacy',
                  //               style: FlutterFlowTheme.of(context).customTextStyle1.override(
                  //                 fontFamily: 'good times',
                  //                 color: FlutterFlowTheme.of(context).tertiary,
                  //                 fontSize: 24.0,
                  //                 letterSpacing: 0.0,
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //     ),
                  //     const SizedBox(width: 40.0), // For symmetrical layout
                  //   ],
                  // ),



                  ///
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Back button aligned to left
                      Align(
                        alignment: Alignment.centerLeft,
                        child: InkWell(
                          onTap: () => context.safePop(),
                          child: Container(
                            width: 40.0,
                            height: 40.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).backBtnClr,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 4.0,
                                  color: Theme.of(context).brightness == Brightness.dark
                                      ? const Color(0x335D4E4E)
                                      : Colors.white,
                                  offset: const Offset(0.0, 2.0),
                                ),
                              ],
                              borderRadius: BorderRadius.circular(12.0),
                              border: Border.all(
                                color: Theme.of(context).brightness == Brightness.dark
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
                      ),

                      // Expanded center text
                      Expanded(
                        child: Center(
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'LEGAL',
                                  style: FlutterFlowTheme.of(context).customTextStyle1.override(
                                    fontFamily: 'good times',
                                    color: FlutterFlowTheme.of(context).tertiary,
                                    fontSize: 24.0,
                                    letterSpacing: 0.0,
                                  ),
                                ),
                                TextSpan(
                                  text: ' & ',
                                  style: FlutterFlowTheme.of(context).customTextStyle1.override(
                                    fontFamily: 'good times',
                                    color: const Color(0xFFEB6027),
                                    fontSize: 24.0,
                                    letterSpacing: 0.0,
                                  ),
                                ),
                                TextSpan(
                                  text: 'privacy',
                                  style: FlutterFlowTheme.of(context).customTextStyle1.override(
                                    fontFamily: 'good times',
                                    color: FlutterFlowTheme.of(context).tertiary,
                                    fontSize: 24.0,
                                    letterSpacing: 0.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      // Right spacer for symmetry
                      // const SizedBox(width: 40.0),
                    ],
                  ),

                  ///
                  if (!_model.isLoading)
                    Expanded(
                      child: FutureBuilder<ApiCallResponse>(
                        future: DashboardGroup.privacypolicyCall.call(
                          authToken: FFAppState().authToken,
                        ),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 40.0,
                                height: 40.0,
                                child: SpinKitCubeGrid(
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 40.0,
                                ),
                              ),
                            );
                          }
                          final response = snapshot.data!;
                          final pages = getJsonField(response.jsonBody, r'''$.pages''') as List<dynamic>? ?? [];

                          return ListView.builder(
                            padding: EdgeInsetsDirectional.zero,
                            itemCount: pages.length,
                            itemBuilder: (context, index) {
                              final page = pages[index];
                              return Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                child: Container(
                                  width: double.infinity,
                                  decoration: const BoxDecoration(),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                                    child: ExpandableNotifier(
                                      initialExpanded: false,
                                      child: ExpandablePanel(
                                        header: Container(),
                                        collapsed: Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(12.0),
                                            border: Border.all(
                                              color: FlutterFlowTheme.of(context).homeBoxBorder,
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsetsDirectional.fromSTEB(14.0, 10.0, 14.0, 10.0),
                                                child: Text(
                                                  getJsonField(page, r'''$.title''')
                                                      .toString()
                                                      .maybeHandleOverflow(
                                                    maxChars: 32,
                                                    replacement: '…',
                                                  ),
                                                  style: FlutterFlowTheme.of(context).titleMedium.override(
                                                    font: GoogleFonts.poppins(
                                                      fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                      fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                    ),
                                                    letterSpacing: 0.0,
                                                    fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                    fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 14.0, 0.0),
                                                child: Icon(
                                                  Icons.add,
                                                  color: FlutterFlowTheme.of(context).tertiary,
                                                  size: 20.0,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        expanded: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  color: (Theme.of(context).brightness == Brightness.dark) == false
                                                      ? const Color(0xFFFFEDDF)
                                                      : Colors.transparent,
                                                  borderRadius: BorderRadius.circular(10.0),
                                                  border: Border.all(
                                                    color: const Color(0x2AFFFFFF),
                                                  ),
                                                ),
                                                child: Column(
                                                  mainAxisSize: MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsetsDirectional.fromSTEB(14.0, 10.0, 14.0, 0.0),
                                                      child: Row(
                                                        mainAxisSize: MainAxisSize.max,
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          Text(
                                                            getJsonField(page, r'''$.title''')
                                                                .toString()
                                                                .maybeHandleOverflow(
                                                              maxChars: 32,
                                                              replacement: '…',
                                                            ),
                                                            maxLines: 2,
                                                            style: FlutterFlowTheme.of(context).titleMedium.override(
                                                              font: GoogleFonts.poppins(
                                                                fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                              ),
                                                              letterSpacing: 0.0,
                                                              fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                              fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                            ),
                                                          ),
                                                          Container(
                                                            decoration: BoxDecoration(
                                                              shape: BoxShape.circle,
                                                              border: Border.all(
                                                                color: const Color(0xFF2F2F2F),
                                                              ),
                                                            ),
                                                            child: Padding(
                                                              padding:  EdgeInsetsDirectional.fromSTEB(4.0, 4.0, 4.0, 4.0),
                                                              child: FaIcon(
                                                                FontAwesomeIcons.minus,
                                                                color: FlutterFlowTheme.of(context).tertiary,
                                                                size: 12.0,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsetsDirectional.fromSTEB(14.0, 10.0, 14.0, 10.0),
                                                      child: Html(
                                                        data: getJsonField(page, r'''$.description''').toString(),
                                                        style: {
                                                          "body": Style(
                                                            color: FlutterFlowTheme.of(context).lightWhite,
                                                            fontSize: FontSize(FlutterFlowTheme.of(context).bodySmall.fontSize ?? 12),
                                                            fontFamily: 'Poppins',
                                                          ),
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        theme: const ExpandableThemeData(
                                          tapHeaderToExpand: true,
                                          tapBodyToExpand: true,
                                          tapBodyToCollapse: true,
                                          headerAlignment: ExpandablePanelHeaderAlignment.top,
                                          hasIcon: false,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                ],
              ),
            ),
            if (_model.isLoading)
              const Center(
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
