import '../../nav/nav_widget.dart';
import '/backend/api_requests/api_calls.dart';
import '/components/gradient_button_custom/gradient_button_custom_widget.dart';
import '/components/winner_bottom_sheet/winner_bottom_sheet_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/index.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'match_playerss_model.dart';
export 'match_playerss_model.dart';

class MatchPlayerssWidget extends StatefulWidget {
  const MatchPlayerssWidget({super.key});

  static String routeName = 'MatchPlayerss';
  static String routePath = '/matchPlayerss';

  @override
  State<MatchPlayerssWidget> createState() => _MatchPlayerssWidgetState();
}

class _MatchPlayerssWidgetState extends State<MatchPlayerssWidget>
    with RouteAware {
  late MatchPlayerssModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  // void handleNextQuestion(BuildContext context) async {
  //   if (_model.questionNo ==
  //       DashboardGroup.matchPlayersCall
  //           .questions((_model.matchMinionRes?.jsonBody ?? ''))
  //           ?.length) {
  //     await showDialog(
  //       context: context,
  //       builder: (dialogContext) {
  //         return Dialog(
  //           elevation: 0,
  //           insetPadding: EdgeInsets.zero,
  //           backgroundColor: Colors.transparent,
  //           alignment: const AlignmentDirectional(0.0, 0.0)
  //               .resolve(Directionality.of(context)),
  //           child: WebViewAware(
  //             child: GestureDetector(
  //               onTap: () {
  //                 FocusScope.of(dialogContext).unfocus();
  //                 FocusManager.instance.primaryFocus?.unfocus();
  //               },
  //               child: WinnerBottomSheetWidget(
  //                 onContinuePress: () async {
  //                   context.goNamed(NavWidget.routeName);
  //                 },
  //               ),
  //             ),
  //           ),
  //         );
  //       },
  //     );
  //   } else {
  //     _model.questionIndex = _model.questionIndex + 1;
  //     _model.questionNo = _model.questionNo! + 1;
  //     _model.selectedIndex = -1;
  //     safeSetState(() {});
  //   }
  // }



  void handleNextQuestion(BuildContext context) async {
    // Check if option is selected
    if (_model.selectedIndex == -1) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select an option'),
          duration: Duration(seconds: 2),
        ),
      );
      return; // stop execution here (don’t move forward)
    }

    // Proceed only if option is selected
    if (_model.questionNo ==
        DashboardGroup.matchPlayersCall
            .questions((_model.matchMinionRes?.jsonBody ?? ''))
            ?.length) {
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
                  FocusScope.of(dialogContext).unfocus();
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                child: WinnerBottomSheetWidget(
                  onContinuePress: () async {
                    context.goNamed(NavWidget.routeName);
                  },
                ),
              ),
            ),
          );
        },
      );
    } else {
      _model.questionIndex = _model.questionIndex + 1;
      _model.questionNo = _model.questionNo! + 1;
      _model.selectedIndex = -1;
      safeSetState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MatchPlayerssModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.isLoading = true;
      safeSetState(() {});
      _model.matchMinionRes = await DashboardGroup.matchPlayersCall.call(
        authToken: FFAppState().authToken,
      );

      if ((_model.matchMinionRes?.succeeded ?? true)) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              getJsonField(
                (_model.matchMinionRes?.jsonBody ?? ''),
                r'''$.message''',
              ).toString(),
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
            duration: const Duration(milliseconds: 1700),
            backgroundColor: Colors.black,
          ),
        );
        _model.isLoading = false;
        safeSetState(() {});
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              getJsonField(
                (_model.matchMinionRes?.jsonBody ?? ''),
                r'''$.message''',
              ).toString(),
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
            duration: const Duration(milliseconds: 1700),
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
  void didUpdateWidget(MatchPlayerssWidget oldWidget) {
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


    final questionImageUrl = valueOrDefault<String>(
      getJsonField(
        DashboardGroup.matchPlayersCall
            .questions((_model.matchMinionRes?.jsonBody ?? ''))
            ?.elementAtOrNull(valueOrDefault<int>(_model.questionIndex, 0)),
        r'''$.question_image''',
      )?.toString(),
      '\"\"',
    );

    print('Question image URL>>>: $questionImageUrl');




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
              padding: const EdgeInsetsDirectional.fromSTEB(16.0, 40.0, 16.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
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
                                ? Colors.black
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
                            color: FlutterFlowTheme.of(context).tertiary,
                            size: 24.0,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Minion',
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
                              'goats',
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
                                  ? Colors.black
                                  : const Color(0xD5999999),
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
                    padding: EdgeInsetsDirectional.fromSTEB(
                        0.0,
                        valueOrDefault<double>(
                          MediaQuery.sizeOf(context).height * 0.02,
                          0.0,
                        ),
                        0.0,
                        0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (_model.questionIndex > 0)
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 2.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    _model.questionIndex =
                                        _model.questionIndex + -1;
                                    _model.questionNo = _model.questionNo! + -1;
                                    _model.selectedIndex = -1;
                                    safeSetState(() {});
                                  },
                                  child: Container(
                                    width: 40.0,
                                    height: 40.0,
                                    decoration: BoxDecoration(
                                      color: (Theme.of(context).brightness ==
                                                  Brightness.dark) ==
                                              true
                                          ? Colors.white
                                          : const Color(0xFFA1A1A1),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Align(
                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                      child: Icon(
                                        Icons.arrow_back_ios_new_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .oposite,
                                        size: 20.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: CachedNetworkImage(
                                fadeInDuration: const Duration(milliseconds: 500),
                                fadeOutDuration: const Duration(milliseconds: 500),
                                imageUrl: valueOrDefault<String>(
                                  getJsonField(
                                    DashboardGroup.matchPlayersCall
                                        .questions(
                                          (_model.matchMinionRes?.jsonBody ??
                                              ''),
                                        )
                                        ?.elementAtOrNull(valueOrDefault<int>(
                                          _model.questionIndex,
                                          0,
                                        )),
                                    r'''$.question_image''',
                                  )?.toString(),
                                  '\"\"',
                                ),
                                width: MediaQuery.sizeOf(context).width * 0.6,
                                height:
                                    MediaQuery.sizeOf(context).height * 0.38,
                                fit: BoxFit.fitHeight,
                                errorWidget: (context, error, stackTrace) =>
                                    Image.asset(
                                  'assets/images/error_image.webp',
                                  width: MediaQuery.sizeOf(context).width * 0.6,
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.38,
                                  fit: BoxFit.fitHeight,
                                ),
                              ),
                            ),
                            Builder(
                              builder: (context) => Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    2.0, 0.0, 0.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    if (_model.questionNo ==
                                        DashboardGroup.matchPlayersCall
                                            .questions(
                                              (_model.matchMinionRes
                                                      ?.jsonBody ??
                                                  ''),
                                            )
                                            ?.length) {
                                      await showDialog(
                                        context: context,
                                        builder: (dialogContext) {
                                          return Dialog(
                                            elevation: 0,
                                            insetPadding: EdgeInsets.zero,
                                            backgroundColor: Colors.transparent,
                                            alignment: const AlignmentDirectional(
                                                    0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                            child: WebViewAware(
                                              child: GestureDetector(
                                                onTap: () {
                                                  FocusScope.of(dialogContext)
                                                      .unfocus();
                                                  FocusManager
                                                      .instance.primaryFocus
                                                      ?.unfocus();
                                                },
                                                child: WinnerBottomSheetWidget(
                                                  onContinuePress: () async {
                                                    // context.pushNamed(
                                                    //     HomePageWidget
                                                    //         .routeName);
                                                    context.pushNamed(
                                                        NavWidget
                                                            .routeName);
                                                  },
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    } else {
                                      _model.questionIndex =
                                          _model.questionIndex + 1;
                                      _model.questionNo =
                                          _model.questionNo! + 1;
                                      _model.selectedIndex = -1;
                                      safeSetState(() {});
                                    }
                                  },
                                  child: Container(
                                    width: 40.0,
                                    height: 40.0,
                                    decoration: BoxDecoration(
                                      color: (Theme.of(context).brightness ==
                                                  Brightness.dark) ==
                                              true
                                          ? Colors.white
                                          : const Color(0xFFA1A1A1),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Align(
                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                      child: Icon(
                                        Icons.arrow_forward_ios_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .oposite,
                                        size: 20.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          if (!_model.isLoading)
                            Builder(
                              builder: (context) {
                                final options = getJsonField(
                                  DashboardGroup.matchPlayersCall
                                      .questions(
                                        (_model.matchMinionRes?.jsonBody ?? ''),
                                      )
                                      ?.elementAtOrNull(_model.questionIndex),
                                  r'''$.options''',
                                ).toList();
                                _model.debugGeneratorVariables[
                                        'options${options.length > 100 ? ' (first 100)' : ''}'] =
                                    debugSerializeParam(
                                  options.take(100),
                                  ParamType.JSON,
                                  isList: true,
                                  link:
                                      'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=MatchPlayerss',
                                  name: 'dynamic',
                                  nullable: false,
                                );
                                debugLogWidgetClass(_model);

                                return ListView.builder(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: options.length,
                                  itemBuilder: (context, optionsIndex) {
                                    final optionsItem = options[optionsIndex];
                                    return InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        if (_model.selectedIndex ==
                                            optionsIndex) {
                                          _model.selectedIndex = -1;
                                          safeSetState(() {});
                                        } else {
                                          _model.selectedIndex = optionsIndex;
                                          _model.selectedPlayerId =
                                              getJsonField(
                                            optionsItem,
                                            r'''$.id''',
                                          );
                                          safeSetState(() {});
                                        }
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: _model.selectedIndex ==
                                                  optionsIndex
                                              ? const Color(0xFF038500)
                                              : (Theme.of(context).brightness ==
                                                      Brightness.dark
                                                  ? const Color(0xFF1C1C22)
                                                  : const Color(0xFFF0F0F0)),
                                          border: Border.all(
                                            color:
                                                (Theme.of(context).brightness ==
                                                            Brightness.dark) ==
                                                        true
                                                    ? const Color(0xFF4E4E4E)
                                                    : const Color(0xFFE5E5E5),
                                          ),
                                        ),
                                        child: Align(
                                          alignment:
                                              const AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 15.0, 0.0, 15.0),
                                            child: Text(
                                              valueOrDefault<String>(
                                                getJsonField(
                                                  optionsItem,
                                                  r'''$.name''',
                                                )?.toString(),
                                                '\"\"',
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLarge
                                                      .override(
                                                        font:
                                                            GoogleFonts.poppins(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleLarge
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleLarge
                                                                  .fontStyle,
                                                        ),
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleLarge
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleLarge
                                                                .fontStyle,
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
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              await showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                enableDrag: false,
                                context: context,
                                builder: (context) {
                                  return WebViewAware(
                                    child: GestureDetector(
                                      onTap: () {
                                        FocusScope.of(context).unfocus();
                                        FocusManager.instance.primaryFocus
                                            ?.unfocus();
                                      },
                                      child: Padding(
                                        padding:
                                            MediaQuery.viewInsetsOf(context),
                                        child: WinnerBottomSheetWidget(
                                          onContinuePress: () async {
                                            // context.pushNamed(
                                            //     HomePageWidget.routeName);


                                            context.pushNamed(
                                                NavWidget
                                                    .routeName);


                                          },
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ).then((value) => safeSetState(() {}));
                            },
                            child: Container(
                              decoration: const BoxDecoration(),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 20.0, 0.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    print('shi hai'); // or: debugPrint('shi hai');

                                    _model.apiResultyli = await DashboardGroup
                                        .submitMinionCall
                                        .call(
                                      authToken: FFAppState().authToken,
                                      rightPlayerId: getJsonField(
                                        DashboardGroup.matchPlayersCall
                                            .questions(
                                              (_model.matchMinionRes
                                                      ?.jsonBody ??
                                                  ''),
                                            )
                                            ?.elementAtOrNull(
                                                _model.questionIndex),
                                        r'''$.correct_player_id''',
                                      ),
                                      selectPlayerId: _model.selectedPlayerId,
                                    );

                                    if ((_model.apiResultyli?.succeeded ??
                                        true)) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            getJsonField(
                                              (_model.apiResultyli?.jsonBody ??
                                                  ''),
                                              r'''$.message''',
                                            ).toString(),
                                            style: const TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          duration:
                                              const Duration(milliseconds: 1200),
                                          backgroundColor: Colors.black,
                                        ),
                                      );
                                      context.goNamed(
                                          HomeOnboardingWidget
                                              .routeName);
                                      // context.goNamed(HomePageWidget.routeName);
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            getJsonField(
                                              (_model.apiResultyli?.jsonBody ??
                                                  ''),
                                              r'''$.message''',
                                            ).toString(),
                                            style: const TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          duration:
                                              const Duration(milliseconds: 1200),
                                          backgroundColor: Colors.black,
                                        ),
                                      );
                                    }

                                    safeSetState(() {});
                                  },
                                  child: wrapWithModel(
                                    model: _model.gradientButtonCustomModel,
                                    updateCallback: () => safeSetState(() {}),
                                    child: Builder(builder: (_) {
                                      return DebugFlutterFlowModelContext(
                                        rootModel: _model.rootModel,
                                        child: const GradientButtonCustomWidget(
                                          text: 'Save Progress',
                                        ),
                                      );
                                    }),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(0.0, 0.92),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 20.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Expanded(
                                    child: Container(
                                      height: 60.0,
                                      decoration: BoxDecoration(
                                        color: (Theme.of(context).brightness ==
                                                    Brightness.dark) ==
                                                true
                                            ? const Color(0xFF2C2C2C)
                                            : const Color(0xFFE5E5E5),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                        border: Border.all(
                                          color: const Color(0xFF4E4E4E),
                                        ),
                                      ),
                                      child: Builder(
                                        builder: (context) => FFButtonWidget(
                                          onPressed: () async {
                                            _model.autoAssociateRes =
                                                await DashboardGroup
                                                    .autoAssociateCall
                                                    .call(
                                              authToken: FFAppState().authToken,
                                            );

                                            if ((_model.autoAssociateRes
                                                    ?.succeeded ??
                                                true)) {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    getJsonField(
                                                      (_model.autoAssociateRes
                                                              ?.jsonBody ??
                                                          ''),
                                                      r'''$.message''',
                                                    ).toString(),
                                                    style: const TextStyle(
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  duration: const Duration(
                                                      milliseconds: 1250),
                                                  backgroundColor: Colors.black,
                                                ),
                                              );
                                              await showDialog(
                                                context: context,
                                                builder: (dialogContext) {
                                                  return Dialog(
                                                    elevation: 0,
                                                    insetPadding:
                                                        EdgeInsets.zero,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    alignment:
                                                        const AlignmentDirectional(
                                                                0.0, 0.0)
                                                            .resolve(
                                                                Directionality.of(
                                                                    context)),
                                                    child: WebViewAware(
                                                      child: GestureDetector(
                                                        onTap: () {
                                                          FocusScope.of(
                                                                  dialogContext)
                                                              .unfocus();
                                                          FocusManager.instance
                                                              .primaryFocus
                                                              ?.unfocus();
                                                        },
                                                        child:
                                                            WinnerBottomSheetWidget(
                                                          // onContinuePress:
                                                          //     () async {
                                                            // context.goNamed(
                                                            //     HomePageWidget
                                                            //         .routeName);

                                                                // context.pushNamed(
                                                                //     NavWidget
                                                                //         .routeName);


                                                                onContinuePress: () async {
                                                                  context.goNamed(NavWidget.routeName);


                                                              },
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );
                                            } else {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    getJsonField(
                                                      (_model.autoAssociateRes
                                                              ?.jsonBody ??
                                                          ''),
                                                      r'''$.message''',
                                                    ).toString(),
                                                    style: const TextStyle(
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  duration: const Duration(
                                                      milliseconds: 1250),
                                                  backgroundColor: Colors.black,
                                                ),
                                              );
                                            }

                                            safeSetState(() {});
                                          },
                                          text: 'Auto Associate',
                                          options: FFButtonOptions(
                                            height: 40.0,
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 16.0, 0.0),
                                            iconPadding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: const Color(0x00CD4A20),
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleLarge
                                                    .override(
                                                      font: GoogleFonts.poppins(
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleLarge
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleLarge
                                                                .fontStyle,
                                                      ),
                                                      fontSize: 14.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleLarge
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleLarge
                                                              .fontStyle,
                                                    ),
                                            elevation: 0.0,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 10.0,
                                    decoration: const BoxDecoration(),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 2.0, 0.0),
                                      child: Container(
                                        height: 60.0,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        ),
                                        child: Align(
                                          alignment:
                                              const AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    25.0, 13.0, 25.0, 13.0),
                                            child: InkWell(

                                              onTap: ()async {

                                                if (_model.selectedIndex == -1) {
                                                  ScaffoldMessenger.of(context).showSnackBar(
                                                    const SnackBar(
                                                      content: Text('Please choose an option'),
                                                      duration: Duration(seconds: 1),
                                                      backgroundColor: Colors.red,
                                                    ),
                                                  );
                                                  return;
                                                }

                                                _model.apiResultyli = await DashboardGroup
                                                    .submitMinionCall
                                                    .call(
                                                  authToken: FFAppState().authToken,
                                                  rightPlayerId: getJsonField(
                                                    DashboardGroup.matchPlayersCall
                                                        .questions(
                                                      (_model.matchMinionRes
                                                          ?.jsonBody ??
                                                          ''),
                                                    )
                                                        ?.elementAtOrNull(
                                                        _model.questionIndex),
                                                    r'''$.correct_player_id''',
                                                  ),
                                                  selectPlayerId: _model.selectedPlayerId,
                                                );

                                                if ((_model.apiResultyli?.succeeded ??
                                                    true)) {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        getJsonField(
                                                          (_model.apiResultyli?.jsonBody ??
                                                              ''),
                                                          r'''$.message''',
                                                        ).toString(),
                                                        style: const TextStyle(
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                      duration:
                                                      const Duration(milliseconds: 1200),
                                                      backgroundColor: Colors.black,
                                                    ),
                                                  );
                                                  // context.pushNamed(
                                                  //     NavWidget
                                                  //         .routeName);

                                                  handleNextQuestion(context);




                                                  // context.goNamed(HomePageWidget.routeName);
                                                } else {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        getJsonField(
                                                          (_model.apiResultyli?.jsonBody ??
                                                              ''),
                                                          r'''$.message''',
                                                        ).toString(),
                                                        style: const TextStyle(
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                      duration:
                                                      const Duration(milliseconds: 1200),
                                                      backgroundColor: Colors.black,
                                                    ),
                                                  );
                                                }

                                                safeSetState(() {});
                                              },


                                              child: Text(
                                                'Next',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleLarge
                                                        .override(
                                                          font:
                                                              GoogleFonts.poppins(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleLarge
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleLarge
                                                                    .fontStyle,
                                                          ),
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleLarge
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleLarge
                                                                  .fontStyle,
                                                        ),
                                              ),
                                            ),
                                          ),
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
                ],
              ),
            ),
            if (_model.isLoading)
              Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Container(
                  width: 40.0,
                  height: 40.0,
                  child: const custom_widgets.CubeGridLoader(
                    width: 40.0,
                    height: 40.0,
                    size: 40.0,
                  ),
                ),
              ),
            if (!_model.isTapped)
              Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: Container(
                          height: MediaQuery.sizeOf(context).height * 1.0,
                          decoration: BoxDecoration(
                            color:
                                Theme.of(context).brightness == Brightness.light
                                    ? const Color(0x4B000000)
                                    : const Color(0xC4000000),
                          ),
                          child: Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 20.0, 0.0),
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: (Theme.of(context).brightness ==
                                              Brightness.dark) ==
                                          true
                                      ? const Color(0xFF1C1C22)
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(17.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      16.0, 20.0, 16.0, 16.0),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Aren\'t MINION GOATS awesome?',
                                          textAlign: TextAlign.center,
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
                                                fontSize: 22.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleLarge
                                                        .fontStyle,
                                              ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 8.0, 0.0, 0.0),
                                          child: Column(
                                            children: [
                                              Text(
                                                '50 NBA legends brought back to their college years. Can you match each Minion to its name?\n\nIf you’re stuck, Save the progress and continue later or tap the Auto-Associate button to skip the game. ',
                                                textAlign: TextAlign.center,
                                                style: FlutterFlowTheme.of(context)
                                                    .bodySmall
                                                    .override(
                                                      font: GoogleFonts.poppins(
                                                        fontWeight: FontWeight.w500,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmall
                                                                .fontStyle
                                                        ,
                                                        fontSize: 14
                                                      ),
                                                      color: (Theme.of(context)
                                                                      .brightness ==
                                                                  Brightness
                                                                      .dark) ==
                                                              true
                                                          ? const Color(0xA6FFFFFF)
                                                          : const Color(0xFF595959),
                                                      letterSpacing: 0.0,
                                                      fontWeight: FontWeight.w500,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmall
                                                              .fontStyle,
                                                    ),
                                              ),

                                              const SizedBox(height: 6,),
                                              Text(
                                                'NOTE: You will not able to access the other functions of the app until you have completed the name-icon association ',
                                                textAlign: TextAlign.center,
                                                style: FlutterFlowTheme.of(context)
                                                    .bodySmall
                                                    .override(
                                                      font: GoogleFonts.poppins(
                                                        fontWeight: FontWeight.w700,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmall
                                                                .fontStyle,
                                                      ),
                                                      color: (Theme.of(context)
                                                                      .brightness ==
                                                                  Brightness
                                                                      .dark) ==
                                                              true
                                                          ? const Color(0xA6FFFFFF)
                                                          : const Color(0xFF595959),
                                                      letterSpacing: 0.0,
                                                      fontWeight: FontWeight.w700,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmall
                                                              .fontStyle,
                                                  fontSize: 12
                                                    ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 20.0, 0.0, 10.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              _model.isTapped = true;
                                              safeSetState(() {});
                                            },
                                            child: Container(
                                              width: 82.0,
                                              height: 36.0,
                                              decoration: BoxDecoration(
                                                gradient: LinearGradient(
                                                  colors: [
                                                    FlutterFlowTheme.of(context)
                                                        .peach,
                                                    const Color(0xFFE09B6E)
                                                  ],
                                                  stops: [0.0, 1.0],
                                                  begin: const AlignmentDirectional(
                                                      0.0, -1.0),
                                                  end: const AlignmentDirectional(
                                                      0, 1.0),
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(16.0),
                                              ),
                                              child: Align(
                                                alignment: const AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Text(
                                                  'Start',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodySmall
                                                      .override(
                                                        font:
                                                            GoogleFonts.poppins(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodySmall
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodySmall
                                                                  .fontStyle,
                                                        ),
                                                        color: Colors.white,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmall
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmall
                                                                .fontStyle,
                                                      ),
                                                ),
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
                          ),
                        ),
                      ),
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
