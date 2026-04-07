import '../../custom_code/widgets/cube_grid_loader.dart' as custom_widgets;
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/button_small/button_small_widget.dart';
import '/components/drawer_menu/drawer_menu_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:async';
import 'dart:ui';
import '/index.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import '../../subscription/smart_interstitial_manager.dart';
import '../../subscription/ad_service.dart';

import 'play_with_friends_model.dart';
export 'play_with_friends_model.dart';

class PlayWithFriendsWidget extends StatefulWidget {
  const PlayWithFriendsWidget({super.key});

  static String routeName = 'PlayWithFriends';
  static String routePath = '/playWithFriends';

  @override
  State<PlayWithFriendsWidget> createState() => _PlayWithFriendsWidgetState();
}

class _PlayWithFriendsWidgetState extends State<PlayWithFriendsWidget>
    with TickerProviderStateMixin, RouteAware {
  late PlayWithFriendsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  Future<void> _loadProfileOrRedirect() async {
    debugPrint('[EligiblePlayer] _loadProfileOrRedirect: STARTING');

    final token = FFAppState().authToken;

    // Check if token exists and is not empty
    if (token.isEmpty) {
      debugPrint(
          '[EligiblePlayer] getProfile: No auth token found -> redirecting to login');
      await _showSessionExpiredDialog();
      if (!mounted) return;
      return;
    }

    final tail = token.length >= 4 ? token.substring(token.length - 4) : token;
    debugPrint(
        '[EligiblePlayer] getProfile: start, tokenPresent=true, tokenTail=$tail');

    try {
      final res = await DashboardGroup.getProfileCall.call(
        authToken: token,
      );

      debugPrint('[EligiblePlayer] getProfile: response received');
      debugPrint(
          '[EligiblePlayer] getProfile: status=${res.statusCode}, succeeded=${res.succeeded}');

      final bodyStr = '${res.jsonBody}';
      debugPrint(
        '[EligiblePlayer] getProfile: body=${bodyStr.length > 800 ? '${bodyStr.substring(0, 800)}...(${bodyStr.length} chars)' : bodyStr}',
      );

      final status = res.statusCode;
      final succeeded = res.succeeded == true;
      final unauthorized = status == 401 || status == 403;

      // Check for various failure conditions
      if (!succeeded || unauthorized || status < 200 || status >= 300) {
        debugPrint(
            '[EligiblePlayer] getProfile: failed/unauthorized -> redirecting to login');
        debugPrint(
            '[EligiblePlayer] getProfile: res=$res, succeeded=$succeeded, unauthorized=$unauthorized, status=$status');

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
      debugPrint(
          '[EligiblePlayer] getProfile: success, userName=${FFAppState().userName}');
      safeSetState(() {});
    } catch (e, st) {
      debugPrint('[EligiblePlayer] getProfile: exception=$e');
      debugPrint('[EligiblePlayer] getProfile: stack=$st');

      // Clear all app state data
      _clearAllAppStateData();

      if (!mounted) return;

      // Show session expired popup
      await _showSessionExpiredDialog();
    }
  }

  void _clearAllAppStateData() {
    debugPrint('[EligiblePlayer] Clearing all app state data');

    // Clear authentication token
    FFAppState().authToken = '';

    // Clear user data
    FFAppState().userName = '';

    debugPrint('[EligiblePlayer] App state cleared');
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

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PlayWithFriendsModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      AdService().startPageTimer('playWithFriends');

      // Preload interstitial ad (will check subscription status internally)
      // await SmartInterstitialManager().preloadInterstitial();

      // Only show ad if still mounted and ads are enabled
      if (mounted && FFAppState().advertisementStatus != 0) {
        await SmartInterstitialManager().showInterstitialIfAllowed();
      }

      await _loadProfileOrRedirect();

      FFAppState().isRead = false;
      safeSetState(() {});
    });

    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )
      ..addListener(() => safeSetState(() {}))
      ..addListener(() {
        debugLogWidgetClass(_model);
      });

    _model.teamNameTextController1 ??= TextEditingController()
      ..addListener(() {
        debugLogWidgetClass(_model);
      });
    _model.teamNameFocusNode1 ??= FocusNode();

    _model.teamNameTextController2 ??= TextEditingController()
      ..addListener(() {
        debugLogWidgetClass(_model);
      });
    _model.teamNameFocusNode2 ??= FocusNode();
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);

    _model.dispose();

    AdService().stopInterstitialTimer();

    super.dispose();
  }

  @override
  void didUpdateWidget(PlayWithFriendsWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Restart timer when widget updates
    AdService().startPageTimer('playWithFriends');
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

      // Start timer when page is pushed
      AdService().startPageTimer('playWithFriends');
    }
  }

  @override
  void didPush() {
    if (mounted && DebugFlutterFlowModelContext.maybeOf(context) == null) {
      setState(() => _model.isRouteVisible = true);

      AdService().startPageTimer('playWithFriends');

      debugLogWidgetClass(_model);
    }
  }

  @override
  void didPop() {
    AdService().stopInterstitialTimer();

    _model.isRouteVisible = false;
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
                    ? 'assets/images/playWithFrndsBg.png'
                    : 'assets/images/light_pwf.png',
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsetsDirectional.fromSTEB(16.0, 40.0, 16.0, 0.0),
              child: SingleChildScrollView(
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
                            scaffoldKey.currentState!.openDrawer();
                          },
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
                                      : Colors.transparent,
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
                                    : const Color(0xFF999999),
                              ),
                            ),
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
                              'PLAY WITH',
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
                              'FRIENDS',
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
                              context.pushNamed(AboutScreenWidget.routeName);
                            },
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
                                        : Colors.transparent,
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
                                      : const Color(0xFF999999),
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
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          0.0, 10.0, 0.0, 0.0),
                      child: Container(
                        height: MediaQuery.sizeOf(context).height * 0.8,
                        decoration: const BoxDecoration(),
                        child: FutureBuilder<ApiCallResponse>(
                          future: DashboardGroup.getteamdetailCall.call(
                            authToken: FFAppState().authToken,
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 40.0,
                                  height: 40.0,
                                  child: SpinKitCubeGrid(
                                    color: FlutterFlowTheme.of(context).primary,
                                    size: 40.0,
                                  ),
                                ),
                              );
                            }
                            final tabBarGetteamdetailResponse = snapshot.data!;
                            _model.debugBackendQueries[
                                    'DashboardGroup.getteamdetailCall_statusCode_TabBar_766pstlx'] =
                                debugSerializeParam(
                              tabBarGetteamdetailResponse.statusCode,
                              ParamType.int,
                              link:
                                  'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=PlayWithFriends',
                              name: 'int',
                              nullable: false,
                            );
                            _model.debugBackendQueries[
                                    'DashboardGroup.getteamdetailCall_responseBody_TabBar_766pstlx'] =
                                debugSerializeParam(
                              tabBarGetteamdetailResponse.bodyText,
                              ParamType.String,
                              link:
                                  'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=PlayWithFriends',
                              name: 'String',
                              nullable: false,
                            );
                            debugLogWidgetClass(_model);

                            return Column(
                              children: [
                                Align(
                                  alignment: const Alignment(0.0, 0),
                                  child: TabBar(
                                    labelColor:
                                        FlutterFlowTheme.of(context).peach,
                                    unselectedLabelColor:
                                        FlutterFlowTheme.of(context).tertiary,
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .headlineLarge
                                        .override(
                                          font: GoogleFonts.bebasNeue(
                                            fontWeight: FontWeight.normal,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .headlineLarge
                                                    .fontStyle,
                                          ),
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .headlineLarge
                                                  .fontStyle,
                                        ),
                                    unselectedLabelStyle:
                                        FlutterFlowTheme.of(context)
                                            .headlineLarge
                                            .override(
                                              font: GoogleFonts.bebasNeue(
                                                fontWeight: FontWeight.normal,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineLarge
                                                        .fontStyle,
                                              ),
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.normal,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineLarge
                                                      .fontStyle,
                                            ),
                                    indicatorColor:
                                        FlutterFlowTheme.of(context).primary,
                                    tabs: const [
                                      Tab(
                                        text: 'My Teams',
                                      ),
                                      Tab(
                                        text: 'Join Team',
                                      ),
                                    ],
                                    controller: _model.tabBarController,
                                    onTap: (i) async {
                                      [() async {}, () async {}][i]();
                                    },
                                  ),
                                ),
                                Expanded(
                                  child: TabBarView(
                                    controller: _model.tabBarController,
                                    children: [
                                      Stack(
                                        children: [
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              if (_model.isEnabled)
                                                Align(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          0.0, -1.0),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 20.0,
                                                            0.0, 0.0),
                                                    child: Container(
                                                      width: double.infinity,
                                                      decoration: BoxDecoration(
                                                        color: (Theme.of(context)
                                                                        .brightness ==
                                                                    Brightness
                                                                        .dark) ==
                                                                true
                                                            ? const Color(
                                                                0x26FFFFFF)
                                                            : const Color(
                                                                0x8F898982),
                                                        boxShadow: const [
                                                          BoxShadow(
                                                            blurRadius: 10.0,
                                                            color: Color(
                                                                0x33000000),
                                                            offset: Offset(
                                                              0.0,
                                                              2.0,
                                                            ),
                                                          )
                                                        ],
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                      ),
                                                      child: Form(
                                                        key: _model.formKey1,
                                                        autovalidateMode:
                                                            AutovalidateMode
                                                                .disabled,
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                  3.0,
                                                                  3.0,
                                                                  3.0,
                                                                  0.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                        3.0,
                                                                        0.0,
                                                                        3.0,
                                                                        0.0),
                                                                child: SizedBox(
                                                                  width: double
                                                                      .infinity,
                                                                  child:
                                                                      TextFormField(
                                                                    controller:
                                                                        _model
                                                                            .teamNameTextController1,
                                                                    focusNode:
                                                                        _model
                                                                            .teamNameFocusNode1,
                                                                    autofocus:
                                                                        false,
                                                                    obscureText:
                                                                        false,
                                                                    decoration:
                                                                        InputDecoration(
                                                                      isDense:
                                                                          true,
                                                                      labelStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.poppins(
                                                                              fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                            ),
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                          ),
                                                                      hintText:
                                                                          'Enter Team Name',
                                                                      hintStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.poppins(
                                                                              fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                            ),
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                          ),
                                                                      enabledBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            const BorderSide(
                                                                          color:
                                                                              Color(0x00000000),
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      focusedBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            const BorderSide(
                                                                          color:
                                                                              Color(0x00000000),
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      errorBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).error,
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      focusedErrorBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).error,
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      filled:
                                                                          true,
                                                                      fillColor: (Theme.of(context).brightness == Brightness.dark) ==
                                                                              true
                                                                          ? const Color(
                                                                              0x80050505)
                                                                          : const Color(
                                                                              0xFFE9E9E9),
                                                                      prefixIcon:
                                                                          Icon(
                                                                        FontAwesomeIcons
                                                                            .basketballBall,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .tertiary,
                                                                        size:
                                                                            24.0,
                                                                      ),
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.poppins(
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                          ),
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .fontStyle,
                                                                        ),
                                                                    cursorColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                    validator: _model
                                                                        .teamNameTextController1Validator
                                                                        .asValidator(
                                                                            context),
                                                                  ),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                        10.0,
                                                                        10.0,
                                                                        10.0,
                                                                        0.0),
                                                                child: InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    final selectedMedia =
                                                                        await selectMediaWithSourceBottomSheet(
                                                                      context:
                                                                          context,
                                                                      imageQuality:
                                                                          40,
                                                                      allowPhoto:
                                                                          true,
                                                                      includeBlurHash:
                                                                          true,
                                                                      backgroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .tertiary,
                                                                      textColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .oposite,
                                                                    );
                                                                    if (selectedMedia !=
                                                                            null &&
                                                                        selectedMedia.every((m) => validateFileFormat(
                                                                            m.storagePath,
                                                                            context))) {
                                                                      safeSetState(() =>
                                                                          _model.isDataUploading_uploadDataEzy =
                                                                              true);
                                                                      var selectedUploadedFiles =
                                                                          <FFUploadedFile>[];

                                                                      try {
                                                                        showUploadMessage(
                                                                          context,
                                                                          'Uploading file...',
                                                                          showLoading:
                                                                              true,
                                                                        );
                                                                        selectedUploadedFiles = selectedMedia
                                                                            .map((m) => FFUploadedFile(
                                                                                  name: m.storagePath.split('/').last,
                                                                                  bytes: m.bytes,
                                                                                  height: m.dimensions?.height,
                                                                                  width: m.dimensions?.width,
                                                                                  blurHash: m.blurHash,
                                                                                ))
                                                                            .toList();
                                                                      } finally {
                                                                        ScaffoldMessenger.of(context)
                                                                            .hideCurrentSnackBar();
                                                                        _model.isDataUploading_uploadDataEzy =
                                                                            false;
                                                                      }
                                                                      if (selectedUploadedFiles
                                                                              .length ==
                                                                          selectedMedia
                                                                              .length) {
                                                                        safeSetState(
                                                                            () {
                                                                          _model.uploadedLocalFile_uploadDataEzy =
                                                                              selectedUploadedFiles.first;
                                                                        });
                                                                        showUploadMessage(
                                                                            context,
                                                                            'Success!');
                                                                      } else {
                                                                        safeSetState(
                                                                            () {});
                                                                        showUploadMessage(
                                                                            context,
                                                                            'Failed to upload data');
                                                                        return;
                                                                      }
                                                                    }
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              6.0),
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: Colors
                                                                            .white,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding: const EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                          0.0,
                                                                          16.0,
                                                                          0.0,
                                                                          16.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Padding(
                                                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                10.0,
                                                                                0.0),
                                                                            child:
                                                                                Icon(
                                                                              Icons.cloud_upload_outlined,
                                                                              color: FlutterFlowTheme.of(context).tertiary,
                                                                              size: 24.0,
                                                                            ),
                                                                          ),
                                                                          Text(
                                                                            valueOrDefault<String>(
                                                                              _model.uploadedLocalFile_uploadDataEzy.name,
                                                                              'Upload Icon',
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                  font: GoogleFonts.poppins(
                                                                                    fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                  ),
                                                                                  color: FlutterFlowTheme.of(context).tertiary,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),

                                                              // Padding(
                                                              //   padding: const EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 0.0),
                                                              //   child: InkWell(
                                                              //     splashColor: Colors.transparent,
                                                              //     focusColor: Colors.transparent,
                                                              //     hoverColor: Colors.transparent,
                                                              //     highlightColor: Colors.transparent,
                                                              //     onTap: () async {
                                                              //       final selectedMedia = await selectMediaWithSourceBottomSheet(
                                                              //         context: context,
                                                              //         imageQuality: 40,
                                                              //         allowPhoto: true,
                                                              //         includeBlurHash: true,
                                                              //         backgroundColor: FlutterFlowTheme.of(context).tertiary,
                                                              //         textColor: FlutterFlowTheme.of(context).oposite,
                                                              //       );
                                                              //       if (selectedMedia != null &&
                                                              //           selectedMedia.every((m) => validateFileFormat(m.storagePath, context))) {
                                                              //         safeSetState(() => _model.isDataUploading_uploadDataEzy = true);
                                                              //         var selectedUploadedFiles = <FFUploadedFile>[];
                                                              //
                                                              //         try {
                                                              //           showUploadMessage(
                                                              //             context,
                                                              //             'Uploading file...',
                                                              //             showLoading: true,
                                                              //           );
                                                              //           selectedUploadedFiles = selectedMedia
                                                              //               .map((m) => FFUploadedFile(
                                                              //             name: m.storagePath.split('/').last,
                                                              //             bytes: m.bytes,
                                                              //             height: m.dimensions?.height,
                                                              //             width: m.dimensions?.width,
                                                              //             blurHash: m.blurHash,
                                                              //           ))
                                                              //               .toList();
                                                              //         } finally {
                                                              //           ScaffoldMessenger.of(context).hideCurrentSnackBar();
                                                              //           _model.isDataUploading_uploadDataEzy = false;
                                                              //         }
                                                              //         if (selectedUploadedFiles.length == selectedMedia.length) {
                                                              //           safeSetState(() {
                                                              //             _model.uploadedLocalFile_uploadDataEzy = selectedUploadedFiles.first;
                                                              //           });
                                                              //           showUploadMessage(context, 'Success!');
                                                              //         } else {
                                                              //           safeSetState(() {});
                                                              //           showUploadMessage(context, 'Failed to upload data');
                                                              //           return;
                                                              //         }
                                                              //       }
                                                              //     },
                                                              //     child: Container(
                                                              //       decoration: BoxDecoration(
                                                              //         borderRadius: BorderRadius.circular(6.0),
                                                              //         border: Border.all(
                                                              //           color: Colors.white,
                                                              //           width: 1.0,
                                                              //         ),
                                                              //       ),
                                                              //       child: Padding(
                                                              //         padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 16.0),
                                                              //         child: Row(
                                                              //           mainAxisSize: MainAxisSize.max,
                                                              //           mainAxisAlignment: MainAxisAlignment.center,
                                                              //           children: [
                                                              //             Padding(
                                                              //               padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                                                              //               child: Icon(
                                                              //                 Icons.cloud_upload_outlined,
                                                              //                 color: FlutterFlowTheme.of(context).tertiary,
                                                              //                 size: 24.0,
                                                              //               ),
                                                              //             ),
                                                              //             Text(
                                                              //               _model.uploadedLocalFile_uploadDataEzy != null
                                                              //                   ? '${_model.uploadedLocalFile_uploadDataEzy.name}'
                                                              //                   : 'Upload Icon',
                                                              //               style: FlutterFlowTheme.of(context).labelMedium.override(
                                                              //                 font: GoogleFonts.poppins(
                                                              //                   fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                              //                   fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                              //                 ),
                                                              //                 color: FlutterFlowTheme.of(context).tertiary,
                                                              //                 letterSpacing: 0.0,
                                                              //                 fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                              //                 fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                              //               ),
                                                              //             ),
                                                              //           ],
                                                              //         ),
                                                              //       ),
                                                              //     ),
                                                              //   ),
                                                              // ),
                                                              Padding(
                                                                  padding:
                                                                      const EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                          16.0,
                                                                          16.0,
                                                                          16.0,
                                                                          0.0),
                                                                  child:

                                                                      ///1
                                                                      // Row(
                                                                      //   mainAxisSize:
                                                                      //   MainAxisSize
                                                                      //       .max,
                                                                      //   mainAxisAlignment:
                                                                      //   MainAxisAlignment
                                                                      //       .spaceBetween,
                                                                      //   children: [
                                                                      //
                                                                      //     ///1
                                                                      //     ///
                                                                      //     Expanded(
                                                                      //       child:
                                                                      //       Padding(
                                                                      //         padding: const EdgeInsetsDirectional.fromSTEB(
                                                                      //             0.0,
                                                                      //             0.0,
                                                                      //             10.0,
                                                                      //             0.0),
                                                                      //         child:
                                                                      //         Container(
                                                                      //           height:
                                                                      //           54.0,
                                                                      //           decoration:
                                                                      //           BoxDecoration(
                                                                      //             gradient:
                                                                      //             const LinearGradient(
                                                                      //               colors: [
                                                                      //                 Color(0xFFDD7325),
                                                                      //                 Color(0xFFD69E7E),
                                                                      //                 Color(0xFFDD7325)
                                                                      //               ],
                                                                      //               stops: [
                                                                      //                 0.0,
                                                                      //                 0.5,
                                                                      //                 1.0
                                                                      //               ],
                                                                      //               begin: AlignmentDirectional(0.0, 1.0),
                                                                      //               end: AlignmentDirectional(0, -1.0),
                                                                      //             ),
                                                                      //             borderRadius:
                                                                      //             BorderRadius.circular(12.0),
                                                                      //             border:
                                                                      //             Border.all(
                                                                      //               color: const Color(0xFF4E4E4E),
                                                                      //             ),
                                                                      //           ),
                                                                      //           child:
                                                                      //           Padding(
                                                                      //             padding: const EdgeInsetsDirectional.fromSTEB(
                                                                      //                 0.0,
                                                                      //                 14.0,
                                                                      //                 0.0,
                                                                      //                 14.0),
                                                                      //             child:
                                                                      //             FFButtonWidget(
                                                                      //               onPressed: () async {
                                                                      //                 final _datePicked1Date = await showDatePicker(
                                                                      //                   context: context,
                                                                      //                   initialDate: getCurrentTimestamp,
                                                                      //                   firstDate: getCurrentTimestamp,
                                                                      //                   lastDate: DateTime(2050),
                                                                      //                   builder: (context, child) {
                                                                      //                     return wrapInMaterialDatePickerTheme(
                                                                      //                       context,
                                                                      //                       child!,
                                                                      //                       headerBackgroundColor: FlutterFlowTheme.of(context).primary,
                                                                      //                       headerForegroundColor: FlutterFlowTheme.of(context).info,
                                                                      //                       headerTextStyle: FlutterFlowTheme.of(context).headlineLarge.override(
                                                                      //                         font: GoogleFonts.poppins(
                                                                      //                           fontWeight: FontWeight.w600,
                                                                      //                           fontStyle: FlutterFlowTheme.of(context).headlineLarge.fontStyle,
                                                                      //                         ),
                                                                      //                         fontSize: 32.0,
                                                                      //                         letterSpacing: 0.0,
                                                                      //                         fontWeight: FontWeight.w600,
                                                                      //                         fontStyle: FlutterFlowTheme.of(context).headlineLarge.fontStyle,
                                                                      //                       ),
                                                                      //                       pickerBackgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                      //                       pickerForegroundColor: FlutterFlowTheme.of(context).primaryText,
                                                                      //                       selectedDateTimeBackgroundColor: FlutterFlowTheme.of(context).primary,
                                                                      //                       selectedDateTimeForegroundColor: FlutterFlowTheme.of(context).info,
                                                                      //                       actionButtonForegroundColor: FlutterFlowTheme.of(context).primaryText,
                                                                      //                       iconSize: 24.0,
                                                                      //                     );
                                                                      //                   },
                                                                      //                 );
                                                                      //
                                                                      //                 if (_datePicked1Date != null) {
                                                                      //                   safeSetState(() {
                                                                      //                     _model.datePicked1 = DateTime(
                                                                      //                       _datePicked1Date.year,
                                                                      //                       _datePicked1Date.month,
                                                                      //                       _datePicked1Date.day,
                                                                      //                     );
                                                                      //                   });
                                                                      //                 } else if (_model.datePicked1 != null) {
                                                                      //                   safeSetState(() {
                                                                      //                     _model.datePicked1 = getCurrentTimestamp;
                                                                      //                   });
                                                                      //                 }
                                                                      //                 _model.date = dateTimeFormat("yyyy-MM-dd", _model.datePicked1);
                                                                      //                 safeSetState(() {});
                                                                      //               },
                                                                      //               text: 'Choose Date',
                                                                      //               options: FFButtonOptions(
                                                                      //                 padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                      //                 iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                      //                 color: const Color(0x00CD4A20),
                                                                      //                 textStyle: FlutterFlowTheme.of(context).titleLarge.override(
                                                                      //                   font: GoogleFonts.poppins(
                                                                      //                     fontWeight: FlutterFlowTheme.of(context).titleLarge.fontWeight,
                                                                      //                     fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                                                                      //                   ),
                                                                      //                   color: Colors.white,
                                                                      //                   letterSpacing: 0.0,
                                                                      //                   fontWeight: FlutterFlowTheme.of(context).titleLarge.fontWeight,
                                                                      //                   fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                                                                      //                 ),
                                                                      //                 elevation: 0.0,
                                                                      //                 borderRadius: BorderRadius.circular(8.0),
                                                                      //               ),
                                                                      //             ),
                                                                      //           ),
                                                                      //         ),
                                                                      //       ),
                                                                      //     ),
                                                                      //     Expanded(
                                                                      //       child:
                                                                      //       Container(
                                                                      //         height:
                                                                      //         54.0,
                                                                      //         decoration:
                                                                      //         BoxDecoration(
                                                                      //           gradient:
                                                                      //           const LinearGradient(
                                                                      //             colors: [
                                                                      //               Color(0xFFDD7325),
                                                                      //               Color(0xFFD69E7E),
                                                                      //               Color(0xFFDD7325)
                                                                      //             ],
                                                                      //             stops: [
                                                                      //               0.0,
                                                                      //               0.5,
                                                                      //               1.0
                                                                      //             ],
                                                                      //             begin:
                                                                      //             AlignmentDirectional(0.0, 1.0),
                                                                      //             end:
                                                                      //             AlignmentDirectional(0, -1.0),
                                                                      //           ),
                                                                      //           borderRadius:
                                                                      //           BorderRadius.circular(12.0),
                                                                      //           border:
                                                                      //           Border.all(
                                                                      //             color:
                                                                      //             const Color(0xFF4E4E4E),
                                                                      //           ),
                                                                      //         ),
                                                                      //         child:
                                                                      //         Padding(
                                                                      //           padding: const EdgeInsetsDirectional.fromSTEB(
                                                                      //               0.0,
                                                                      //               14.0,
                                                                      //               0.0,
                                                                      //               14.0),
                                                                      //           child:
                                                                      //           FFButtonWidget(
                                                                      //             onPressed:
                                                                      //                 () async {
                                                                      //               final _datePicked2Time = await showTimePicker(
                                                                      //                 context: context,
                                                                      //                 initialTime: TimeOfDay.fromDateTime(getCurrentTimestamp),
                                                                      //                 builder: (context, child) {
                                                                      //                   return wrapInMaterialTimePickerTheme(
                                                                      //                     context,
                                                                      //                     child!,
                                                                      //                     headerBackgroundColor: FlutterFlowTheme.of(context).primary,
                                                                      //                     headerForegroundColor: FlutterFlowTheme.of(context).info,
                                                                      //                     headerTextStyle: FlutterFlowTheme.of(context).headlineLarge.override(
                                                                      //                       font: GoogleFonts.poppins(
                                                                      //                         fontWeight: FontWeight.w600,
                                                                      //                         fontStyle: FlutterFlowTheme.of(context).headlineLarge.fontStyle,
                                                                      //                       ),
                                                                      //                       fontSize: 32.0,
                                                                      //                       letterSpacing: 0.0,
                                                                      //                       fontWeight: FontWeight.w600,
                                                                      //                       fontStyle: FlutterFlowTheme.of(context).headlineLarge.fontStyle,
                                                                      //                     ),
                                                                      //                     pickerBackgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                      //                     pickerForegroundColor: FlutterFlowTheme.of(context).primaryText,
                                                                      //                     selectedDateTimeBackgroundColor: FlutterFlowTheme.of(context).primary,
                                                                      //                     selectedDateTimeForegroundColor: FlutterFlowTheme.of(context).info,
                                                                      //                     actionButtonForegroundColor: FlutterFlowTheme.of(context).primaryText,
                                                                      //                     iconSize: 24.0,
                                                                      //                   );
                                                                      //                 },
                                                                      //               );
                                                                      //               if (_datePicked2Time != null) {
                                                                      //                 safeSetState(() {
                                                                      //                   _model.datePicked2 = DateTime(
                                                                      //                     getCurrentTimestamp.year,
                                                                      //                     getCurrentTimestamp.month,
                                                                      //                     getCurrentTimestamp.day,
                                                                      //                     _datePicked2Time.hour,
                                                                      //                     _datePicked2Time.minute,
                                                                      //                   );
                                                                      //                 });
                                                                      //               } else if (_model.datePicked2 != null) {
                                                                      //                 safeSetState(() {
                                                                      //                   _model.datePicked2 = getCurrentTimestamp;
                                                                      //                 });
                                                                      //               }
                                                                      //               _model.time = dateTimeFormat("Hm", _model.datePicked2);
                                                                      //               safeSetState(() {});
                                                                      //             },
                                                                      //             text:
                                                                      //             'Choose Time',
                                                                      //             options:
                                                                      //             FFButtonOptions(
                                                                      //               padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                      //               iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                      //               color: const Color(0x00CD4A20),
                                                                      //               textStyle: FlutterFlowTheme.of(context).titleLarge.override(
                                                                      //                 font: GoogleFonts.poppins(
                                                                      //                   fontWeight: FlutterFlowTheme.of(context).titleLarge.fontWeight,
                                                                      //                   fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                                                                      //                 ),
                                                                      //                 color: Colors.white,
                                                                      //                 letterSpacing: 0.0,
                                                                      //                 fontWeight: FlutterFlowTheme.of(context).titleLarge.fontWeight,
                                                                      //                 fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                                                                      //               ),
                                                                      //               elevation: 0.0,
                                                                      //               borderRadius: BorderRadius.circular(8.0),
                                                                      //             ),
                                                                      //           ),
                                                                      //         ),
                                                                      //       ),
                                                                      //     ),
                                                                      //   ],
                                                                      // ),

                                                                      ///2
                                                                      Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Expanded(
                                                                        child:
                                                                            Padding(
                                                                          padding: const EdgeInsetsDirectional
                                                                              .fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              10.0,
                                                                              0.0),
                                                                          child:
                                                                              Container(
                                                                            height:
                                                                                54.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              gradient: const LinearGradient(
                                                                                colors: [
                                                                                  Color(0xFFDD7325),
                                                                                  Color(0xFFD69E7E),
                                                                                  Color(0xFFDD7325)
                                                                                ],
                                                                                stops: [
                                                                                  0.0,
                                                                                  0.5,
                                                                                  1.0
                                                                                ],
                                                                                begin: AlignmentDirectional(0.0, 1.0),
                                                                                end: AlignmentDirectional(0, -1.0),
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(12.0),
                                                                              border: Border.all(color: const Color(0xFF4E4E4E)),
                                                                            ),
                                                                            child:
                                                                                Padding(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 14.0, 0.0, 14.0),
                                                                              child: FFButtonWidget(
                                                                                onPressed: () async {
                                                                                  final datePicked1Date = await showDatePicker(
                                                                                    context: context,
                                                                                    initialDate: getCurrentTimestamp,
                                                                                    firstDate: getCurrentTimestamp,
                                                                                    lastDate: DateTime(2050),
                                                                                    builder: (context, child) {
                                                                                      return wrapInMaterialDatePickerTheme(
                                                                                        context,
                                                                                        child!,
                                                                                        headerBackgroundColor: FlutterFlowTheme.of(context).primary,
                                                                                        headerForegroundColor: FlutterFlowTheme.of(context).info,
                                                                                        headerTextStyle: FlutterFlowTheme.of(context).headlineLarge.override(
                                                                                              font: GoogleFonts.poppins(
                                                                                                fontWeight: FontWeight.w600,
                                                                                                fontStyle: FlutterFlowTheme.of(context).headlineLarge.fontStyle,
                                                                                              ),
                                                                                              fontSize: 32.0,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.w600,
                                                                                              fontStyle: FlutterFlowTheme.of(context).headlineLarge.fontStyle,
                                                                                            ),
                                                                                        pickerBackgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                        pickerForegroundColor: FlutterFlowTheme.of(context).primaryText,
                                                                                        selectedDateTimeBackgroundColor: FlutterFlowTheme.of(context).primary,
                                                                                        selectedDateTimeForegroundColor: FlutterFlowTheme.of(context).info,
                                                                                        actionButtonForegroundColor: FlutterFlowTheme.of(context).primaryText,
                                                                                        iconSize: 24.0,
                                                                                      );
                                                                                    },
                                                                                  );
                                                                                  if (datePicked1Date != null) {
                                                                                    safeSetState(() {
                                                                                      _model.datePicked1 = DateTime(
                                                                                        datePicked1Date.year,
                                                                                        datePicked1Date.month,
                                                                                        datePicked1Date.day,
                                                                                      );
                                                                                      _model.date = dateTimeFormat("yyyy-MM-dd", _model.datePicked1);
                                                                                    });
                                                                                  }
                                                                                },
                                                                                text: _model.date ?? 'Choose Date',
                                                                                options: FFButtonOptions(
                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                  iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                  color: const Color(0x00CD4A20),
                                                                                  textStyle: FlutterFlowTheme.of(context).titleLarge.override(
                                                                                        font: GoogleFonts.poppins(
                                                                                          fontWeight: FlutterFlowTheme.of(context).titleLarge.fontWeight,
                                                                                          fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                                                                                        ),
                                                                                        color: Colors.white,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FlutterFlowTheme.of(context).titleLarge.fontWeight,
                                                                                        fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                                                                                      ),
                                                                                  elevation: 0.0,
                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Expanded(
                                                                        child:
                                                                            Container(
                                                                          height:
                                                                              54.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            gradient:
                                                                                const LinearGradient(
                                                                              colors: [
                                                                                Color(0xFFDD7325),
                                                                                Color(0xFFD69E7E),
                                                                                Color(0xFFDD7325)
                                                                              ],
                                                                              stops: [
                                                                                0.0,
                                                                                0.5,
                                                                                1.0
                                                                              ],
                                                                              begin: AlignmentDirectional(0.0, 1.0),
                                                                              end: AlignmentDirectional(0, -1.0),
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(12.0),
                                                                            border:
                                                                                Border.all(color: const Color(0xFF4E4E4E)),
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                14.0,
                                                                                0.0,
                                                                                14.0),
                                                                            child:
                                                                                FFButtonWidget(
                                                                              onPressed: () async {
                                                                                final datePicked2Time = await showTimePicker(
                                                                                  context: context,
                                                                                  initialTime: TimeOfDay.fromDateTime(getCurrentTimestamp),
                                                                                  builder: (context, child) {
                                                                                    return wrapInMaterialTimePickerTheme(
                                                                                      context,
                                                                                      child!,
                                                                                      headerBackgroundColor: FlutterFlowTheme.of(context).primary,
                                                                                      headerForegroundColor: FlutterFlowTheme.of(context).info,
                                                                                      headerTextStyle: FlutterFlowTheme.of(context).headlineLarge.override(
                                                                                            font: GoogleFonts.poppins(
                                                                                              fontWeight: FontWeight.w600,
                                                                                              fontStyle: FlutterFlowTheme.of(context).headlineLarge.fontStyle,
                                                                                            ),
                                                                                            fontSize: 32.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.w600,
                                                                                            fontStyle: FlutterFlowTheme.of(context).headlineLarge.fontStyle,
                                                                                          ),
                                                                                      pickerBackgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      pickerForegroundColor: FlutterFlowTheme.of(context).primaryText,
                                                                                      selectedDateTimeBackgroundColor: FlutterFlowTheme.of(context).primary,
                                                                                      selectedDateTimeForegroundColor: FlutterFlowTheme.of(context).info,
                                                                                      actionButtonForegroundColor: FlutterFlowTheme.of(context).primaryText,
                                                                                      iconSize: 24.0,
                                                                                    );
                                                                                  },
                                                                                );
                                                                                if (datePicked2Time != null) {
                                                                                  safeSetState(() {
                                                                                    _model.datePicked2 = DateTime(
                                                                                      getCurrentTimestamp.year,
                                                                                      getCurrentTimestamp.month,
                                                                                      getCurrentTimestamp.day,
                                                                                      datePicked2Time.hour,
                                                                                      datePicked2Time.minute,
                                                                                    );
                                                                                    _model.time = dateTimeFormat("Hm", _model.datePicked2);
                                                                                  });
                                                                                }
                                                                              },
                                                                              text: _model.time ?? 'Choose Time',
                                                                              options: FFButtonOptions(
                                                                                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                color: const Color(0x00CD4A20),
                                                                                textStyle: FlutterFlowTheme.of(context).titleLarge.override(
                                                                                      font: GoogleFonts.poppins(
                                                                                        fontWeight: FlutterFlowTheme.of(context).titleLarge.fontWeight,
                                                                                        fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                                                                                      ),
                                                                                      color: Colors.white,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FlutterFlowTheme.of(context).titleLarge.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                                                                                    ),
                                                                                elevation: 0.0,
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  )),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                        16.0,
                                                                        25.0,
                                                                        16.0,
                                                                        25.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceAround,
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          Padding(
                                                                        padding: const EdgeInsetsDirectional
                                                                            .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            10.0,
                                                                            0.0),
                                                                        child:
                                                                            InkWell(
                                                                          splashColor:
                                                                              Colors.transparent,
                                                                          focusColor:
                                                                              Colors.transparent,
                                                                          hoverColor:
                                                                              Colors.transparent,
                                                                          highlightColor:
                                                                              Colors.transparent,
                                                                          onTap:
                                                                              () async {
                                                                            _model.isEnabled =
                                                                                false;
                                                                            safeSetState(() {});
                                                                          },
                                                                          child:
                                                                              Container(
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              borderRadius: BorderRadius.circular(12.0),
                                                                              border: Border.all(
                                                                                color: const Color(0xFF4E4E4E),
                                                                              ),
                                                                            ),
                                                                            child:
                                                                                Align(
                                                                              alignment: const AlignmentDirectional(0.0, 0.0),
                                                                              child: Padding(
                                                                                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 14.0, 0.0, 14.0),
                                                                                child: Text(
                                                                                  'Cancel',
                                                                                  style: FlutterFlowTheme.of(context).titleLarge.override(
                                                                                        font: GoogleFonts.poppins(
                                                                                          fontWeight: FlutterFlowTheme.of(context).titleLarge.fontWeight,
                                                                                          fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                                                                                        ),
                                                                                        color: Colors.white,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FlutterFlowTheme.of(context).titleLarge.fontWeight,
                                                                                        fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      child:
                                                                          Container(
                                                                        height:
                                                                            54.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          gradient:
                                                                              const LinearGradient(
                                                                            colors: [
                                                                              Color(0xFFDD7325),
                                                                              Color(0xFFD69E7E),
                                                                              Color(0xFFDD7325)
                                                                            ],
                                                                            stops: [
                                                                              0.0,
                                                                              0.5,
                                                                              1.0
                                                                            ],
                                                                            begin:
                                                                                AlignmentDirectional(0.0, 1.0),
                                                                            end:
                                                                                AlignmentDirectional(0, -1.0),
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(12.0),
                                                                          border:
                                                                              Border.all(
                                                                            color:
                                                                                const Color(0xFF4E4E4E),
                                                                          ),
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding: const EdgeInsetsDirectional
                                                                              .fromSTEB(
                                                                              0.0,
                                                                              14.0,
                                                                              0.0,
                                                                              14.0),
                                                                          child:
                                                                              FFButtonWidget(
                                                                            onPressed:
                                                                                () async {
                                                                              _model.isValid = true;
                                                                              if (_model.formKey1.currentState == null || !_model.formKey1.currentState!.validate()) {
                                                                                safeSetState(() => _model.isValid = false);
                                                                                return;
                                                                              }
                                                                              // if (_model.uploadedLocalFile_uploadDataEzy == null || (_model.uploadedLocalFile_uploadDataEzy.bytes ?? []).isEmpty) {
                                                                              //   ScaffoldMessenger.of(context).showSnackBar(
                                                                              //     const SnackBar(
                                                                              //       content: Text(
                                                                              //         'Please upload an icon to continue',
                                                                              //         style: TextStyle(
                                                                              //           color: Colors.white,
                                                                              //         ),
                                                                              //       ),
                                                                              //       duration: Duration(milliseconds: 2250),
                                                                              //       backgroundColor: Colors.black,
                                                                              //     ),
                                                                              //   );
                                                                              //   _model.isValid = false;
                                                                              //   safeSetState(() {});
                                                                              //   return;
                                                                              // }
                                                                              if (_model.isValid!) {
                                                                                _model.apiResultoud = await DashboardGroup.createTeamCall.call(
                                                                                  title: _model.teamNameTextController1.text,
                                                                                  logo: _model.uploadedLocalFile_uploadDataEzy,
                                                                                  authToken: FFAppState().authToken,
                                                                                  date: _model.date,
                                                                                  time: _model.time,
                                                                                );

                                                                                if ((_model.apiResultoud?.succeeded ?? true)) {
                                                                                  ScaffoldMessenger.of(context).showSnackBar(
                                                                                    SnackBar(
                                                                                      content: Text(
                                                                                        getJsonField(
                                                                                          (_model.apiResultoud?.jsonBody ?? ''),
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
                                                                                  safeSetState(() {
                                                                                    _model.teamNameTextController1?.clear();
                                                                                    _model.date = null;
                                                                                    _model.time = null;
                                                                                    _model.datePicked1 = null;
                                                                                    _model.datePicked2 = null;
                                                                                  });
                                                                                  safeSetState(() {
                                                                                    _model.date = null;
                                                                                    _model.time = null;
                                                                                    _model.datePicked1 = null;
                                                                                    _model.datePicked2 = null;
                                                                                    _model.isDataUploading_uploadDataEzy = false;
                                                                                    _model.uploadedLocalFile_uploadDataEzy = FFUploadedFile(bytes: Uint8List.fromList([]));
                                                                                  });

                                                                                  _model.isEnabled = false;
                                                                                  safeSetState(() {});
                                                                                  await Future.delayed(
                                                                                    const Duration(
                                                                                      milliseconds: 1000,
                                                                                    ),
                                                                                  );
                                                                                  _model.chatMember = await DashboardGroup.teamMemberforChatCall.call(
                                                                                    authToken: FFAppState().authToken,
                                                                                    teamId: getJsonField(
                                                                                      (_model.apiResultoud?.jsonBody ?? ''),
                                                                                      r'''$.data.id''',
                                                                                    ),
                                                                                  );

                                                                                  if ((_model.chatMember?.succeeded ?? true)) {
                                                                                    var teamsRecordReference = TeamsRecord.collection.doc();
                                                                                    await teamsRecordReference.set({
                                                                                      ...createTeamsRecordData(
                                                                                        name: getJsonField(
                                                                                          (_model.apiResultoud?.jsonBody ?? ''),
                                                                                          r'''$.data.title''',
                                                                                        ).toString(),
                                                                                        photoUrl: getJsonField(
                                                                                          (_model.apiResultoud?.jsonBody ?? ''),
                                                                                          r'''$.data.logo''',
                                                                                        ).toString(),
                                                                                        uid: getJsonField(
                                                                                          (_model.apiResultoud?.jsonBody ?? ''),
                                                                                          r'''$.data.id''',
                                                                                        ).toString(),
                                                                                        inviteCode: getJsonField(
                                                                                          (_model.apiResultoud?.jsonBody ?? ''),
                                                                                          r'''$.data.invite_code''',
                                                                                        ).toString(),
                                                                                      ),
                                                                                      ...mapToFirestore(
                                                                                        {
                                                                                          'createdAt': FieldValue.serverTimestamp(),
                                                                                          'members': (getJsonField(
                                                                                            (_model.chatMember?.jsonBody ?? ''),
                                                                                            r'''$.team_members_ids''',
                                                                                            true,
                                                                                          ) as List?)
                                                                                              ?.map<String>((e) => e.toString())
                                                                                              .toList()
                                                                                              .cast<String>(),
                                                                                        },
                                                                                      ),
                                                                                    });
                                                                                    _model.createRoom = TeamsRecord.getDocumentFromData({
                                                                                      ...createTeamsRecordData(
                                                                                        name: getJsonField(
                                                                                          (_model.apiResultoud?.jsonBody ?? ''),
                                                                                          r'''$.data.title''',
                                                                                        ).toString(),
                                                                                        photoUrl: getJsonField(
                                                                                          (_model.apiResultoud?.jsonBody ?? ''),
                                                                                          r'''$.data.logo''',
                                                                                        ).toString(),
                                                                                        uid: getJsonField(
                                                                                          (_model.apiResultoud?.jsonBody ?? ''),
                                                                                          r'''$.data.id''',
                                                                                        ).toString(),
                                                                                        inviteCode: getJsonField(
                                                                                          (_model.apiResultoud?.jsonBody ?? ''),
                                                                                          r'''$.data.invite_code''',
                                                                                        ).toString(),
                                                                                      ),
                                                                                      ...mapToFirestore(
                                                                                        {
                                                                                          'createdAt': DateTime.now(),
                                                                                          'members': (getJsonField(
                                                                                            (_model.chatMember?.jsonBody ?? ''),
                                                                                            r'''$.team_members_ids''',
                                                                                            true,
                                                                                          ) as List?)
                                                                                              ?.map<String>((e) => e.toString())
                                                                                              .toList()
                                                                                              .cast<String>(),
                                                                                        },
                                                                                      ),
                                                                                    }, teamsRecordReference);
                                                                                  }
                                                                                } else {
                                                                                  ScaffoldMessenger.of(context).showSnackBar(
                                                                                    SnackBar(
                                                                                      content: Text(
                                                                                        getJsonField(
                                                                                          (_model.apiResultoud?.jsonBody ?? ''),
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
                                                                                }
                                                                              }

                                                                              safeSetState(() {});
                                                                            },
                                                                            text:
                                                                                'Create Now',
                                                                            options:
                                                                                FFButtonOptions(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                              iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                              color: const Color(0x00CD4A20),
                                                                              textStyle: FlutterFlowTheme.of(context).titleLarge.override(
                                                                                    font: GoogleFonts.poppins(
                                                                                      fontWeight: FlutterFlowTheme.of(context).titleLarge.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                                                                                    ),
                                                                                    color: Colors.white,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FlutterFlowTheme.of(context).titleLarge.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                                                                                  ),
                                                                              elevation: 0.0,
                                                                              borderRadius: BorderRadius.circular(8.0),
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
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              if (FFAppState().isRead)
                                                Expanded(
                                                  child: Container(
                                                    decoration:
                                                        const BoxDecoration(),
                                                    child: Visibility(
                                                      visible:
                                                          !_model.isEnabled,
                                                      child: Builder(
                                                        builder: (context) {
                                                          final teamList =
                                                              DashboardGroup
                                                                      .getteamdetailCall
                                                                      .teamList(
                                                                        tabBarGetteamdetailResponse
                                                                            .jsonBody,
                                                                      )
                                                                      ?.toList() ??
                                                                  [];
                                                          _model.debugGeneratorVariables[
                                                                  'teamList${teamList.length > 100 ? ' (first 100)' : ''}'] =
                                                              debugSerializeParam(
                                                            teamList.take(100),
                                                            ParamType.JSON,
                                                            isList: true,
                                                            link:
                                                                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=PlayWithFriends',
                                                            name: 'dynamic',
                                                            nullable: false,
                                                          );
                                                          debugLogWidgetClass(
                                                              _model);

                                                          return ListView
                                                              .builder(
                                                            padding:
                                                                EdgeInsets.zero,
                                                            shrinkWrap: true,
                                                            scrollDirection:
                                                                Axis.vertical,
                                                            itemCount:
                                                                teamList.length,
                                                            itemBuilder: (context,
                                                                teamListIndex) {
                                                              final teamListItem =
                                                                  teamList[
                                                                      teamListIndex];
                                                              return Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                        0.0,
                                                                        14.0,
                                                                        0.0,
                                                                        14.0),
                                                                child: InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    context
                                                                        .pushNamed(
                                                                      TeamDetailsWidget
                                                                          .routeName,
                                                                      queryParameters:
                                                                          {
                                                                        'teamIndex':
                                                                            serializeParam(
                                                                          teamListIndex,
                                                                          ParamType
                                                                              .int,
                                                                        ),
                                                                      }.withoutNulls,
                                                                    );
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    width: double
                                                                        .infinity,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: Theme.of(context).brightness ==
                                                                              Brightness
                                                                                  .dark
                                                                          ? const Color(
                                                                              0xFF1C1C22)
                                                                          : Colors
                                                                              .white,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              15.0),
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: Theme.of(context).brightness ==
                                                                                Brightness.dark
                                                                            ? const Color(0xFF4E4E4E)
                                                                            : Colors.white,
                                                                      ),
                                                                    ),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .min,
                                                                      children: [
                                                                        Padding(
                                                                          padding: const EdgeInsetsDirectional
                                                                              .fromSTEB(
                                                                              14.0,
                                                                              14.0,
                                                                              14.0,
                                                                              14.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.start,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.center,
                                                                            children: [
                                                                              Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: [
                                                                                  Container(
                                                                                    decoration: BoxDecoration(
                                                                                      shape: BoxShape.circle,
                                                                                      border: Border.all(
                                                                                        color: Colors.white,
                                                                                      ),
                                                                                    ),
                                                                                    child: Container(
                                                                                      width: 60.0,
                                                                                      height: 60.0,
                                                                                      clipBehavior: Clip.antiAlias,
                                                                                      decoration: const BoxDecoration(
                                                                                        shape: BoxShape.circle,
                                                                                      ),
                                                                                      child: CachedNetworkImage(
                                                                                        fadeInDuration: const Duration(milliseconds: 500),
                                                                                        fadeOutDuration: const Duration(milliseconds: 500),
                                                                                        imageUrl: safeImageUrl(
                                                                                          getJsonField(
                                                                                            teamListItem,
                                                                                            r'''$.logo''',
                                                                                          )?.toString(),
                                                                                        ),
                                                                                        fit: BoxFit.cover,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              Expanded(
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Padding(
                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                        children: [
                                                                                          Text(
                                                                                            getJsonField(
                                                                                              teamListItem,
                                                                                              r'''$.title''',
                                                                                            ).toString(),
                                                                                            style: FlutterFlowTheme.of(context).titleLarge.override(
                                                                                                  font: GoogleFonts.poppins(
                                                                                                    fontWeight: FlutterFlowTheme.of(context).titleLarge.fontWeight,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                                                                                                  ),
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FlutterFlowTheme.of(context).titleLarge.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                                                                                                ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Flexible(
                                                                                          child: Padding(
                                                                                          padding: const EdgeInsetsDirectional.fromSTEB(10.0, 4.0, 0.0, 0.0),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.min,
                                                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                                                            children: [
                                                                                              Icon(
                                                                                                Icons.groups_2,
                                                                                                color: Theme.of(context).brightness == Brightness.dark ? const Color(0xFFC0C0C0) : const Color(0xFF4D4D4D),
                                                                                                size: 18.0,
                                                                                              ),
                                                                                              Flexible(
                                                                                                child: Padding(
                                                                                                padding: const EdgeInsetsDirectional.fromSTEB(3.0, 0.0, 0.0, 0.0),
                                                                                                child: Text(
                                                                                                  '${getJsonField(
                                                                                                    teamListItem,
                                                                                                    r'''$.members_count''',
                                                                                                  ).toString()}  Member',
                                                                                                  textAlign: TextAlign.start,
                                                                                                  overflow: TextOverflow.ellipsis,
                                                                                                  style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                        font: GoogleFonts.poppins(
                                                                                                          fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                                        ),
                                                                                                        color: FlutterFlowTheme.of(context).tertiary,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                                      ),
                                                                                                 ),
                                                                                               ),
                                                                                               ), // close Flexible around Text
                                                                                            ],
                                                                                           ),
                                                                                         ),
                                                                                         ), // close Flexible around first Padding
                                                                                        Flexible(
                                                                                          child: Padding(
                                                                                           padding: const EdgeInsetsDirectional.fromSTEB(20.0, 4.0, 0.0, 0.0),
                                                                                           child: Row(
                                                                                            mainAxisSize: MainAxisSize.min,
                                                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                                                            children: [
                                                                                              Icon(
                                                                                                Icons.tornado_outlined,
                                                                                                color: Theme.of(context).brightness == Brightness.dark ? const Color(0xFFC0C0C0) : const Color(0xFF4D4D4D),
                                                                                                size: 16.0,
                                                                                              ),
                                                                                              Flexible(
                                                                                                child: Padding(
                                                                                                padding: const EdgeInsetsDirectional.fromSTEB(1.0, 0.0, 0.0, 0.0),
                                                                                                child: Text(
                                                                                                  'Ranking Complete',
                                                                                                  textAlign: TextAlign.start,
                                                                                                  overflow: TextOverflow.ellipsis,
                                                                                                  style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                        font: GoogleFonts.poppins(
                                                                                                          fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                                        ),
                                                                                                        color: FlutterFlowTheme.of(context).tertiary,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                                      ),
                                                                                                ),
                                                                                               ),
                                                                                               ), // close Flexible around Ranking Complete text
                                                                                            ],
                                                                                           ),
                                                                                         ),
                                                                                         ), // close Flexible around second Padding
                                                                                      ],
                                                                                     ),
                                                                                   ],
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: const EdgeInsetsDirectional
                                                                              .fromSTEB(
                                                                              10.0,
                                                                              4.0,
                                                                              10.0,
                                                                              10.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children: [
                                                                              Builder(
                                                                                builder: (context) => InkWell(
                                                                                  splashColor: Colors.transparent,
                                                                                  focusColor: Colors.transparent,
                                                                                  hoverColor: Colors.transparent,
                                                                                  highlightColor: Colors.transparent,
                                                                                  // onTap: () async {
                                                                                  //   unawaited(
                                                                                  //     () async {
                                                                                  //       await Share.share(
                                                                                  //         getJsonField(
                                                                                  //           teamListItem,
                                                                                  //           r'''$.invite_code''',
                                                                                  //         ).toString(),
                                                                                  //         sharePositionOrigin: getWidgetBoundingBox(context),
                                                                                  //       );
                                                                                  //     }(),
                                                                                  //   );
                                                                                  // },

                                                                                  ///2
//                                                                                   onTap: () async {
//                                                                                     final inviteCode = getJsonField(
//                                                                                       teamListItem,
//                                                                                       r'''$.invite_code''',
//                                                                                     ).toString();
//
//                                                                                     final customInviteMessage = '''Hey!
// Do you know the Vote The Goat app?
// I'd like to invite you to join and discover your favorite basketball legends!
//
// Use my invite code $inviteCode to sign up and start exploring.
//
// Download the app now and join the fun!
// You can download it here: [APP_DOWNLOAD_LINK]''';
//
//                                                                                     print('Sharing invite message: $customInviteMessage');
//
//                                                                                     unawaited(
//                                                                                           () async {
//                                                                                         await Share.share(
//                                                                                           customInviteMessage,
//                                                                                           sharePositionOrigin: getWidgetBoundingBox(context),
//                                                                                         );
//                                                                                       }(),
//                                                                                     );
//                                                                                   },

                                                                                  ///3
                                                                                  onTap: () async {
                                                                                    try {
                                                                                      // Show loading indicator
                                                                                      showDialog(
                                                                                        context: context,
                                                                                        barrierDismissible: false,
                                                                                        builder: (context) => const Center(
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
                                                                                      );

                                                                                      final appLinkResponse = await AppLinkCall.call(
                                                                                        authToken: FFAppState().authToken,
                                                                                      );

                                                                                      // Close loading indicator
                                                                                      Navigator.of(context).pop();

                                                                                      debugPrint('AppLink API Response: ${appLinkResponse.jsonBody}');
                                                                                      debugPrint('AppLink succeeded: ${appLinkResponse.succeeded}');
                                                                                      debugPrint('Status code: ${appLinkResponse.statusCode}');

                                                                                      final inviteCode = getJsonField(
                                                                                        teamListItem,
                                                                                        r'''$.invite_code''',
                                                                                      ).toString();

                                                                                      String customInviteMessage;

                                                                                      if (appLinkResponse.succeeded) {
                                                                                        final appLink = AppLinkCall.appUrlLink(
                                                                                          appLinkResponse.jsonBody,
                                                                                        );

                                                                                        if (appLink != null && appLink.isNotEmpty) {
                                                                                          customInviteMessage = '''Hey!
Do you know the Vote The Goat app?
I'd like to invite you to join and discover your favorite basketball legends!

Use my invite code $inviteCode to sign up and start exploring.

Download the app now and join the fun!
You can download it here
Android: https://play.google.com/store/apps/details?id=com.voteforgoat.app
iOS: $appLink''';
                                                                                        } else {
                                                                                          customInviteMessage = '''Hey!
Do you know the Vote The Goat app?
I'd like to invite you to join and discover your favorite basketball legends!

Use my invite code $inviteCode to sign up and start exploring.

Download the app now and join the fun!''';
                                                                                        }
                                                                                      } else {
                                                                                        // API call failed
                                                                                        debugPrint('API Error: Status ${appLinkResponse.statusCode}');

                                                                                        customInviteMessage = '''Hey!
Do you know the Vote The Goat app?
I'd like to invite you to join and discover your favorite basketball legends!

Use my invite code $inviteCode to sign up and start exploring.

Download the app now and join the fun!''';
                                                                                      }

                                                                                      // Share the message
                                                                                      unawaited(
                                                                                        () async {
                                                                                          await Share.share(
                                                                                            customInviteMessage,
                                                                                            sharePositionOrigin: getWidgetBoundingBox(context),
                                                                                          );
                                                                                        }(),
                                                                                      );
                                                                                    } catch (e) {
                                                                                      // Close loading indicator if still open
                                                                                      Navigator.of(context).pop();

                                                                                      debugPrint('Error in share flow: $e');

                                                                                      ScaffoldMessenger.of(context).showSnackBar(
                                                                                        const SnackBar(
                                                                                          content: Text(
                                                                                            'Unable to share at this time. Please try again.',
                                                                                            style: TextStyle(color: Colors.white),
                                                                                          ),
                                                                                          backgroundColor: Colors.red,
                                                                                        ),
                                                                                      );
                                                                                    }
                                                                                  },

                                                                                  ///

                                                                                  child: getJsonField(
                                                                                            teamListItem,
                                                                                            r'''$.is_invite''',
                                                                                          ) ==
                                                                                          0
                                                                                      ? const SizedBox()
                                                                                      : Container(
                                                                                          width: MediaQuery.sizeOf(context).width * 0.42,
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
                                                                                            borderRadius: BorderRadius.circular(12.0),
                                                                                          ),
                                                                                          child: Padding(
                                                                                            padding: const EdgeInsetsDirectional.fromSTEB(10.0, 6.0, 10.0, 6.0),
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                                              children: [
                                                                                                const Icon(
                                                                                                  Icons.share_sharp,
                                                                                                  color: Colors.white,
                                                                                                  size: 16.0,
                                                                                                ),
                                                                                                Padding(
                                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                                  child: Text(
                                                                                                    'Invite Friends',
                                                                                                    style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                          font: GoogleFonts.poppins(
                                                                                                            fontWeight: FontWeight.w500,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                                                          ),
                                                                                                          color: Colors.white,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FontWeight.w500,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                ),
                                                                              ),
                                                                              Align(
                                                                                alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                child: InkWell(
                                                                                  splashColor: Colors.transparent,
                                                                                  focusColor: Colors.transparent,
                                                                                  hoverColor: Colors.transparent,
                                                                                  highlightColor: Colors.transparent,
                                                                                  // onTap: () async {
                                                                                  //   print('team name${getJsonField(
                                                                                  //     teamListItem,
                                                                                  //     r'''$.id''',
                                                                                  //   ).toString()}');
                                                                                  //
                                                                                  //   context.pushNamed(
                                                                                  //     PlayWithFriendRankingWidget.routeName,
                                                                                  //     queryParameters: {
                                                                                  //       'teamIndex': serializeParam(
                                                                                  //         teamListIndex,
                                                                                  //         ParamType.int,
                                                                                  //       ),
                                                                                  //     }.withoutNulls,
                                                                                  //   );
                                                                                  // },

                                                                                  onTap: () async {
                                                                                    final teamId = getJsonField(teamListItem, r'''$.id''');
                                                                                    print('team id: $teamId');
                                                                                    context.pushNamed(
                                                                                      PlayWithFriendRankingWidget.routeName,
                                                                                      queryParameters: {
                                                                                        'teamId': serializeParam(teamId, ParamType.int),
                                                                                      }.withoutNulls,
                                                                                    );
                                                                                  },

                                                                                  child: Container(
                                                                                    width: MediaQuery.sizeOf(context).width * 0.42,
                                                                                    decoration: BoxDecoration(
                                                                                      gradient: const LinearGradient(
                                                                                        colors: [
                                                                                          Color(0xFF038500),
                                                                                          Color(0xFF40AE3C),
                                                                                          Color(0xFF038500)
                                                                                        ],
                                                                                        stops: [
                                                                                          0.0,
                                                                                          0.5,
                                                                                          1.0
                                                                                        ],
                                                                                        begin: AlignmentDirectional(0.0, 1.0),
                                                                                        end: AlignmentDirectional(0, -1.0),
                                                                                      ),
                                                                                      borderRadius: BorderRadius.circular(12.0),
                                                                                    ),
                                                                                    child: Align(
                                                                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                      child: Padding(
                                                                                        padding: const EdgeInsetsDirectional.fromSTEB(10.0, 6.0, 10.0, 6.0),
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                                          children: [
                                                                                            const Icon(
                                                                                              Icons.remove_red_eye,
                                                                                              color: Colors.white,
                                                                                              size: 16.0,
                                                                                            ),
                                                                                            Align(
                                                                                              alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                              child: Padding(
                                                                                                padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                                child: Text(
                                                                                                  'Ranking',
                                                                                                  style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                        font: GoogleFonts.poppins(
                                                                                                          fontWeight: FontWeight.w500,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                                                        ),
                                                                                                        color: Colors.white,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FontWeight.w500,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
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
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                            ],
                                          ),
                                          if (!_model.isEnabled)
                                            Positioned(
                                              right: 0.0,
                                              bottom: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.09,
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  _model.isEnabled = true;
                                                  safeSetState(() {});
                                                },
                                                child: Container(
                                                  width: 47.0,
                                                  height: 47.0,
                                                  decoration: BoxDecoration(
                                                    gradient:
                                                        const LinearGradient(
                                                      colors: [
                                                        Color(0xFFDD7325),
                                                        Color(0xFFDD7325)
                                                      ],
                                                      stops: [0.0, 1.0],
                                                      begin:
                                                          AlignmentDirectional(
                                                              1.0, -0.98),
                                                      end: AlignmentDirectional(
                                                          -1.0, 0.98),
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                  ),
                                                  child: const Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                14.0,
                                                                14.0,
                                                                14.0,
                                                                14.0),
                                                    child: Icon(
                                                      Icons.add_sharp,
                                                      color: Colors.white,
                                                      size: 20.0,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                        ],
                                      ),
                                      Stack(
                                        children: [
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Align(
                                                alignment:
                                                    const AlignmentDirectional(
                                                        0.0, -1.0),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(
                                                          0.0, 20.0, 0.0, 0.0),
                                                  child: Container(
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(
                                                      color: (Theme.of(context)
                                                                      .brightness ==
                                                                  Brightness
                                                                      .dark) ==
                                                              true
                                                          ? const Color(
                                                              0x26FFFFFF)
                                                          : Colors.white,
                                                      boxShadow: const [
                                                        BoxShadow(
                                                          blurRadius: 10.0,
                                                          color:
                                                              Color(0x33000000),
                                                          offset: Offset(
                                                            0.0,
                                                            2.0,
                                                          ),
                                                        )
                                                      ],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                    ),
                                                    child: Form(
                                                      key: _model.formKey2,
                                                      autovalidateMode:
                                                          AutovalidateMode
                                                              .disabled,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(3.0,
                                                                5.0, 3.0, 0.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                      0.0,
                                                                      3.0,
                                                                      0.0,
                                                                      0.0),
                                                              child: SizedBox(
                                                                width: double
                                                                    .infinity,
                                                                child:
                                                                    TextFormField(
                                                                  controller: _model
                                                                      .teamNameTextController2,
                                                                  focusNode: _model
                                                                      .teamNameFocusNode2,
                                                                  autofocus:
                                                                      false,
                                                                  obscureText:
                                                                      false,
                                                                  decoration:
                                                                      InputDecoration(
                                                                    isDense:
                                                                        true,
                                                                    labelStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.poppins(
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                          ),
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .fontStyle,
                                                                        ),
                                                                    hintText:
                                                                        'Enter Invite Code\n',
                                                                    hintStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.poppins(
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                          ),
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .fontStyle,
                                                                        ),
                                                                    enabledBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          const BorderSide(
                                                                        color: Color(
                                                                            0x00000000),
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    focusedBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          const BorderSide(
                                                                        color: Color(
                                                                            0x00000000),
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    errorBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .error,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    focusedErrorBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .error,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    filled:
                                                                        true,
                                                                    fillColor: (Theme.of(context).brightness == Brightness.dark) ==
                                                                            true
                                                                        ? const Color(
                                                                            0x80050505)
                                                                        : const Color(
                                                                            0x2E050505),
                                                                    prefixIcon:
                                                                        Icon(
                                                                      FontAwesomeIcons
                                                                          .basketballBall,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .tertiary,
                                                                      size:
                                                                          24.0,
                                                                    ),
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .poppins(
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .fontStyle,
                                                                      ),
                                                                  cursorColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                  validator: _model
                                                                      .teamNameTextController2Validator
                                                                      .asValidator(
                                                                          context),
                                                                ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                      16.0,
                                                                      25.0,
                                                                      16.0,
                                                                      25.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceAround,
                                                                children: [
                                                                  Expanded(
                                                                    child:
                                                                        Container(
                                                                      width: double
                                                                          .infinity,
                                                                      height:
                                                                          47.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        gradient:
                                                                            LinearGradient(
                                                                          colors: [
                                                                            FlutterFlowTheme.of(context).peach,
                                                                            const Color(0xFFE09B6E)
                                                                          ],
                                                                          stops: const [
                                                                            0.0,
                                                                            1.0
                                                                          ],
                                                                          begin: const AlignmentDirectional(
                                                                              0.0,
                                                                              -1.0),
                                                                          end: const AlignmentDirectional(
                                                                              0,
                                                                              1.0),
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(12.0),
                                                                      ),
                                                                      child:
                                                                          FFButtonWidget(
                                                                        // onPressed:
                                                                        //     () async {
                                                                        //   _model.apiResult5di = await DashboardGroup
                                                                        //       .joinTeamCall
                                                                        //       .call(
                                                                        //     authToken:
                                                                        //     FFAppState().authToken,
                                                                        //     inviteCode:
                                                                        //     _model.teamNameTextController2.text,
                                                                        //   );
                                                                        //
                                                                        //   if ((_model.apiResult5di?.succeeded ??
                                                                        //       true)) {
                                                                        //
                                                                        //     _model.teamNameTextController2?.clear();
                                                                        //     ScaffoldMessenger.of(context).showSnackBar(
                                                                        //       SnackBar(
                                                                        //         content: Text(
                                                                        //           getJsonField(
                                                                        //             (_model.apiResult5di?.jsonBody ?? ''),
                                                                        //             r'''$.message''',
                                                                        //           ).toString(),
                                                                        //           style: const TextStyle(
                                                                        //             color: Colors.white,
                                                                        //           ),
                                                                        //         ),
                                                                        //         duration: const Duration(milliseconds: 1500),
                                                                        //         backgroundColor: Colors.black,
                                                                        //       ),
                                                                        //
                                                                        //
                                                                        //
                                                                        //     );
                                                                        //     _model.foundTeam =
                                                                        //     await queryTeamsRecordOnce(
                                                                        //       queryBuilder: (teamsRecord) => teamsRecord.where(
                                                                        //         'inviteCode',
                                                                        //         isEqualTo: _model.teamNameTextController2.text,
                                                                        //       ),
                                                                        //       limit: 1,
                                                                        //     );
                                                                        //     if (_model.foundTeam != null &&
                                                                        //         (_model.foundTeam)!.isNotEmpty) {
                                                                        //       await _model.foundTeam!.firstOrNull!.reference.update({
                                                                        //         ...mapToFirestore(
                                                                        //           {
                                                                        //             'members': FieldValue.arrayUnion([
                                                                        //               getJsonField(
                                                                        //                 (_model.apiResult5di?.jsonBody ?? ''),
                                                                        //                 r'''$.data.user_id''',
                                                                        //               ).toString()
                                                                        //             ]),
                                                                        //           },
                                                                        //         ),
                                                                        //       });
                                                                        //     }
                                                                        //   } else {
                                                                        //     ScaffoldMessenger.of(context).showSnackBar(
                                                                        //       SnackBar(
                                                                        //         content: Text(
                                                                        //           getJsonField(
                                                                        //             (_model.apiResult5di?.jsonBody ?? ''),
                                                                        //             r'''$.message''',
                                                                        //           ).toString(),
                                                                        //           style: const TextStyle(
                                                                        //             color: Colors.white,
                                                                        //           ),
                                                                        //         ),
                                                                        //         duration: const Duration(milliseconds: 1500),
                                                                        //         backgroundColor: Colors.black,
                                                                        //       ),
                                                                        //     );
                                                                        //   }
                                                                        //
                                                                        //   safeSetState(
                                                                        //           () {});
                                                                        // },

                                                                        onPressed:
                                                                            () async {
                                                                          _model.apiResult5di = await DashboardGroup
                                                                              .joinTeamCall
                                                                              .call(
                                                                            authToken:
                                                                                FFAppState().authToken,
                                                                            inviteCode:
                                                                                _model.teamNameTextController2.text,
                                                                          );

                                                                          if ((_model.apiResult5di?.succeeded ??
                                                                              true)) {
                                                                            _model.teamNameTextController2?.clear();

                                                                            await showDialog(
                                                                              context: context,
                                                                              barrierDismissible: false,
                                                                              builder: (alertDialogContext) {
                                                                                return BackdropFilter(
                                                                                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                                                                                  child: AlertDialog(
                                                                                    backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    shape: RoundedRectangleBorder(
                                                                                      borderRadius: BorderRadius.circular(16),
                                                                                      side: BorderSide(
                                                                                        color: (Theme.of(context).brightness == Brightness.dark) ? const Color(0xFF4E4E4E) : Colors.transparent,
                                                                                        width: 1,
                                                                                      ),
                                                                                    ),
                                                                                    title: Text(
                                                                                      'Success',
                                                                                      style: FlutterFlowTheme.of(context).headlineMedium.override(
                                                                                            fontFamily: 'Poppins',
                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                            fontSize: 20,
                                                                                            fontWeight: FontWeight.w600,
                                                                                          ),
                                                                                    ),
                                                                                    content: Text(
                                                                                      getJsonField(
                                                                                        (_model.apiResult5di?.jsonBody ?? ''),
                                                                                        r'''$.message''',
                                                                                      ).toString(),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                                                                                            style: FlutterFlowTheme.of(context).titleSmall.override(
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
                                                                                  ),
                                                                                );
                                                                              },
                                                                            );

                                                                            _model.foundTeam =
                                                                                await queryTeamsRecordOnce(
                                                                              queryBuilder: (teamsRecord) => teamsRecord.where(
                                                                                'inviteCode',
                                                                                isEqualTo: _model.teamNameTextController2.text,
                                                                              ),
                                                                              limit: 1,
                                                                            );

                                                                            if (_model.foundTeam != null &&
                                                                                (_model.foundTeam)!.isNotEmpty) {
                                                                              await _model.foundTeam!.firstOrNull!.reference.update({
                                                                                ...mapToFirestore({
                                                                                  'members': FieldValue.arrayUnion([
                                                                                    getJsonField(
                                                                                      (_model.apiResult5di?.jsonBody ?? ''),
                                                                                      r'''$.data.user_id''',
                                                                                    ).toString()
                                                                                  ]),
                                                                                }),
                                                                              });
                                                                            }
                                                                          } else {
                                                                            await showDialog(
                                                                              context: context,
                                                                              barrierDismissible: false,
                                                                              builder: (alertDialogContext) {
                                                                                return BackdropFilter(
                                                                                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                                                                                  child: AlertDialog(
                                                                                    backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    shape: RoundedRectangleBorder(
                                                                                      borderRadius: BorderRadius.circular(16),
                                                                                      side: BorderSide(
                                                                                        color: (Theme.of(context).brightness == Brightness.dark) ? const Color(0xFF4E4E4E) : Colors.transparent,
                                                                                        width: 1,
                                                                                      ),
                                                                                    ),
                                                                                    title: Text(
                                                                                      'Error',
                                                                                      style: FlutterFlowTheme.of(context).headlineMedium.override(
                                                                                            fontFamily: 'Poppins',
                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                            fontSize: 20,
                                                                                            fontWeight: FontWeight.w600,
                                                                                          ),
                                                                                    ),
                                                                                    content: Text(
                                                                                      getJsonField(
                                                                                        (_model.apiResult5di?.jsonBody ?? ''),
                                                                                        r'''$.message''',
                                                                                      ).toString(),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                                                                                            style: FlutterFlowTheme.of(context).titleSmall.override(
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
                                                                                  ),
                                                                                );
                                                                              },
                                                                            );
                                                                          }

                                                                          safeSetState(
                                                                              () {});
                                                                        },
                                                                        text:
                                                                            'Join Team',
                                                                        options:
                                                                            FFButtonOptions(
                                                                          height:
                                                                              40.0,
                                                                          padding: const EdgeInsetsDirectional
                                                                              .fromSTEB(
                                                                              16.0,
                                                                              0.0,
                                                                              16.0,
                                                                              0.0),
                                                                          iconPadding: const EdgeInsetsDirectional
                                                                              .fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          color:
                                                                              const Color(0x00CD4A20),
                                                                          textStyle: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .override(
                                                                                font: GoogleFonts.poppins(
                                                                                  fontWeight: FontWeight.w500,
                                                                                  fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                ),
                                                                                color: Colors.white,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w500,
                                                                                fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                              ),
                                                                          elevation:
                                                                              0.0,
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
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
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              FFAppState().isRead
                                                  ? Align(
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              0.0, -1.0),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(0.0,
                                                                28.0, 0.0, 0.0),
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: (Theme.of(context)
                                                                            .brightness ==
                                                                        Brightness
                                                                            .dark) ==
                                                                    true
                                                                ? const Color(
                                                                    0x26FFFFFF)
                                                                : const Color(
                                                                    0xD6FFFFFF),
                                                            boxShadow: const [
                                                              BoxShadow(
                                                                blurRadius:
                                                                    10.0,
                                                                color: Color(
                                                                    0x33000000),
                                                                offset: Offset(
                                                                  0.0,
                                                                  2.0,
                                                                ),
                                                              )
                                                            ],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0),
                                                          ),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                        16.0,
                                                                        13.0,
                                                                        16.0,
                                                                        15.0),
                                                                child: Text(
                                                                  'How to Join a Team',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineLarge
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .poppins(
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .headlineLarge
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .headlineLarge
                                                                              .fontStyle,
                                                                        ),
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .headlineLarge
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .headlineLarge
                                                                            .fontStyle,
                                                                      ),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                        16.0,
                                                                        0.0,
                                                                        16.0,
                                                                        10.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Container(
                                                                      width:
                                                                          4.0,
                                                                      height:
                                                                          4.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .tertiary,
                                                                        shape: BoxShape
                                                                            .circle,
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      child:
                                                                          Padding(
                                                                        padding: const EdgeInsetsDirectional
                                                                            .fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          'Ask for an invitation link from a team member',
                                                                          maxLines:
                                                                              2,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .titleMedium
                                                                              .override(
                                                                                font: GoogleFonts.poppins(
                                                                                  fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                                ),
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              // Padding(
                                                              //   padding:
                                                              //   const EdgeInsetsDirectional
                                                              //       .fromSTEB(
                                                              //       16.0,
                                                              //       0.0,
                                                              //       16.0,
                                                              //       10.0),
                                                              //   child: Row(
                                                              //     mainAxisSize:
                                                              //     MainAxisSize
                                                              //         .max,
                                                              //     children: [
                                                              //       Container(
                                                              //         width: 4.0,
                                                              //         height: 4.0,
                                                              //         decoration:
                                                              //         BoxDecoration(
                                                              //           color: FlutterFlowTheme.of(
                                                              //               context)
                                                              //               .tertiary,
                                                              //           shape: BoxShape
                                                              //               .circle,
                                                              //         ),
                                                              //       ),
                                                              //       Expanded(
                                                              //         child: Padding(
                                                              //           padding: const EdgeInsetsDirectional
                                                              //               .fromSTEB(
                                                              //               10.0,
                                                              //               0.0,
                                                              //               0.0,
                                                              //               0.0),
                                                              //           child: Text(
                                                              //             'Complete Your Ranking first',
                                                              //             maxLines: 2,
                                                              //             style: FlutterFlowTheme.of(
                                                              //                 context)
                                                              //                 .titleMedium
                                                              //                 .override(
                                                              //               font:
                                                              //               GoogleFonts.poppins(
                                                              //                 fontWeight:
                                                              //                 FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                              //                 fontStyle:
                                                              //                 FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                              //               ),
                                                              //               letterSpacing:
                                                              //               0.0,
                                                              //               fontWeight: FlutterFlowTheme.of(context)
                                                              //                   .titleMedium
                                                              //                   .fontWeight,
                                                              //               fontStyle: FlutterFlowTheme.of(context)
                                                              //                   .titleMedium
                                                              //                   .fontStyle,
                                                              //             ),
                                                              //           ),
                                                              //         ),
                                                              //       ),
                                                              //     ],
                                                              //   ),
                                                              // ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                        16.0,
                                                                        0.0,
                                                                        16.0,
                                                                        10.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Container(
                                                                      width:
                                                                          4.0,
                                                                      height:
                                                                          4.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .tertiary,
                                                                        shape: BoxShape
                                                                            .circle,
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      child:
                                                                          Padding(
                                                                        padding: const EdgeInsetsDirectional
                                                                            .fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          'Enter the invitation code to join the team',
                                                                          maxLines:
                                                                              2,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .titleMedium
                                                                              .override(
                                                                                font: GoogleFonts.poppins(
                                                                                  fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                                ),
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                        16.0,
                                                                        0.0,
                                                                        16.0,
                                                                        30.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Container(
                                                                      width:
                                                                          4.0,
                                                                      height:
                                                                          4.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .tertiary,
                                                                        shape: BoxShape
                                                                            .circle,
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      child:
                                                                          Padding(
                                                                        padding: const EdgeInsetsDirectional
                                                                            .fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          'Start collaborating on team rankings',
                                                                          maxLines:
                                                                              2,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .titleMedium
                                                                              .override(
                                                                                font: GoogleFonts.poppins(
                                                                                  fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                                ),
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
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
                                                      ),
                                                    )
                                                  : const SizedBox(
                                                      height: 0.0,
                                                      width: 0.0,
                                                    ),
                                            ],
                                          ),
                                          Positioned(
                                            right: 0.0,
                                            bottom: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.09,
                                            child: Container(
                                              width: 47.0,
                                              height: 47.0,
                                              decoration: BoxDecoration(
                                                gradient: const LinearGradient(
                                                  colors: [
                                                    Color(0xFFDD7325),
                                                    Color(0xFFDD7325)
                                                  ],
                                                  stops: [0.0, 1.0],
                                                  begin: AlignmentDirectional(
                                                      1.0, -0.98),
                                                  end: AlignmentDirectional(
                                                      -1.0, 0.98),
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                              child: const Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        14.0, 14.0, 14.0, 14.0),
                                                child: Icon(
                                                  Icons.add_sharp,
                                                  color: Colors.white,
                                                  size: 20.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (!FFAppState().isRead)
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(
                    0.0,
                    valueOrDefault<double>(
                      MediaQuery.sizeOf(context).height * 0.5,
                      0.0,
                    ),
                    0.0,
                    0.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 500.0,
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        0.0, 0.0, 0.0, 40.0),
                    child: PageView(
                      controller: _model.pageViewController ??=
                          PageController(initialPage: 0)
                            ..addListener(() {
                              debugLogWidgetClass(_model);
                            }),
                      scrollDirection: Axis.horizontal,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: (Theme.of(context).brightness ==
                                              Brightness.dark) ==
                                          true
                                      ? const Color(0x26FFFFFF)
                                      : const Color(0xFFC2C4C2),
                                  boxShadow: const [
                                    BoxShadow(
                                      blurRadius: 4.0,
                                      color: Color(0x33000000),
                                      offset: Offset(
                                        0.0,
                                        2.0,
                                      ),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              12.0, 16.0, 12.0, 16.0),
                                      child: Text(
                                        'A Game Within the Game\nPlay with Friends is a playful spin-off of VOTE THE GOAT, designed for private fun, not to be confused with the Goat Global Ranking ',
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .override(
                                              font: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w500,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmall
                                                        .fontStyle,
                                              ),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall
                                                      .fontStyle,
                                            ),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 8.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            '1 ',
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
                                                            .fontStyle,
                                                  ),
                                                  // color: FlutterFlowTheme.of(
                                                  //     context)
                                                  //     .peach,
                                                  color: Theme.of(context)
                                                              .brightness ==
                                                          Brightness.dark
                                                      ? Colors.white
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .peach,
                                                  fontSize: 14.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodySmall
                                                          .fontStyle,
                                                ),
                                          ),
                                          Text(
                                            ' / 5',
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
                                                            .fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .tertiary,
                                                  fontSize: 14.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodySmall
                                                          .fontStyle,
                                                ),
                                          ),
                                        ],
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
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: (Theme.of(context).brightness ==
                                              Brightness.dark) ==
                                          true
                                      ? const Color(0x26FFFFFF)
                                      : const Color(0xFFC2C4C2),
                                  boxShadow: const [
                                    BoxShadow(
                                      blurRadius: 4.0,
                                      color: Color(0x33000000),
                                      offset: Offset(
                                        0.0,
                                        2.0,
                                      ),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              12.0, 16.0, 12.0, 16.0),
                                      child: Text(
                                        'Your Team, Your Rules\nPlay whenever you want, with whomever you want: friends, family, classmates, teammates, colleagues. Just create a private Team and start the game.',
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .override(
                                              font: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w500,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmall
                                                        .fontStyle,
                                              ),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall
                                                      .fontStyle,
                                            ),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 8.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            '2',
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
                                                            .fontStyle,
                                                  ),
                                                  color: Theme.of(context)
                                                              .brightness ==
                                                          Brightness.dark
                                                      ? Colors.white
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .peach,
                                                  fontSize: 14.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodySmall
                                                          .fontStyle,
                                                ),
                                          ),
                                          Text(
                                            ' / 5',
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
                                                            .fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .tertiary,
                                                  fontSize: 14.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodySmall
                                                          .fontStyle,
                                                ),
                                          ),
                                        ],
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
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: (Theme.of(context).brightness ==
                                              Brightness.dark) ==
                                          true
                                      ? const Color(0x26FFFFFF)
                                      : const Color(0xFFC2C4C2),
                                  boxShadow: const [
                                    BoxShadow(
                                      blurRadius: 4.0,
                                      color: Color(0x33000000),
                                      offset: Offset(
                                        0.0,
                                        2.0,
                                      ),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              12.0, 16.0, 12.0, 16.0),
                                      child: Text(
                                        'Set the Deadline\nOnce your Team is ready, choose a deadline (day and time). The app will automatically collect the positions from each participant’s Your Ranking screen at that moment.',
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .override(
                                              font: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w500,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmall
                                                        .fontStyle,
                                              ),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall
                                                      .fontStyle,
                                            ),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 8.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            '3',
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
                                                            .fontStyle,
                                                  ),
                                                  color: Theme.of(context)
                                                              .brightness ==
                                                          Brightness.dark
                                                      ? Colors.white
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .peach,
                                                  fontSize: 14.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodySmall
                                                          .fontStyle,
                                                ),
                                          ),
                                          Text(
                                            ' / 5',
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
                                                            .fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .tertiary,
                                                  fontSize: 14.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodySmall
                                                          .fontStyle,
                                                ),
                                          ),
                                        ],
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
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: (Theme.of(context).brightness ==
                                              Brightness.dark) ==
                                          true
                                      ? const Color(0x26FFFFFF)
                                      : const Color(0xFFC2C4C2),
                                  boxShadow: const [
                                    BoxShadow(
                                      blurRadius: 4.0,
                                      color: Color(0x33000000),
                                      offset: Offset(
                                        0.0,
                                        2.0,
                                      ),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              12.0, 16.0, 12.0, 16.0),
                                      child: Text(
                                        'No Need to Finalize\nImportant: neither you nor your friends need to finalize Your Ranking to join the Team! The app works with whatever is already there.\n',
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .override(
                                              font: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w500,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmall
                                                        .fontStyle,
                                              ),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall
                                                      .fontStyle,
                                            ),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 8.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            '4',
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
                                                            .fontStyle,
                                                  ),
                                                  color: Theme.of(context)
                                                              .brightness ==
                                                          Brightness.dark
                                                      ? Colors.white
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .peach,
                                                  fontSize: 14.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodySmall
                                                          .fontStyle,
                                                ),
                                          ),
                                          Text(
                                            ' / 5',
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
                                                            .fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .tertiary,
                                                  fontSize: 14.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodySmall
                                                          .fontStyle,
                                                ),
                                          ),
                                        ],
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
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: (Theme.of(context).brightness ==
                                              Brightness.dark) ==
                                          true
                                      ? const Color(0x26FFFFFF)
                                      : const Color(0xFFC2C4C2),
                                  boxShadow: const [
                                    BoxShadow(
                                      blurRadius: 4.0,
                                      color: Color(0x33000000),
                                      offset: Offset(
                                        0.0,
                                        2.0,
                                      ),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              12.0, 16.0, 12.0, 16.0),
                                      child: Text(
                                        'Your Team, Your Goat\nThe result? A Goat ranking from your group alone!',
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .override(
                                              font: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w500,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmall
                                                        .fontStyle,
                                              ),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall
                                                      .fontStyle,
                                            ),
                                      ),
                                    ),
                                    Container(
                                      decoration: const BoxDecoration(),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(0.0, 0.0, 0.0, 18.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            FFAppState().isRead = true;
                                            safeSetState(() {});
                                          },
                                          child: wrapWithModel(
                                            model: _model.buttonSmallModel,
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child: Builder(builder: (_) {
                                              return DebugFlutterFlowModelContext(
                                                rootModel: _model.rootModel,
                                                child: const ButtonSmallWidget(
                                                  text: 'FINISH',
                                                  height: 28,
                                                  width: 88,
                                                  fontSize: 12,
                                                  textColor: Colors.white,
                                                ),
                                              );
                                            }),
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
                      ],
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
