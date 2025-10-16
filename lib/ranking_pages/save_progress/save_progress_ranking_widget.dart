

import 'package:vote_for_goat/custom_code/widgets/cube_grid_loader.dart';
import '/backend/api_requests/api_calls.dart';
import '/components/drawer_menu/drawer_menu_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'save_progress_ranking_model.dart';
export 'save_progress_ranking_model.dart';

class SaveProgressRankingWidget extends StatefulWidget {
  const SaveProgressRankingWidget({super.key});

  static String routeName = 'SaveProgressRanking';
  static String routePath = '/saveProgressRanking';

  @override
  State<SaveProgressRankingWidget> createState() =>
      _SaveProgressRankingWidgetState();
}

class _SaveProgressRankingWidgetState extends State<SaveProgressRankingWidget>
    with RouteAware {
  late SaveProgressRankingModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  bool _loading = false;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SaveProgressRankingModel());
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    _model.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(SaveProgressRankingWidget oldWidget) {
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

    return FutureBuilder<ApiCallResponse>(
      future: DashboardGroup.positionlistCall.call(
        authToken: FFAppState().authToken,
      ),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).oposite,
            body: const Center(
              child: CubeGridLoader(
                size: 40.0,
              ),
            ),
          );
        }

        final positionlistResponse = snapshot.data!;
        final players = DashboardGroup.positionlistCall
                .positionList(positionlistResponse.jsonBody)
                ?.toList() ??
            [];

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).oposite,
            drawer: Drawer(
              elevation: 16.0,
              child: WebViewAware(
                child: wrapWithModel(
                  model: _model.drawerMenuModel,
                  updateCallback: () => safeSetState(() {}),
                  child: Builder(builder: (_) {
                    return DebugFlutterFlowModelContext(
                      rootModel: _model.rootModel,
                      child: const DrawerMenuWidget(),
                    );
                  }),
                ),
              ),
            ),
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
                Align(
                  alignment: const AlignmentDirectional(0.0, -1.0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(
                        0.0,
                        valueOrDefault<double>(
                          MediaQuery.sizeOf(context).height * 0.02,
                          0.0,
                        ),
                        0.0,
                        0.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        Theme.of(context).brightness == Brightness.dark
                            ? 'assets/images/logo_vtg.png'
                            : 'assets/images/LOGO_VTG_3.png',
                        width: 142.0,
                        height: 142.0,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 0.0),
                  child: _loading
                      ? const Center(
                          child: CubeGridLoader(
                            size: 40.0,
                          ),
                        )
                      : Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
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
                                                  ? const Color(0xD5999999)
                                                  : Colors.white,
                                          offset: const Offset(0.0, 2.0),
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
                                        context.pop();
                                      },
                                      child: Icon(
                                        Icons.arrow_back,
                                        color: FlutterFlowTheme.of(context)
                                            .tertiary,
                                        size: 24.0,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            8.0, 0.0, 0.0, 0.0),
                                    child: InkWell(
                                      onTap: (){
                                        context.pop();
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
                                                      ? const Color(0xD5999999)
                                                      : Colors.white,
                                              offset: const Offset(0.0, 2.0),
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                          border: Border.all(
                                            color:
                                                (Theme.of(context).brightness ==
                                                            Brightness.dark) ==
                                                        true
                                                    ? Colors.black
                                                    : const Color(0xD5999999),
                                          ),
                                        ),
                                        child: Align(
                                          alignment: const AlignmentDirectional(
                                              0.0, 0.0),
                                          child: FaIcon(
                                            FontAwesomeIcons.edit,
                                            color: FlutterFlowTheme.of(context)
                                                .tertiary,
                                            size: 24.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0,
                                  valueOrDefault<double>(
                                    MediaQuery.sizeOf(context).height * 0.1,
                                    0.0,
                                  ),
                                  0.0,
                                  0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    'Your',
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
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 0.0, 0.0),
                                    child: RichText(
                                      textScaler:
                                          MediaQuery.of(context).textScaler,
                                      text: TextSpan(
                                        children: [
                                          // TextSpan(
                                          //   text: 'TEAM',
                                          //   style: FlutterFlowTheme.of(context)
                                          //       .customTextStyle1
                                          //       .override(
                                          //         fontFamily: 'good times',
                                          //         color:
                                          //             const Color(0xFFEB6027),
                                          //         fontSize: 24.0,
                                          //         letterSpacing: 0.0,
                                          //         fontWeight: FontWeight.normal,
                                          //       ),
                                          // ),
                                          TextSpan(
                                            text: ' ranking',
                                            style: FlutterFlowTheme.of(context)
                                                .customTextStyle1
                                                .override(
                                                  fontFamily: 'good times',

                                                  color:  const Color(0xFFEB6027),

                                                  fontSize: 24.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0,
                                    valueOrDefault<double>(
                                      MediaQuery.sizeOf(context).height * 0.08,
                                      0.0,
                                    ),
                                    0.0,
                                    0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    // Top 3 podium (only if we have at least 3 players)
                                    if (players.length >= 3)
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          // Second place
                                          _buildPodiumContainer(players[1], 2,
                                              140.0, const Color(0xFFA8A8A8)),
                                          // First place
                                          _buildPodiumContainer(players[0], 1,
                                              160.0, const Color(0xFFFFD700)),
                                          // Third place
                                          _buildPodiumContainer(players[2], 3,
                                              125.0, const Color(0xFFCD7F32)),
                                        ],
                                      ),
                                    // Header row
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
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(10.0, 7.0, 10.0, 7.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              'Rank',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    font: GoogleFonts.baloo2(
                                                      fontWeight:
                                                          FontWeight.w800,
                                                    ),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .oposite,
                                                    fontSize: 16.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w800,
                                                  ),
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(
                                                        40.0, 0.0, 0.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: Text(
                                                        'Player',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .baloo2(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w800,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .oposite,
                                                                  fontSize:
                                                                      16.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w800,
                                                                ),
                                                      ),
                                                    ),
                                                    Text(
                                                      'GOAT Points',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            font: GoogleFonts
                                                                .baloo2(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w800,
                                                            ),
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .oposite,
                                                            fontSize: 16.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w800,
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
                                    // List of all players
                                    Expanded(
                                      child: Container(

                                        child: ListView.builder(
                                          padding: EdgeInsets.zero,
                                          shrinkWrap: true,
                                          itemCount: players.length,
                                          itemBuilder: (context, index) {
                                            final player = players[index];
                                            return Container(
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                color: (Theme.of(context)
                                                                .brightness ==
                                                            Brightness.dark) ==
                                                        true
                                                    ? const Color(0xB2000000)
                                                    : Colors.white,
                                                boxShadow: const [
                                                  BoxShadow(
                                                    blurRadius: 1.0,
                                                    color: Color(0x33463838),
                                                    offset: Offset(1.0, 2.0),
                                                    spreadRadius: 1.0,
                                                  )
                                                ],
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(
                                                        10.0, 7.0, 10.0, 7.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        const FaIcon(
                                                          FontAwesomeIcons
                                                              .solidStar,
                                                          color:
                                                              Color(0xFFFFBC06),
                                                          size: 18.0,
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                  7.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                          child: Text(
                                                            getJsonField(player,
                                                                    r'''$.position''')
                                                                .toString(),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .titleMedium
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .poppins(),
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(40.0,
                                                                0.0, 0.0, 0.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Container(
                                                              width: 30.0,
                                                              height: 30.0,
                                                              clipBehavior: Clip
                                                                  .antiAlias,
                                                              decoration:
                                                                  const BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                              child:
                                                                  Image.network(
                                                                getJsonField(
                                                                    player,
                                                                    r'''$.player.image'''),
                                                                fit: BoxFit
                                                                    .cover,
                                                                errorBuilder: (context,
                                                                        error,
                                                                        stackTrace) =>
                                                                    Image.asset(
                                                                  'assets/images/error_image.webp',
                                                                  width: double
                                                                      .infinity,
                                                                ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                      7.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                              child: Text(
                                                                '${getJsonField(player, r'''$.player.first_name''').toString()} ${getJsonField(player, r'''$.player.last_name''').toString()}',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .poppins(),
                                                                      fontSize:
                                                                          12.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(7.0,
                                                              0.0, 0.0, 0.0),
                                                      child: Text(
                                                        (double.tryParse(getJsonField(
                                                                            player,
                                                                            r'''$.player.greatness_index_value''')
                                                                        ?.toString() ??
                                                                    '0') ??
                                                                0.0)
                                                            .toStringAsFixed(2),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .titleMedium
                                                            .override(
                                                              font: GoogleFonts
                                                                  .poppins(),
                                                              fontSize: 12.0,
                                                              letterSpacing:
                                                                  0.0,
                                                            ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    )
                                  ],
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
      },
    );
  }

  Widget _buildPodiumContainer(
      dynamic player, int rank, double height, Color gradientColor) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(
              0.0,
              valueOrDefault<double>(
                MediaQuery.sizeOf(context).height * 0.04,
                0.0,
              ),
              0.0,
              0.0),
          child: Container(
            width: MediaQuery.sizeOf(context).width * 0.28,
            height: height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: rank == 1
                    ? [
                        const Color(0xFFFF8C00),
                        const Color(0xFFFFA500),
                        const Color(0xFFFFD700)
                      ]
                    : rank == 2
                        ? [
                            const Color(0xFFA8A8A8),
                            const Color(0xF4D3D3D3),
                            const Color(0xC5F9F9F9)
                          ]
                        : [
                            const Color(0xFFCD7F32),
                            const Color(0xFFAA5C1F),
                            const Color(0xFFCD7F32)
                          ],
                stops: const [0.0, 0.5, 1.0],
                begin: const AlignmentDirectional(1.0, 0.0),
                end: const AlignmentDirectional(-1.0, 0),
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: const Radius.circular(0.0),
                bottomRight: const Radius.circular(0.0),
                topLeft: Radius.circular(rank == 1 ? 30.0 : 12.0),
                topRight: Radius.circular(rank == 1 ? 30.0 : 12.0),
              ),
            ),
            child: Stack(
              children: [
                Align(
                  alignment: const AlignmentDirectional(0.0, -2.0),
                  child: ClipOval(
                    child: Container(
                      width: rank == 1 ? 80.0 : 70.0,
                      height: rank == 1 ? 80.0 : 70.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: const Color(0xFFFFA500),
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
                          getJsonField(player, r'''$.player.image'''),
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              Image.asset(
                            'assets/images/error_image.webp',
                            width: double.infinity,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(
                      0.0,
                      rank == 1
                          ? -0.78
                          : rank == 2
                              ? -0.8
                              : -0.6),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      rank == 1
                          ? 'assets/images/Group_1686555007.png'
                          : rank == 2
                              ? 'assets/images/Group_1686555007-1.png'
                              : 'assets/images/three.png',
                      width: 40.0,
                      height: 40.0,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                if (rank == 1)
                  Align(
                    alignment: const AlignmentDirectional(0.0, -2.1),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        'assets/images/Group_(5).png',
                        width: 44.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                Align(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        0.0, 40.0, 0.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Text(
                            '${getJsonField(player, r'''$.player.first_name''').toString()}\n${getJsonField(player, r'''$.player.last_name''').toString()}',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  font: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                  ),
                                  color: rank == 2
                                      ? Colors.black
                                      : FlutterFlowTheme.of(context).tertiary,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          // child: Text(
                          //   getJsonField(player, r'''$.player.greatness_index_value''')
                          //           ?.toString() ??
                          //       '0',
                          //   textAlign: TextAlign.center,
                          //   style: FlutterFlowTheme.of(context)
                          //       .titleMedium
                          //       .override(
                          //         font: GoogleFonts.poppins(
                          //           fontWeight: FontWeight.bold,
                          //         ),
                          //         color: rank == 2
                          //             ? Colors.black
                          //             : FlutterFlowTheme.of(context).tertiary,
                          //         letterSpacing: 0.0,
                          //         fontWeight: FontWeight.bold,
                          //       ),
                          // ),
                          child: Text(
                            (double.tryParse(getJsonField(player, r'''$.player.greatness_index_value''')?.toString() ?? '0') ?? 0.0).toStringAsFixed(2),
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                              font: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                              ),
                              color: rank == 2
                                  ? Colors.black
                                  : FlutterFlowTheme.of(context).tertiary,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.bold,
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
    );
  }
}
