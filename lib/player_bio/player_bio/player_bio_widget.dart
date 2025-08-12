import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'player_bio_model.dart';
export 'player_bio_model.dart';

class PlayerBioWidget extends StatefulWidget {
  const PlayerBioWidget({
    super.key,
    this.playerId,
  });

  final int? playerId;

  static String routeName = 'playerBio';
  static String routePath = '/playerBio';

  @override
  State<PlayerBioWidget> createState() => _PlayerBioWidgetState();
}

class _PlayerBioWidgetState extends State<PlayerBioWidget>
    with TickerProviderStateMixin {
  late PlayerBioModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PlayerBioModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.apiResultwyv = await DashboardGroup.playertBioCall.call(
        playerId: widget.playerId,
        authToken: FFAppState().authToken,
      );

      if ((_model.apiResultwyv?.succeeded ?? true)) {
        await Future.wait([
          Future(() async {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  getJsonField(
                    (_model.apiResultwyv?.jsonBody ?? ''),
                    r'''$.message''',
                  ).toString(),
                  style: FlutterFlowTheme.of(context).titleMedium.override(
                        font: GoogleFonts.poppins(
                          fontWeight: FlutterFlowTheme.of(context)
                              .titleMedium
                              .fontWeight,
                          fontStyle: FlutterFlowTheme.of(context)
                              .titleMedium
                              .fontStyle,
                        ),
                        color: Colors.white,
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).titleMedium.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).titleMedium.fontStyle,
                      ),
                ),
                duration: Duration(milliseconds: 4000),
                backgroundColor: Colors.black,
              ),
            );
          }),
          Future(() async {
            safeSetState(() {});
          }),
        ]);
        return;
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              getJsonField(
                (_model.apiResultwyv?.jsonBody ?? ''),
                r'''$.message''',
              ).toString(),
              style: FlutterFlowTheme.of(context).titleMedium.override(
                    font: GoogleFonts.poppins(
                      fontWeight:
                          FlutterFlowTheme.of(context).titleMedium.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).titleMedium.fontStyle,
                    ),
                    color: Colors.white,
                    letterSpacing: 0.0,
                    fontWeight:
                        FlutterFlowTheme.of(context).titleMedium.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).titleMedium.fontStyle,
                  ),
            ),
            duration: Duration(milliseconds: 4000),
            backgroundColor: Colors.black,
          ),
        );
        return;
      }
    });

    _model.tabBarController = TabController(
      vsync: this,
      length: 4,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                    ? 'assets/images/commonBg.png'
                    : 'assets/images/plain_whiteBg.png',
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.fill,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 40.0, 16.0, 0.0),
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
                                  ? Color(0xD5999999)
                                  : Colors.white,
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
                                : Color(0xD5999999),
                          ),
                        ),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pop();
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
                            'Player',
                            style: FlutterFlowTheme.of(context)
                                .customTextStyle1
                                .override(
                                  fontFamily: 'goodtimes',
                                  color: Color(0xFFEB6027),
                                  fontSize: 24.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                ),
                          ),
                          Text(
                            ' bio',
                            style: FlutterFlowTheme.of(context)
                                .customTextStyle1
                                .override(
                                  fontFamily: 'goodtimes',
                                  color: FlutterFlowTheme.of(context).tertiary,
                                  fontSize: 24.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                ),
                          ),
                        ],
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
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
                                    ? Color(0xD5999999)
                                    : Colors.white,
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
                                  : Color(0xD5999999),
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
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 20.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${getJsonField(
                                  (_model.apiResultwyv?.jsonBody ?? ''),
                                  r'''$.data.first_name''',
                                ).toString()} ${getJsonField(
                                  (_model.apiResultwyv?.jsonBody ?? ''),
                                  r'''$.data.last_name''',
                                ).toString()}',
                                style: FlutterFlowTheme.of(context)
                                    .displayMedium
                                    .override(
                                      font: GoogleFonts.bebasNeue(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .displayMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .displayMedium
                                            .fontStyle,
                                      ),
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .displayMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .displayMedium
                                          .fontStyle,
                                    ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 3.0, 0.0, 3.0),
                                child: Text(
                                  getJsonField(
                                    DashboardGroup.playertBioCall.playerData(
                                      (_model.apiResultwyv?.jsonBody ?? ''),
                                    ),
                                    r'''$.nick_name''',
                                  ).toString(),
                                  style: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        font: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w600,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontStyle,
                                        ),
                                        color:
                                            FlutterFlowTheme.of(context).peach,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontStyle,
                                      ),
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    'DOB :',
                                    style: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .override(
                                          font: GoogleFonts.poppins(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .titleMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleMedium
                                                    .fontStyle,
                                          ),
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .titleMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        4.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      getJsonField(
                                        DashboardGroup.playertBioCall
                                            .playerData(
                                          (_model.apiResultwyv?.jsonBody ?? ''),
                                        ),
                                        r'''$.dob''',
                                      ).toString(),
                                      style: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .override(
                                            font: GoogleFonts.poppins(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMedium
                                                      .fontStyle,
                                            ),
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .titleMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    'Age :',
                                    style: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .override(
                                          font: GoogleFonts.poppins(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .titleMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleMedium
                                                    .fontStyle,
                                          ),
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .titleMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        4.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      getJsonField(
                                        DashboardGroup.playertBioCall
                                            .playerData(
                                          (_model.apiResultwyv?.jsonBody ?? ''),
                                        ),
                                        r'''$.age''',
                                      ).toString(),
                                      style: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .override(
                                            font: GoogleFonts.poppins(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMedium
                                                      .fontStyle,
                                            ),
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .titleMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: SvgPicture.asset(
                                  'assets/images/minions.svg',
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.3,
                                  fit: BoxFit.scaleDown,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment(0.0, 0),
                          child: TabBar(
                            isScrollable: true,
                            labelColor: FlutterFlowTheme.of(context).peach,
                            unselectedLabelColor:
                                FlutterFlowTheme.of(context).primaryText,
                            labelStyle: FlutterFlowTheme.of(context)
                                .headlineLarge
                                .override(
                                  font: GoogleFonts.bebasNeue(
                                    fontWeight: FontWeight.normal,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .headlineLarge
                                        .fontStyle,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .headlineLarge
                                      .fontStyle,
                                ),
                            unselectedLabelStyle: FlutterFlowTheme.of(context)
                                .headlineLarge
                                .override(
                                  font: GoogleFonts.bebasNeue(
                                    fontWeight: FontWeight.normal,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .headlineLarge
                                        .fontStyle,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .headlineLarge
                                      .fontStyle,
                                ),
                            indicatorColor:
                                FlutterFlowTheme.of(context).primary,
                            tabs: [
                              Tab(
                                text: 'Profile',
                              ),
                              Tab(
                                text: 'LIST OF AWARDS',
                              ),
                              Tab(
                                text: 'Achievements',
                              ),
                              Tab(
                                text: 'Stats',
                              ),
                            ],
                            controller: _model.tabBarController,
                            onTap: (i) async {
                              [
                                () async {},
                                () async {},
                                () async {},
                                () async {}
                              ][i]();
                            },
                          ),
                        ),
                        Expanded(
                          child: TabBarView(
                            controller: _model.tabBarController,
                            physics: const NeverScrollableScrollPhysics(),
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 16.0, 0.0, 0.0),
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, -1.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, -1.0),
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        color: (Theme.of(context)
                                                                        .brightness ==
                                                                    Brightness
                                                                        .dark) ==
                                                                true
                                                            ? Colors.transparent
                                                            : Color(0xFFEBEAEA),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        border: Border.all(
                                                          color: (Theme.of(context)
                                                                          .brightness ==
                                                                      Brightness
                                                                          .dark) ==
                                                                  true
                                                              ? Color(
                                                                  0xFF282727)
                                                              : Colors.white,
                                                        ),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    6.0,
                                                                    8.0,
                                                                    6.0,
                                                                    8.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .end,
                                                          children: [
                                                            ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              child: SvgPicture
                                                                  .asset(
                                                                'assets/images/ball.svg',
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      -1.0,
                                                                      0.0),
                                                              child: Text(
                                                                'PERIOD',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmall
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .poppins(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodySmall
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodySmall
                                                                            .fontStyle,
                                                                      ),
                                                                      fontSize:
                                                                          10.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodySmall
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodySmall
                                                                          .fontStyle,
                                                                    ),
                                                              ),
                                                            ),
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      -1.0,
                                                                      0.0),
                                                              child: Text(
                                                                '${getJsonField(
                                                                  DashboardGroup
                                                                      .playertBioCall
                                                                      .playerData(
                                                                    (_model.apiResultwyv
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  ),
                                                                  r'''$.active_from_year''',
                                                                ).toString()} - ${getJsonField(
                                                                  DashboardGroup
                                                                      .playertBioCall
                                                                      .playerData(
                                                                    (_model.apiResultwyv
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  ),
                                                                  r'''$.active_to_year''',
                                                                ).toString()}',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleLarge
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .poppins(
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .titleLarge
                                                                            .fontStyle,
                                                                      ),
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleLarge
                                                                          .fontStyle,
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
                                          ),
                                          Container(
                                            width: 10.0,
                                            decoration: BoxDecoration(),
                                          ),
                                          Expanded(
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, -1.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, -1.0),
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        color: (Theme.of(context)
                                                                        .brightness ==
                                                                    Brightness
                                                                        .dark) ==
                                                                true
                                                            ? Colors.transparent
                                                            : Color(0xFFEBEAEA),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        border: Border.all(
                                                          color: (Theme.of(context)
                                                                          .brightness ==
                                                                      Brightness
                                                                          .dark) ==
                                                                  true
                                                              ? Color(
                                                                  0xFF282727)
                                                              : Colors.white,
                                                        ),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    6.0,
                                                                    8.0,
                                                                    6.0,
                                                                    8.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .end,
                                                          children: [
                                                            ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              child: SvgPicture
                                                                  .asset(
                                                                'assets/images/Vector.svg',
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      -1.0,
                                                                      0.0),
                                                              child: Text(
                                                                'POSITION',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmall
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .poppins(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodySmall
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodySmall
                                                                            .fontStyle,
                                                                      ),
                                                                      fontSize:
                                                                          10.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodySmall
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodySmall
                                                                          .fontStyle,
                                                                    ),
                                                              ),
                                                            ),
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      -1.0,
                                                                      0.0),
                                                              child: Text(
                                                                getJsonField(
                                                                  DashboardGroup
                                                                      .playertBioCall
                                                                      .playerData(
                                                                    (_model.apiResultwyv
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  ),
                                                                  r'''$.position_name''',
                                                                ).toString(),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleLarge
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .poppins(
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .titleLarge
                                                                            .fontStyle,
                                                                      ),
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleLarge
                                                                          .fontStyle,
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
                                          ),
                                          Container(
                                            width: 10.0,
                                            decoration: BoxDecoration(),
                                          ),
                                          Expanded(
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, -1.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, -1.0),
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        color: (Theme.of(context)
                                                                        .brightness ==
                                                                    Brightness
                                                                        .dark) ==
                                                                true
                                                            ? Colors.transparent
                                                            : Color(0xFFEBEAEA),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        border: Border.all(
                                                          color: (Theme.of(context)
                                                                          .brightness ==
                                                                      Brightness
                                                                          .dark) ==
                                                                  true
                                                              ? Color(
                                                                  0xFF282727)
                                                              : Colors.white,
                                                        ),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    6.0,
                                                                    8.0,
                                                                    6.0,
                                                                    8.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .end,
                                                          children: [
                                                            ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              child: SvgPicture
                                                                  .asset(
                                                                'assets/images/Group_(2).svg',
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      -1.0,
                                                                      0.0),
                                                              child: Text(
                                                                'HEIGHT',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmall
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .poppins(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodySmall
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodySmall
                                                                            .fontStyle,
                                                                      ),
                                                                      fontSize:
                                                                          10.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodySmall
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodySmall
                                                                          .fontStyle,
                                                                    ),
                                                              ),
                                                            ),
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      -1.0,
                                                                      0.0),
                                                              child: Text(
                                                                '${getJsonField(
                                                                  DashboardGroup
                                                                      .playertBioCall
                                                                      .playerData(
                                                                    (_model.apiResultwyv
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  ),
                                                                  r'''$.height''',
                                                                ).toString()}',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleLarge
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .poppins(
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .titleLarge
                                                                            .fontStyle,
                                                                      ),
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleLarge
                                                                          .fontStyle,
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
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 10.0, 0.0, 0.0),
                                        child: Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            border: Border.all(
                                              color: (Theme.of(context)
                                                              .brightness ==
                                                          Brightness.dark) ==
                                                      true
                                                  ? Color(0xFF282727)
                                                  : Color(0xFFE9E8E8),
                                            ),
                                          ),
                                          child: SingleChildScrollView(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          9.0,
                                                                          0.0,
                                                                          9.0),
                                                              child: Text(
                                                                'Dob',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineLarge
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .poppins(
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .headlineLarge
                                                                            .fontStyle,
                                                                      ),
                                                                      color: Color(
                                                                          0xFFFF7D1F),
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .headlineLarge
                                                                          .fontStyle,
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 10.0,
                                                      decoration:
                                                          BoxDecoration(),
                                                    ),
                                                    Expanded(
                                                      child: Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          9.0,
                                                                          0.0,
                                                                          9.0),
                                                              child: Text(
                                                                'Age',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineLarge
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .poppins(
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .headlineLarge
                                                                            .fontStyle,
                                                                      ),
                                                                      color: Color(
                                                                          0xFFFF7D1F),
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .headlineLarge
                                                                          .fontStyle,
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: (Theme.of(context)
                                                                            .brightness ==
                                                                        Brightness
                                                                            .dark) ==
                                                                    true
                                                                ? Color(
                                                                    0xFF2A2A2A)
                                                                : Color(
                                                                    0xFFEAEAEA),
                                                          ),
                                                          child: Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          10.0,
                                                                          0.0,
                                                                          10.0),
                                                              child: Text(
                                                                getJsonField(
                                                                  DashboardGroup
                                                                      .playertBioCall
                                                                      .playerData(
                                                                    (_model.apiResultwyv
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  ),
                                                                  r'''$.dob''',
                                                                ).toString(),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineLarge
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .poppins(
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .headlineLarge
                                                                            .fontStyle,
                                                                      ),
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .headlineLarge
                                                                          .fontStyle,
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 1.0,
                                                      decoration:
                                                          BoxDecoration(),
                                                    ),
                                                    Expanded(
                                                      child: Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: (Theme.of(context)
                                                                            .brightness ==
                                                                        Brightness
                                                                            .dark) ==
                                                                    true
                                                                ? Color(
                                                                    0xFF2A2A2A)
                                                                : Color(
                                                                    0xFFEAEAEA),
                                                          ),
                                                          child: Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          10.0,
                                                                          0.0,
                                                                          10.0),
                                                              child: Text(
                                                                getJsonField(
                                                                  DashboardGroup
                                                                      .playertBioCall
                                                                      .playerData(
                                                                    (_model.apiResultwyv
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  ),
                                                                  r'''$.age''',
                                                                ).toString(),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineLarge
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .poppins(
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .headlineLarge
                                                                            .fontStyle,
                                                                      ),
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .headlineLarge
                                                                          .fontStyle,
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          9.0,
                                                                          0.0,
                                                                          9.0),
                                                              child: Text(
                                                                'Dob',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineLarge
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .poppins(
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .headlineLarge
                                                                            .fontStyle,
                                                                      ),
                                                                      color: Color(
                                                                          0xFFFF7D1F),
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .headlineLarge
                                                                          .fontStyle,
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 10.0,
                                                      decoration:
                                                          BoxDecoration(),
                                                    ),
                                                    Expanded(
                                                      child: Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          9.0,
                                                                          0.0,
                                                                          9.0),
                                                              child: Text(
                                                                'Age',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineLarge
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .poppins(
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .headlineLarge
                                                                            .fontStyle,
                                                                      ),
                                                                      color: Color(
                                                                          0xFFFF7D1F),
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .headlineLarge
                                                                          .fontStyle,
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: (Theme.of(context)
                                                                            .brightness ==
                                                                        Brightness
                                                                            .dark) ==
                                                                    true
                                                                ? Color(
                                                                    0xFF2A2A2A)
                                                                : Color(
                                                                    0xFFEAEAEA),
                                                          ),
                                                          child: Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          10.0,
                                                                          0.0,
                                                                          10.0),
                                                              child: Text(
                                                                '16 March 1994',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineLarge
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .poppins(
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .headlineLarge
                                                                            .fontStyle,
                                                                      ),
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .headlineLarge
                                                                          .fontStyle,
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 1.0,
                                                      decoration:
                                                          BoxDecoration(),
                                                    ),
                                                    Expanded(
                                                      child: Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: (Theme.of(context)
                                                                            .brightness ==
                                                                        Brightness
                                                                            .dark) ==
                                                                    true
                                                                ? Color(
                                                                    0xFF2A2A2A)
                                                                : Color(
                                                                    0xFFEAEAEA),
                                                          ),
                                                          child: Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          10.0,
                                                                          0.0,
                                                                          10.0),
                                                              child: Text(
                                                                '30Y  10M  13D',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineLarge
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .poppins(
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .headlineLarge
                                                                            .fontStyle,
                                                                      ),
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .headlineLarge
                                                                          .fontStyle,
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Container(
                                                  width: double.infinity,
                                                  decoration: BoxDecoration(),
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  9.0,
                                                                  0.0,
                                                                  9.0),
                                                      child: Text(
                                                        'Seasons in NBA',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineLarge
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .poppins(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineLarge
                                                                        .fontStyle,
                                                                  ),
                                                                  color: Color(
                                                                      0xFFFF7D1F),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineLarge
                                                                      .fontStyle,
                                                                ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  width: double.infinity,
                                                  decoration: BoxDecoration(),
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  10.0,
                                                                  0.0,
                                                                  10.0),
                                                      child: Text(
                                                        'Lorem Ipsum',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineLarge
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .poppins(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineLarge
                                                                        .fontStyle,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineLarge
                                                                      .fontStyle,
                                                                ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  width: double.infinity,
                                                  decoration: BoxDecoration(),
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  9.0,
                                                                  0.0,
                                                                  9.0),
                                                      child: Text(
                                                        'Teams in NBA',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineLarge
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .poppins(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineLarge
                                                                        .fontStyle,
                                                                  ),
                                                                  color: Color(
                                                                      0xFFFF7D1F),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineLarge
                                                                      .fontStyle,
                                                                ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  width: double.infinity,
                                                  decoration: BoxDecoration(),
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  9.0,
                                                                  0.0,
                                                                  9.0),
                                                      child: Text(
                                                        'Seasons in NBA',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineLarge
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .poppins(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineLarge
                                                                        .fontStyle,
                                                                  ),
                                                                  color: Colors
                                                                      .white,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineLarge
                                                                      .fontStyle,
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
                                    ],
                                  ),
                                ),
                              ),
                              Container(),
                              Container(),
                              Container(),
                            ],
                          ),
                        ),
                      ],
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
