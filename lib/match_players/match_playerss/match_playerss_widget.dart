library;

import 'package:lottie/lottie.dart';
import 'package:vote_for_goat/match_players/match_playerss/resume_to_match_players_widget.dart';
import '../../nav/nav_widget.dart';
import '/backend/api_requests/api_calls.dart';
import '/components/winner_bottom_sheet/winner_bottom_sheet_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
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

  ///1
  // @override
  // void initState() {
  //   super.initState();
  //   _model = createModel(context, () => MatchPlayerssModel());
  //
  //   print('token is: ${FFAppState().authToken}');
  //   print('popup: ${FFAppState().isTapped}');
  //
  //   SchedulerBinding.instance.addPostFrameCallback((_) async {
  //     _model.isLoading = true;
  //     safeSetState(() {});
  //     _model.matchMinionRes = await DashboardGroup.matchPlayersCall.call(
  //       authToken: FFAppState().authToken,
  //     );
  //
  //     final questions = DashboardGroup.matchPlayersCall
  //         .questions((_model.matchMinionRes?.jsonBody ?? '')) ??
  //         [];
  //     final totalQuestions = questions.length;
  //     _model.selectedIndices = List.filled(totalQuestions, -1);
  //
  //     // Pre-populate selections for attempted questions
  //     for (int i = 0; i < questions.length; i++) {
  //       final question = questions[i];
  //       final status = getJsonField(question, r'''$.status''') ?? 0;
  //       final selectedPlayerId =
  //       getJsonField(question, r'''$.selected_player_id''');
  //
  //       if (status == 1 && selectedPlayerId != null) {
  //         final options = getJsonField(question, r'''$.options''').toList();
  //         for (int j = 0; j < options.length; j++) {
  //           if (getJsonField(options[j], r'''$.id''') == selectedPlayerId) {
  //             _model.selectedIndices[i] = j;
  //             break;
  //           }
  //         }
  //       }
  //     }
  //
  //     if (_model.selectedIndices.isNotEmpty) {
  //       _model.selectedIndex = _model.selectedIndices[_model.questionIndex];
  //     }
  //
  //     if ((_model.matchMinionRes?.succeeded ?? true)) {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(
  //           content: Text(
  //             getJsonField(
  //               (_model.matchMinionRes?.jsonBody ?? ''),
  //               r'''$.message''',
  //             ).toString(),
  //             style: const TextStyle(color: Colors.white),
  //           ),
  //           duration: const Duration(milliseconds: 1700),
  //           backgroundColor: Colors.black,
  //         ),
  //       );
  //       _model.isLoading = false;
  //       safeSetState(() {});
  //     } else {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(
  //           content: Text(
  //             getJsonField(
  //               (_model.matchMinionRes?.jsonBody ?? ''),
  //               r'''$.message''',
  //             ).toString(),
  //             style: const TextStyle(color: Colors.white),
  //           ),
  //           duration: const Duration(milliseconds: 1700),
  //           backgroundColor: Colors.black,
  //         ),
  //       );
  //       _model.isLoading = false;
  //       safeSetState(() {});
  //     }
  //   });
  // }

  ///2
  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MatchPlayerssModel());

    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.isLoading = true;
      safeSetState(() {});
      _model.matchMinionRes = await DashboardGroup.matchPlayersCall.call(
        authToken: FFAppState().authToken,
      );

      if ((_model.matchMinionRes?.succeeded ?? true)) {
        // Get all questions from the API response
        final questions = DashboardGroup.matchPlayersCall
                .questions((_model.matchMinionRes?.jsonBody ?? '')) ??
            [];

        // Initialize selectedIndices for persistence
        final totalQuestions = questions.length;
        _model.selectedIndices = List.filled(totalQuestions, -1);

        // ✅ PRE-POPULATE previous selections for attempted questions
        for (int i = 0; i < questions.length; i++) {
          final question = questions[i];
          final status = getJsonField(question, r'''$.status''') ?? 0;
          final selectedPlayerId =
              getJsonField(question, r'''$.selected_player_id''');

          if (status == 1 && selectedPlayerId != null) {
            final options = getJsonField(question, r'''$.options''').toList();
            for (int j = 0; j < options.length; j++) {
              if (getJsonField(options[j], r'''$.id''') == selectedPlayerId) {
                _model.selectedIndices[i] = j; // ✅ Store previous selection
                break;
              }
            }
          }
        }

        // ✅ Find the first unattempted question (status == 0)
        int startIndex = 0;
        for (int i = 0; i < questions.length; i++) {
          final questionStatus = getJsonField(questions[i], r'''$.status''');
          if (questionStatus == 0) {
            startIndex = i;
            break;
          }
        }

        // Set the starting question index and number
        _model.questionIndex = startIndex;
        _model.questionNo = startIndex + 1;
        _model.selectedIndex =
            _model.selectedIndices[startIndex]; // ✅ Load current selection

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              getJsonField(
                (_model.matchMinionRes?.jsonBody ?? ''),
                r'''$.message''',
              ).toString(),
              style: const TextStyle(color: Colors.white),
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
              style: const TextStyle(color: Colors.white),
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

  ///
  ///
  ///

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final totalQuestions = DashboardGroup.matchPlayersCall
            .questions((_model.matchMinionRes?.jsonBody ?? ''))
            ?.length ??
        0;

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
              padding:
                  const EdgeInsetsDirectional.fromSTEB(16.0, 40.0, 16.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        0.0, 0.0, 0.0, 0.0),
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
                                  onTap: () async {
                                    _model.questionIndex -= 1;
                                    _model.questionNo = _model.questionNo! - 1;
                                    _model.selectedIndex = _model
                                        .selectedIndices[_model.questionIndex];
                                    safeSetState(() {});
                                  },
                                  child: Container(
                                    width: 40.0,
                                    height: 40.0,
                                    decoration: BoxDecoration(
                                      color: (Theme.of(context).brightness ==
                                              Brightness.dark)
                                          ? Colors.white
                                          : const Color(0xFFA1A1A1),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Align(
                                      alignment:
                                          const AlignmentDirectional(0.0, 0.0),
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
                            Column(
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Minion',
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
                                const SizedBox(height: 20),
                                Text(
                                  '${_model.questionIndex + 1}/$totalQuestions',
                                  style: FlutterFlowTheme.of(context)
                                      .titleLarge
                                      .override(
                                        font: GoogleFonts.poppins(
                                          fontWeight: FontWeight.bold,
                                        ),
                                        fontSize: 18.0,
                                        color: Colors.orange,
                                      ),
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: CachedNetworkImage(
                                    fadeInDuration:
                                        const Duration(milliseconds: 500),
                                    fadeOutDuration:
                                        const Duration(milliseconds: 500),
                                    imageUrl: valueOrDefault<String>(
                                      getJsonField(
                                        DashboardGroup.matchPlayersCall
                                            .questions(
                                              (_model.matchMinionRes
                                                      ?.jsonBody ??
                                                  ''),
                                            )
                                            ?.elementAtOrNull(
                                                _model.questionIndex),
                                        r'''$.question_image''',
                                      )?.toString(),
                                      '""',
                                    ),
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.6,
                                    height: MediaQuery.sizeOf(context).height *
                                        0.38,
                                    fit: BoxFit.fitHeight,
                                    errorWidget: (context, error, stackTrace) =>
                                        Image.asset(
                                      'assets/images/error_image.webp',
                                      width: MediaQuery.sizeOf(context).width *
                                          0.6,
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.38,
                                      fit: BoxFit.fitHeight,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Builder(
                              builder: (context) => Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    2.0, 0.0, 0.0, 0.0),
                                child: InkWell(
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
                                        barrierDismissible: false,
                                        // Prevent dismissing by tapping outside
                                        context: context,
                                        builder: (dialogContext) {
                                          return PopScope(
                                            canPop: false,
                                            // Prevent back button from closing dialog

                                            child: Dialog(
                                              elevation: 0,
                                              insetPadding: EdgeInsets.zero,
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
                                                    FocusScope.of(dialogContext)
                                                        .unfocus();
                                                    FocusManager
                                                        .instance.primaryFocus
                                                        ?.unfocus();
                                                  },
                                                  child:
                                                      WinnerBottomSheetWidget(
                                                    onContinuePress: () async {
                                                      context.pushNamed(
                                                          NavWidget.routeName);
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    } else {
                                      _model.questionIndex += 1;
                                      _model.questionNo =
                                          _model.questionNo! + 1;
                                      _model.selectedIndex =
                                          _model.selectedIndices[
                                              _model.questionIndex];
                                      safeSetState(() {});
                                    }
                                  },
                                  child: _model.questionIndex ==
                                          totalQuestions - 1

                                      // _model.questionIndex == 49
                                      ? const SizedBox(
                                          width: 40,
                                        )
                                      : Container(
                                          width: 40.0,
                                          height: 40.0,
                                          decoration: BoxDecoration(
                                            color:
                                                (Theme.of(context).brightness ==
                                                        Brightness.dark)
                                                    ? Colors.white
                                                    : const Color(0xFFA1A1A1),
                                            shape: BoxShape.circle,
                                          ),
                                          child: Align(
                                            alignment:
                                                const AlignmentDirectional(
                                                    0.0, 0.0),
                                            child: Icon(
                                              Icons.arrow_forward_ios_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
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
                                final options = (getJsonField(
                                  DashboardGroup.matchPlayersCall
                                      .questions(
                                        (_model.matchMinionRes?.jsonBody ?? ''),
                                      )
                                      ?.elementAtOrNull(_model.questionIndex),
                                  r'''$.options''',
                                ) as List?)?.toList() ?? [];

                                if (options.isEmpty) {
                                  return const Center(
                                    child: Text(
                                      'No options available',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  );
                                }

                                return ListView.builder(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: options.length,
                                  itemBuilder: (context, optionsIndex) {
                                    final optionsItem = options[optionsIndex];
                                    final isSelected = _model.selectedIndices[
                                            _model.questionIndex] ==
                                        optionsIndex;

                                    return InkWell(
                                      onTap: () async {
                                        // ✅ REMOVED RESTRICTION - Now allows modification
                                        _model.selectedIndices[_model
                                            .questionIndex] = optionsIndex;
                                        _model.selectedIndex = optionsIndex;
                                        _model.selectedPlayerId = getJsonField(
                                            optionsItem, r'''$.id''');

                                        safeSetState(
                                            () {}); // UI updates immediately

                                        // Call backend API
                                        _model.apiResultyli =
                                            await DashboardGroup
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
                                          selectPlayerId:
                                              _model.selectedPlayerId,
                                        );

                                        if ((_model.apiResultyli?.succeeded ??
                                            true)) {
                                          // ScaffoldMessenger.of(context).showSnackBar(
                                          //   SnackBar(
                                          //     content: Text(
                                          //       getJsonField(
                                          //         (_model.apiResultyli?.jsonBody ?? ''),
                                          //         r'''$.message''',
                                          //       ).toString(),
                                          //       style: const TextStyle(color: Colors.white),
                                          //     ),
                                          //     duration: const Duration(milliseconds: 1200),
                                          //     backgroundColor: Colors.black,
                                          //   ),
                                          // );
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                getJsonField(
                                                  (_model.apiResultyli
                                                          ?.jsonBody ??
                                                      ''),
                                                  r'''$.message''',
                                                ).toString(),
                                                style: const TextStyle(
                                                    color: Colors.white),
                                              ),
                                              duration: const Duration(
                                                  milliseconds: 1200),
                                              backgroundColor: Colors.black,
                                            ),
                                          );
                                        }
                                        safeSetState(() {});
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: isSelected
                                              ? const Color(0xFF038500)
                                              : (Theme.of(context).brightness ==
                                                      Brightness.dark
                                                  ? const Color(0xFF1C1C22)
                                                  : const Color(0xFFF0F0F0)),
                                          border: Border.all(
                                            color:
                                                (Theme.of(context).brightness ==
                                                        Brightness.dark)
                                                    ? const Color(0xFF4E4E4E)
                                                    : const Color(0xFFE5E5E5),
                                          ),
                                        ),
                                        child: Align(
                                          alignment: const AlignmentDirectional(
                                              0.0, 0.0),
                                          child: Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(0.0, 15.0, 0.0, 15.0),
                                            child: Text(
                                              valueOrDefault<String>(
                                                getJsonField(optionsItem,
                                                        r'''$.name''')
                                                    ?.toString(),
                                                '""',
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
                          Align(
                            alignment: const AlignmentDirectional(0.0, 0.92),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 20.0),
                              child: Column(
                                children: [
                                  _model.questionIndex == 49
                                      ? const SizedBox()
                                      : Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Expanded(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(
                                                        0.0, 0.0, 2.0, 0.0),
                                                child: Container(
                                                  height: 50.0,
                                                  decoration: BoxDecoration(
                                                    color:
                                                        const Color(0xffDD7325),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                    border: Border.all(
                                                      color: const Color(
                                                          0xffDD7325),
                                                    ),
                                                  ),
                                                  child: FFButtonWidget(
                                                    onPressed: () async {
                                                      if (_model
                                                              .selectedIndex ==
                                                          -1) {
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          const SnackBar(
                                                            content: Text(
                                                                'Please choose an option'),
                                                            duration: Duration(
                                                                seconds: 1),
                                                            backgroundColor:
                                                                Colors.red,
                                                          ),
                                                        );
                                                        return;
                                                      }

                                                      _model.apiResultyli =
                                                          await DashboardGroup
                                                              .submitMinionCall
                                                              .call(
                                                        authToken: FFAppState()
                                                            .authToken,
                                                        rightPlayerId:
                                                            getJsonField(
                                                          DashboardGroup
                                                              .matchPlayersCall
                                                              .questions(
                                                                (_model.matchMinionRes
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              )
                                                              ?.elementAtOrNull(
                                                                  _model
                                                                      .questionIndex),
                                                          r'''$.correct_player_id''',
                                                        ),
                                                        selectPlayerId: _model
                                                            .selectedPlayerId,
                                                      );

                                                      if ((_model.apiResultyli
                                                              ?.succeeded ??
                                                          true)) {
                                                        context.goNamed(
                                                            ResumeToMatchPlayersWidget
                                                                .routeName);
                                                      } else {
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          SnackBar(
                                                            content: Text(
                                                              getJsonField(
                                                                (_model.apiResultyli
                                                                        ?.jsonBody ??
                                                                    ''),
                                                                r'''$.message''',
                                                              ).toString(),
                                                              style: const TextStyle(
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                            duration:
                                                                const Duration(
                                                                    milliseconds:
                                                                        1200),
                                                            backgroundColor:
                                                                Colors.black,
                                                          ),
                                                        );
                                                      }
                                                      safeSetState(() {});
                                                    },
                                                    text: 'Save Progress',
                                                    options: FFButtonOptions(
                                                      height: 50.0,
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(25.0,
                                                              13.0, 25.0, 13.0),
                                                      iconPadding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(0.0,
                                                              0.0, 0.0, 0.0),
                                                      color: Colors.transparent,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleLarge
                                                              .override(
                                                                font: GoogleFonts
                                                                    .poppins(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleLarge
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleLarge
                                                                      .fontStyle,
                                                                ),
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleLarge
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleLarge
                                                                    .fontStyle,
                                                              ),
                                                      elevation: 0.0,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                  const SizedBox(height: 5),

                                  ///1
                                  ///
                                  _model.questionIndex == 49
                                      ? const SizedBox()
                                      : Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Expanded(
                                              child: Container(
                                                height: 50.0,
                                                decoration: BoxDecoration(
                                                  color: (Theme.of(context)
                                                              .brightness ==
                                                          Brightness.dark)
                                                      ? const Color(0xFF2C2C2C)
                                                      : const Color(0xFFE5E5E5),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                  border: Border.all(
                                                    color:
                                                        const Color(0xFF4E4E4E),
                                                  ),
                                                ),
                                                child:

                                                    ///auto associate button previous version
                                                    //     Builder(
                                                    //   builder: (context) => FFButtonWidget(
                                                    //     onPressed: () async {
                                                    //       _model.autoAssociateRes = await DashboardGroup.autoAssociateCall.call(
                                                    //         authToken: FFAppState().authToken,
                                                    //       );
                                                    //
                                                    //       if ((_model.autoAssociateRes?.succeeded ?? true)) {
                                                    //         ScaffoldMessenger.of(context).showSnackBar(
                                                    //           SnackBar(
                                                    //             content: Text(
                                                    //               getJsonField(
                                                    //                 (_model.autoAssociateRes?.jsonBody ?? ''),
                                                    //                 r'''$.message''',
                                                    //               ).toString(),
                                                    //               style: const TextStyle(color: Colors.white),
                                                    //             ),
                                                    //             duration: const Duration(milliseconds: 1250),
                                                    //             backgroundColor: Colors.black,
                                                    //           ),
                                                    //         );
                                                    //         await showDialog(
                                                    //           context: context,
                                                    //           builder: (dialogContext) {
                                                    //             return Dialog(
                                                    //               elevation: 0,
                                                    //               insetPadding: EdgeInsets.zero,
                                                    //               backgroundColor: Colors.transparent,
                                                    //               alignment: const AlignmentDirectional(0.0, 0.0)
                                                    //                   .resolve(Directionality.of(context)),
                                                    //               child: WebViewAware(
                                                    //                 child: GestureDetector(
                                                    //                   onTap: () {
                                                    //                     FocusScope.of(dialogContext).unfocus();
                                                    //                     FocusManager.instance.primaryFocus?.unfocus();
                                                    //                   },
                                                    //                   child: WinnerBottomSheetWidget(
                                                    //                     onContinuePress: () async {
                                                    //                       context.goNamed(NavWidget.routeName);
                                                    //                     },
                                                    //                   ),
                                                    //                 ),
                                                    //               ),
                                                    //             );
                                                    //           },
                                                    //         );
                                                    //       } else {
                                                    //         ScaffoldMessenger.of(context).showSnackBar(
                                                    //           SnackBar(
                                                    //             content: Text(
                                                    //               getJsonField(
                                                    //                 (_model.autoAssociateRes?.jsonBody ?? ''),
                                                    //                 r'''$.message''',
                                                    //               ).toString(),
                                                    //               style: const TextStyle(color: Colors.white),
                                                    //             ),
                                                    //             duration: const Duration(milliseconds: 1250),
                                                    //             backgroundColor: Colors.black,
                                                    //           ),
                                                    //         );
                                                    //       }
                                                    //       safeSetState(() {});
                                                    //     },
                                                    //     text: 'Auto Associate',
                                                    //     options: FFButtonOptions(
                                                    //       height: 50.0,
                                                    //       padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                    //       iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                    //       color: const Color(0x00CD4A20),
                                                    //       textStyle: FlutterFlowTheme.of(context).titleLarge.override(
                                                    //         font: GoogleFonts.poppins(
                                                    //           fontWeight: FlutterFlowTheme.of(context).titleLarge.fontWeight,
                                                    //           fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                                                    //         ),
                                                    //         fontSize: 14.0,
                                                    //         letterSpacing: 0.0,
                                                    //         fontWeight: FlutterFlowTheme.of(context).titleLarge.fontWeight,
                                                    //         fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                                                    //       ),
                                                    //       elevation: 0.0,
                                                    //       borderRadius: BorderRadius.circular(8.0),
                                                    //     ),
                                                    //   ),
                                                    // ),

                                                    ///auto associate button new version
                                                    Builder(
                                                  builder: (context) =>
                                                      FFButtonWidget(
                                                    onPressed: () async {
                                                      _model.autoAssociateRes =
                                                          await DashboardGroup
                                                              .autoAssociateCall
                                                              .call(
                                                        authToken: FFAppState()
                                                            .authToken,
                                                      );

                                                      if ((_model
                                                              .autoAssociateRes
                                                              ?.succeeded ??
                                                          true)) {
                                                        ScaffoldMessenger.of(
                                                                context)
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
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                            duration:
                                                                const Duration(
                                                                    milliseconds:
                                                                        1250),
                                                            backgroundColor:
                                                                Colors.black,
                                                          ),
                                                        );

                                                        // Check if any question has been attempted
                                                        final questions = DashboardGroup
                                                                .matchPlayersCall
                                                                .questions((_model
                                                                        .matchMinionRes
                                                                        ?.jsonBody ??
                                                                    '')) ??
                                                            [];

                                                        bool
                                                            hasAttemptedAnyQuestion =
                                                            false;
                                                        for (var question
                                                            in questions) {
                                                          final status =
                                                              getJsonField(
                                                                      question,
                                                                      r'''$.status''') ??
                                                                  0;
                                                          if (status == 1) {
                                                            hasAttemptedAnyQuestion =
                                                                true;
                                                            break;
                                                          }
                                                        }

                                                        if (hasAttemptedAnyQuestion) {
                                                          // Show winner bottom sheet if user has attempted at least one question
                                                          await showDialog(
                                                            barrierDismissible:
                                                                false,
                                                            context: context,
                                                            builder:
                                                                (dialogContext) {
                                                              return PopScope(
                                                                canPop: false,
                                                                // Prevent back button from closing dialog

                                                                child: Dialog(
                                                                  elevation: 0,
                                                                  insetPadding:
                                                                      EdgeInsets
                                                                          .zero,
                                                                  backgroundColor:
                                                                      Colors
                                                                          .transparent,
                                                                  alignment: const AlignmentDirectional(
                                                                          0.0,
                                                                          0.0)
                                                                      .resolve(
                                                                          Directionality.of(
                                                                              context)),
                                                                  child:
                                                                      WebViewAware(
                                                                    child:
                                                                        GestureDetector(
                                                                      onTap:
                                                                          () {
                                                                        FocusScope.of(dialogContext)
                                                                            .unfocus();
                                                                        FocusManager
                                                                            .instance
                                                                            .primaryFocus
                                                                            ?.unfocus();
                                                                      },
                                                                      child:
                                                                          WinnerBottomSheetWidget(
                                                                        onContinuePress:
                                                                            () async {
                                                                          context
                                                                              .goNamed(NavWidget.routeName);
                                                                        },
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          );
                                                        } else {
                                                          // Navigate directly to NavWidget if no questions attempted
                                                          context.goNamed(
                                                              NavWidget
                                                                  .routeName);
                                                        }
                                                      } else {
                                                        ScaffoldMessenger.of(
                                                                context)
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
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                            duration:
                                                                const Duration(
                                                                    milliseconds:
                                                                        1250),
                                                            backgroundColor:
                                                                Colors.black,
                                                          ),
                                                        );
                                                      }
                                                      safeSetState(() {});
                                                    },
                                                    text: 'Auto Associate',
                                                    options: FFButtonOptions(
                                                      height: 50.0,
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(16.0,
                                                              0.0, 16.0, 0.0),
                                                      iconPadding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(0.0,
                                                              0.0, 0.0, 0.0),
                                                      color: const Color(
                                                          0x00CD4A20),
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleLarge
                                                              .override(
                                                                font: GoogleFonts
                                                                    .poppins(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleLarge
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleLarge
                                                                      .fontStyle,
                                                                ),
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleLarge
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleLarge
                                                                    .fontStyle,
                                                              ),
                                                      elevation: 0.0,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
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
                          ),

                          // Add this where the "See Results" button should appear (on the 50th question)
                          // if (_model.questionIndex ==
                          //     49) // 50th question (0-indexed)
                          if (_model.questionIndex == totalQuestions - 1)


                          Container(
                              width: double.infinity,
                              height: 50.0,
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  await showDialog(
                                    context: context,
                                    barrierDismissible: false,
                                    builder: (alertDialogContext) {
                                      return BackdropFilter(
                                        filter: ImageFilter.blur(
                                            sigmaX: 5, sigmaY: 5),
                                        child: AlertDialog(
                                          backgroundColor: Colors.white,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                          ),
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  vertical: 24.0,
                                                  horizontal: 16.0),
                                          content: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Lottie.asset(
                                                'assets/jsons/Bouncing_Basket_Ball.json',
                                                width: 80,
                                                height: 80,
                                                fit: BoxFit.contain,
                                                repeat: true,
                                              ),
                                              const SizedBox(height: 16),
                                              Text(
                                                'Great! You have completed the associations!',
                                                textAlign: TextAlign.center,
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .headlineSmall
                                                    .override(
                                                      font: GoogleFonts.poppins(
                                                          fontWeight:
                                                              FontWeight.w600),
                                                      color: Colors.black,
                                                    ),
                                              ),
                                              const SizedBox(height: 8),
                                              Text(
                                                'Are you ready to view your association results?',
                                                textAlign: TextAlign.center,
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      font:
                                                          GoogleFonts.poppins(),
                                                      color: Colors.black87,
                                                      fontSize: 15,
                                                    ),
                                              ),
                                              const SizedBox(height: 24),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  FFButtonWidget(
                                                    onPressed: () {
                                                      Navigator.pop(
                                                          alertDialogContext);
                                                    },
                                                    text: 'NO',
                                                    options: FFButtonOptions(
                                                      height: 40,
                                                      width: 80,
                                                      color: const Color(
                                                          0xFFE0E0E0),
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                font: GoogleFonts
                                                                    .poppins(),
                                                                color: Colors
                                                                    .black,
                                                              ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                    ),
                                                  ),
                                                  const SizedBox(width: 16),
                                                  FFButtonWidget(
                                                    onPressed: () async {
                                                      Navigator.pop(
                                                          alertDialogContext);
                                                      _model.autoAssociateRes =
                                                          await DashboardGroup
                                                              .autoAssociateCall
                                                              .call(
                                                        authToken: FFAppState()
                                                            .authToken,
                                                      );
                                                      final message =
                                                          getJsonField(
                                                        (_model.autoAssociateRes
                                                                ?.jsonBody ??
                                                            ''),
                                                        r'''$.message''',
                                                      ).toString();
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          content: Text(message,
                                                              style: const TextStyle(
                                                                  color: Colors
                                                                      .white)),
                                                          duration:
                                                              const Duration(
                                                                  milliseconds:
                                                                      1250),
                                                          backgroundColor:
                                                              Colors.black,
                                                        ),
                                                      );
                                                      if ((_model
                                                              .autoAssociateRes
                                                              ?.succeeded ??
                                                          false)) {
                                                        await showDialog(
                                                          barrierDismissible:
                                                              false,
                                                          context: context,
                                                          builder:
                                                              (dialogContext) {
                                                            return PopScope(
                                                              canPop: false,
                                                              child: Dialog(
                                                                insetPadding:
                                                                    EdgeInsets
                                                                        .zero,
                                                                // Remove default padding
                                                                alignment: Alignment
                                                                    .bottomCenter,

                                                                elevation: 0,
                                                                backgroundColor:
                                                                    Colors
                                                                        .transparent,
                                                                child: SizedBox(
                                                                  width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width,
                                                                  // Full width

                                                                  child:
                                                                      WinnerBottomSheetWidget(
                                                                    onContinuePress:
                                                                        () async {
                                                                      context.goNamed(
                                                                          NavWidget
                                                                              .routeName);
                                                                    },
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        );
                                                      }
                                                      safeSetState(() {});
                                                    },
                                                    text: 'YES',
                                                    options: FFButtonOptions(
                                                      height: 40,
                                                      width: 80,
                                                      color: const Color(
                                                          0xFFFF6600),
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                font: GoogleFonts
                                                                    .poppins(),
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                                text: 'See Results',
                                options: FFButtonOptions(
                                  height: 50.0,
                                  color: Colors.green,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleLarge
                                      .override(
                                        font: GoogleFonts.poppins(),
                                        fontSize: 14.0,
                                      ),
                                  elevation: 0.0,
                                  borderRadius: BorderRadius.circular(12.0),
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
            if (!FFAppState().isTapped)
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
                                          Brightness.dark)
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
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(0.0, 8.0, 0.0, 0.0),
                                          child: Column(
                                            children: [
                                              Text(
                                                "50 NBA legends brought back to their college years. Can you match each Minion to its name?\n\nIf you're stuck, Save the progress and continue later or tap the Auto-Associate button to skip the game.",
                                                textAlign: TextAlign.center,
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodySmall
                                                    .override(
                                                      font: GoogleFonts.poppins(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmall
                                                                .fontStyle,
                                                      ),
                                                      color: (Theme.of(context)
                                                                  .brightness ==
                                                              Brightness.dark)
                                                          ? const Color(
                                                              0xA6FFFFFF)
                                                          : const Color(
                                                              0xFF595959),
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmall
                                                              .fontStyle,
                                                      fontSize: 14,
                                                    ),
                                              ),
                                              const SizedBox(height: 16),
                                              Text(
                                                'NOTE: You will not able to access the other functions of the app until you have completed the name-icon association ',
                                                textAlign: TextAlign.center,
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodySmall
                                                    .override(
                                                      font: GoogleFonts.poppins(
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmall
                                                                .fontStyle,
                                                      ),
                                                      color: (Theme.of(context)
                                                                  .brightness ==
                                                              Brightness.dark)
                                                          ? const Color(
                                                              0xA6FFFFFF)
                                                          : const Color(
                                                              0xFF595959),
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmall
                                                              .fontStyle,
                                                      fontSize: 14,
                                                    ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(0.0, 20.0, 0.0, 10.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              FFAppState().isTapped = true;
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
                                                  stops: const [0.0, 1.0],
                                                  begin:
                                                      const AlignmentDirectional(
                                                          0.0, -1.0),
                                                  end:
                                                      const AlignmentDirectional(
                                                          0, 1.0),
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(16.0),
                                              ),
                                              child: Align(
                                                alignment:
                                                    const AlignmentDirectional(
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
