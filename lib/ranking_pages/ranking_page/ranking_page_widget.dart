



import '../../nav/nav_widget.dart';
import '/backend/api_requests/api_calls.dart';
import '/components/drawer_menu/drawer_menu_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:lottie/lottie.dart';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/index.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'ranking_page_model.dart';
export 'ranking_page_model.dart';

class RankingPageWidget extends StatefulWidget {
  const RankingPageWidget({super.key});

  static String routeName = 'rankingPage';
  static String routePath = '/rankingPage';

  @override
  State<RankingPageWidget> createState() => _RankingPageWidgetState();
}

class _RankingPageWidgetState extends State<RankingPageWidget> with RouteAware {
  late RankingPageModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  // Local players list for smooth UI updates
  List<dynamic> _localPlayers = [];



// Add these methods to your RankingPageWidget's _RankingPageWidgetState class

  Future<void> _loadProfileOrRedirect() async {
    debugPrint('[RankingPage] _loadProfileOrRedirect: STARTING');

    final token = FFAppState().authToken;

    // Check if token exists and is not empty
    if (token.isEmpty) {
      debugPrint('[RankingPage] getProfile: No auth token found -> redirecting to login');
      await _showSessionExpiredDialog();
      if (!mounted) return;
      return;
    }

    final tail = token.length >= 4
        ? token.substring(token.length - 4)
        : token;
    debugPrint('[RankingPage] getProfile: start, tokenPresent=true, tokenTail=$tail');

    try {
      final res = await DashboardGroup.getProfileCall.call(
        authToken: token,
      );

      debugPrint('[RankingPage] getProfile: response received');
      debugPrint('[RankingPage] getProfile: status=${res.statusCode}, succeeded=${res.succeeded}');

      final bodyStr = '${res.jsonBody}';
      debugPrint(
        '[RankingPage] getProfile: body=${bodyStr.length > 800
            ? '${bodyStr.substring(0, 800)}...(${bodyStr.length} chars)'
            : bodyStr}',
      );

      final status = res.statusCode;
      final succeeded = res.succeeded == true;
      final unauthorized = status == 401 || status == 403;

      // Check for various failure conditions
      if (!succeeded || unauthorized || status < 200 || status >= 300) {
        debugPrint('[RankingPage] getProfile: failed/unauthorized -> redirecting to login');
        debugPrint('[RankingPage] getProfile: res=$res, succeeded=$succeeded, unauthorized=$unauthorized, status=$status');

        // Clear all app state data
        _clearAllAppStateData();

        if (!mounted) return;

        // Show session expired popup
        await _showSessionExpiredDialog();
        return;
      }

      // Success case
      FFAppState().userName = getJsonField(
        (res.jsonBody ?? ''),
        r'$.name',
      ).toString();

      // Extract and store is_guest flag
      final isGuestValue = getJsonField(
        (res.jsonBody ?? ''),
        r'$.data.is_guest',
      );
      _model.isGuestUser = isGuestValue == 1 || isGuestValue == true;
      debugPrint('[RankingPage] getProfile: isGuestUser=${_model.isGuestUser}');

      debugPrint('[RankingPage] getProfile: success, userName=${FFAppState().userName}');
      safeSetState(() {});
    } catch (e, st) {
      debugPrint('[RankingPage] getProfile: exception=$e');
      debugPrint('[RankingPage] getProfile: stack=$st');

      // Clear all app state data
      _clearAllAppStateData();

      if (!mounted) return;

      // Show session expired popup
      await _showSessionExpiredDialog();
    }
  }

  Future<void> _showSessionExpiredDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Session Expired',
            style: FlutterFlowTheme.of(context).headlineSmall,
          ),
          content: Text(
            'Your session has expired. Please log in again to continue.',
            style: FlutterFlowTheme.of(context).bodyMedium,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                context.goNamed(LogInWidget.routeName);
              },
              child: Text(
                'OK',
                style: FlutterFlowTheme.of(context).titleSmall,
              ),
            ),
          ],
        );
      },
    );
  }

  void _clearAllAppStateData() {
    debugPrint('[RankingPage] Clearing all app state data');

    // Clear authentication token
    FFAppState().authToken = '';

    // Clear user data
    FFAppState().userName = '';

    debugPrint('[RankingPage] App state cleared');
  }



  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RankingPageModel());

    SchedulerBinding.instance.addPostFrameCallback((_) async {

      await _loadProfileOrRedirect();

      _model.isLoading = true;
      safeSetState(() {});
      await Future.delayed(const Duration(milliseconds: 3000));
      _model.isLoading = false;
      safeSetState(() {});
    });

    _model.searchFieldTextController ??= TextEditingController()
      ..addListener(() {
        debugLogWidgetClass(_model);
      });
    _model.searchFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    _model.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(RankingPageWidget oldWidget) {
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

    return FutureBuilder<ApiCallResponse>(
      future: (_model.apiRequestCompleter ??= Completer<ApiCallResponse>()
        ..complete(DashboardGroup.positionlistCall.call(
          authToken: FFAppState().authToken,
        )))
          .future,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).oposite,
            body: Center(
              child: SizedBox(
                width: 40.0,
                height: 40.0,
                child: SpinKitCubeGrid(
                  color: FlutterFlowTheme.of(context).primary,
                  size: 40.0,
                ),
              ),
            ),
          );
        }
        final rankingPagePositionlistResponse = snapshot.data!;
        _model.debugBackendQueries[
        'DashboardGroup.positionlistCall_statusCode_Scaffold_2jgl58pr'] =
            debugSerializeParam(
              rankingPagePositionlistResponse.statusCode,
              ParamType.int,
              link:
              'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=rankingPage',
              name: 'int',
              nullable: false,
            );
        _model.debugBackendQueries[
        'DashboardGroup.positionlistCall_responseBody_Scaffold_2jgl58pr'] =
            debugSerializeParam(
              rankingPagePositionlistResponse.bodyText,
              ParamType.String,
              link:
              'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=rankingPage',
              name: 'String',
              nullable: false,
            );
        debugLogWidgetClass(_model);

        // Get players from API and initialize local list
        final players = DashboardGroup.positionlistCall
            .positionList(
          rankingPagePositionlistResponse.jsonBody,
        )
            ?.toList() ??
            [];

        // Initialize localPlayers only once after API fetch
        if (_localPlayers.isEmpty && players.isNotEmpty) {
          _localPlayers = List<dynamic>.from(players);
        }

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
                    fit: BoxFit.cover,
                    alignment: const Alignment(0.0, -1.0),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        16.0, 40.0, 16.0, 0.0),
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
                                  scaffoldKey.currentState!.openDrawer();
                                },
                                child: Icon(
                                  Icons.menu,
                                  color: FlutterFlowTheme.of(context).tertiary,
                                  size: 24.0,
                                ),
                              ),
                            ),
                            Column(
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
                                    fontSize: 28.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                Text(
                                  'Ranking',
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
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0,
                                valueOrDefault<double>(
                                  MediaQuery.sizeOf(context).height * 0.04,
                                  0.0,
                                ),
                                0.0,
                                valueOrDefault<double>(
                                  MediaQuery.sizeOf(context).height * 0.0,
                                  0.0,
                                )),
                            child: Text(
                              // 'Drag & Drop the Players and release them\nin the desired ranking position',

                              "Drag & Drop to rank the players you know.\nRank as many as you want. There is no need to move them all.",

                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                font: GoogleFonts.poppins(
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .fontStyle,
                                ),
                                color: (Theme.of(context).brightness ==
                                    Brightness.dark) ==
                                    true
                                    ? Colors.white
                                    : const Color(0xBF000000),
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
                        //  Container(
                        //   padding: const EdgeInsetsDirectional.fromSTEB(
                        //       16, 10, 0, 10),
                        //   child: Column(
                        //     crossAxisAlignment: CrossAxisAlignment.center,
                        //     children: [
                        //       Text(
                        //         'Please select how many players you want to rank',
                        //         style: FlutterFlowTheme.of(context)
                        //             .titleMedium
                        //             .override(
                        //           font: GoogleFonts.poppins(
                        //             fontWeight: FlutterFlowTheme.of(context)
                        //                 .titleMedium
                        //                 .fontWeight,
                        //             fontStyle: FlutterFlowTheme.of(context)
                        //                 .titleMedium
                        //                 .fontStyle,
                        //           ),
                        //           color: (Theme.of(context).brightness ==
                        //               Brightness.dark) ==
                        //               true
                        //               ? Colors.white
                        //               : const Color(0xBF000000),
                        //           letterSpacing: 0.0,
                        //           fontWeight: FlutterFlowTheme.of(context)
                        //               .titleMedium
                        //               .fontWeight,
                        //           fontStyle: FlutterFlowTheme.of(context)
                        //               .titleMedium
                        //               .fontStyle,
                        //         ),
                        //       ),
                        //       const SizedBox(height: 12),
                        //       Row(
                        //         mainAxisAlignment: MainAxisAlignment.center,
                        //         children: [10, 25, 50]
                        //             .map(
                        //               (count) => Padding(
                        //             padding: const EdgeInsets.symmetric(
                        //                 horizontal: 10),
                        //             child: Row(
                        //               children: [
                        //                 Radio<int>(
                        //                   value: count,
                        //                   groupValue:
                        //                   _model.selectedPlayerCount,
                        //                   activeColor:
                        //                   FlutterFlowTheme.of(context)
                        //                       .primary,
                        //                   onChanged: (value) {
                        //                     setState(() {
                        //                       _model.selectedPlayerCount =
                        //                           value;
                        //                     });
                        //                   },
                        //                 ),
                        //                 Text(
                        //                   count.toString(),
                        //                   style:
                        //                   FlutterFlowTheme.of(context)
                        //                       .bodyMedium
                        //                       .override(
                        //                     fontFamily: 'Poppins',
                        //                     color:
                        //                     FlutterFlowTheme.of(
                        //                         context)
                        //                         .primaryText,
                        //                   ),
                        //                 ),
                        //               ],
                        //             ),
                        //           ),
                        //         )
                        //             .toList(),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        if (_model.isLoading)
                          const Expanded(
                            child: SizedBox.shrink(),
                          ),
                        if (!_model.isLoading)
                          Expanded(
                            child: ReorderableListView.builder(
                              padding: const EdgeInsets.only(bottom: 140.0),
                              proxyDecorator: (Widget child, int index,
                                  Animation<double> animation) =>
                                  Material(
                                      color: Colors.transparent, child: child),
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: _localPlayers.length,
                              itemBuilder: (context, playersIndex) {
                                final playersItem = _localPlayers[playersIndex];
                                return Container(
                                  key: ValueKey("ListView_1woyhxpx" '_' +
                                      playersIndex.toString()),
                                  child: Container(
                                    decoration: const BoxDecoration(),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional
                                          .fromSTEB(10.0, 8.0, 10.0, 8.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(12.0),
                                          border: Border.all(
                                            color: (Theme.of(context)
                                                .brightness ==
                                                Brightness.dark) ==
                                                true
                                                ? const Color(0xFF4E4E4E)
                                                : const Color(0xFFE6E6E6),
                                          ),
                                        ),
                                        child: Stack(
                                          children: [
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  valueOrDefault<double>(
                                                    MediaQuery.sizeOf(context)
                                                        .width <
                                                        kBreakpointSmall
                                                        ? -1.1
                                                        : -1.05,
                                                    0.0,
                                                  ),
                                                  -1.4),
                                              child: Padding(
                                                padding:
                                                const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                    5.0, 0.0, 0.0, 0.0),
                                                child: ClipOval(
                                                  child: Container(
                                                    width: 40.0,
                                                    height: 40.0,
                                                    decoration: BoxDecoration(
                                                      color:
                                                      FlutterFlowTheme.of(
                                                          context)
                                                          .peach,
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: Align(
                                                      alignment:
                                                      const AlignmentDirectional(
                                                          0.0, 0.0),
                                                      child: Text(
                                                        (playersIndex + 1)
                                                            .toString(),
                                                        style: FlutterFlowTheme
                                                            .of(context)
                                                            .labelMedium
                                                            .override(
                                                          font: GoogleFonts
                                                              .poppins(
                                                            fontWeight:
                                                            FontWeight
                                                                .w500,
                                                            fontStyle: FlutterFlowTheme.of(
                                                                context)
                                                                .labelMedium
                                                                .fontStyle,
                                                          ),
                                                          color: const Color(
                                                              0xBFFFFFFF),
                                                          letterSpacing:
                                                          0.0,
                                                          fontWeight:
                                                          FontWeight
                                                              .w500,
                                                          fontStyle: FlutterFlowTheme
                                                              .of(context)
                                                              .labelMedium
                                                              .fontStyle,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                              const EdgeInsetsDirectional
                                                  .fromSTEB(10.0, 10.0,
                                                  10.0, 10.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(14.0,
                                                        14.0, 14.0, 14.0),
                                                    child:



                                                    Row(
                                                      mainAxisSize:
                                                      MainAxisSize.max,
                                                      mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .start,
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .center,
                                                      children: [
                                                        Column(
                                                          mainAxisSize:
                                                          MainAxisSize.max,
                                                          mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                          children: [
                                                            Container(
                                                              width: 60.0,
                                                              height: 60.0,
                                                              clipBehavior: Clip
                                                                  .antiAlias,
                                                              decoration:
                                                              const BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                              child: Image.network(
                                                                  getJsonField(
                                                                    playersItem,
                                                                    r'''$.player.image''',
                                                                  ),
                                                                  fit: BoxFit
                                                                      .fitHeight,
                                                                  errorBuilder:
                                                                      (context,
                                                                      error,
                                                                      stackTrace) =>
                                                                      Image
                                                                          .asset(
                                                                        'assets/images/error_image.webp',
                                                                        fit:
                                                                        BoxFit.fitHeight,
                                                                      )),
                                                            ),
                                                          ],
                                                        ),
                                                        Expanded(
                                                          child: Column(
                                                            mainAxisSize:
                                                            MainAxisSize
                                                                .max,
                                                            mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                            crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                    10.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                                child:





                                                                // Row(
                                                                //   mainAxisSize:
                                                                //   MainAxisSize
                                                                //       .max,
                                                                //   mainAxisAlignment:
                                                                //   MainAxisAlignment
                                                                //       .spaceBetween,
                                                                //   children: [
                                                                //     Text(
                                                                //       '${getJsonField(
                                                                //         playersItem,
                                                                //         r'''$.player.first_name''',
                                                                //       ).toString()} ${getJsonField(
                                                                //         playersItem,
                                                                //         r'''$.player.last_name''',
                                                                //       ).toString()}'
                                                                //           .maybeHandleOverflow(
                                                                //         maxChars:
                                                                //         20,
                                                                //         replacement:
                                                                //         '…',
                                                                //       ),
                                                                //       style: FlutterFlowTheme.of(
                                                                //           context)
                                                                //           .titleLarge
                                                                //           .override(
                                                                //         font:
                                                                //         GoogleFonts.poppins(),
                                                                //         color: (Theme.of(context).brightness == Brightness.dark) == true
                                                                //             ? Colors.white
                                                                //             : Colors.black,
                                                                //         letterSpacing:
                                                                //         0.0,
                                                                //       ),
                                                                //     ),
                                                                //     Row(
                                                                //       mainAxisSize:
                                                                //       MainAxisSize
                                                                //           .max,
                                                                //       children: [
                                                                //         Text(
                                                                //           'Age :',
                                                                //           style: FlutterFlowTheme.of(context)
                                                                //               .titleLarge
                                                                //               .override(
                                                                //             font: GoogleFonts.poppins(),
                                                                //             color: (Theme.of(context).brightness == Brightness.dark) == true ? Colors.white : Colors.black,
                                                                //             fontSize: 12.0,
                                                                //             letterSpacing: 0.0,
                                                                //           ),
                                                                //         ),
                                                                //         Padding(
                                                                //           padding: const EdgeInsetsDirectional.fromSTEB(
                                                                //               2.0,
                                                                //               0.0,
                                                                //               0.0,
                                                                //               0.0),
                                                                //           child:
                                                                //           Text(
                                                                //             getJsonField(
                                                                //               playersItem,
                                                                //               r'''$.player.age''',
                                                                //             ).toString(),
                                                                //             style: FlutterFlowTheme.of(context).titleLarge.override(
                                                                //               font: GoogleFonts.poppins(),
                                                                //               color: (Theme.of(context).brightness == Brightness.dark) == true ? Colors.white : Colors.black,
                                                                //               fontSize: 12.0,
                                                                //               letterSpacing: 0.0,
                                                                //             ),
                                                                //           ),
                                                                //         ),
                                                                //       ],
                                                                //     ),
                                                                //   ],
                                                                // ),

                                                              ///2
                                                                Row(
                                                                  mainAxisSize: MainAxisSize.max,
                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                  children: [
                                                                    Expanded(
                                                                      flex: 2,
                                                                      child: Text(
                                                                        '${getJsonField(
                                                                          playersItem,
                                                                          r'''$.player.first_name''',
                                                                        ).toString()} ${getJsonField(
                                                                          playersItem,
                                                                          r'''$.player.last_name''',
                                                                        ).toString()}'
                                                                            .maybeHandleOverflow(
                                                                          // maxChars: 13,

                                                                          maxChars: MediaQuery.sizeOf(context).width > 600 ? 30 : 18,


                                                                          replacement: '..',
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .titleLarge
                                                                            .override(
                                                                          font: GoogleFonts.poppins(
                                                                            fontWeight: FlutterFlowTheme.of(context)
                                                                                .titleLarge
                                                                                .fontWeight,
                                                                            fontStyle: FlutterFlowTheme.of(context)
                                                                                .titleLarge
                                                                                .fontStyle,
                                                                          ),
                                                                          letterSpacing: 0.0,
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .titleLarge
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .titleLarge
                                                                              .fontStyle,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Flexible(
                                                                      child: Row(
                                                                        mainAxisSize: MainAxisSize.min,
                                                                        children: [
                                                                          Text(
                                                                            'Age:',
                                                                            style: FlutterFlowTheme.of(context).titleLarge.override(
                                                                              font: GoogleFonts.poppins(
                                                                                fontWeight: FlutterFlowTheme.of(context)
                                                                                    .titleLarge
                                                                                    .fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context)
                                                                                    .titleLarge
                                                                                    .fontStyle,
                                                                              ),
                                                                              color: (Theme.of(context).brightness == Brightness.dark) == true
                                                                                  ? const Color(0xFFCDCDCD)
                                                                                  : Colors.black,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FlutterFlowTheme.of(context)
                                                                                  .titleLarge
                                                                                  .fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context)
                                                                                  .titleLarge
                                                                                  .fontStyle,
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: const EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 0.0, 0.0),
                                                                            child: Text(
                                                                              getJsonField(
                                                                                playersItem,
                                                                                r'''$.player.age''',
                                                                              ).toString(),
                                                                              style: FlutterFlowTheme.of(context).titleLarge.override(
                                                                                font: GoogleFonts.poppins(
                                                                                  fontWeight: FlutterFlowTheme.of(context)
                                                                                      .titleLarge
                                                                                      .fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context)
                                                                                      .titleLarge
                                                                                      .fontStyle,
                                                                                ),
                                                                                color: (Theme.of(context).brightness == Brightness.dark) == true
                                                                                    ? const Color(0xFFCDCDCD)
                                                                                    : Colors.black,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FlutterFlowTheme.of(context)
                                                                                    .titleLarge
                                                                                    .fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context)
                                                                                    .titleLarge
                                                                                    .fontStyle,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),


                                                              ),
                                                              Padding(
                                                                padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                    10.0,
                                                                    4.0,
                                                                    0.0,
                                                                    0.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                                  mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                                  children: [
                                                                    Text(
                                                                      'Position : ',
                                                                      textAlign:
                                                                      TextAlign
                                                                          .start,
                                                                      style: FlutterFlowTheme.of(
                                                                          context)
                                                                          .bodySmall
                                                                          .override(
                                                                        font:
                                                                        GoogleFonts.poppins(),
                                                                        color:
                                                                        FlutterFlowTheme.of(context).tertiary,
                                                                        letterSpacing:
                                                                        0.0,
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      getJsonField(
                                                                        playersItem,
                                                                        r'''$.player.position_name''',
                                                                      ).toString(),
                                                                      textAlign:
                                                                      TextAlign
                                                                          .start,
                                                                      style: FlutterFlowTheme.of(
                                                                          context)
                                                                          .bodySmall
                                                                          .override(
                                                                        font:
                                                                        GoogleFonts.poppins(),
                                                                        color:
                                                                        FlutterFlowTheme.of(context).tertiary,
                                                                        letterSpacing:
                                                                        0.0,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                    10.0,
                                                                    4.0,
                                                                    0.0,
                                                                    0.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                                  mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                                  children: [
                                                                    Row(
                                                                      mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                      children: [
                                                                        Text(
                                                                          'Jersey Number : ',
                                                                          textAlign:
                                                                          TextAlign.start,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodySmall
                                                                              .override(
                                                                            font: GoogleFonts.poppins(),
                                                                            color: FlutterFlowTheme.of(context).tertiary,
                                                                            letterSpacing: 0.0,
                                                                          ),
                                                                        ),
                                                                        Text(
                                                                          ' #',
                                                                          textAlign:
                                                                          TextAlign.start,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodySmall
                                                                              .override(
                                                                            font: GoogleFonts.poppins(),
                                                                            color: FlutterFlowTheme.of(context).tertiary,
                                                                            letterSpacing: 0.0,
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              1.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                          Text(
                                                                            getJsonField(
                                                                              playersItem,
                                                                              r'''$.player.jersey_number''',
                                                                            ).toString(),
                                                                            textAlign:
                                                                            TextAlign.start,
                                                                            style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                              font: GoogleFonts.poppins(),
                                                                              color: FlutterFlowTheme.of(context).tertiary,
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
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
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },



///1

                              onReorder: (int oldIndex, int newIndex) async {
                                // Adjust index for Flutter's reorder behavior
                                int adjustedIndex = newIndex;
                                if (oldIndex < newIndex) {
                                  adjustedIndex -= 1;
                                }

                                // Save previous state for revert
                                final previousPlayers =
                                List<dynamic>.from(_localPlayers);

                                // Update local list immediately for smooth UI
                                setState(() {
                                  final item = _localPlayers.removeAt(oldIndex);
                                  _localPlayers.insert(adjustedIndex, item);
                                });

                                final draggedPlayer = _localPlayers[adjustedIndex];
                                final playerId = getJsonField(
                                    draggedPlayer, r'''$.player.player_id''');
                                final newPosition = adjustedIndex + 1;

                                // Call API in background
                                _model.apiResult156 =
                                await DashboardGroup.rankingPostCall.call(
                                  position: newPosition,
                                  authToken: FFAppState().authToken,
                                  playerId: playerId,
                                );

                                if (!(_model.apiResult156?.succeeded ?? false)) {
                                  // Revert local list if API fails
                                  setState(() {
                                    _localPlayers = previousPlayers;
                                  });
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        getJsonField(
                                            (_model.apiResult156?.jsonBody ??
                                                ''),
                                            r'''$.message''')
                                            .toString(),
                                        style:
                                        const TextStyle(color: Colors.white),
                                      ),
                                      duration:
                                      const Duration(milliseconds: 2000),
                                      backgroundColor: Colors.red,
                                    ),
                                  );
                                } else {
                                  // Show success message
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        getJsonField(
                                            (_model.apiResult156?.jsonBody ??
                                                ''),
                                            r'''$.message''')
                                            .toString(),
                                        style:
                                        const TextStyle(color: Colors.white),
                                      ),
                                      duration:
                                      const Duration(milliseconds: 1000),
                                      backgroundColor: Colors.green,
                                    ),
                                  );
                                }
                              },
                            ),
                          ),

                      ],
                    ),
                  ),
                ),

                ///1  previous code for bottom buttons


                // Align(
                //   alignment: const AlignmentDirectional(0.0, 0.92),
                //   child: Padding(
                //     padding: const EdgeInsetsDirectional.fromSTEB(
                //         16.0, 0.0, 16.0, 80.0),
                //     child: Row(
                //       mainAxisSize: MainAxisSize.max,
                //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //       crossAxisAlignment: CrossAxisAlignment.end,
                //       children: [
                //         Container(
                //           height: 60.0,
                //           decoration: BoxDecoration(
                //             color: (Theme.of(context).brightness ==
                //                 Brightness.dark) ==
                //                 true
                //                 ? const Color(0xFF2C2C2C)
                //                 : const Color(0xFFE5E5E5),
                //             borderRadius: BorderRadius.circular(12.0),
                //             border: Border.all(
                //               color: (Theme.of(context).brightness ==
                //                   Brightness.dark) ==
                //                   true
                //                   ? const Color(0xFF4E4E4E)
                //                   : const Color(0xFFB7B7B7),
                //             ),
                //           ),
                //           child: Align(
                //             alignment: const AlignmentDirectional(0.0, 0.0),
                //             child: Padding(
                //               padding: const EdgeInsetsDirectional.fromSTEB(
                //                   25.0, 13.0, 25.0, 13.0),
                //               child: InkWell(
                //                 onTap: () async {
                //                   context.pushNamed(
                //                       SaveProgressRankingWidget.routeName);
                //                 },
                //                 child: Text(
                //                   'Save Progress',
                //                   style: FlutterFlowTheme.of(context)
                //                       .titleLarge
                //                       .override(
                //                     font: GoogleFonts.poppins(
                //                       fontWeight:
                //                       FlutterFlowTheme.of(context)
                //                           .titleLarge
                //                           .fontWeight,
                //                       fontStyle:
                //                       FlutterFlowTheme.of(context)
                //                           .titleLarge
                //                           .fontStyle,
                //                     ),
                //                     letterSpacing: 0.0,
                //                     fontWeight: FlutterFlowTheme.of(context)
                //                         .titleLarge
                //                         .fontWeight,
                //                     fontStyle: FlutterFlowTheme.of(context)
                //                         .titleLarge
                //                         .fontStyle,
                //                   ),
                //                 ),
                //               ),
                //             ),
                //           ),
                //         ),
                //         Container(
                //           width: 10.0,
                //           decoration: const BoxDecoration(),
                //         ),
                //         Expanded(
                //           child: Container(
                //             height: 60.0,
                //             decoration: BoxDecoration(
                //               color: FlutterFlowTheme.of(context).peach,
                //               borderRadius: BorderRadius.circular(12.0),
                //               border: Border.all(
                //                 color: (Theme.of(context).brightness ==
                //                     Brightness.dark) ==
                //                     true
                //                     ? const Color(0xFF4E4E4E)
                //                     : Colors.transparent,
                //               ),
                //             ),
                //             child: FFButtonWidget(
                //               onPressed: () async {
                //                 if (_model.selectedPlayerCount == null) {
                //                   await showDialog(
                //                     context: context,
                //                     barrierDismissible: false,
                //                     builder: (alertDialogContext) {
                //                       return BackdropFilter(
                //                         filter: ImageFilter.blur(
                //                             sigmaX: 5, sigmaY: 5),
                //                         child: AlertDialog(
                //                           backgroundColor:
                //                           FlutterFlowTheme.of(context)
                //                               .secondaryBackground,
                //                           shape: RoundedRectangleBorder(
                //                             borderRadius:
                //                             BorderRadius.circular(16),
                //                             side: BorderSide(
                //                               color: (Theme.of(context)
                //                                   .brightness ==
                //                                   Brightness.dark)
                //                                   ? const Color(0xFF4E4E4E)
                //                                   : Colors.transparent,
                //                               width: 1,
                //                             ),
                //                           ),
                //                           title: Text(
                //                             'Selection Required',
                //                             style: FlutterFlowTheme.of(context)
                //                                 .headlineMedium
                //                                 .override(
                //                               fontFamily: 'Poppins',
                //                               color: FlutterFlowTheme.of(
                //                                   context)
                //                                   .primaryText,
                //                               fontSize: 20,
                //                               fontWeight: FontWeight.w600,
                //                             ),
                //                           ),
                //                           content: Text(
                //                             'Please select how many players you want to rank',
                //                             style: FlutterFlowTheme.of(context)
                //                                 .bodyMedium
                //                                 .override(
                //                               fontFamily: 'Poppins',
                //                               color: FlutterFlowTheme.of(
                //                                   context)
                //                                   .secondaryText,
                //                               fontSize: 14,
                //                             ),
                //                           ),
                //                           actions: [
                //                             TextButton(
                //                               onPressed: () => Navigator.pop(
                //                                   alertDialogContext),
                //                               child: Container(
                //                                 padding:
                //                                 const EdgeInsets.symmetric(
                //                                     horizontal: 16,
                //                                     vertical: 8),
                //                                 decoration: BoxDecoration(
                //                                   color: FlutterFlowTheme.of(
                //                                       context)
                //                                       .primary,
                //                                   borderRadius:
                //                                   BorderRadius.circular(8),
                //                                 ),
                //                                 child: Text(
                //                                   'OK',
                //                                   style: FlutterFlowTheme.of(
                //                                       context)
                //                                       .titleSmall
                //                                       .override(
                //                                     fontFamily: 'Poppins',
                //                                     color: Colors.white,
                //                                     fontSize: 14,
                //                                     fontWeight:
                //                                     FontWeight.w500,
                //                                   ),
                //                                 ),
                //                               ),
                //                             ),
                //                           ],
                //                           elevation: 5,
                //                         ),
                //                       );
                //                     },
                //                   );
                //                   return;
                //                 }
                //
                //                 await showDialog(
                //                   context: context,
                //                   barrierDismissible: false,
                //                   builder: (alertDialogContext) {
                //                     return BackdropFilter(
                //                       filter: ImageFilter.blur(
                //                           sigmaX: 5, sigmaY: 5),
                //                       child: AlertDialog(
                //                         backgroundColor: Colors.transparent,
                //                         insetPadding: EdgeInsets.zero,
                //                         contentPadding: EdgeInsets.zero,
                //                         content: Align(
                //                           alignment: Alignment.center,
                //                           child: Container(
                //                             width:
                //                             MediaQuery.sizeOf(context).width,
                //                             height: MediaQuery.sizeOf(context)
                //                                 .height *
                //                                 0.7,
                //                             decoration: const BoxDecoration(),
                //                             child: Align(
                //                               alignment: Alignment.center,
                //                               child: Padding(
                //                                 padding:
                //                                 const EdgeInsets.symmetric(
                //                                     horizontal: 8.0),
                //                                 child: Container(
                //                                   width: double.infinity,
                //                                   height:
                //                                   MediaQuery.sizeOf(context)
                //                                       .height,
                //                                   decoration: BoxDecoration(
                //                                     color: Colors.white,
                //                                     boxShadow: const [
                //                                       BoxShadow(
                //                                         blurRadius: 3.0,
                //                                         color:
                //                                         Color(0x33000000),
                //                                         offset:
                //                                         Offset(0.0, 1.0),
                //                                       )
                //                                     ],
                //                                     borderRadius:
                //                                     BorderRadius.circular(
                //                                         24.0),
                //                                     border: Border.all(
                //                                       color: FlutterFlowTheme
                //                                           .of(context)
                //                                           .primaryBackground,
                //                                       width: 1.0,
                //                                     ),
                //                                   ),
                //                                   child: Padding(
                //                                     padding:
                //                                     const EdgeInsetsDirectional
                //                                         .fromSTEB(0.0, 0.0,
                //                                         0.0, 12.0),
                //                                     child: Column(
                //                                       mainAxisSize:
                //                                       MainAxisSize.max,
                //                                       crossAxisAlignment:
                //                                       CrossAxisAlignment
                //                                           .start,
                //                                       children: [
                //                                         Padding(
                //                                           padding:
                //                                           const EdgeInsetsDirectional
                //                                               .fromSTEB(
                //                                               24.0,
                //                                               16.0,
                //                                               24.0,
                //                                               16.0),
                //                                           child: Column(
                //                                             mainAxisSize:
                //                                             MainAxisSize
                //                                                 .max,
                //                                             crossAxisAlignment:
                //                                             CrossAxisAlignment
                //                                                 .start,
                //                                             children: [
                //                                               Align(
                //                                                 alignment:
                //                                                 Alignment
                //                                                     .center,
                //                                                 child:
                //                                                 Lottie.asset(
                //                                                   'assets/jsons/Bouncing_Basket_Ball.json',
                //                                                   width: 100.0,
                //                                                   height: 100.0,
                //                                                   fit: BoxFit
                //                                                       .contain,
                //                                                   animate: true,
                //                                                 ),
                //                                               ),
                //                                               Align(
                //                                                 alignment:
                //                                                 Alignment
                //                                                     .center,
                //                                                 child: Padding(
                //                                                   padding:
                //                                                   const EdgeInsetsDirectional
                //                                                       .fromSTEB(
                //                                                       0.0,
                //                                                       12.0,
                //                                                       0.0,
                //                                                       0.0),
                //                                                   child:
                //                                                   Text.rich(
                //                                                     TextSpan(
                //                                                       children: [
                //                                                         TextSpan(
                //                                                           text:
                //                                                           'You\'re about to finalize your list and contribute to the nominee of the Greatest Player of all time\n\n',
                //                                                           style: FlutterFlowTheme.of(context)
                //                                                               .headlineLarge
                //                                                               .override(
                //                                                             font: GoogleFonts.poppins(
                //                                                               fontWeight: FontWeight.normal,
                //                                                             ),
                //                                                             color: Colors.black,
                //                                                             fontSize: 16.0,
                //                                                           ),
                //                                                         ),
                //                                                         TextSpan(
                //                                                           text:
                //                                                           'ATTENTION: ',
                //                                                           style: FlutterFlowTheme.of(context)
                //                                                               .headlineLarge
                //                                                               .override(
                //                                                             font: GoogleFonts.poppins(
                //                                                               fontWeight: FontWeight.bold,
                //                                                             ),
                //                                                             color: Colors.black,
                //                                                             fontSize: 16.0,
                //                                                           ),
                //                                                         ),
                //                                                         TextSpan(
                //                                                           text:
                //                                                           'This choice is irreversible!\n\n(Check in ABOUT VOTE THE GOAT\n- When the Voting will reopen\n- How to buy credits to reopen your Vote)\n\nAre you sure you want to proceed, or would you prefer to think about it a little longer?',
                //                                                           style: FlutterFlowTheme.of(context)
                //                                                               .headlineLarge
                //                                                               .override(
                //                                                             font: GoogleFonts.poppins(
                //                                                               fontWeight: FontWeight.normal,
                //                                                             ),
                //                                                             color: Colors.black,
                //                                                             fontSize: 16.0,
                //                                                           ),
                //                                                         ),
                //                                                       ],
                //                                                     ),
                //                                                     textAlign:
                //                                                     TextAlign
                //                                                         .left,
                //                                                   ),
                //                                                 ),
                //                                               ),
                //                                             ],
                //                                           ),
                //                                         ),
                //                                         Expanded(
                //                                           child: Padding(
                //                                             padding:
                //                                             const EdgeInsetsDirectional
                //                                                 .fromSTEB(
                //                                                 24.0,
                //                                                 0.0,
                //                                                 24.0,
                //                                                 10.0),
                //                                             child: Row(
                //                                               mainAxisAlignment:
                //                                               MainAxisAlignment
                //                                                   .end,
                //                                               children: [
                //                                                 Container(
                //                                                   width: 70.0,
                //                                                   decoration:
                //                                                   BoxDecoration(
                //                                                     color: const Color(
                //                                                         0x54808080),
                //                                                     borderRadius:
                //                                                     BorderRadius.circular(
                //                                                         12.0),
                //                                                   ),
                //                                                   child:
                //                                                   FFButtonWidget(
                //                                                     onPressed:
                //                                                         () async {
                //                                                       Navigator.pop(
                //                                                           alertDialogContext);
                //                                                     },
                //                                                     text: 'Back',
                //                                                     options:
                //                                                     FFButtonOptions(
                //                                                       height:
                //                                                       40.0,
                //                                                       color: const Color(
                //                                                           0xff000000),
                //                                                       textStyle: FlutterFlowTheme.of(
                //                                                           context)
                //                                                           .headlineLarge
                //                                                           .override(
                //                                                         font:
                //                                                         GoogleFonts.poppins(
                //                                                           fontWeight: FlutterFlowTheme.of(context).headlineLarge.fontWeight,
                //                                                         ),
                //                                                         color:
                //                                                         Colors.white,
                //                                                         fontSize:
                //                                                         16.0,
                //                                                       ),
                //                                                       elevation:
                //                                                       0.0,
                //                                                       borderRadius:
                //                                                       BorderRadius.circular(
                //                                                           12.0),
                //                                                     ),
                //                                                   ),
                //                                                 ),
                //                                                 Padding(
                //                                                   padding:
                //                                                   const EdgeInsetsDirectional
                //                                                       .fromSTEB(
                //                                                       12.0,
                //                                                       0.0,
                //                                                       0.0,
                //                                                       0.0),
                //                                                   child:
                //                                                   Container(
                //                                                     width: 70.0,
                //                                                     decoration:
                //                                                     BoxDecoration(
                //                                                       color: FlutterFlowTheme.of(
                //                                                           context)
                //                                                           .primary,
                //                                                       borderRadius:
                //                                                       BorderRadius.circular(
                //                                                           12.0),
                //                                                     ),
                //                                                     child:
                //                                                     FFButtonWidget(
                //                                                       onPressed:
                //                                                           () async {
                //                                                         _model.apiResultxjo = await DashboardGroup
                //                                                             .finalizeRankingCall
                //                                                             .call(
                //                                                           authToken:
                //                                                           FFAppState().authToken,
                //                                                         );
                //
                //                                                         final message =
                //                                                         getJsonField(
                //                                                           (_model.apiResultxjo?.jsonBody ??
                //                                                               ''),
                //                                                           r'''$.message''',
                //                                                         ).toString();
                //
                //                                                         Navigator.pop(
                //                                                             alertDialogContext);
                //
                //                                                         await showDialog(
                //                                                           context:
                //                                                           context,
                //                                                           barrierDismissible:
                //                                                           false,
                //                                                           builder:
                //                                                               (context) {
                //                                                             bool isSuccess =
                //                                                                 _model.apiResultxjo?.succeeded ?? false;
                //                                                             return BackdropFilter(
                //                                                               filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                //                                                               child: AlertDialog(
                //                                                                 backgroundColor: Colors.white,
                //                                                                 shape: RoundedRectangleBorder(
                //                                                                   borderRadius: BorderRadius.circular(16),
                //                                                                 ),
                //                                                                 content: Container(
                //                                                                   width: 300,
                //                                                                   padding: const EdgeInsets.all(16),
                //                                                                   child: Column(
                //                                                                     mainAxisSize: MainAxisSize.min,
                //                                                                     children: [
                //                                                                       Icon(
                //                                                                         isSuccess ? Icons.check_circle : Icons.error,
                //                                                                         color: isSuccess ? Colors.green : Colors.red,
                //                                                                         size: 60,
                //                                                                       ),
                //                                                                       const SizedBox(height: 16),
                //                                                                       Text(
                //                                                                         isSuccess ? 'Success!' : 'Error!',
                //                                                                         style: TextStyle(
                //                                                                           fontSize: 20,
                //                                                                           fontWeight: FontWeight.bold,
                //                                                                           color: isSuccess ? Colors.green : Colors.red,
                //                                                                         ),
                //                                                                       ),
                //                                                                       const SizedBox(height: 12),
                //                                                                       Text(
                //                                                                         message,
                //                                                                         textAlign: TextAlign.center,
                //                                                                         style: const TextStyle(fontSize: 16),
                //                                                                       ),
                //                                                                       const SizedBox(height: 20),
                //                                                                       ElevatedButton(
                //                                                                         onPressed: () => Navigator.pop(context),
                //                                                                         style: ElevatedButton.styleFrom(
                //                                                                           backgroundColor: FlutterFlowTheme.of(context).primary,
                //                                                                           shape: RoundedRectangleBorder(
                //                                                                             borderRadius: BorderRadius.circular(8),
                //                                                                           ),
                //                                                                         ),
                //                                                                         child: const Text(
                //                                                                           'OK',
                //                                                                           style: TextStyle(color: Colors.white),
                //                                                                         ),
                //                                                                       ),
                //                                                                     ],
                //                                                                   ),
                //                                                                 ),
                //                                                               ),
                //                                                             );
                //                                                           },
                //                                                         );
                //
                //                                                         safeSetState(
                //                                                                 () {});
                //                                                       },
                //                                                       text:
                //                                                       'Finalize',
                //                                                       options:
                //                                                       FFButtonOptions(
                //                                                         height:
                //                                                         40.0,
                //                                                         color: FlutterFlowTheme.of(context)
                //                                                             .peach,
                //                                                         textStyle: FlutterFlowTheme.of(context)
                //                                                             .headlineLarge
                //                                                             .override(
                //                                                           font: GoogleFonts.poppins(
                //                                                             fontWeight: FlutterFlowTheme.of(context).headlineLarge.fontWeight,
                //                                                           ),
                //                                                           color: Colors.white,
                //                                                           fontSize: 16.0,
                //                                                         ),
                //                                                         elevation:
                //                                                         0.0,
                //                                                         borderRadius:
                //                                                         BorderRadius.circular(10.0),
                //                                                       ),
                //                                                     ),
                //                                                   ),
                //                                                 ),
                //                                               ],
                //                                             ),
                //                                           ),
                //                                         ),
                //                                       ],
                //                                     ),
                //                                   ),
                //                                 ),
                //                               ),
                //                             ),
                //                           ),
                //                         ),
                //                       ),
                //                     );
                //                   },
                //                 );
                //               },
                //               text: 'Finalize',
                //               options: FFButtonOptions(
                //                 height: 40.0,
                //                 padding: const EdgeInsetsDirectional.fromSTEB(
                //                     16.0, 0.0, 16.0, 0.0),
                //                 iconPadding:
                //                 const EdgeInsetsDirectional.fromSTEB(
                //                     0.0, 0.0, 0.0, 0.0),
                //                 color: const Color(0x00CD4A20),
                //                 textStyle: FlutterFlowTheme.of(context)
                //                     .titleSmall
                //                     .override(
                //                   font: GoogleFonts.poppins(
                //                     fontWeight: FontWeight.w500,
                //                     fontStyle: FlutterFlowTheme.of(context)
                //                         .titleSmall
                //                         .fontStyle,
                //                   ),
                //                   color: Colors.white,
                //                   letterSpacing: 0.0,
                //                   fontWeight: FontWeight.w500,
                //                   fontStyle: FlutterFlowTheme.of(context)
                //                       .titleSmall
                //                       .fontStyle,
                //                 ),
                //                 elevation: 0.0,
                //                 borderRadius: BorderRadius.circular(8.0),
                //               ),
                //             ),
                //           ),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),

                ///2 feedback for buttons

                Align(
                  alignment: const AlignmentDirectional(0.0, 0.92),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        16.0, 0.0, 16.0, 80.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.end,
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
                              borderRadius: BorderRadius.circular(12.0),
                              border: Border.all(
                                color: (Theme.of(context).brightness ==
                                    Brightness.dark) ==
                                    true
                                    ? const Color(0xFF4E4E4E)
                                    : const Color(0xFFB7B7B7),
                              ),
                            ),
                            child: Align(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    25.0, 13.0, 25.0, 13.0),
                                child: InkWell(
                                  onTap: () async {
                                    // final saveResult = await DashboardGroup.saveProgressCall.call(
                                    //   authToken: FFAppState().authToken,
                                    // );

                                    // final message = getJsonField(
                                    //   saveResult.jsonBody ?? '',
                                    //   r'''$.message''',
                                    // ).toString();

                                    await showDialog(
                                      context: context,
                                      barrierDismissible: false,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(16),
                                            side: BorderSide(
                                              color: (Theme.of(context).brightness == Brightness.dark)
                                                  ? const Color(0xFF4E4E4E)
                                                  : Colors.transparent,
                                              width: 1,
                                            ),
                                          ),
                                          title: Text(
                                            'Save Progress',
                                            style: FlutterFlowTheme.of(context)
                                                .headlineMedium
                                                .override(
                                              fontFamily: 'Poppins',
                                              color: FlutterFlowTheme.of(context).primaryText,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          content: Text(
                                            "Progress saved successfully!",
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                              fontFamily: 'Poppins',
                                              color: FlutterFlowTheme.of(context).secondaryText,
                                              fontSize: 14,
                                            ),
                                          ),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(alertDialogContext),
                                              child: Container(
                                                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(context).primary,
                                                  borderRadius: BorderRadius.circular(8),
                                                ),
                                                child: Text(
                                                  'OK',
                                                  style: FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                    fontFamily: 'Poppins',
                                                    color: Colors.white,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                          elevation: 5,
                                        );
                                      },
                                    );
                                  },
                                  child: Text(
                                    'Save Progress',
                                    style: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .override(
                                      font: GoogleFonts.poppins(
                                        fontWeight:
                                        FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .fontWeight,
                                        fontStyle:
                                        FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .fontStyle,
                                      ),
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleLarge
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
                          decoration: const BoxDecoration(),
                        ),
                        Expanded(
                          child: Container(
                            height: 60.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).peach,
                              borderRadius: BorderRadius.circular(12.0),
                              border: Border.all(
                                color: (Theme.of(context).brightness ==
                                    Brightness.dark) ==
                                    true
                                    ? const Color(0xFF4E4E4E)
                                    : Colors.transparent,
                              ),
                            ),
                            child: FFButtonWidget(
                              onPressed: () async {

                                // Guest user check
                                if (_model.isGuestUser) {
                                  await showDialog<void>(
                                    context: context,
                                    barrierDismissible: true,
                                    builder: (BuildContext dialogContext) {
                                      return AlertDialog(
                                        backgroundColor: const Color(0xFFFFFFFF),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(16),
                                        ),
                                        elevation: 5,
                                        title: const Text(
                                          'Sign Up Required',
                                          style: TextStyle(
                                            fontFamily: 'Poppins',
                                            color: Color(0xFF14181B),
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        content: const Text(
                                          // 'To finalize your ranking, you need to sign up in the app first.',

                                          "One Head, One Vote.\nThis is a certified Global Census.\nTo prevent spam and count your specific ranking, you need to sign up before finalizing.",
                                          style: TextStyle(
                                            fontFamily: 'Poppins',
                                            color: Color(0xFF57636C),
                                            fontSize: 14,
                                          ),
                                        ),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.of(dialogContext).pop(),
                                            child: Container(
                                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                              decoration: BoxDecoration(
                                                color: const Color(0xFF57636C).withValues(alpha: 0.12),
                                                borderRadius: BorderRadius.circular(8),
                                              ),
                                              child: const Text(
                                                'Cancel',
                                                style: TextStyle(
                                                  fontFamily: 'Poppins',
                                                  color: Color(0xFF57636C),
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(dialogContext).pop();
                                              context.pushNamed(SignUpWidget.routeName, queryParameters: {
                                                'showBackButton': serializeParam(true, ParamType.bool),
                                              });
                                            },
                                            child: Container(
                                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                              decoration: BoxDecoration(
                                                color: const Color(0xFFEB6027),
                                                borderRadius: BorderRadius.circular(8),
                                              ),
                                              child: const Text(
                                                'Sign Up',
                                                style: TextStyle(
                                                  fontFamily: 'Poppins',
                                                  color: Colors.white,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                  return;
                                }

                                /// commenting for new app flow
                                // if (_model.selectedPlayerCount == null) {
                                //   await showDialog(
                                //     context: context,
                                //     barrierDismissible: false,
                                //     builder: (alertDialogContext) {
                                //       return BackdropFilter(
                                //         filter: ImageFilter.blur(
                                //             sigmaX: 5, sigmaY: 5),
                                //         child: AlertDialog(
                                //           backgroundColor:
                                //           FlutterFlowTheme.of(context)
                                //               .secondaryBackground,
                                //           shape: RoundedRectangleBorder(
                                //             borderRadius:
                                //             BorderRadius.circular(16),
                                //             side: BorderSide(
                                //               color: (Theme.of(context)
                                //                   .brightness ==
                                //                   Brightness.dark)
                                //                   ? const Color(0xFF4E4E4E)
                                //                   : Colors.transparent,
                                //               width: 1,
                                //             ),
                                //           ),
                                //           title: Text(
                                //             'Selection Required',
                                //             style: FlutterFlowTheme.of(context)
                                //                 .headlineMedium
                                //                 .override(
                                //               fontFamily: 'Poppins',
                                //               color: FlutterFlowTheme.of(
                                //                   context)
                                //                   .primaryText,
                                //               fontSize: 20,
                                //               fontWeight: FontWeight.w600,
                                //             ),
                                //           ),
                                //           content: Text(
                                //             'Please select how many players you want to rank',
                                //             style: FlutterFlowTheme.of(context)
                                //                 .bodyMedium
                                //                 .override(
                                //               fontFamily: 'Poppins',
                                //               color: FlutterFlowTheme.of(
                                //                   context)
                                //                   .secondaryText,
                                //               fontSize: 14,
                                //             ),
                                //           ),
                                //           actions: [
                                //             TextButton(
                                //               onPressed: () => Navigator.pop(
                                //                   alertDialogContext),
                                //               child: Container(
                                //                 padding:
                                //                 const EdgeInsets.symmetric(
                                //                     horizontal: 16,
                                //                     vertical: 8),
                                //                 decoration: BoxDecoration(
                                //                   color: FlutterFlowTheme.of(
                                //                       context)
                                //                       .primary,
                                //                   borderRadius:
                                //                   BorderRadius.circular(8),
                                //                 ),
                                //                 child: Text(
                                //                   'OK',
                                //                   style: FlutterFlowTheme.of(
                                //                       context)
                                //                       .titleSmall
                                //                       .override(
                                //                     fontFamily: 'Poppins',
                                //                     color: Colors.white,
                                //                     fontSize: 14,
                                //                     fontWeight:
                                //                     FontWeight.w500,
                                //                   ),
                                //                 ),
                                //               ),
                                //             ),
                                //           ],
                                //           elevation: 5,
                                //         ),
                                //       );
                                //     },
                                //   );
                                //   return;
                                // }




                                ///1 Confirmation dialog before finalizing ranking previous version

                                // await showDialog(
                                //   context: context,
                                //   barrierDismissible: false,
                                //   builder: (alertDialogContext) {
                                //     return BackdropFilter(
                                //       filter: ImageFilter.blur(
                                //           sigmaX: 5, sigmaY: 5),
                                //       child: AlertDialog(
                                //         backgroundColor: Colors.transparent,
                                //         insetPadding: EdgeInsets.zero,
                                //         contentPadding: EdgeInsets.zero,
                                //         content: Align(
                                //           alignment: Alignment.center,
                                //           child: Container(
                                //             width: MediaQuery.sizeOf(context).width,
                                //             height: MediaQuery.sizeOf(context).height * 0.7,
                                //             decoration: const BoxDecoration(),
                                //             child: Align(
                                //               alignment: Alignment.center,
                                //               child: Padding(
                                //                 padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                //                 child: Container(
                                //                   width: double.infinity,
                                //                   height: MediaQuery.sizeOf(context).height,
                                //                   decoration: BoxDecoration(
                                //                     color: Colors.white,
                                //                     boxShadow: const [
                                //                       BoxShadow(
                                //                         blurRadius: 3.0,
                                //                         color: Color(0x33000000),
                                //                         offset: Offset(0.0, 1.0),
                                //                       )
                                //                     ],
                                //                     borderRadius: BorderRadius.circular(24.0),
                                //                     border: Border.all(
                                //                       color: FlutterFlowTheme.of(context).primaryBackground,
                                //                       width: 1.0,
                                //                     ),
                                //                   ),
                                //                   child: Padding(
                                //                     padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                                //                     child: Column(
                                //                       mainAxisSize: MainAxisSize.max,
                                //                       crossAxisAlignment: CrossAxisAlignment.start,
                                //                       children: [
                                //                         Padding(
                                //                           padding: const EdgeInsetsDirectional.fromSTEB(24.0, 16.0, 24.0, 16.0),
                                //                           child: Column(
                                //                             mainAxisSize: MainAxisSize.max,
                                //                             crossAxisAlignment: CrossAxisAlignment.start,
                                //                             children: [
                                //                               Align(
                                //                                 alignment: Alignment.center,
                                //                                 child: Lottie.asset(
                                //                                   'assets/jsons/Bouncing_Basket_Ball.json',
                                //                                   width: 100.0,
                                //                                   height: 100.0,
                                //                                   fit: BoxFit.contain,
                                //                                   animate: true,
                                //                                 ),
                                //                               ),
                                //                               Align(
                                //                                 alignment: Alignment.center,
                                //                                 child: Padding(
                                //                                   padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                                //                                   child: Text.rich(
                                //                                     TextSpan(
                                //                                       children: [
                                //                                         TextSpan(
                                //                                           text: 'You\'re about to finalize your list and contribute to the nominee of the Greatest Player of all time\n\n',
                                //                                           style: FlutterFlowTheme.of(context).headlineLarge.override(
                                //                                             font: GoogleFonts.poppins(
                                //                                               fontWeight: FontWeight.normal,
                                //                                             ),
                                //                                             color: Colors.black,
                                //                                             fontSize: 16.0,
                                //                                           ),
                                //                                         ),
                                //                                         TextSpan(
                                //                                           text: 'ATTENTION: ',
                                //                                           style: FlutterFlowTheme.of(context).headlineLarge.override(
                                //                                             font: GoogleFonts.poppins(
                                //                                               fontWeight: FontWeight.bold,
                                //                                             ),
                                //                                             color: Colors.black,
                                //                                             fontSize: 16.0,
                                //                                           ),
                                //                                         ),
                                //                                         TextSpan(
                                //                                           text: 'This choice is irreversible!\n\n(Check in ABOUT VOTE THE GOAT\n- When the Voting will reopen\n- How to buy credits to reopen your Vote)\n\nAre you sure you want to proceed, or would you prefer to think about it a little longer?',
                                //                                           style: FlutterFlowTheme.of(context).headlineLarge.override(
                                //                                             font: GoogleFonts.poppins(
                                //                                               fontWeight: FontWeight.normal,
                                //                                             ),
                                //                                             color: Colors.black,
                                //                                             fontSize: 16.0,
                                //                                           ),
                                //                                         ),
                                //                                       ],
                                //                                     ),
                                //                                     textAlign: TextAlign.left,
                                //                                   ),
                                //                                 ),
                                //                               ),
                                //                             ],
                                //                           ),
                                //                         ),
                                //                         Padding(
                                //                           padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 10.0),
                                //                           child: Row(
                                //                             mainAxisAlignment: MainAxisAlignment.end,
                                //                             children: [
                                //                               // BACK BUTTON
                                //                               SizedBox(
                                //                                 width: 90.0,
                                //                                 child: FFButtonWidget(
                                //                                   onPressed: () async {
                                //                                     Navigator.pop(alertDialogContext);
                                //                                   },
                                //                                   text: 'Back',
                                //                                   options: FFButtonOptions(
                                //                                     height: 48.0, // increased height
                                //                                     color: const Color(0xff000000),
                                //                                     textStyle: FlutterFlowTheme.of(context).headlineLarge.override(
                                //                                       font: GoogleFonts.poppins(
                                //                                         fontWeight:
                                //                                         FlutterFlowTheme.of(context).headlineLarge.fontWeight,
                                //                                       ),
                                //                                       color: Colors.white,
                                //                                       fontSize: 16.0,
                                //                                     ),
                                //                                     elevation: 0.0,
                                //                                     borderRadius: BorderRadius.circular(12.0),
                                //                                   ),
                                //                                 ),
                                //                               ),
                                //
                                //                               // FINALIZE BUTTON
                                //                               Padding(
                                //                                 padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                //                                 child: Container(
                                //                                   width: 90.0, // increased width
                                //                                   decoration: BoxDecoration(
                                //                                     color: FlutterFlowTheme.of(context).primary,
                                //                                     borderRadius: BorderRadius.circular(12.0),
                                //                                   ),
                                //                                   child: FFButtonWidget(
                                //                                     onPressed: () async {
                                //                                       // Call the API first
                                //                                       _model.apiResultxjo = await DashboardGroup.finalizeRankingCall.call(
                                //                                         authToken: FFAppState().authToken,
                                //                                       );
                                //
                                //                                       // Extract message
                                //                                       final message = getJsonField(
                                //                                         (_model.apiResultxjo?.jsonBody ?? ''),
                                //                                         r'''$.message''',
                                //                                       ).toString();
                                //
                                //                                       // Close the current confirmation dialog
                                //                                       Navigator.pop(alertDialogContext);
                                //
                                //                                       // Show API result in a new alert dialog
                                //                                       await showDialog(
                                //                                         context: context,
                                //                                         barrierDismissible: false,
                                //                                         builder: (context) {
                                //                                           bool isSuccess = _model.apiResultxjo?.succeeded ?? false;
                                //                                           return BackdropFilter(
                                //                                             filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                                //                                             child: AlertDialog(
                                //                                               backgroundColor: Colors.white,
                                //                                               shape: RoundedRectangleBorder(
                                //                                                 borderRadius: BorderRadius.circular(24),
                                //                                               ),
                                //                                               content: Container(
                                //                                                 width: MediaQuery.sizeOf(context).width * 0.8,
                                //                                                 padding: const EdgeInsets.all(16),
                                //                                                 child: Column(
                                //                                                   mainAxisSize: MainAxisSize.min,
                                //                                                   children: [
                                //                                                     Text(
                                //                                                       isSuccess ? 'Success' : 'Error',
                                //                                                       style: const TextStyle(
                                //                                                         fontSize: 20,
                                //                                                         fontWeight: FontWeight.w600,
                                //                                                         color: Colors.black,
                                //                                                       ),
                                //                                                     ),
                                //                                                     const SizedBox(height: 16),
                                //                                                     Text(
                                //                                                       message,
                                //                                                       textAlign: TextAlign.center,
                                //                                                       style: const TextStyle(
                                //                                                         fontSize: 16,
                                //                                                         fontWeight: FontWeight.w500,
                                //                                                         color: Colors.black,
                                //                                                       ),
                                //                                                     ),
                                //                                                     const SizedBox(height: 24),
                                //                                                     FFButtonWidget(
                                //                                                       onPressed: () {
                                //                                                         context.pushNamed(
                                //                                                           NavWidget.routeName,
                                //                                                           queryParameters: {'initialTab': '2'},
                                //                                                         );
                                //                                                       },
                                //                                                       text: 'OK',
                                //                                                       options: FFButtonOptions(
                                //                                                         height: 40,
                                //                                                         padding:
                                //                                                         const EdgeInsets.symmetric(horizontal: 24),
                                //                                                         color: isSuccess ? Colors.green : Colors.red,
                                //                                                         textStyle: const TextStyle(
                                //                                                           color: Colors.white,
                                //                                                           fontSize: 16,
                                //                                                           fontWeight: FontWeight.w500,
                                //                                                         ),
                                //                                                         elevation: 0,
                                //                                                         borderRadius: BorderRadius.circular(24),
                                //                                                       ),
                                //                                                     ),
                                //                                                   ],
                                //                                                 ),
                                //                                               ),
                                //                                             ),
                                //                                           );
                                //                                         },
                                //                                       );
                                //
                                //                                       safeSetState(() {});
                                //                                     },
                                //                                     text: 'Finalize',
                                //                                     options: FFButtonOptions(
                                //                                       height: 48.0, // increased height
                                //                                       color: FlutterFlowTheme.of(context).peach,
                                //                                       textStyle: FlutterFlowTheme.of(context).headlineLarge.override(
                                //                                         font: GoogleFonts.poppins(
                                //                                           fontWeight:
                                //                                           FlutterFlowTheme.of(context).headlineLarge.fontWeight,
                                //                                         ),
                                //                                         color: Colors.white,
                                //                                         fontSize: 16.0,
                                //                                       ),
                                //                                       elevation: 0.0,
                                //                                       borderRadius: BorderRadius.circular(10.0),
                                //                                     ),
                                //                                   ),
                                //                                 ),
                                //                               ),
                                //                             ],
                                //                           ),
                                //                         ),
                                //                       ],
                                //                     ),
                                //                   ),
                                //                 ),
                                //               ),
                                //             ),
                                //           ),
                                //         ),
                                //       ),
                                //     );
                                //   },
                                // );


                                ///2 copilot version confirmation dialog before finalizing ranking
                                await showDialog(
                                  context: context,
                                  barrierDismissible: false,
                                  builder: (alertDialogContext) {
                                    return BackdropFilter(
                                      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                                      child: AlertDialog(
                                        backgroundColor: Colors.transparent,
                                        insetPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
                                        contentPadding: EdgeInsets.zero,
                                        content: ConstrainedBox(
                                          constraints: BoxConstraints(
                                            maxWidth: 500,
                                            maxHeight: MediaQuery.of(context).size.height * 0.75,
                                          ),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              boxShadow: const [
                                                BoxShadow(
                                                  blurRadius: 3.0,
                                                  color: Color(0x33000000),
                                                  offset: Offset(0.0, 1.0),
                                                )
                                              ],
                                              borderRadius: BorderRadius.circular(24.0),
                                              border: Border.all(
                                                color: FlutterFlowTheme.of(context).primaryBackground,
                                                width: 1.0,
                                              ),
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Flexible(
                                                  child: SingleChildScrollView(
                                                    padding: const EdgeInsets.fromLTRB(24.0, 16.0, 24.0, 16.0),
                                                    child: Column(
                                                      mainAxisSize: MainAxisSize.min,
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Align(
                                                          alignment: Alignment.center,
                                                          child: Lottie.asset(
                                                            'assets/jsons/Bouncing_Basket_Ball.json',
                                                            width: 100.0,
                                                            height: 100.0,
                                                            fit: BoxFit.contain,
                                                            animate: true,
                                                          ),
                                                        ),
                                                        Align(
                                                          alignment: Alignment.center,
                                                          child: Padding(
                                                            padding: const EdgeInsets.only(top: 12.0),
                                                            child: Text.rich(
                                                              TextSpan(
                                                                children: [
                                                                  TextSpan(
                                                                    text: 'You\'re about to finalize your list and contribute to the nominee of the Greatest Player of all time\n\n',
                                                                    style: FlutterFlowTheme.of(context).headlineLarge.override(
                                                                      font: GoogleFonts.poppins(fontWeight: FontWeight.normal),
                                                                      color: Colors.black,
                                                                      fontSize: 16.0,
                                                                    ),
                                                                  ),
                                                                  TextSpan(
                                                                    text: 'ATTENTION: ',
                                                                    style: FlutterFlowTheme.of(context).headlineLarge.override(
                                                                      font: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                                                                      color: Colors.black,
                                                                      fontSize: 16.0,
                                                                    ),
                                                                  ),
                                                                  TextSpan(
                                                                    text: 'This choice is irreversible!\n\n(Check in ABOUT VOTE THE GOAT\n- When the Voting will reopen\n- How to buy credits to reopen your Vote)\n\nAre you sure you want to proceed, or would you prefer to think about it a little longer?',
                                                                    style: FlutterFlowTheme.of(context).headlineLarge.override(
                                                                      font: GoogleFonts.poppins(fontWeight: FontWeight.normal),
                                                                      color: Colors.black,
                                                                      fontSize: 16.0,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              textAlign: TextAlign.left,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.fromLTRB(24.0, 0.0, 24.0, 12.0),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.end,
                                                    children: [
                                                      SizedBox(
                                                        width: 90.0,
                                                        height: 48.0,
                                                        child: FFButtonWidget(
                                                          onPressed: () async {
                                                            Navigator.pop(alertDialogContext);
                                                          },
                                                          text: 'Back',
                                                          options: FFButtonOptions(
                                                            height: 48.0,
                                                            color: const Color(0xff000000),
                                                            textStyle: FlutterFlowTheme.of(context).headlineLarge.override(
                                                              font: GoogleFonts.poppins(
                                                                fontWeight: FlutterFlowTheme.of(context).headlineLarge.fontWeight,
                                                              ),
                                                              color: Colors.white,
                                                              fontSize: 16.0,
                                                            ),
                                                            elevation: 0.0,
                                                            borderRadius: BorderRadius.circular(12.0),
                                                          ),
                                                        ),
                                                      ),
                                                      const SizedBox(width: 12.0),
                                                      SizedBox(
                                                        width: 90.0,
                                                        height: 48.0,
                                                        child: FFButtonWidget(
                                                          onPressed: () async {







                                                            _model.apiResultxjo = await DashboardGroup.finalizeRankingCall.call(
                                                              authToken: FFAppState().authToken,
                                                            );

                                                            final message = getJsonField(
                                                              (_model.apiResultxjo?.jsonBody ?? ''),
                                                              r'''$.message''',
                                                            ).toString();

                                                            Navigator.pop(alertDialogContext);

                                                            await showDialog(
                                                              context: context,
                                                              barrierDismissible: false,
                                                              builder: (context) {
                                                                bool isSuccess = _model.apiResultxjo?.succeeded ?? false;
                                                                return BackdropFilter(
                                                                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                                                                  child: AlertDialog(
                                                                    backgroundColor: Colors.white,
                                                                    shape: RoundedRectangleBorder(
                                                                      borderRadius: BorderRadius.circular(24),
                                                                    ),
                                                                    content: Container(
                                                                      width: MediaQuery.sizeOf(context).width * 0.8,
                                                                      padding: const EdgeInsets.all(16),
                                                                      child: Column(
                                                                        mainAxisSize: MainAxisSize.min,
                                                                        children: [
                                                                          Text(
                                                                            isSuccess ? 'Success' : 'Error',
                                                                            style: const TextStyle(
                                                                              fontSize: 20,
                                                                              fontWeight: FontWeight.w600,
                                                                              color: Colors.black,
                                                                            ),
                                                                          ),
                                                                          const SizedBox(height: 16),
                                                                          Text(
                                                                            message,
                                                                            textAlign: TextAlign.center,
                                                                            style: const TextStyle(
                                                                              fontSize: 16,
                                                                              fontWeight: FontWeight.w500,
                                                                              color: Colors.black,
                                                                            ),
                                                                          ),
                                                                          const SizedBox(height: 24),
                                                                          FFButtonWidget(
                                                                            onPressed: () {
                                                                              context.pushNamed(
                                                                                NavWidget.routeName,
                                                                                queryParameters: {'initialTab': '2'},
                                                                              );
                                                                            },
                                                                            text: 'OK',
                                                                            options: FFButtonOptions(
                                                                              height: 40,
                                                                              padding: const EdgeInsets.symmetric(horizontal: 24),
                                                                              color: isSuccess ? Colors.green : Colors.red,
                                                                              textStyle: const TextStyle(
                                                                                color: Colors.white,
                                                                                fontSize: 16,
                                                                                fontWeight: FontWeight.w500,
                                                                              ),
                                                                              elevation: 0,
                                                                              borderRadius: BorderRadius.circular(24),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            );

                                                            safeSetState(() {});
                                                          },
                                                          text: 'Finalize',
                                                          options: FFButtonOptions(
                                                            height: 48.0,
                                                            color: FlutterFlowTheme.of(context).peach,
                                                            textStyle: FlutterFlowTheme.of(context).headlineLarge.override(
                                                              font: GoogleFonts.poppins(
                                                                fontWeight: FlutterFlowTheme.of(context).headlineLarge.fontWeight,
                                                              ),
                                                              color: Colors.white,
                                                              fontSize: 16.0,
                                                            ),
                                                            elevation: 0.0,
                                                            borderRadius: BorderRadius.circular(10.0),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                );


                              },
                              text: 'Finalize',
                              options: FFButtonOptions(
                                height: 40.0,
                                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                color: const Color(0x00CD4A20),
                                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                  font: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                  ),
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                ),
                                elevation: 0.0,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),


                ///

                if (_model.isLoading)
                  const Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          0.0, 80.0, 0.0, 0.0),
                      child: SizedBox(
                        width: 100.0,
                        height: 100.0,
                        child: custom_widgets.CubeGridLoader(
                          width: 100.0,
                          height: 100.0,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}