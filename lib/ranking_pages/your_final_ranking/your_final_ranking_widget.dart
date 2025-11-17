import 'package:vote_for_goat/custom_code/widgets/cube_grid_loader.dart';

import '/components/drawer_menu/drawer_menu_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'your_final_ranking_model.dart';
export 'your_final_ranking_model.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';


class YourFinalRankingWidget extends StatefulWidget {
  const YourFinalRankingWidget({super.key});

  static String routeName = 'YourFinalRanking';
  static String routePath = '/yourFinalRanking';

  @override
  State<YourFinalRankingWidget> createState() => _YourFinalRankingWidgetState();
}

class _YourFinalRankingWidgetState extends State<YourFinalRankingWidget>
    with RouteAware {
  late YourFinalRankingModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();



  //
  // @override
  // void initState() {
  //   super.initState();
  //   _model = createModel(context, () => YourFinalRankingModel());
  // }




// Inside _YourFinalRankingWidgetState
  List<PlayerRanking> _rankings = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => YourFinalRankingModel());
    fetchRankings();
  }

  Future<void> fetchRankings() async {
    final authToken = FFAppState().authToken;

    const url = 'https://votethegoat.ezxdemo.com/api/global_ranking';
    final response = await http.get(
      Uri.parse(url),
      headers: {
        'Authorization': 'Bearer $authToken'
      },
    );
    print('API response: ${response.body}'); // Print the raw response

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['data'];
      setState(() {
        _rankings = data.map((e) => PlayerRanking.fromJson(e)).toList();
        _loading = false;
      });
    } else {
      setState(() {
        _loading = false;
      });
      // Handle error
    }
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);

    _model.dispose();

    super.dispose();
  }

  @override
  void didUpdateWidget(YourFinalRankingWidget oldWidget) {
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
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 0.0),
              child:

              _loading ? const Center(
                child: CubeGridLoader(
                  size: 40.0,
                ),
              ):
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    child: Row(
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
                                    ? const Color(0xD5999999)
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
                              scaffoldKey.currentState!.openDrawer();
                            },
                            child: Icon(
                              Icons.menu,
                              color: FlutterFlowTheme.of(context).tertiary,
                              size: 24.0,
                            ),
                          ),
                        ),
                        // Padding(
                        //   padding: const EdgeInsetsDirectional.fromSTEB(
                        //       8.0, 0.0, 0.0, 0.0),
                        //   child: Container(
                        //     width: 40.0,
                        //     height: 40.0,
                        //     decoration: BoxDecoration(
                        //       color: FlutterFlowTheme.of(context).backBtnClr,
                        //       boxShadow: [
                        //         BoxShadow(
                        //           blurRadius: 4.0,
                        //           color: (Theme.of(context).brightness ==
                        //                       Brightness.dark) ==
                        //                   true
                        //               ? const Color(0xD5999999)
                        //               : Colors.white,
                        //           offset: const Offset(
                        //             0.0,
                        //             2.0,
                        //           ),
                        //         )
                        //       ],
                        //       borderRadius: BorderRadius.circular(12.0),
                        //       border: Border.all(
                        //         color: (Theme.of(context).brightness ==
                        //                     Brightness.dark) ==
                        //                 true
                        //             ? Colors.black
                        //             : const Color(0xD5999999),
                        //       ),
                        //     ),
                        //     child: Align(
                        //       alignment: const AlignmentDirectional(0.0, 0.0),
                        //       child: FaIcon(
                        //         FontAwesomeIcons.edit,
                        //         color: FlutterFlowTheme.of(context).tertiary,
                        //         size: 24.0,
                        //       ),
                        //     ),
                        //   ),
                        // ),
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
                          'The Goat',
                          style: FlutterFlowTheme.of(context)
                              .customTextStyle1
                              .override(
                                fontFamily: 'good times',
                                color: FlutterFlowTheme.of(context).tertiary,
                                fontSize: 24.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.normal,
                              ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              10.0, 0.0, 0.0, 0.0),
                          child: RichText(
                            textScaler: MediaQuery.of(context).textScaler,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Global',
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
                                TextSpan(
                                  text: ' ranking',
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
                                )
                              ],
                              style: FlutterFlowTheme.of(context)
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
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0,
                                        valueOrDefault<double>(
                                          MediaQuery.sizeOf(context).height *
                                              0.04,
                                          0.0,
                                        ),
                                        0.0,
                                        0.0),
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.28,
                                      height: 140.0,
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            const Color(0xFFA8A8A8),
                                            const Color(0xF4D3D3D3),
                                            (Theme.of(context).brightness ==
                                                        Brightness.dark) ==
                                                    true
                                                ? const Color(0xC5F9F9F9)
                                                : const Color(0xF4D3D3D3)
                                          ],
                                          stops: const [0.0, 0.66, 0.8],
                                          begin: const AlignmentDirectional(1.0, 0.0),
                                          end: const AlignmentDirectional(-1.0, 0),
                                        ),
                                        borderRadius: const BorderRadius.only(
                                          bottomLeft: Radius.circular(0.0),
                                          bottomRight: Radius.circular(0.0),
                                          topLeft: Radius.circular(12.0),
                                          topRight: Radius.circular(12.0),
                                        ),
                                      ),
                                      child: Stack(
                                        children: [
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(0.0, -2.0),
                                            child: ClipOval(
                                              child: Container(
                                                width: 70.0,
                                                height: 70.0,
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
                                                    errorBuilder:
                                                        (context, error, stackTrace) =>
                                                        Image.asset(
                                                          'assets/images/error_image.webp',
                                                          width: double.infinity,),
                                                    _rankings[1].image,

                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(0.0, -0.8),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: Image.asset(
                                                'assets/images/Group_1686555007-1.png',
                                                width: 40.0,
                                                height: 40.0,
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(0.0, 0.0),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 40.0, 0.0, 0.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Text(
                                                      '${_rankings[1].firstName}\n${_rankings[1].lastName}',

                                                      textAlign:
                                                          TextAlign.center,
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
                                                            color: Colors.black,
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
                                                  Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Text(
                                                      '${_rankings[1].goatPoints}',

                                                      textAlign:
                                                          TextAlign.center,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .titleMedium
                                                          .override(
                                                            font: GoogleFonts
                                                                .poppins(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMedium
                                                                      .fontStyle,
                                                            ),
                                                            color: Colors.black,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.bold,
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
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Align(
                                    alignment: const AlignmentDirectional(0.0, -1.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0,
                                          valueOrDefault<double>(
                                            MediaQuery.sizeOf(context).height *
                                                0.04,
                                            0.0,
                                          ),
                                          0.0,
                                          0.0),
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.28,
                                        height: 160.0,
                                        decoration: const BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              Color(0xFFFF8C00),
                                              Color(0xFFFFA500),
                                              Color(0xFFFFD700)
                                            ],
                                            stops: [0.0, 0.5, 1.0],
                                            begin:
                                                AlignmentDirectional(1.0, 0.0),
                                            end: AlignmentDirectional(-1.0, 0),
                                          ),
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(0.0),
                                            bottomRight: Radius.circular(0.0),
                                            topLeft: Radius.circular(30.0),
                                            topRight: Radius.circular(30.0),
                                          ),
                                        ),
                                        child: Stack(
                                          children: [
                                            Align(
                                              alignment: const AlignmentDirectional(
                                                  0.0, -2.0),
                                              child: ClipOval(
                                                child: Container(
                                                  width: 80.0,
                                                  height: 80.0,
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
                                                    clipBehavior:
                                                        Clip.antiAlias,
                                                    decoration: const BoxDecoration(
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child:  Image.network(
                                                      errorBuilder:
                                                          (context, error, stackTrace) =>
                                                          Image.asset(
                                                            'assets/images/error_image.webp',
                                                            width: double.infinity,),
                                                      _rankings[0].image,

                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: const AlignmentDirectional(
                                                  0.0, -0.78),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: Image.asset(
                                                  'assets/images/Group_1686555007.png',
                                                  width: 40.0,
                                                  height: 40.0,
                                                  fit: BoxFit.contain,
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: const AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 40.0, 0.0, 0.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Text(
                                                        '${_rankings[0].firstName}\n${_rankings[0].lastName}',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleMedium
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .poppins(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .tertiary,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMedium
                                                                      .fontStyle,
                                                                ),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Text(
                                                        '${_rankings[0].goatPoints}',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleMedium
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .poppins(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .tertiary,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
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
                                            Align(
                                              alignment: const AlignmentDirectional(
                                                  0.0, -2.1),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: Image.asset(
                                                  'assets/images/Group_(5).png',
                                                  width: 44.0,
                                                  fit: BoxFit.cover,
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
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0,
                                        valueOrDefault<double>(
                                          MediaQuery.sizeOf(context).height *
                                              0.04,
                                          0.0,
                                        ),
                                        0.0,
                                        0.0),
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.28,
                                      height: 115.0,
                                      decoration: const BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            Color(0xFFCD7F32),
                                            Color(0xFFAA5C1F),
                                            Color(0xFFCD7F32)
                                          ],
                                          stops: [0.0, 0.3, 0.8],
                                          begin: AlignmentDirectional(1.0, 0.0),
                                          end: AlignmentDirectional(-1.0, 0),
                                        ),
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(0.0),
                                          bottomRight: Radius.circular(0.0),
                                          topLeft: Radius.circular(12.0),
                                          topRight: Radius.circular(12.0),
                                        ),
                                      ),
                                      child: Stack(
                                        children: [
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(0.0, -3.4),
                                            child: ClipOval(
                                              child: Container(
                                                width: 70.0,
                                                height: 70.0,
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
                                                    errorBuilder:
                                                        (context, error, stackTrace) =>
                                                        Image.asset(
                                                          'assets/images/error_image.webp',
                                                          width: double.infinity,),
                                                    _rankings[2].image,

                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(0.0, -1.2),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: Image.asset(
                                                'assets/images/three.png',
                                                width: 40.0,
                                                height: 40.0,
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(0.0, 0.0),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 40.0, 0.0, 0.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Text(
                                                      overflow:  TextOverflow.ellipsis,
                                                      maxLines: 2,
                                                      '${_rankings[2].firstName}\n${_rankings[2].lastName}',

                                                      textAlign:
                                                          TextAlign.center,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleMedium
                                                              .override(
                                                                font: GoogleFonts
                                                                    .poppins(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .tertiary,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMedium
                                                                    .fontStyle,
                                                              ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Text(
                                                      '${_rankings[2].goatPoints}',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleMedium
                                                              .override(
                                                                font: GoogleFonts
                                                                    .poppins(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .tertiary,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
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
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
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
                                              'Player',
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
                                            'GOAT Points',
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
                          // ListView(
                          //   padding: EdgeInsets.zero,
                          //   shrinkWrap: true,
                          //   scrollDirection: Axis.vertical,
                          //   children: [
                          //     Container(
                          //       width: double.infinity,
                          //       decoration: BoxDecoration(
                          //         color: (Theme.of(context).brightness ==
                          //                     Brightness.dark) ==
                          //                 true
                          //             ? const Color(0xB2000000)
                          //             : Colors.white,
                          //         boxShadow: [
                          //           const BoxShadow(
                          //             blurRadius: 1.0,
                          //             color: Color(0x33463838),
                          //             offset: Offset(
                          //               1.0,
                          //               2.0,
                          //             ),
                          //             spreadRadius: 1.0,
                          //           )
                          //         ],
                          //       ),
                          //       child: Padding(
                          //         padding: const EdgeInsetsDirectional.fromSTEB(
                          //             10.0, 7.0, 10.0, 7.0),
                          //         child: Row(
                          //           mainAxisSize: MainAxisSize.max,
                          //           mainAxisAlignment: MainAxisAlignment.start,
                          //           children: [
                          //             Row(
                          //               mainAxisSize: MainAxisSize.max,
                          //               children: [
                          //                 const FaIcon(
                          //                   FontAwesomeIcons.solidStar,
                          //                   color: Color(0xFFFFBC06),
                          //                   size: 18.0,
                          //                 ),
                          //                 Padding(
                          //                   padding:
                          //                       const EdgeInsetsDirectional.fromSTEB(
                          //                           7.0, 0.0, 0.0, 0.0),
                          //                   child: Text(
                          //                     '4',
                          //                     style:
                          //                         FlutterFlowTheme.of(context)
                          //                             .titleMedium
                          //                             .override(
                          //                               font:
                          //                                   GoogleFonts.poppins(
                          //                                 fontWeight:
                          //                                     FlutterFlowTheme.of(
                          //                                             context)
                          //                                         .titleMedium
                          //                                         .fontWeight,
                          //                                 fontStyle:
                          //                                     FlutterFlowTheme.of(
                          //                                             context)
                          //                                         .titleMedium
                          //                                         .fontStyle,
                          //                               ),
                          //                               letterSpacing: 0.0,
                          //                               fontWeight:
                          //                                   FlutterFlowTheme.of(
                          //                                           context)
                          //                                       .titleMedium
                          //                                       .fontWeight,
                          //                               fontStyle:
                          //                                   FlutterFlowTheme.of(
                          //                                           context)
                          //                                       .titleMedium
                          //                                       .fontStyle,
                          //                             ),
                          //                   ),
                          //                 ),
                          //               ],
                          //             ),
                          //             Expanded(
                          //               child: Padding(
                          //                 padding:
                          //                     const EdgeInsetsDirectional.fromSTEB(
                          //                         40.0, 0.0, 0.0, 0.0),
                          //                 child: Row(
                          //                   mainAxisSize: MainAxisSize.max,
                          //                   children: [
                          //                     Container(
                          //                       width: 30.0,
                          //                       height: 30.0,
                          //                       clipBehavior: Clip.antiAlias,
                          //                       decoration: const BoxDecoration(
                          //                         shape: BoxShape.circle,
                          //                       ),
                          //                       child: Image.network(
                          //                         'https://picsum.photos/seed/42/600',
                          //                         fit: BoxFit.cover,
                          //                       ),
                          //                     ),
                          //                     Padding(
                          //                       padding: const EdgeInsetsDirectional
                          //                           .fromSTEB(
                          //                               7.0, 0.0, 0.0, 0.0),
                          //                       child: Text(
                          //                         'Shai Gilgeous',
                          //                         style: FlutterFlowTheme.of(
                          //                                 context)
                          //                             .titleMedium
                          //                             .override(
                          //                               font:
                          //                                   GoogleFonts.poppins(
                          //                                 fontWeight:
                          //                                     FlutterFlowTheme.of(
                          //                                             context)
                          //                                         .titleMedium
                          //                                         .fontWeight,
                          //                                 fontStyle:
                          //                                     FlutterFlowTheme.of(
                          //                                             context)
                          //                                         .titleMedium
                          //                                         .fontStyle,
                          //                               ),
                          //                               fontSize: 12.0,
                          //                               letterSpacing: 0.0,
                          //                               fontWeight:
                          //                                   FlutterFlowTheme.of(
                          //                                           context)
                          //                                       .titleMedium
                          //                                       .fontWeight,
                          //                               fontStyle:
                          //                                   FlutterFlowTheme.of(
                          //                                           context)
                          //                                       .titleMedium
                          //                                       .fontStyle,
                          //                             ),
                          //                       ),
                          //                     ),
                          //                   ],
                          //                 ),
                          //               ),
                          //             ),
                          //             Padding(
                          //               padding: const EdgeInsetsDirectional.fromSTEB(
                          //                   7.0, 0.0, 0.0, 0.0),
                          //               child: Text(
                          //                 '98',
                          //                 style: FlutterFlowTheme.of(context)
                          //                     .titleMedium
                          //                     .override(
                          //                       font: GoogleFonts.poppins(
                          //                         fontWeight:
                          //                             FlutterFlowTheme.of(
                          //                                     context)
                          //                                 .titleMedium
                          //                                 .fontWeight,
                          //                         fontStyle:
                          //                             FlutterFlowTheme.of(
                          //                                     context)
                          //                                 .titleMedium
                          //                                 .fontStyle,
                          //                       ),
                          //                       fontSize: 12.0,
                          //                       letterSpacing: 0.0,
                          //                       fontWeight:
                          //                           FlutterFlowTheme.of(context)
                          //                               .titleMedium
                          //                               .fontWeight,
                          //                       fontStyle:
                          //                           FlutterFlowTheme.of(context)
                          //                               .titleMedium
                          //                               .fontStyle,
                          //                     ),
                          //               ),
                          //             ),
                          //           ],
                          //         ),
                          //       ),
                          //     ),
                          //
                          //   ],
                          // ),
                          _loading
                              ? const Center(child: CubeGridLoader( size: 40,))
                              : SizedBox(height: MediaQuery.sizeOf(context).height * 0.36,
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 100.0),
                                  child: ListView.builder(
                                                              padding: EdgeInsets.zero,
                                                              shrinkWrap: true,
                                                              itemCount: _rankings.length,
                                                              itemBuilder: (context, index) {
                                  final player = _rankings[index];
                                  return

                                  //   Container(
                                  //   // ... your styling
                                  //   child: Row(
                                  //     children: [
                                  //       Text('${player.position}'),
                                  //       // ... other widgets
                                  //       Text(player.name),
                                  //       Text('${player.goatPoints}'),
                                  //     ],
                                  //   ),
                                  // );


                                    Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color: (Theme.of(context).brightness ==
                                                          Brightness.dark) ==
                                                      true
                                                  ? const Color(0xB2000000)
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
                                                mainAxisAlignment: MainAxisAlignment.start,
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
                                                        padding:
                                                            const EdgeInsetsDirectional.fromSTEB(
                                                                7.0, 0.0, 0.0, 0.0),
                                                        child: Text(
                                                            '${player.position}',
                                                        //       // ... other widgets
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
                                                      padding:
                                                          const EdgeInsetsDirectional.fromSTEB(
                                                              40.0, 0.0, 0.0, 0.0),
                                                      child: Row(
                                                        mainAxisSize: MainAxisSize.max,
                                                        children: [
                                                          Container(
                                                            width: 30.0,
                                                            height: 30.0,
                                                            clipBehavior: Clip.antiAlias,
                                                            decoration: const BoxDecoration(
                                                              shape: BoxShape.circle,
                                                            ),
                                                            child: Image.network(
                                                              errorBuilder:
                                                                  (context, error, stackTrace) =>
                                                                  Image.asset(
                                                                    'assets/images/error_image.webp',
                                                                    width: double.infinity,),
                                                              player.image,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding: const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    7.0, 0.0, 0.0, 0.0),
                                                            child: Text(
                                                              (player.name),
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
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                                        7.0, 0.0, 0.0, 0.0),
                                                    child: Text(
                                                      '${player.goatPoints}',
                                                      style: FlutterFlowTheme.of(context)
                                                          .titleMedium
                                                          .override(
                                                            font: GoogleFonts.poppins(
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
  }
}



class PlayerRanking {
  final int position;
  final String firstName;
  final String image;
  final String lastName;
  final num goatPoints;
  final num totalPoints;

  PlayerRanking({
    required this.position,
    required this.firstName,
    required this.image,
    required this.lastName,
    required this.goatPoints,
    required this.totalPoints,
  });

  factory PlayerRanking.fromJson(Map<String, dynamic> json) {
    return PlayerRanking(
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
