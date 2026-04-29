// lib/ranking_pages/your_final_ranking/your_final_ranking_v2_widget.dart
import 'package:vote_for_goat/custom_code/widgets/cube_grid_loader.dart';

import '/backend/api_requests/api_calls.dart';
import '/components/drawer_menu/drawer_menu_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'your_final_ranking_v2_model.dart';
export 'your_final_ranking_v2_model.dart';

class YourFinalRankingV2Widget extends StatefulWidget {
  const YourFinalRankingV2Widget({super.key});

  static String routeName = 'YourFinalRankingV2';
  static String routePath = '/yourFinalRankingV2';

  @override
  State<YourFinalRankingV2Widget> createState() =>
      _YourFinalRankingV2WidgetState();
}

class _YourFinalRankingV2WidgetState extends State<YourFinalRankingV2Widget>
    with RouteAware {
  late YourFinalRankingV2Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  List<PlayerRankingV2> _rankings = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => YourFinalRankingV2Model());
    fetchRankings();
  }

  Future<void> fetchRankings() async {
    final authToken = FFAppState().authToken;

    try {
      final response = await DashboardGroup.globalRankingCall.call(
        authToken: authToken,
      );

      print('API response: ${response.jsonBody}');

      if (response.succeeded) {
        final List<dynamic> data = response.jsonBody['data'] ?? [];
        final list = data.map((e) => PlayerRankingV2.fromJson(e)).toList();
        if (!mounted) return;
        setState(() {
          _rankings = list;
          _loading = false;
        });
      } else {
        if (!mounted) return;
        setState(() {
          _loading = false;
        });
      }
    } catch (_) {
      if (!mounted) return;
      setState(() {
        _loading = false;
      });
    }
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    _model.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(YourFinalRankingV2Widget oldWidget) {
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
    DebugFlutterFlowModelContext
        .maybeOf(context)
        ?.parentModelCallback
        ?.call(_model);

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme
            .of(context)
            .oposite,
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
            // Background
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                Theme
                    .of(context)
                    .brightness == Brightness.dark
                    ? 'assets/images/commonBg.png'
                    : 'assets/images/plain_whiteBg.png',
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.fill,
              ),
            ),
            // Logo
            Align(
              alignment: const AlignmentDirectional(0.0, -1.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(
                    0.0,
                    valueOrDefault<double>(
                      MediaQuery
                          .sizeOf(context)
                          .height * 0.02,
                      0.0,
                    ),
                    0.0,
                    0.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    Theme
                        .of(context)
                        .brightness == Brightness.dark
                        ? 'assets/images/logo_vtg.png'
                        : 'assets/images/LOGO_VTG_3.png',
                    width: 142.0,
                    height: 142.0,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            // Main content
            Padding(
              padding:
              const EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 0.0),
              child: _loading
                  ? const Center(
                child: CubeGridLoader(size: 40.0),
              )
                  : (_rankings.isEmpty
                  ? Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'No ranking found..!!',
                      style: FlutterFlowTheme
                          .of(context)
                          .titleMedium
                          .override(
                        font: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontStyle: FlutterFlowTheme
                              .of(context)
                              .titleMedium
                              .fontStyle,
                        ),
                        color:
                        FlutterFlowTheme
                            .of(context)
                            .tertiary,
                        letterSpacing: 0.0,
                      ),
                    ),
                  ],
                ),
              )
                  : Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // Top bar (menu button)
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
                            color: FlutterFlowTheme
                                .of(context)
                                .backBtnClr,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 4.0,
                                color:
                                (Theme
                                    .of(context)
                                    .brightness ==
                                    Brightness.dark) ==
                                    true
                                    ? const Color(0xD5999999)
                                    : Colors.white,
                                offset: const Offset(0.0, 2.0),
                              )
                            ],
                            borderRadius: BorderRadius.circular(12.0),
                            border: Border.all(
                              color: (Theme
                                  .of(context)
                                  .brightness ==
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
                              scaffoldKey.currentState!.openDrawer();
                            },
                            child: Icon(
                              Icons.menu,
                              color: FlutterFlowTheme
                                  .of(context)
                                  .tertiary,
                              size: 24.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Title section
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(
                        0.0,
                        valueOrDefault<double>(
                          MediaQuery
                              .sizeOf(context)
                              .height * 0.1,
                          0.0,
                        ),
                        0.0,
                        0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'The Goat',
                          style: FlutterFlowTheme
                              .of(context)
                              .customTextStyle1
                              .override(
                            fontFamily: 'good times',
                            color: FlutterFlowTheme
                                .of(context)
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
                            MediaQuery
                                .of(context)
                                .textScaler,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Global',
                                  style: FlutterFlowTheme
                                      .of(context)
                                      .customTextStyle1
                                      .override(
                                    fontFamily: 'good times',
                                    color:
                                    const Color(0xFFEB6027),
                                    fontSize: 24.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                TextSpan(
                                  text: ' ranking',
                                  style: FlutterFlowTheme
                                      .of(context)
                                      .customTextStyle1
                                      .override(
                                    fontFamily: 'good times',
                                    color: FlutterFlowTheme
                                        .of(
                                        context)
                                        .tertiary,
                                    fontSize: 24.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ],
                              style: FlutterFlowTheme
                                  .of(context)
                                  .customTextStyle1
                                  .override(
                                fontFamily: 'good times',
                                color: Colors.white,
                                fontSize: 24.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(
                    height: 40,
                  ),

                  // Replace the entire Expanded widget (Podium + list section) with this:

                  // Podium + list section
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        // Podium Row
                        ClipRect(
                          child: Row(
                            crossAxisAlignment:
                            CrossAxisAlignment.end,
                            children: [
                              // 2nd place
                              Expanded(
                                child: SizedBox(
                                  height: 200.0,
                                  child: Stack(
                                    clipBehavior: Clip.none,
                                    children: [
                                      // Podium image

                                      Theme
                                          .of(context)
                                          .brightness == Brightness.dark ?

                                      Positioned(
                                        left: -10,
                                        right: -17,
                                        bottom: 0,
                                        height: 140.0,
                                        child:
                                        Image.asset(
                                          'assets/images/stand3 2.png',
                                          fit: BoxFit.fill,
                                        ),
                                      )

                                          :

                                      Positioned(
                                        left: 2,
                                        right: 2,
                                        bottom: 0,
                                        height: 130.0,
                                        child:
                                        Image.asset(
                                          'assets/images/light3.png',
                                          fit: BoxFit.fill,
                                        ),
                                      )

                                      ,
                                      // Avatar — rounded square, overlapping into podium
                                      Positioned(
                                        top: 0,
                                        left: 0,
                                        right: 0,
                                        child: Center(
                                          child: Container(
                                            width: 78.0,
                                            height: 78.0,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius
                                                  .circular(16.0),
                                              border: Border.all(
                                                color: const Color(
                                                    0xFFDCC17B),
                                                width: 2.5,
                                              ),
                                              color: Colors.black,
                                            ),
                                            child: ClipRRect(
                                              borderRadius:
                                              BorderRadius
                                                  .circular(13.0),
                                              child: Image.network(
                                                _rankings.length > 1
                                                    ? _rankings[1]
                                                    .image
                                                    : '',
                                                fit: BoxFit.contain,
                                                errorBuilder: (context,
                                                    error,
                                                    stackTrace) =>
                                                    Image.asset(
                                                      'assets/images/error_image.webp',
                                                      width:
                                                      double.infinity,
                                                      fit: BoxFit.cover,
                                                    ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      // Rank badge
                                      Positioned(
                                        top: 65.0,
                                        left: 0,
                                        right: 0,
                                        child: Center(
                                          child: Image.asset(
                                            'assets/images/2.png',
                                            width: 40.0,
                                            height: 40.0,
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                      // Name + Points
                                      Positioned(
                                        left: 0,
                                        right: 0,
                                        bottom: 28.0,
                                        child: Center(
                                          child: SizedBox(
                                            width: 60.0,
                                            child: Column(
                                              mainAxisSize:
                                              MainAxisSize.min,
                                              children: [
                                                Text(
                                                  _rankings.length > 1
                                                      ? '${_rankings[1]
                                                      .firstName}\n${_rankings[1]
                                                      .lastName}'
                                                      : '—',
                                                  textAlign: TextAlign
                                                      .center,
                                                  maxLines: 3,
                                                  overflow:
                                                  TextOverflow
                                                      .ellipsis,
                                                  style: FlutterFlowTheme
                                                      .of(context)
                                                      .titleMedium
                                                      .override(
                                                    font: GoogleFonts
                                                        .poppins(
                                                      fontWeight:
                                                      FontWeight
                                                          .w600,
                                                      fontStyle: FlutterFlowTheme
                                                          .of(
                                                          context)
                                                          .titleMedium
                                                          .fontStyle,
                                                    ),
                                                    color: Colors
                                                        .white,
                                                    fontSize:
                                                    12.0,
                                                    letterSpacing:
                                                    0.0,
                                                    fontWeight:
                                                    FontWeight
                                                        .w600,
                                                    lineHeight:
                                                    1.2,
                                                  ),
                                                ),
                                                const SizedBox(
                                                    height: 1.0),
                                                Text(
                                                  _rankings.length > 1
                                                      ? '${_rankings[1]
                                                      .goatPoints}'
                                                      : '-',
                                                  textAlign: TextAlign
                                                      .center,
                                                  style: FlutterFlowTheme
                                                      .of(context)
                                                      .titleMedium
                                                      .override(
                                                    font: GoogleFonts
                                                        .poppins(
                                                      fontWeight:
                                                      FontWeight
                                                          .bold,
                                                      fontStyle: FlutterFlowTheme
                                                          .of(
                                                          context)
                                                          .titleMedium
                                                          .fontStyle,
                                                    ),
                                                    color: const Color(
                                                        0xFFDBB459),
                                                    fontSize:
                                                    14.0,
                                                    letterSpacing:
                                                    0.0,
                                                    fontWeight:
                                                    FontWeight
                                                        .bold,
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
                              // 1st place (tallest, center)
                              Expanded(
                                child: SizedBox(
                                  height: 240.0,
                                  child: Stack(
                                    clipBehavior: Clip.none,
                                    children: [
                                      // Podium image

                                      Theme
                                          .of(context)
                                          .brightness == Brightness.dark ?

                                      Positioned(
                                        left: -17,
                                        right: -17,
                                        bottom: 0,
                                        height: 170.0,
                                        child: Image.asset(
                                          'assets/images/stand1 3.png',
                                          fit: BoxFit.fill,
                                        ),
                                      )
                                          :
                                      Positioned(
                                        left: -19,
                                        right: -19,
                                        bottom: 0,
                                        height: 160.0,
                                        child: Image.asset(
                                          'assets/images/light1.png',
                                          fit: BoxFit.fill,
                                        ),
                                      )
                                      ,
                                      // Avatar — rounded square
                                      Positioned(
                                        top: 0,
                                        left: 0,
                                        right: 0,
                                        child: Center(
                                          child: Container(
                                            width: 88.0,
                                            height: 88.0,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius
                                                  .circular(18.0),
                                              border: Border.all(
                                                color: const Color(
                                                    0xFFDCC17B),
                                                width: 2.5,
                                              ),
                                              color: Colors.black,
                                            ),
                                            child: ClipRRect(
                                              borderRadius:
                                              BorderRadius
                                                  .circular(15.0),
                                              child: Image.network(
                                                _rankings.isNotEmpty
                                                    ? _rankings[0]
                                                    .image
                                                    : '',
                                                fit: BoxFit.contain,
                                                errorBuilder: (context,
                                                    error,
                                                    stackTrace) =>
                                                    Image.asset(
                                                      'assets/images/error_image.webp',
                                                      width:
                                                      double.infinity,
                                                      fit: BoxFit.cover,
                                                    ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      // Rank badge
                                      Positioned(
                                        top: 74.0,
                                        left: 0,
                                        right: 0,
                                        child: Center(
                                          child: Image.asset(
                                            'assets/images/1.png',
                                            width: 40.0,
                                            height: 40.0,
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                      // Name + Points
                                      Positioned(
                                        left: 0,
                                        right: 0,
                                        bottom: 40.0,
                                        child: Center(
                                          child: SizedBox(
                                            width: 65.0,
                                            child: Column(
                                              mainAxisSize:
                                              MainAxisSize.min,
                                              children: [
                                                Text(
                                                  _rankings.isNotEmpty
                                                      ? '${_rankings[0]
                                                      .firstName}\n${_rankings[0]
                                                      .lastName}'
                                                      : '—',
                                                  textAlign: TextAlign
                                                      .center,
                                                  maxLines: 3,
                                                  overflow:
                                                  TextOverflow
                                                      .ellipsis,
                                                  style: FlutterFlowTheme
                                                      .of(context)
                                                      .titleMedium
                                                      .override(
                                                    font: GoogleFonts
                                                        .poppins(
                                                      fontWeight:
                                                      FontWeight
                                                          .w600,
                                                      fontStyle: FlutterFlowTheme
                                                          .of(
                                                          context)
                                                          .titleMedium
                                                          .fontStyle,
                                                    ),
                                                    color: Colors
                                                        .white,
                                                    fontSize:
                                                    14.0,
                                                    letterSpacing:
                                                    0.0,
                                                    fontWeight:
                                                    FontWeight
                                                        .w600,
                                                    lineHeight:
                                                    1.2,
                                                  ),
                                                ),
                                                const SizedBox(
                                                    height: 1.0),
                                                Text(
                                                  _rankings.isNotEmpty
                                                      ? '${_rankings[0]
                                                      .goatPoints}'
                                                      : '-',
                                                  textAlign: TextAlign
                                                      .center,
                                                  style: FlutterFlowTheme
                                                      .of(context)
                                                      .titleMedium
                                                      .override(
                                                    font: GoogleFonts
                                                        .poppins(
                                                      fontWeight:
                                                      FontWeight
                                                          .bold,
                                                      fontStyle: FlutterFlowTheme
                                                          .of(
                                                          context)
                                                          .titleMedium
                                                          .fontStyle,
                                                    ),
                                                    color: const Color(
                                                        0xFFDBB459),
                                                    fontSize:
                                                    16.0,
                                                    letterSpacing:
                                                    0.0,
                                                    fontWeight:
                                                    FontWeight
                                                        .bold,
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
                              // 3rd place
                              Expanded(
                                child: SizedBox(
                                  height: 190.0,
                                  child: Stack(
                                    clipBehavior: Clip.none,
                                    children: [


                                      // Podium image


                                      Theme
                                          .of(context)
                                          .brightness == Brightness.dark
                                          ?
                                      Positioned(
                                        left: -17,
                                        right: -10,
                                        bottom: 0,
                                        height: 130.0,
                                        child: Image.asset(
                                          'assets/images/stand2 2.png',
                                          fit: BoxFit.fill,
                                        ),
                                      )

                                          : Positioned(
                                        left: 4,
                                        right: 2,
                                        bottom: 0,
                                        height: 118.0,
                                        child: Image.asset(
                                          'assets/images/light2.png',
                                          fit: BoxFit.fill,
                                        ),
                                      )


                                      ,
                                      // Avatar — rounded square
                                      Positioned(
                                        top: 0,
                                        left: 0,
                                        right: 0,
                                        child: Center(
                                          child: Container(
                                            width: 78.0,
                                            height: 78.0,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius
                                                  .circular(16.0),
                                              border: Border.all(
                                                color: const Color(
                                                    0xFFDCC17B),
                                                width: 2.5,
                                              ),
                                              color: Colors.black,
                                            ),
                                            child: ClipRRect(
                                              borderRadius:
                                              BorderRadius
                                                  .circular(13.0),
                                              child: Image.network(
                                                _rankings.length > 2
                                                    ? _rankings[2]
                                                    .image
                                                    : '',
                                                fit: BoxFit.contain,
                                                errorBuilder: (context,
                                                    error,
                                                    stackTrace) =>
                                                    Image.asset(
                                                      'assets/images/error_image.webp',
                                                      width:
                                                      double.infinity,
                                                      fit: BoxFit.cover,
                                                    ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      // Rank badge
                                      Positioned(
                                        top: 65.0,
                                        left: 0,
                                        right: 0,
                                        child: Center(
                                          child: Image.asset(
                                            'assets/images/3.png',
                                            width: 40.0,
                                            height: 40.0,
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                      // Name + Points
                                      Positioned(
                                        left: 0,
                                        right: 0,
                                        bottom: 22.0,
                                        child: Center(
                                          child: SizedBox(
                                            width: 60.0,
                                            child: Column(
                                              mainAxisSize:
                                              MainAxisSize.min,
                                              children: [
                                                Text(
                                                  _rankings.length > 2
                                                      ? '${_rankings[2]
                                                      .firstName}\n${_rankings[2]
                                                      .lastName}'
                                                      : '—',
                                                  textAlign: TextAlign
                                                      .center,
                                                  maxLines: 3,
                                                  overflow:
                                                  TextOverflow
                                                      .ellipsis,
                                                  style: FlutterFlowTheme
                                                      .of(context)
                                                      .titleMedium
                                                      .override(
                                                    font: GoogleFonts
                                                        .poppins(
                                                      fontWeight:
                                                      FontWeight
                                                          .w600,
                                                      fontStyle: FlutterFlowTheme
                                                          .of(
                                                          context)
                                                          .titleMedium
                                                          .fontStyle,
                                                    ),
                                                    color: Colors
                                                        .white,
                                                    fontSize:
                                                    14.0,
                                                    letterSpacing:
                                                    0.0,
                                                    fontWeight:
                                                    FontWeight
                                                        .w600,
                                                    lineHeight:
                                                    1.2,
                                                  ),
                                                ),
                                                const SizedBox(
                                                    height: 1.0),
                                                Text(
                                                  _rankings.length > 2
                                                      ? '${_rankings[2]
                                                      .goatPoints}'
                                                      : '-',
                                                  textAlign: TextAlign
                                                      .center,
                                                  style: FlutterFlowTheme
                                                      .of(context)
                                                      .titleMedium
                                                      .override(
                                                    font: GoogleFonts
                                                        .poppins(
                                                      fontWeight:
                                                      FontWeight
                                                          .bold,
                                                      fontStyle: FlutterFlowTheme
                                                          .of(
                                                          context)
                                                          .titleMedium
                                                          .fontStyle,
                                                    ),
                                                    color: const Color(
                                                        0xFFDBB459),
                                                    fontSize:
                                                    14.0,
                                                    letterSpacing:
                                                    0.0,
                                                    fontWeight:
                                                    FontWeight
                                                        .bold,
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
                        ),

                        // Rankings list
                        Expanded(
                          child: ListView.builder(
                            padding: const EdgeInsets.only(
                                top: 8.0, bottom: 100.0),
                            shrinkWrap: false,
                            itemCount: _rankings.length > 3
                                ? _rankings.length - 3
                                : 0,
                            itemBuilder: (context, index) {
                              final player = _rankings[index + 3];
                              final bool isFirst = index == 0;

                              final bool isDark =
                                  Theme
                                      .of(context)
                                      .brightness ==
                                      Brightness.dark;

                              final Color cardColor = isDark
                                  ? (isFirst
                                  ? const Color(0xFF232323)
                                  : const Color(0xFF232323))
                                  : (isFirst
                                  ? const Color(0xFFEAEAEA)
                                  : const Color(0xFFEAEAEA));

                              // final Color cardColor = isFirst
                              //     ? const Color(0xff3D3623)
                              //     : const Color(0xFF232323);
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0, vertical: 5.0),
                                child: Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    // Card body
                                    Container(
                                      width: double.infinity,
                                      margin: const EdgeInsets.only(
                                          left: 16.0),
                                      decoration: BoxDecoration(
                                        color: cardColor,
                                        borderRadius:
                                        BorderRadius.circular(
                                            10.0),
                                        border: Border.all(
                                          color: isDark
                                              ? (isFirst
                                              ? const Color(
                                              0xFFAC7944)
                                              : const Color(
                                              0xFFAC7944))
                                              : (isFirst
                                              ? const Color(
                                              0xFFEAEAEA)
                                              : const Color(
                                              0xFFEAEAEA)),
                                          width: 1.5,
                                        ),
                                      ),
                                      child: Padding(
                                        padding:
                                        const EdgeInsetsDirectional
                                            .fromSTEB(28.0, 10.0,
                                            16.0, 10.0),
                                        child: Row(
                                          mainAxisSize:
                                          MainAxisSize.max,
                                          children: [
                                            // Player avatar — rounded square
                                            Container(
                                              width: 50.0,
                                              height: 50.0,
                                              decoration:
                                              BoxDecoration(
                                                borderRadius:
                                                BorderRadius
                                                    .circular(
                                                    10.0),
                                                border: Border.all(
                                                  color:

                                                  // const Color(
                                                  //     0xFFDCC17B),


                                                  isDark ? (isFirst
                                                      ? const Color(
                                                      0xFFDCC17B)
                                                      : const Color(
                                                      0xFFDCC17B)) :

                                                  (isFirst
                                                      ? const Color(
                                                      0xFFFFffff)
                                                      : const Color(
                                                      0xffD9D9D9)),

                                                  width: 1.5,
                                                ),
                                                color: Colors.black,
                                              ),
                                              child: ClipRRect(
                                                borderRadius:
                                                BorderRadius
                                                    .circular(
                                                    8.5),
                                                child: Image.network(
                                                  player.image,
                                                  fit: BoxFit.contain,
                                                  errorBuilder: (context,
                                                      error,
                                                      stackTrace) =>
                                                      Image.asset(
                                                        'assets/images/error_image.webp',
                                                        width: double
                                                            .infinity,
                                                        fit: BoxFit.cover,
                                                      ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                                width: 12.0),
                                            // Player name
                                            Expanded(
                                              child: Text(
                                                player.name,
                                                style: FlutterFlowTheme
                                                    .of(context)
                                                    .titleMedium
                                                    .override(
                                                  font: GoogleFonts
                                                      .poppins(
                                                    fontWeight:
                                                    FontWeight
                                                        .w500,
                                                    fontStyle: FlutterFlowTheme
                                                        .of(
                                                        context)
                                                        .titleMedium
                                                        .fontStyle,
                                                  ),
                                                  color: isDark ? (isFirst
                                                      ? const Color(
                                                      0xFFFFFFFF)
                                                      : const Color(
                                                      0xFFFFFFFF)) :

                                                  (isFirst
                                                      ? const Color(
                                                      0xff000000)
                                                      : const Color(
                                                      0xff000000)),
                                                  fontSize: 18.0,
                                                  letterSpacing:
                                                  0.0,
                                                  fontWeight:
                                                  FontWeight
                                                      .w500,
                                                ),
                                                overflow: TextOverflow
                                                    .ellipsis,
                                              ),
                                            ),
                                            // GOAT Points
                                            Text(
                                              '${player.goatPoints}',
                                              style: FlutterFlowTheme
                                                  .of(context)
                                                  .titleMedium
                                                  .override(
                                                font: GoogleFonts
                                                    .poppins(
                                                  fontWeight:
                                                  FontWeight
                                                      .w500,
                                                  fontStyle: FlutterFlowTheme
                                                      .of(
                                                      context)
                                                      .titleMedium
                                                      .fontStyle,
                                                ),
                                                color:

                                                isDark ? (isFirst
                                                    ? const Color(
                                                    0xFFDCC17B)
                                                    : const Color(
                                                    0xFFDCC17B)) :

                                                (isFirst
                                                    ? const Color(
                                                    0xff69260D)
                                                    : const Color(0xff69260D)),
                                                fontSize: 20.0,
                                                letterSpacing:
                                                0.0,
                                                fontWeight:
                                                FontWeight
                                                    .bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    // Rank number circle — overlaying left edge
                                    Positioned(
                                      left: 0,
                                      top: 0,
                                      bottom: 0,
                                      child: Center(
                                        child: Container(
                                          width: 34.0,
                                          height: 34.0,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color:

                                            isDark ? (isFirst
                                                ? const Color(
                                                0xff3D3623)
                                                : const Color(
                                                0xff3D3623)) :

                                            (isFirst
                                                ? const Color(
                                                0xff2F2F2D)
                                                : const Color(0xff2F2F2D)),


                                            // 0xff3D3623
                                            // cardColor,
                                            border: Border.all(
                                              color:

                                              // const Color(
                                              //     0xFFAC7944),
                                              isDark ? (isFirst
                                                  ? const Color(
                                                  0xFFAC7944)
                                                  : const Color(
                                                  0xFFAC7944)) :

                                              (isFirst
                                                  ? const Color(
                                                  0xffB7B3AB)
                                                  : const Color(0xffB7B3AB)),

                                              width: 1.5,
                                            ),
                                          ),
                                          alignment: Alignment.center,
                                          child: Text(
                                            '${player.position}',
                                            style: FlutterFlowTheme
                                                .of(
                                                context)
                                                .titleMedium
                                                .override(
                                                font: GoogleFonts
                                                    .poppins(
                                                  fontWeight:
                                                  FontWeight
                                                      .w600,
                                                  fontStyle: FlutterFlowTheme
                                                      .of(
                                                      context)
                                                      .titleMedium
                                                      .fontStyle,
                                                ),
                                                color:
                                                // const
                                                // Color(
                                                //     0xFFDBB459),
                                                isDark ? (isFirst
                                                    ? const Color(
                                                    0xFFDBB459)
                                                    : const Color(
                                                    0xFFDBB459)) :

                                                (isFirst
                                                    ? const Color(
                                                    0xFFFFFFFF)
                                                    : const Color(0xffFFFFFF)),


                                                fontSize: 20.0,
                                                letterSpacing:
                                                0.0,
                                                fontWeight:
                                                FontWeight
                                                    .w600),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
            ),
          ],
        ),
      ),
    );
  }
}

class PlayerRankingV2 {
  final int position;
  final String firstName;
  final String image;
  final String lastName;
  final num goatPoints;
  final num totalPoints;

  PlayerRankingV2({
    required this.position,
    required this.firstName,
    required this.image,
    required this.lastName,
    required this.goatPoints,
    required this.totalPoints,
  });

  factory PlayerRankingV2.fromJson(Map<String, dynamic> json) {
    return PlayerRankingV2(
      position: json['position'] ?? 0,
      firstName: json['first_name'] ?? '',
      image: json['image'] ?? '',
      lastName: json['last_name'] ?? '',
      goatPoints: json['goat_points'] ?? 0,
      totalPoints: json['total_points'] ?? 0,
    );
  }

  String get name => '$firstName $lastName';
}
