import '../../subscription/ad_service.dart';
import '../../subscription/smart_interstitial_manager.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'all_players_model.dart';
export 'all_players_model.dart';

class AllPlayersWidget extends StatefulWidget {
  const AllPlayersWidget({super.key});

  static String routeName = 'AllPlayers';
  static String routePath = '/allPlayers';

  @override
  State<AllPlayersWidget> createState() => _AllPlayersWidgetState();
}

class _AllPlayersWidgetState extends State<AllPlayersWidget> with RouteAware {
  late AllPlayersModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AllPlayersModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      AdService().startPageTimer('allPlayersPage');

      // Preload interstitial ad (will check subscription status internally)
      await SmartInterstitialManager().preloadInterstitial();

      // Only show ad if still mounted and ads are enabled
      if (mounted && FFAppState().advertisementStatus != 0) {
        await SmartInterstitialManager().showInterstitialIfAllowed();
      }



      _model.isLoading = true;
      safeSetState(() {});
      _model.getAllPlayerRes = await DashboardGroup.getAllPlayersCall.call(
        authToken: FFAppState().authToken,
      );

      if ((_model.getAllPlayerRes?.succeeded ?? true)) {
        // ScaffoldMessenger.of(context).showSnackBar(
          // SnackBar(
          //   content: Text(
          //     getJsonField(
          //       (_model.getAllPlayerRes?.jsonBody ?? ''),
          //       r'''$.message''',
          //     ).toString(),
          //     style: TextStyle(
          //       color: Colors.white,
          //     ),
          //   ),
          //   duration: Duration(milliseconds: 4000),
          //   backgroundColor: Colors.black,
          // ),
        // );
        _model.isLoading = false;
        safeSetState(() {});
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              getJsonField(
                (_model.getAllPlayerRes?.jsonBody ?? ''),
                r'''$.message''',
              ).toString(),
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
            duration: const Duration(milliseconds: 4000),
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
    // Stop the page timer when leaving the page
    AdService().stopInterstitialTimer();
    routeObserver.unsubscribe(this);
    _model.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(AllPlayersWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    _model.widget = widget;
    // Restart timer when widget updates
    AdService().startPageTimer('allPlayersPage');
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
      // Restart timer when returning to this page
      AdService().startPageTimer('allPlayersPage');
      debugLogWidgetClass(_model);
    }
  }

  @override
  void didPush() {
    if (mounted && DebugFlutterFlowModelContext.maybeOf(context) == null) {
      setState(() => _model.isRouteVisible = true);
      // Start timer when page is pushed
      AdService().startPageTimer('allPlayersPage');
      debugLogWidgetClass(_model);
    }
  }

  @override
  void didPop() {
    _model.isRouteVisible = false;
    // Stop timer when leaving the page
    AdService().stopInterstitialTimer();
  }

  @override
  void didPushNext() {
    _model.isRouteVisible = false;
    AdService().stopInterstitialTimer();
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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Stack(
          children: [
            Align(
              alignment: const AlignmentDirectional(0.0, 0.0),
              child: ClipRRect(
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
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(16.0, 40.0, 16.0, 0.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
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
                                'Players',
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
                                'list',
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
                    Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0,
                            valueOrDefault<double>(
                              MediaQuery.sizeOf(context).height * 0.04,
                              0.0,
                            ),
                            0.0,
                            20.0),
                        child: Text(
                          'Tap on any player to view their detailed bio, stats, and achievements',
                          textAlign: TextAlign.center,
                          style:
                              FlutterFlowTheme.of(context).titleMedium.override(
                                    font: GoogleFonts.poppins(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontStyle,
                                  ),
                        ),
                      ),
                    ),
                    if (!_model.isLoading)
                      Container(
                        height: MediaQuery.sizeOf(context).height * 0.7,
                        decoration: const BoxDecoration(),
                        child: Builder(
                          builder: (context) {
                            final playerList = DashboardGroup.getAllPlayersCall
                                    .playerData(
                                      (_model.getAllPlayerRes?.jsonBody ?? ''),
                                    )
                                    ?.toList() ??
                                [];
                            _model.debugGeneratorVariables[
                                    'playerList${playerList.length > 100 ? ' (first 100)' : ''}'] =
                                debugSerializeParam(
                              playerList.take(100),
                              ParamType.JSON,
                              isList: true,
                              link:
                                  'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=AllPlayers',
                              name: 'dynamic',
                              nullable: false,
                            );
                            debugLogWidgetClass(_model);

                            return ListView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: playerList.length,
                              itemBuilder: (context, playerListIndex) {
                                final playerListItem =
                                    playerList[playerListIndex];
                                return InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed(
                                      PlayerBioWidget.routeName,
                                      queryParameters: {
                                        'playerId': serializeParam(
                                          getJsonField(
                                            playerListItem,
                                            r'''$.player_id''',
                                          ),
                                          ParamType.int,
                                        ),
                                      }.withoutNulls,
                                    );
                                  },
                                  child: Container(
                                    width: 100.0,
                                    height: 100.0,
                                    decoration: const BoxDecoration(),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 10.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Container(
                                                width: 60.0,
                                                height: 60.0,
                                                clipBehavior: Clip.antiAlias,
                                                decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Image.network(
                                                  getJsonField(
                                                    playerListItem,
                                                    r'''$.image''',
                                                  ).toString(),
                                                  fit: BoxFit.contain,
                                                  errorBuilder: (context, error,
                                                          stackTrace) =>
                                                      Image.asset(
                                                    'assets/images/error_image.webp',
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          20.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    '${getJsonField(
                                                      playerListItem,
                                                      r'''$.first_name''',
                                                    ).toString()} ${getJsonField(
                                                      playerListItem,
                                                      r'''$.last_name''',
                                                    ).toString()}',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleLarge
                                                        .override(
                                                          font: GoogleFonts
                                                              .poppins(
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
                                              Text(
                                                'Age : ',
                                                style: FlutterFlowTheme.of(
                                                        context)
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
                                              Text(
                                                getJsonField(
                                                  playerListItem,
                                                  r'''$.age''',
                                                ).toString(),
                                                style: FlutterFlowTheme.of(
                                                        context)
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
                                            ],
                                          ),
                                        ),
                                        const Divider(
                                          thickness: 2.0,
                                          color: Color(0xFF4E4E4E),
                                        ),
                                      ],
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
            ),
            if (_model.isLoading)
              Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Container(
                  width: 100.0,
                  height: 100.0,
                  decoration: const BoxDecoration(),
                  child: const SizedBox(
                    width: 40.0,
                    height: 40.0,
                    child: custom_widgets.CubeGridLoader(
                      width: 40.0,
                      height: 40.0,
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
