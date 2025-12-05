import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'contest_details_model.dart';
export 'contest_details_model.dart';

class ContestDetailsWidget extends StatefulWidget {
  const ContestDetailsWidget({
    super.key,
    required this.contestId,
  });

  final int? contestId;

  static String routeName = 'ContestDetails';
  static String routePath = '/contestDetails';

  @override
  State<ContestDetailsWidget> createState() => _ContestDetailsWidgetState();
}

class _ContestDetailsWidgetState extends State<ContestDetailsWidget>
    with RouteAware {
  late ContestDetailsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ContestDetailsModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.isLoading = true;
      safeSetState(() {});
      _model.apiResult5ic =
          await DashboardGroup.comlpleteContestDetailsCall.call(
        contestId: widget.contestId,
        authToken: FFAppState().authToken,
      );

      if ((_model.apiResult5ic?.succeeded ?? true)) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              getJsonField(
                (_model.apiResult5ic?.jsonBody ?? ''),
                r'''$.message''',
              ).toString(),
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
            duration: const Duration(milliseconds: 2050),
            backgroundColor: Colors.black,
          ),
        );
        _model.isLoading = false;
        safeSetState(() {});
        safeSetState(() {});
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              getJsonField(
                (_model.apiResult5ic?.jsonBody ?? ''),
                r'''$.message''',
              ).toString(),
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
            duration: const Duration(milliseconds: 2050),
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
  void didUpdateWidget(ContestDetailsWidget oldWidget) {
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
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16.0, 40.0, 16.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 40.0,
                                height: 40.0,
                                decoration: BoxDecoration(
                                  color:
                                      FlutterFlowTheme.of(context).backBtnClr,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 4.0,
                                      color: (Theme.of(context).brightness ==
                                                  Brightness.dark) ==
                                              true
                                          ? const Color(0x335D4E4E)
                                          : Colors.white,
                                      offset: const Offset(
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
                                    context.safePop();
                                  },
                                  child: Icon(
                                    Icons.arrow_back_rounded,
                                    color:
                                        FlutterFlowTheme.of(context).tertiary,
                                    size: 24.0,
                                  ),
                                ),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'contest',
                                    style: FlutterFlowTheme.of(context)
                                        .customTextStyle1
                                        .override(
                                          fontFamily: 'good times',
                                          color: FlutterFlowTheme.of(context)
                                              .tertiary,
                                          fontSize: 24.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                                  Text(
                                    'details',
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
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    8.0, 0.0, 0.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context
                                        .pushNamed(AboutScreenWidget.routeName);
                                  },
                                  child: Container(
                                    width: 40.0,
                                    height: 40.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .backBtnClr,
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 4.0,
                                          color:
                                              (Theme.of(context).brightness ==
                                                          Brightness.dark) ==
                                                      true
                                                  ? const Color(0x335D4E4E)
                                                  : Colors.white,
                                          offset: const Offset(
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
                                            ? Colors.transparent
                                            : const Color(0xD5999999),
                                      ),
                                    ),
                                    child: Icon(
                                      FFIcons.kessentialUi1,
                                      color:
                                          FlutterFlowTheme.of(context).tertiary,
                                      size: 24.0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Align(
                            alignment: const AlignmentDirectional(-1.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 16.0, 0.0, 0.0),
                              child: Container(
                                width: 110.0,
                                height: 110.0,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 2.0,
                                  ),
                                ),
                                child: Container(
                                  width: 200.0,
                                  height: 200.0,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.network(

                                    getJsonField(
                                      DashboardGroup.comlpleteContestDetailsCall
                                          .contestResult(
                                        (_model.apiResult5ic?.jsonBody ?? ''),
                                      ),
                                      r'''$.logo''',
                                    )?.toString()??'',
                                    fit: BoxFit.cover,
                                    errorBuilder:
                                        (context, error, stackTrace) =>
                                        Image.asset(
                                          'assets/images/error_image.webp',
                                          width: double.infinity,
                                          fit: BoxFit.cover, // Add this line

                                        ),


                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 20.0, 0.0, 0.0),
                            child: Text(
                              getJsonField(
                                DashboardGroup.comlpleteContestDetailsCall
                                    .contestResult(
                                  (_model.apiResult5ic?.jsonBody ?? ''),
                                ),
                                r'''$.title''',
                              )?.toString()??"",
                              style: FlutterFlowTheme.of(context)
                                  .headlineLarge
                                  .override(
                                    font: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .headlineLarge
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .headlineLarge
                                        .fontStyle,
                                  ),
                            ),
                          ),
                          Text(
                            getJsonField(
                              DashboardGroup.comlpleteContestDetailsCall
                                  .contestResult(
                                (_model.apiResult5ic?.jsonBody ?? ''),
                              ),
                              r'''$.description''',
                            )?.toString()??"",
                            style: FlutterFlowTheme.of(context)
                                .titleLarge
                                .override(
                                  font: GoogleFonts.poppins(
                                    fontWeight: FontWeight.normal,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .fontStyle,
                                  ),
                                  color: FlutterFlowTheme.of(context).tertiary,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleLarge
                                      .fontStyle,
                                ),
                          ),
                          // Padding(
                          //   padding: const EdgeInsetsDirectional.fromSTEB(
                          //       0.0, 20.0, 0.0, 0.0),
                          //   child: Row(
                          //     mainAxisSize: MainAxisSize.max,
                          //     children: [
                          //       Container(
                          //         decoration: BoxDecoration(
                          //           borderRadius: BorderRadius.circular(8.0),
                          //           border: Border.all(
                          //             color: (Theme.of(context).brightness ==
                          //                         Brightness.dark) ==
                          //                     true
                          //                 ? const Color(0xFF4E4E4E)
                          //                 : Colors.transparent,
                          //           ),
                          //         ),
                          //         child: Padding(
                          //           padding: const EdgeInsetsDirectional.fromSTEB(
                          //               10.0, 10.0, 10.0, 10.0),
                          //           child: Row(
                          //             mainAxisSize: MainAxisSize.max,
                          //             crossAxisAlignment:
                          //                 CrossAxisAlignment.start,
                          //             children: [
                          //               const Column(
                          //                 mainAxisSize: MainAxisSize.max,
                          //                 children: [
                          //                   Icon(
                          //                     Icons.tornado_outlined,
                          //                     color: Color(0xFFC0BFBF),
                          //                     size: 16.0,
                          //                   ),
                          //                 ],
                          //               ),
                          //               Padding(
                          //                 padding:
                          //                     const EdgeInsetsDirectional.fromSTEB(
                          //                         5.0, 0.0, 0.0, 0.0),
                          //                 child: Column(
                          //                   mainAxisSize: MainAxisSize.max,
                          //                   children: [
                          //                     Text(
                          //                       'Difficulty',
                          //                       style: FlutterFlowTheme.of(
                          //                               context)
                          //                           .bodySmall
                          //                           .override(
                          //                             font: GoogleFonts.poppins(
                          //                               fontWeight:
                          //                                   FlutterFlowTheme.of(
                          //                                           context)
                          //                                       .bodySmall
                          //                                       .fontWeight,
                          //                               fontStyle:
                          //                                   FlutterFlowTheme.of(
                          //                                           context)
                          //                                       .bodySmall
                          //                                       .fontStyle,
                          //                             ),
                          //                             color:
                          //                                 FlutterFlowTheme.of(
                          //                                         context)
                          //                                     .tertiary,
                          //                             letterSpacing: 0.0,
                          //                             fontWeight:
                          //                                 FlutterFlowTheme.of(
                          //                                         context)
                          //                                     .bodySmall
                          //                                     .fontWeight,
                          //                             fontStyle:
                          //                                 FlutterFlowTheme.of(
                          //                                         context)
                          //                                     .bodySmall
                          //                                     .fontStyle,
                          //                           ),
                          //                     ),
                          //                     Padding(
                          //                       padding: const EdgeInsetsDirectional
                          //                           .fromSTEB(
                          //                               0.0, 5.0, 0.0, 0.0),
                          //                       child: Text(
                          //                         getJsonField(
                          //                           DashboardGroup
                          //                               .comlpleteContestDetailsCall
                          //                               .contestResult(
                          //                             (_model.apiResult5ic
                          //                                     ?.jsonBody ??
                          //                                 ''),
                          //                           ),
                          //                           r'''$.difficulty_type''',
                          //                         ).toString(),
                          //                         style: FlutterFlowTheme.of(
                          //                                 context)
                          //                             .labelMedium
                          //                             .override(
                          //                               font:
                          //                                   GoogleFonts.poppins(
                          //                                 fontWeight:
                          //                                     FontWeight.w600,
                          //                                 fontStyle:
                          //                                     FlutterFlowTheme.of(
                          //                                             context)
                          //                                         .labelMedium
                          //                                         .fontStyle,
                          //                               ),
                          //                               color: (Theme.of(context)
                          //                                               .brightness ==
                          //                                           Brightness
                          //                                               .dark) ==
                          //                                       true
                          //                                   ? const Color(0xFFDBDBDB)
                          //                                   : const Color(0xFC000000),
                          //                               letterSpacing: 0.0,
                          //                               fontWeight:
                          //                                   FontWeight.w600,
                          //                               fontStyle:
                          //                                   FlutterFlowTheme.of(
                          //                                           context)
                          //                                       .labelMedium
                          //                                       .fontStyle,
                          //                             ),
                          //                       ),
                          //                     ),
                          //                   ],
                          //                 ),
                          //               ),
                          //             ],
                          //           ),
                          //         ),
                          //       ),
                          //       // Padding(
                          //       //   padding: const EdgeInsetsDirectional.fromSTEB(
                          //       //       10.0, 0.0, 10.0, 0.0),
                          //       //   child: Container(
                          //       //     decoration: BoxDecoration(
                          //       //       borderRadius: BorderRadius.circular(8.0),
                          //       //       border: Border.all(
                          //       //         color: (Theme.of(context).brightness ==
                          //       //                     Brightness.dark) ==
                          //       //                 true
                          //       //             ? const Color(0xFF4E4E4E)
                          //       //             : Colors.transparent,
                          //       //       ),
                          //       //     ),
                          //       //     child: Padding(
                          //       //       padding: const EdgeInsetsDirectional.fromSTEB(
                          //       //           10.0, 10.0, 10.0, 10.0),
                          //       //       child: Row(
                          //       //         mainAxisSize: MainAxisSize.max,
                          //       //         crossAxisAlignment:
                          //       //             CrossAxisAlignment.start,
                          //       //         children: [
                          //       //           const Column(
                          //       //             mainAxisSize: MainAxisSize.max,
                          //       //             children: [
                          //       //               Icon(
                          //       //                 Icons.calendar_month,
                          //       //                 color: Color(0xFFC0BFBF),
                          //       //                 size: 16.0,
                          //       //               ),
                          //       //             ],
                          //       //           ),
                          //       //           Padding(
                          //       //             padding:
                          //       //                 const EdgeInsetsDirectional.fromSTEB(
                          //       //                     5.0, 0.0, 0.0, 0.0),
                          //       //             child: Column(
                          //       //               mainAxisSize: MainAxisSize.max,
                          //       //               crossAxisAlignment:
                          //       //                   CrossAxisAlignment.start,
                          //       //               children: [
                          //       //                 Text(
                          //       //                   'Valid',
                          //       //                   style: FlutterFlowTheme.of(
                          //       //                           context)
                          //       //                       .bodySmall
                          //       //                       .override(
                          //       //                         font:
                          //       //                             GoogleFonts.poppins(
                          //       //                           fontWeight:
                          //       //                               FlutterFlowTheme.of(
                          //       //                                       context)
                          //       //                                   .bodySmall
                          //       //                                   .fontWeight,
                          //       //                           fontStyle:
                          //       //                               FlutterFlowTheme.of(
                          //       //                                       context)
                          //       //                                   .bodySmall
                          //       //                                   .fontStyle,
                          //       //                         ),
                          //       //                         color:
                          //       //                             FlutterFlowTheme.of(
                          //       //                                     context)
                          //       //                                 .tertiary,
                          //       //                         letterSpacing: 0.0,
                          //       //                         fontWeight:
                          //       //                             FlutterFlowTheme.of(
                          //       //                                     context)
                          //       //                                 .bodySmall
                          //       //                                 .fontWeight,
                          //       //                         fontStyle:
                          //       //                             FlutterFlowTheme.of(
                          //       //                                     context)
                          //       //                                 .bodySmall
                          //       //                                 .fontStyle,
                          //       //                       ),
                          //       //                 ),
                          //       //                 Padding(
                          //       //                   padding: const EdgeInsetsDirectional
                          //       //                       .fromSTEB(
                          //       //                           0.0, 5.0, 0.0, 0.0),
                          //       //                   child: Text(
                          //       //                     getJsonField(
                          //       //                       DashboardGroup
                          //       //                           .comlpleteContestDetailsCall
                          //       //                           .contestResult(
                          //       //                         (_model.apiResult5ic
                          //       //                                 ?.jsonBody ??
                          //       //                             ''),
                          //       //                       ),
                          //       //                       r'''$.days_remaining''',
                          //       //                     ).toString(),
                          //       //                     style: FlutterFlowTheme.of(
                          //       //                             context)
                          //       //                         .labelMedium
                          //       //                         .override(
                          //       //                           font: GoogleFonts
                          //       //                               .poppins(
                          //       //                             fontWeight:
                          //       //                                 FontWeight.w600,
                          //       //                             fontStyle:
                          //       //                                 FlutterFlowTheme.of(
                          //       //                                         context)
                          //       //                                     .labelMedium
                          //       //                                     .fontStyle,
                          //       //                           ),
                          //       //                           color: (Theme.of(context)
                          //       //                                           .brightness ==
                          //       //                                       Brightness
                          //       //                                           .dark) ==
                          //       //                                   true
                          //       //                               ? const Color(
                          //       //                                   0xFFDBDBDB)
                          //       //                               : const Color(
                          //       //                                   0xFC000000),
                          //       //                           letterSpacing: 0.0,
                          //       //                           fontWeight:
                          //       //                               FontWeight.w600,
                          //       //                           fontStyle:
                          //       //                               FlutterFlowTheme.of(
                          //       //                                       context)
                          //       //                                   .labelMedium
                          //       //                                   .fontStyle,
                          //       //                         ),
                          //       //                   ),
                          //       //                 ),
                          //       //               ],
                          //       //             ),
                          //       //           ),
                          //       //         ],
                          //       //       ),
                          //       //     ),
                          //       //   ),
                          //       // ),
                          //       // Padding(
                          //       //   padding: const EdgeInsetsDirectional.fromSTEB(
                          //       //       0.0, 0.0, 10.0, 0.0),
                          //       //   child: Container(
                          //       //     decoration: BoxDecoration(
                          //       //       borderRadius: BorderRadius.circular(8.0),
                          //       //       border: Border.all(
                          //       //         color: (Theme.of(context).brightness ==
                          //       //                     Brightness.dark) ==
                          //       //                 true
                          //       //             ? const Color(0xFF4E4E4E)
                          //       //             : Colors.transparent,
                          //       //       ),
                          //       //     ),
                          //       //     child: Padding(
                          //       //       padding: const EdgeInsetsDirectional.fromSTEB(
                          //       //           10.0, 10.0, 10.0, 10.0),
                          //       //       child: Row(
                          //       //         mainAxisSize: MainAxisSize.max,
                          //       //         crossAxisAlignment:
                          //       //             CrossAxisAlignment.start,
                          //       //         children: [
                          //       //           Column(
                          //       //             mainAxisSize: MainAxisSize.max,
                          //       //             children: [
                          //       //               ClipRRect(
                          //       //                 borderRadius:
                          //       //                     BorderRadius.circular(8.0),
                          //       //                 child: SvgPicture.asset(
                          //       //                   'assets/images/Group_(3).svg',
                          //       //                   fit: BoxFit.cover,
                          //       //                 ),
                          //       //               ),
                          //       //             ],
                          //       //           ),
                          //       //           Padding(
                          //       //             padding:
                          //       //                 const EdgeInsetsDirectional.fromSTEB(
                          //       //                     5.0, 0.0, 0.0, 0.0),
                          //       //             child: Column(
                          //       //               mainAxisSize: MainAxisSize.max,
                          //       //               crossAxisAlignment:
                          //       //                   CrossAxisAlignment.start,
                          //       //               children: [
                          //       //                 Text(
                          //       //                   'Rewards',
                          //       //                   style: FlutterFlowTheme.of(
                          //       //                           context)
                          //       //                       .bodySmall
                          //       //                       .override(
                          //       //                         font:
                          //       //                             GoogleFonts.poppins(
                          //       //                           fontWeight:
                          //       //                               FlutterFlowTheme.of(
                          //       //                                       context)
                          //       //                                   .bodySmall
                          //       //                                   .fontWeight,
                          //       //                           fontStyle:
                          //       //                               FlutterFlowTheme.of(
                          //       //                                       context)
                          //       //                                   .bodySmall
                          //       //                                   .fontStyle,
                          //       //                         ),
                          //       //                         color:
                          //       //                             FlutterFlowTheme.of(
                          //       //                                     context)
                          //       //                                 .tertiary,
                          //       //                         letterSpacing: 0.0,
                          //       //                         fontWeight:
                          //       //                             FlutterFlowTheme.of(
                          //       //                                     context)
                          //       //                                 .bodySmall
                          //       //                                 .fontWeight,
                          //       //                         fontStyle:
                          //       //                             FlutterFlowTheme.of(
                          //       //                                     context)
                          //       //                                 .bodySmall
                          //       //                                 .fontStyle,
                          //       //                       ),
                          //       //                 ),
                          //       //                 Padding(
                          //       //                   padding: const EdgeInsetsDirectional
                          //       //                       .fromSTEB(
                          //       //                           0.0, 5.0, 0.0, 0.0),
                          //       //                   child: Text(
                          //       //                     getJsonField(
                          //       //                       DashboardGroup
                          //       //                           .comlpleteContestDetailsCall
                          //       //                           .contestResult(
                          //       //                         (_model.apiResult5ic
                          //       //                                 ?.jsonBody ??
                          //       //                             ''),
                          //       //                       ),
                          //       //                       r'''$.rewards''',
                          //       //                     ).toString(),
                          //       //                     style: FlutterFlowTheme.of(
                          //       //                             context)
                          //       //                         .labelMedium
                          //       //                         .override(
                          //       //                           font: GoogleFonts
                          //       //                               .poppins(
                          //       //                             fontWeight:
                          //       //                                 FontWeight.w600,
                          //       //                             fontStyle:
                          //       //                                 FlutterFlowTheme.of(
                          //       //                                         context)
                          //       //                                     .labelMedium
                          //       //                                     .fontStyle,
                          //       //                           ),
                          //       //                           color: (Theme.of(context)
                          //       //                                           .brightness ==
                          //       //                                       Brightness
                          //       //                                           .dark) ==
                          //       //                                   true
                          //       //                               ? const Color(
                          //       //                                   0xFFDBDBDB)
                          //       //                               : const Color(
                          //       //                                   0xFC000000),
                          //       //                           letterSpacing: 0.0,
                          //       //                           fontWeight:
                          //       //                               FontWeight.w600,
                          //       //                           fontStyle:
                          //       //                               FlutterFlowTheme.of(
                          //       //                                       context)
                          //       //                                   .labelMedium
                          //       //                                   .fontStyle,
                          //       //                         ),
                          //       //                   ),
                          //       //                 ),
                          //       //               ],
                          //       //             ),
                          //       //           ),
                          //       //         ],
                          //       //       ),
                          //       //     ),
                          //       //   ),
                          //       // ),
                          //     ],
                          //   ),
                          // ),
                          // Padding(
                          //   padding: const EdgeInsetsDirectional.fromSTEB(
                          //       0.0, 10.0, 0.0, 0.0),
                          //   child: Row(
                          //     mainAxisSize: MainAxisSize.max,
                          //     children: [
                          //       Container(
                          //         decoration: BoxDecoration(
                          //           borderRadius: BorderRadius.circular(8.0),
                          //           border: Border.all(
                          //             color: (Theme.of(context).brightness ==
                          //                         Brightness.dark) ==
                          //                     true
                          //                 ? const Color(0xFF4E4E4E)
                          //                 : Colors.transparent,
                          //           ),
                          //         ),
                          //         child: Padding(
                          //           padding: const EdgeInsetsDirectional.fromSTEB(
                          //               10.0, 10.0, 10.0, 10.0),
                          //           child: Row(
                          //             mainAxisSize: MainAxisSize.max,
                          //             crossAxisAlignment:
                          //                 CrossAxisAlignment.start,
                          //             children: [
                          //               const Column(
                          //                 mainAxisSize: MainAxisSize.max,
                          //                 children: [
                          //                   Icon(
                          //                     Icons.groups_2,
                          //                     color: Color(0xFFC0BFBF),
                          //                     size: 16.0,
                          //                   ),
                          //                 ],
                          //               ),
                          //               // Padding(
                          //               //   padding:
                          //               //       const EdgeInsetsDirectional.fromSTEB(
                          //               //           5.0, 0.0, 0.0, 0.0),
                          //               //   child: Column(
                          //               //     mainAxisSize: MainAxisSize.max,
                          //               //     crossAxisAlignment:
                          //               //         CrossAxisAlignment.start,
                          //               //     children: [
                          //               //       Text(
                          //               //         'Participants',
                          //               //         style: FlutterFlowTheme.of(
                          //               //                 context)
                          //               //             .bodySmall
                          //               //             .override(
                          //               //               font: GoogleFonts.poppins(
                          //               //                 fontWeight:
                          //               //                     FlutterFlowTheme.of(
                          //               //                             context)
                          //               //                         .bodySmall
                          //               //                         .fontWeight,
                          //               //                 fontStyle:
                          //               //                     FlutterFlowTheme.of(
                          //               //                             context)
                          //               //                         .bodySmall
                          //               //                         .fontStyle,
                          //               //               ),
                          //               //               color:
                          //               //                   FlutterFlowTheme.of(
                          //               //                           context)
                          //               //                       .tertiary,
                          //               //               letterSpacing: 0.0,
                          //               //               fontWeight:
                          //               //                   FlutterFlowTheme.of(
                          //               //                           context)
                          //               //                       .bodySmall
                          //               //                       .fontWeight,
                          //               //               fontStyle:
                          //               //                   FlutterFlowTheme.of(
                          //               //                           context)
                          //               //                       .bodySmall
                          //               //                       .fontStyle,
                          //               //             ),
                          //               //       ),
                          //               //       // Padding(
                          //               //       //   padding: const EdgeInsetsDirectional
                          //               //       //       .fromSTEB(
                          //               //       //           0.0, 5.0, 0.0, 0.0),
                          //               //       //   child: Text(
                          //               //       //     getJsonField(
                          //               //       //       DashboardGroup
                          //               //       //           .comlpleteContestDetailsCall
                          //               //       //           .contestResult(
                          //               //       //         (_model.apiResult5ic
                          //               //       //                 ?.jsonBody ??
                          //               //       //             ''),
                          //               //       //       ),
                          //               //       //       r'''$.participants''',
                          //               //       //     ).toString(),
                          //               //       //     style: FlutterFlowTheme.of(
                          //               //       //             context)
                          //               //       //         .labelMedium
                          //               //       //         .override(
                          //               //       //           font:
                          //               //       //               GoogleFonts.poppins(
                          //               //       //             fontWeight:
                          //               //       //                 FontWeight.w600,
                          //               //       //             fontStyle:
                          //               //       //                 FlutterFlowTheme.of(
                          //               //       //                         context)
                          //               //       //                     .labelMedium
                          //               //       //                     .fontStyle,
                          //               //       //           ),
                          //               //       //           color: (Theme.of(context)
                          //               //       //                           .brightness ==
                          //               //       //                       Brightness
                          //               //       //                           .dark) ==
                          //               //       //                   true
                          //               //       //               ? const Color(0xFFDBDBDB)
                          //               //       //               : const Color(0xFC000000),
                          //               //       //           letterSpacing: 0.0,
                          //               //       //           fontWeight:
                          //               //       //               FontWeight.w600,
                          //               //       //           fontStyle:
                          //               //       //               FlutterFlowTheme.of(
                          //               //       //                       context)
                          //               //       //                   .labelMedium
                          //               //       //                   .fontStyle,
                          //               //       //         ),
                          //               //       //   ),
                          //               //       // ),
                          //               //     ],
                          //               //   ),
                          //               // ),
                          //             ],
                          //           ),
                          //         ),
                          //       ),
                          //       // Padding(
                          //       //   padding: const EdgeInsetsDirectional.fromSTEB(
                          //       //       10.0, 0.0, 0.0, 0.0),
                          //       //   child: Container(
                          //       //     decoration: BoxDecoration(
                          //       //       borderRadius: BorderRadius.circular(8.0),
                          //       //       border: Border.all(
                          //       //         color: (Theme.of(context).brightness ==
                          //       //                     Brightness.dark) ==
                          //       //                 true
                          //       //             ? const Color(0xFF4E4E4E)
                          //       //             : Colors.transparent,
                          //       //       ),
                          //       //     ),
                          //       //     child: Padding(
                          //       //       padding: const EdgeInsetsDirectional.fromSTEB(
                          //       //           10.0, 10.0, 10.0, 10.0),
                          //       //       child: Row(
                          //       //         mainAxisSize: MainAxisSize.max,
                          //       //         crossAxisAlignment:
                          //       //             CrossAxisAlignment.start,
                          //       //         children: [
                          //       //           const Column(
                          //       //             mainAxisSize: MainAxisSize.max,
                          //       //             children: [
                          //       //               FaIcon(
                          //       //                 FontAwesomeIcons.questionCircle,
                          //       //                 color: Color(0xFFC0BFBF),
                          //       //                 size: 16.0,
                          //       //               ),
                          //       //             ],
                          //       //           ),
                          //       //           Padding(
                          //       //             padding:
                          //       //                 const EdgeInsetsDirectional.fromSTEB(
                          //       //                     5.0, 0.0, 0.0, 0.0),
                          //       //             child: Column(
                          //       //               mainAxisSize: MainAxisSize.max,
                          //       //               crossAxisAlignment:
                          //       //                   CrossAxisAlignment.start,
                          //       //               children: [
                          //       //                 Text(
                          //       //                   'Total Questions',
                          //       //                   style: FlutterFlowTheme.of(
                          //       //                           context)
                          //       //                       .bodySmall
                          //       //                       .override(
                          //       //                         font:
                          //       //                             GoogleFonts.poppins(
                          //       //                           fontWeight:
                          //       //                               FlutterFlowTheme.of(
                          //       //                                       context)
                          //       //                                   .bodySmall
                          //       //                                   .fontWeight,
                          //       //                           fontStyle:
                          //       //                               FlutterFlowTheme.of(
                          //       //                                       context)
                          //       //                                   .bodySmall
                          //       //                                   .fontStyle,
                          //       //                         ),
                          //       //                         color:
                          //       //                             FlutterFlowTheme.of(
                          //       //                                     context)
                          //       //                                 .tertiary,
                          //       //                         letterSpacing: 0.0,
                          //       //                         fontWeight:
                          //       //                             FlutterFlowTheme.of(
                          //       //                                     context)
                          //       //                                 .bodySmall
                          //       //                                 .fontWeight,
                          //       //                         fontStyle:
                          //       //                             FlutterFlowTheme.of(
                          //       //                                     context)
                          //       //                                 .bodySmall
                          //       //                                 .fontStyle,
                          //       //                       ),
                          //       //                 ),
                          //       //                 Padding(
                          //       //                   padding: const EdgeInsetsDirectional
                          //       //                       .fromSTEB(
                          //       //                           0.0, 5.0, 0.0, 0.0),
                          //       //                   child: Text(
                          //       //                     getJsonField(
                          //       //                       DashboardGroup
                          //       //                           .comlpleteContestDetailsCall
                          //       //                           .contestResult(
                          //       //                         (_model.apiResult5ic
                          //       //                                 ?.jsonBody ??
                          //       //                             ''),
                          //       //                       ),
                          //       //                       r'''$.total_questions''',
                          //       //                     ).toString(),
                          //       //                     style: FlutterFlowTheme.of(
                          //       //                             context)
                          //       //                         .labelMedium
                          //       //                         .override(
                          //       //                           font: GoogleFonts
                          //       //                               .poppins(
                          //       //                             fontWeight:
                          //       //                                 FontWeight.w600,
                          //       //                             fontStyle:
                          //       //                                 FlutterFlowTheme.of(
                          //       //                                         context)
                          //       //                                     .labelMedium
                          //       //                                     .fontStyle,
                          //       //                           ),
                          //       //                           color: (Theme.of(context)
                          //       //                                           .brightness ==
                          //       //                                       Brightness
                          //       //                                           .dark) ==
                          //       //                                   true
                          //       //                               ? const Color(
                          //       //                                   0xFFDBDBDB)
                          //       //                               : const Color(
                          //       //                                   0xFC000000),
                          //       //                           letterSpacing: 0.0,
                          //       //                           fontWeight:
                          //       //                               FontWeight.w600,
                          //       //                           fontStyle:
                          //       //                               FlutterFlowTheme.of(
                          //       //                                       context)
                          //       //                                   .labelMedium
                          //       //                                   .fontStyle,
                          //       //                         ),
                          //       //                   ),
                          //       //                 ),
                          //       //               ],
                          //       //             ),
                          //       //           ),
                          //       //         ],
                          //       //       ),
                          //       //     ),
                          //       //   ),
                          //       // ),
                          //     ],
                          //   ),
                          // ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 20.0, 0.0, 0.0),
                            child: Text(
                              'My Results',
                              style: FlutterFlowTheme.of(context)
                                  .headlineLarge
                                  .override(
                                    font: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .headlineLarge
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .headlineLarge
                                        .fontStyle,
                                  ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 8.0, 0.0, 0.0),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                border: Border.all(
                                  color: (Theme.of(context).brightness ==
                                              Brightness.dark) ==
                                          true
                                      ? const Color(0xFF4E4E4E)
                                      : const Color(0x24777777),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    12.0, 12.0, 12.0, 12.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            color:
                                                (Theme.of(context).brightness ==
                                                            Brightness.dark) ==
                                                        true
                                                    ? const Color(0xFF3E3E43)
                                                    : const Color(0x25777777),
                                            shape: BoxShape.circle,
                                          ),
                                          child: const Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 8.0, 8.0, 8.0),
                                            child: Icon(
                                              Icons.question_mark,
                                              color: Color(0xFFDF7D35),
                                              size: 20.0,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              'Total questions',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLarge
                                                      .override(
                                                        font:
                                                            GoogleFonts.poppins(
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleLarge
                                                                  .fontStyle,
                                                        ),
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleLarge
                                                                .fontStyle,
                                                      ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            getJsonField(
                                              DashboardGroup
                                                  .comlpleteContestDetailsCall
                                                  .contestResult(
                                                (_model.apiResult5ic
                                                        ?.jsonBody ??
                                                    ''),
                                              ),
                                              r'''$.total_questions''',
                                            )?.toString()??"",
                                            style: FlutterFlowTheme.of(context)
                                                .titleLarge
                                                .override(
                                                  font: GoogleFonts.poppins(
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleLarge
                                                            .fontStyle,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleLarge
                                                          .fontStyle,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Divider(
                                      thickness: 1.0,
                                      color: (Theme.of(context).brightness ==
                                                  Brightness.dark) ==
                                              true
                                          ? const Color(0xFF4E4E4E)
                                          : const Color(0x26777777),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            color:
                                                (Theme.of(context).brightness ==
                                                            Brightness.dark) ==
                                                        true
                                                    ? const Color(0xFF3E3E43)
                                                    : const Color(0x25777777),
                                            shape: BoxShape.circle,
                                          ),
                                          child: const Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 8.0, 8.0, 8.0),
                                            child: Icon(
                                              Icons.watch_later_outlined,
                                              color: Color(0xFFDF7D35),
                                              size: 20.0,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              'Total time',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLarge
                                                      .override(
                                                        font:
                                                            GoogleFonts.poppins(
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleLarge
                                                                  .fontStyle,
                                                        ),
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleLarge
                                                                .fontStyle,
                                                      ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            getJsonField(
                                              DashboardGroup
                                                  .comlpleteContestDetailsCall
                                                  .contestResult(
                                                (_model.apiResult5ic
                                                        ?.jsonBody ??
                                                    ''),
                                              ),
                                              r'''$.time_spent_minutes''',
                                            )?.toString()??"",
                                            style: FlutterFlowTheme.of(context)
                                                .titleLarge
                                                .override(
                                                  font: GoogleFonts.poppins(
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleLarge
                                                            .fontStyle,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleLarge
                                                          .fontStyle,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Divider(
                                      thickness: 1.0,
                                      color: (Theme.of(context).brightness ==
                                                  Brightness.dark) ==
                                              true
                                          ? const Color(0xFF4E4E4E)
                                          : const Color(0x26777777),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            color:
                                                (Theme.of(context).brightness ==
                                                            Brightness.dark) ==
                                                        true
                                                    ? const Color(0xFF3E3E43)
                                                    : const Color(0x25777777),
                                            shape: BoxShape.circle,
                                          ),
                                          child: const Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 8.0, 8.0, 8.0),
                                            child: Icon(
                                              Icons.question_mark,
                                              color: Color(0xFFDF7D35),
                                              size: 20.0,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              'Total correct answers',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLarge
                                                      .override(
                                                        font:
                                                            GoogleFonts.poppins(
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleLarge
                                                                  .fontStyle,
                                                        ),
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleLarge
                                                                .fontStyle,
                                                      ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            getJsonField(
                                              DashboardGroup
                                                  .comlpleteContestDetailsCall
                                                  .contestResult(
                                                (_model.apiResult5ic
                                                        ?.jsonBody ??
                                                    ''),
                                              ),
                                              r'''$.correct_answers''',
                                            )?.toString()??"",
                                            style: FlutterFlowTheme.of(context)
                                                .titleLarge
                                                .override(
                                                  font: GoogleFonts.poppins(
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleLarge
                                                            .fontStyle,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleLarge
                                                          .fontStyle,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Divider(
                                      thickness: 1.0,
                                      color: (Theme.of(context).brightness ==
                                                  Brightness.dark) ==
                                              true
                                          ? const Color(0xFF4E4E4E)
                                          : const Color(0x26777777),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            color:
                                                (Theme.of(context).brightness ==
                                                            Brightness.dark) ==
                                                        true
                                                    ? const Color(0xFF3E3E43)
                                                    : const Color(0x25777777),
                                            shape: BoxShape.circle,
                                          ),
                                          child: const Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 8.0, 8.0, 8.0),
                                            child: FaIcon(
                                              FontAwesomeIcons.moneyBillWave,
                                              color: Color(0xFFDF7D35),
                                              size: 20.0,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              'Points earned',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLarge
                                                      .override(
                                                        font:
                                                            GoogleFonts.poppins(
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleLarge
                                                                  .fontStyle,
                                                        ),
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleLarge
                                                                .fontStyle,
                                                      ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            '${getJsonField(
                                              DashboardGroup
                                                  .comlpleteContestDetailsCall
                                                  .contestResult(
                                                (_model.apiResult5ic
                                                        ?.jsonBody ??
                                                    ''),
                                              ),
                                              r'''$.point_earned''',
                                            )?.toString()??""} Pts',
                                            style: FlutterFlowTheme.of(context)
                                                .titleLarge
                                                .override(
                                                  font: GoogleFonts.poppins(
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleLarge
                                                            .fontStyle,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleLarge
                                                          .fontStyle,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Divider(
                                      thickness: 1.0,
                                      color: (Theme.of(context).brightness ==
                                                  Brightness.dark) ==
                                              true
                                          ? const Color(0xFF4E4E4E)
                                          : const Color(0x26777777),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            color:
                                                (Theme.of(context).brightness ==
                                                            Brightness.dark) ==
                                                        true
                                                    ? const Color(0xFF3E3E43)
                                                    : const Color(0x25777777),
                                            shape: BoxShape.circle,
                                          ),
                                          child: const Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 8.0, 8.0, 8.0),
                                            child: Icon(
                                              Icons.leaderboard_outlined,
                                              color: Color(0xFFDF7D35),
                                              size: 20.0,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              'Your Rank',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLarge
                                                      .override(
                                                        font:
                                                            GoogleFonts.poppins(
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleLarge
                                                                  .fontStyle,
                                                        ),
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleLarge
                                                                .fontStyle,
                                                      ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            getJsonField(
                                              DashboardGroup
                                                  .comlpleteContestDetailsCall
                                                  .contestResult(
                                                (_model.apiResult5ic
                                                        ?.jsonBody ??
                                                    ''),
                                              ),
                                              r'''$.your_rank''',
                                            )?.toString()??"",
                                            style: FlutterFlowTheme.of(context)
                                                .titleLarge
                                                .override(
                                                  font: GoogleFonts.poppins(
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleLarge
                                                            .fontStyle,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleLarge
                                                          .fontStyle,
                                                ),
                                          ),
                                        ),
                                      ],
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
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
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
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          color: FlutterFlowTheme.of(context)
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
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          40.0, 0.0, 0.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              'User',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    font: GoogleFonts.baloo2(
                                                      fontWeight:
                                                          FontWeight.w800,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .oposite,
                                                    fontSize: 16.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w800,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                            ),
                                          ),
                                          Text(
                                            'Earned Points',
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
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .oposite,
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w800,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
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
                          Builder(
                            builder: (context) {
                              // final usersRank = getJsonField(
                              //   DashboardGroup.comlpleteContestDetailsCall
                              //       .contestResult(
                              //     (_model.apiResult5ic?.jsonBody ?? ''),
                              //   ),
                              //   r'''$.ranking_list''',
                              // ).toList();

                              final usersRank = (getJsonField(
                                DashboardGroup.comlpleteContestDetailsCall.contestResult(
                                  (_model.apiResult5ic?.jsonBody ?? ''),
                                ),
                                r'''$.ranking_list''',
                              ) as List?) ?? [];

                              _model.debugGeneratorVariables[
                                      'usersRank${usersRank.length > 100 ? ' (first 100)' : ''}'] =
                                  debugSerializeParam(
                                usersRank.take(100),
                                ParamType.JSON,
                                isList: true,
                                link:
                                    'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=ContestDetails',
                                name: 'dynamic',
                                nullable: false,
                              );
                              debugLogWidgetClass(_model);

                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: usersRank.length,
                                itemBuilder: (context, usersRankIndex) {
                                  final usersRankItem =
                                      usersRank[usersRankIndex];
                                  return Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: (Theme.of(context).brightness ==
                                                  Brightness.dark) ==
                                              true
                                          ? const Color(0xFF4E4E4E)
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
                                      padding: const EdgeInsetsDirectional.fromSTEB(
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
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        7.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  getJsonField(
                                                    usersRankItem,
                                                    r'''$.rank''',
                                                  ).toString(),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleMedium
                                                      .override(
                                                        font:
                                                            GoogleFonts.poppins(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleMedium
                                                                  .fontStyle,
                                                        ),
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
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
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Container(
                                                    width: 30.0,
                                                    height: 30.0,
                                                    clipBehavior:
                                                        Clip.antiAlias,
                                                    decoration: const BoxDecoration(
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: Image.network(
                                                      getJsonField(
                                                        usersRankItem,
                                                        r'''$.profile_image''',
                                                      ).toString(),
                                                      fit: BoxFit.cover,
                                                      errorBuilder: (context,
                                                              error,
                                                              stackTrace) =>
                                                          Image.asset(
                                                        'assets/images/error_image.webp',
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(7.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      getJsonField(
                                                        usersRankItem,
                                                        r'''$.name''',
                                                      ).toString(),
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
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    7.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              getJsonField(
                                                usersRankItem,
                                                r'''$.reward_point''',
                                              ).toString(),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMedium
                                                      .override(
                                                        font:
                                                            GoogleFonts.poppins(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleMedium
                                                                  .fontStyle,
                                                        ),
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleMedium
                                                                .fontStyle,
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
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (_model.isLoading == true)
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
