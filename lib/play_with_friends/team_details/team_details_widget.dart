import 'package:share_plus/share_plus.dart';

import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/backend/schema/structs/index.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/index.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'team_details_model.dart';
export 'team_details_model.dart';

class TeamDetailsWidget extends StatefulWidget {
  const TeamDetailsWidget({
    super.key,
    int? teamIndex,
  }) : teamIndex = teamIndex ?? 0;

  final int teamIndex;

  static String routeName = 'TeamDetails';
  static String routePath = '/teamDetails';

  @override
  State<TeamDetailsWidget> createState() => _TeamDetailsWidgetState();
}

class _TeamDetailsWidgetState extends State<TeamDetailsWidget> with RouteAware {
  late TeamDetailsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TeamDetailsModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.isLoading = true;
      safeSetState(() {});
      _model.apiResultr60 = await DashboardGroup.getteamdetailCall.call(
        authToken: FFAppState().authToken,
      );

      if ((_model.apiResultr60?.succeeded ?? true)) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              getJsonField(
                (_model.apiResultr60?.jsonBody ?? ''),
                r'''$.status''',
              ).toString(),
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
            duration: const Duration(milliseconds: 1450),
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
                (_model.apiResultr60?.jsonBody ?? ''),
                r'''$.status''',
              ).toString(),
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
            duration: const Duration(milliseconds: 1450),
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
  void didUpdateWidget(TeamDetailsWidget oldWidget) {
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

// Place this inside your build method, after fetching the team data
    final teamId = getJsonField(
      DashboardGroup.getteamdetailCall
          .teamList((_model.apiResultr60?.jsonBody ?? ''))
          ?.elementAtOrNull(widget.teamIndex),
      r'''$.id''',
    );

    print('Team ID: $teamId');

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
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
            if (!_model.isLoading)
              Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(16.0, 40.0, 16.0, 0.0),
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
                                'TEAM',
                                style: FlutterFlowTheme.of(context)
                                    .customTextStyle1
                                    .override(
                                      fontFamily: 'good times',
                                      color:
                                          FlutterFlowTheme.of(context).tertiary,
                                      fontSize: 28.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.normal,
                                    ),
                              ),
                              Text(
                                'DETAILS',
                                style: FlutterFlowTheme.of(context)
                                    .customTextStyle1
                                    .override(
                                      fontFamily: 'good times',
                                      color: const Color(0xFFEB6027),
                                      fontSize: 28.0,
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
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 30.0, 0.0, 10.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.white,
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
                                  valueOrDefault<String>(
                                    getJsonField(
                                      DashboardGroup.getteamdetailCall
                                          .teamList(
                                            (_model.apiResultr60?.jsonBody ??
                                                ''),
                                          )
                                          ?.elementAtOrNull(widget.teamIndex),
                                      r'''$.logo''',
                                    )?.toString(),
                                    '\"\"',
                                  ),
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) =>
                                      Image.asset(
                                    'assets/images/error_image.webp',
                                    width: double.infinity,
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
                                  child: Text(
                                    valueOrDefault<String>(
                                      getJsonField(
                                        DashboardGroup.getteamdetailCall
                                            .teamList(
                                              (_model.apiResultr60?.jsonBody ??
                                                  ''),
                                            )
                                            ?.elementAtOrNull(widget.teamIndex),
                                        r'''$.title''',
                                      )?.toString(),
                                      '\"\"',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .override(
                                          font: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleLarge
                                                    .fontStyle,
                                          ),
                                          fontSize: 20.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleLarge
                                                  .fontStyle,
                                        ),
                                  ),
                                ),
                              ],
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
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            3.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      '${valueOrDefault<String>(
                                        (getJsonField(
                                                  DashboardGroup
                                                      .getteamdetailCall
                                                      .teamList(
                                                        (_model.apiResultr60
                                                                ?.jsonBody ??
                                                            ''),
                                                      )
                                                      ?.elementAtOrNull(
                                                          widget.teamIndex),
                                                  r'''$.members''',
                                                )
                                                            .toList()
                                                            .map<ToProgressStruct?>(
                                                                ToProgressStruct
                                                                    .maybeFromMap)
                                                            .toList()
                                                        as Iterable<
                                                            ToProgressStruct?>)
                                                    .withoutNulls
                                                    .length ==
                                                null
                                            ? 'No data found'
                                            : valueOrDefault<String>(
                                                getJsonField(
                                                  DashboardGroup
                                                      .getteamdetailCall
                                                      .teamList(
                                                        (_model.apiResultr60
                                                                ?.jsonBody ??
                                                            ''),
                                                      )
                                                      ?.elementAtOrNull(
                                                          widget.teamIndex),
                                                  r'''$.members_count''',
                                                )?.toString(),
                                                '[ ]',
                                              ),
                                        '[ ]',
                                      )} Members',
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

                            ///
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  10.0, 10.0, 10.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.watch_later_outlined,
                                    color: Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? const Color(0xFFC0C0C0)
                                        : const Color(0xFF4D4D4D),
                                    size: 18.0,
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            3.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      "Deadline :",
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
                                  Flexible(
                                    child: Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              3.0, 0.0, 0.0, 0.0),
                                      child: Tooltip(
                                        message: '${getJsonField(
                                          DashboardGroup.getteamdetailCall
                                              .teamList((_model
                                                      .apiResultr60?.jsonBody ??
                                                  ''))
                                              ?.elementAtOrNull(
                                                  widget.teamIndex),
                                          r'''$.date''',
                                        ).toString()} at ${getJsonField(
                                          DashboardGroup.getteamdetailCall
                                              .teamList((_model
                                                      .apiResultr60?.jsonBody ??
                                                  ''))
                                              ?.elementAtOrNull(
                                                  widget.teamIndex),
                                          r'''$.time''',
                                        ).toString()}',
                                        preferBelow: false,
                                        textStyle: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.black87,
                                          borderRadius:
                                              BorderRadius.circular(6),
                                        ),
                                        child: Text(
                                          '${getJsonField(
                                            DashboardGroup.getteamdetailCall
                                                .teamList((_model.apiResultr60
                                                        ?.jsonBody ??
                                                    ''))
                                                ?.elementAtOrNull(
                                                    widget.teamIndex),
                                            r'''$.date''',
                                          ).toString()} at ${getJsonField(
                                            DashboardGroup.getteamdetailCall
                                                .teamList((_model.apiResultr60
                                                        ?.jsonBody ??
                                                    ''))
                                                ?.elementAtOrNull(
                                                    widget.teamIndex),
                                            r'''$.time''',
                                          ).toString()}',
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.start,
                                          style: FlutterFlowTheme.of(context)
                                              .bodySmall
                                              .override(
                                                font: GoogleFonts.poppins(
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
                                                color:
                                                    FlutterFlowTheme.of(context)
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
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            ///



                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  10.0, 14.0, 10.0, 10.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [


                                  getJsonField(
                                    DashboardGroup.getteamdetailCall
                                        .teamList((_model
                                        .apiResultr60?.jsonBody ??
                                        ''))
                                        ?.elementAtOrNull(
                                        widget.teamIndex),
                                    r'''$.is_invite''',
                                  ) == 0 ? SizedBox() :
                                  InkWell(
                                    // onTap: () async {
                                    //   print(
                                    //       'Invite Friends button tapped with teamId: $teamId');
                                    //   await Share.share(
                                    //     'Join my team on Vote for GOAT! Use my Team ID: $teamId to join and compete together. Download the app here: https://example.com/download',
                                    //   );
                                    // },

                                    onTap: () async {
                                      final teamList = DashboardGroup
                                              .getteamdetailCall
                                              .teamList(_model
                                                      .apiResultr60?.jsonBody ??
                                                  '') ??
                                          [];

                                      if (widget.teamIndex < 0 ||
                                          widget.teamIndex >= teamList.length) {
                                        debugPrint(
                                            'Invite Friends tap ignored: invalid index ${widget.teamIndex}.');
                                        return;
                                      }

                                      final teamItem =
                                          teamList.elementAt(widget.teamIndex);
                                      final teamTitle =
                                          getJsonField(teamItem, r'''$.title''')
                                              .toString();
                                      final teamId =
                                          getJsonField(teamItem, r'''$.id''')
                                              .toString();
                                      final inviteCode = getJsonField(
                                              teamItem, r'''$.invite_code''')
                                          .toString();

                                      debugPrint(
                                        'Invite Friends tapped -> teamId=$teamId, title=$teamTitle, inviteCode=$inviteCode',
                                      );

                                      final customInviteMessage = '''
Hey!
Do you know the Vote The Goat app?
I'd like to invite you to join and discover your favorite basketball legends!

Use my invite code $inviteCode to sign up and start exploring.

Download the app now and join the fun!
You can download it here: [APP_DOWNLOAD_LINK]
''';

                                      await Share.share(
                                        customInviteMessage,
                                        sharePositionOrigin:
                                            getWidgetBoundingBox(context),
                                      );
                                    },
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.42,
                                      decoration: BoxDecoration(
                                        gradient: const LinearGradient(
                                          colors: [
                                            Color(0xFFDD7325),
                                            Color(0xFFD69E7E),
                                            Color(0xFFDD7325)
                                          ],
                                          stops: [0.0, 0.5, 1.0],
                                          begin: AlignmentDirectional(0.0, 1.0),
                                          end: AlignmentDirectional(0, -1.0),
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(10.0, 6.0, 10.0, 6.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            const Icon(
                                              Icons.share_sharp,
                                              color: Colors.white,
                                              size: 16.0,
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                      8.0, 0.0, 0.0, 0.0),
                                              child: Text(
                                                'Invite Friends',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .titleMedium
                                                    .override(
                                                      font: GoogleFonts.poppins(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleMedium
                                                                .fontStyle,
                                                      ),
                                                      color: Colors.white,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w500,
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
                                    ),
                                  ),
                                  Align(
                                    alignment:
                                        const AlignmentDirectional(0.0, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        print(
                                            'Navigating to PlayWithFriendRankingWidget with teamId: $teamId');
                                        context.pushNamed(
                                          PlayWithFriendRankingWidget.routeName,
                                          queryParameters: {
                                            'teamId': serializeParam(
                                              teamId,
                                              ParamType.int,
                                            ),
                                          }.withoutNulls,
                                        );
                                      },
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.42,
                                        decoration: BoxDecoration(
                                          gradient: const LinearGradient(
                                            colors: [
                                              Color(0xFF038500),
                                              Color(0xFF40AE3C),
                                              Color(0xFF038500)
                                            ],
                                            stops: [0.0, 0.5, 1.0],
                                            begin:
                                                AlignmentDirectional(0.0, 1.0),
                                            end: AlignmentDirectional(0, -1.0),
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        child: Align(
                                          alignment: const AlignmentDirectional(
                                              0.0, 0.0),
                                          child: Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(10.0, 6.0, 10.0, 6.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                const Icon(
                                                  Icons.remove_red_eye,
                                                  color: Colors.white,
                                                  size: 16.0,
                                                ),
                                                Align(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(
                                                            8.0, 0.0, 0.0, 0.0),
                                                    child: Text(
                                                      'Ranking',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .titleMedium
                                                          .override(
                                                            font: GoogleFonts
                                                                .poppins(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMedium
                                                                      .fontStyle,
                                                            ),
                                                            color: Colors.white,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMedium
                                                                    .fontStyle,
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
                                ],
                              ),
                            ),


                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 30.0, 0.0, 0.0),
                              child: Container(
                                height:
                                    MediaQuery.sizeOf(context).height * 0.44,
                                decoration: const BoxDecoration(),
                                child: Builder(
                                  builder: (context) {
                                    final teamMembers = getJsonField(
                                      DashboardGroup.getteamdetailCall
                                          .teamList(
                                            (_model.apiResultr60?.jsonBody ??
                                                ''),
                                          )
                                          ?.elementAtOrNull(widget.teamIndex),
                                      r'''$.members''',
                                    ).toList();
                                    _model.debugGeneratorVariables[
                                            'teamMembers${teamMembers.length > 100 ? ' (first 100)' : ''}'] =
                                        debugSerializeParam(
                                      teamMembers.take(100),
                                      ParamType.JSON,
                                      isList: true,
                                      link:
                                          'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=TeamDetails',
                                      name: 'dynamic',
                                      nullable: false,
                                    );
                                    debugLogWidgetClass(_model);

                                    return ListView.builder(
                                      padding: EdgeInsets.zero,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount: teamMembers.length,
                                      itemBuilder: (context, teamMembersIndex) {
                                        final teamMembersItem =
                                            teamMembers[teamMembersIndex];
                                        return Container(
                                          width: 100.0,
                                          decoration: const BoxDecoration(),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    width: 42.0,
                                                    height: 42.0,
                                                    clipBehavior:
                                                        Clip.antiAlias,
                                                    decoration:
                                                        const BoxDecoration(
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: CachedNetworkImage(
                                                      fadeInDuration:
                                                          const Duration(
                                                              milliseconds:
                                                                  500),
                                                      fadeOutDuration:
                                                          const Duration(
                                                              milliseconds:
                                                                  500),
                                                      imageUrl: getJsonField(
                                                        teamMembersItem,
                                                        r'''$.user.image''',
                                                      ).toString(),
                                                      fit: BoxFit.cover,
                                                      errorWidget: (context,
                                                              error,
                                                              stackTrace) =>
                                                          Image.asset(
                                                        'assets/images/error_image.webp',
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(20.0,
                                                              0.0, 0.0, 0.0),
                                                      child: Text(
                                                        getJsonField(
                                                          teamMembersItem,
                                                          r'''$.user.name''',
                                                        ).toString(),
                                                        style:
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
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Divider(
                                                thickness: 2.0,
                                                color: Theme.of(context)
                                                            .brightness ==
                                                        Brightness.dark
                                                    ? const Color(0xFF4E4E4E)
                                                    : const Color(0x1A000000),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  },
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
            if (!_model.isLoading)
              Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 30.0),
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
                  child: FFButtonWidget(
                    onPressed: () async {
                      context.pushNamed(
                        ChatPageWidget.routeName,
                        queryParameters: {
                          'teamId': serializeParam(
                            valueOrDefault<int>(
                              getJsonField(
                                DashboardGroup.getteamdetailCall
                                    .teamList(
                                      (_model.apiResultr60?.jsonBody ?? ''),
                                    )
                                    ?.elementAtOrNull(widget.teamIndex),
                                r'''$.id''',
                              ),
                              0,
                            ),
                            ParamType.int,
                          ),
                        }.withoutNulls,
                      );
                    },
                    text: 'Chat With Team',
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 47.0,
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          16.0, 0.0, 16.0, 0.0),
                      iconPadding: const EdgeInsetsDirectional.fromSTEB(
                          0.0, 0.0, 0.0, 0.0),
                      color: const Color(0x00CD4A20),
                      textStyle:
                          FlutterFlowTheme.of(context).titleLarge.override(
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
