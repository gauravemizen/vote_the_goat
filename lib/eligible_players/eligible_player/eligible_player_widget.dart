import '/backend/api_requests/api_calls.dart';
import '/components/drawer_menu/drawer_menu_widget.dart';
import '/components/no_data_found/no_data_found_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/index.dart';
import 'dart:async';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'eligible_player_model.dart';
export 'eligible_player_model.dart';

class EligiblePlayerWidget extends StatefulWidget {
  const EligiblePlayerWidget({super.key});

  static String routeName = 'eligible_player';
  static String routePath = '/eligiblePlayer';

  @override
  State<EligiblePlayerWidget> createState() => _EligiblePlayerWidgetState();
}

class _EligiblePlayerWidgetState extends State<EligiblePlayerWidget>
    with RouteAware {
  late EligiblePlayerModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EligiblePlayerModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.isLoading = true;
      safeSetState(() {});
      _model.apiResultlrq = await DashboardGroup.eligblePlayersCall.call(
        authToken: FFAppState().authToken,
        search: _model.searchFieldTextController.text,
      );

      if ((_model.apiResultlrq?.succeeded ?? true)) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              getJsonField(
                (_model.apiResultlrq?.jsonBody ?? ''),
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

        safeSetState(() {});
        _model.isLoading = false;
        safeSetState(() {});
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              getJsonField(
                (_model.apiResultlrq?.jsonBody ?? ''),
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
  void didUpdateWidget(EligiblePlayerWidget oldWidget) {
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


    print('Auth Token: ${FFAppState().authToken}');

    DebugFlutterFlowModelContext.maybeOf(context)
        ?.parentModelCallback
        ?.call(_model);
    context.watch<FFAppState>();

    return FutureBuilder<ApiCallResponse>(
      future: (_model.apiRequestCompleter ??= Completer<ApiCallResponse>()
            ..complete(DashboardGroup.eligblePlayersCall.call(
              authToken: FFAppState().authToken,
              search: _model.searchFieldTextController.text,
            )))
          .future,
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
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
        final eligiblePlayerEligblePlayersResponse = snapshot.data!;
        _model.debugBackendQueries[
                'DashboardGroup.eligblePlayersCall_statusCode_Scaffold_rltv3q3c'] =
            debugSerializeParam(
          eligiblePlayerEligblePlayersResponse.statusCode,
          ParamType.int,
          link:
              'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=eligible_player',
          name: 'int',
          nullable: false,
        );
        _model.debugBackendQueries[
                'DashboardGroup.eligblePlayersCall_responseBody_Scaffold_rltv3q3c'] =
            debugSerializeParam(
          eligiblePlayerEligblePlayersResponse.bodyText,
          ParamType.String,
          link:
              'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=eligible_player',
          name: 'String',
          nullable: false,
        );
        debugLogWidgetClass(_model);

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
                  ),
                ),
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
                              scaffoldKey.currentState!.openDrawer();
                            },
                            child: Container(
                              width: 40.0,
                              height: 40.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).backBtnClr,
                                boxShadow: [
                                  const BoxShadow(
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
                                Icons.menu,
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
                                  'Eligible',
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
                                  'PLAYERS',
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
                                  color:
                                      FlutterFlowTheme.of(context).backBtnClr,
                                  boxShadow: [
                                    const BoxShadow(
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
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
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
                                  'Apply filters to rank Players based on their Titles, Awards and Stats or compare up to two Players',
                                  textAlign: TextAlign.center,
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
                          ],
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Container(
                              width: double.infinity,
                              child: TextFormField(
                                controller: _model.searchFieldTextController,
                                focusNode: _model.searchFieldFocusNode,
                                onChanged: (_) => EasyDebounce.debounce(
                                  '_model.searchFieldTextController',
                                  const Duration(milliseconds: 2000),
                                  () async {
                                    safeSetState(() =>
                                        _model.apiRequestCompleter = null);
                                    await _model.waitForApiRequestCompleted();
                                  },
                                ),
                                autofocus: false,
                                obscureText: false,
                                decoration: InputDecoration(
                                  isDense: true,
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        font: GoogleFonts.poppins(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontStyle,
                                        ),
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontStyle,
                                      ),
                                  hintText: 'Search player...',
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        font: GoogleFonts.poppins(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontStyle,
                                        ),
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontStyle,
                                      ),
                                  enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(8.0),
                                      bottomRight: Radius.circular(0.0),
                                      topLeft: Radius.circular(8.0),
                                      topRight: Radius.circular(0.0),
                                    ),
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(8.0),
                                      bottomRight: Radius.circular(0.0),
                                      topLeft: Radius.circular(8.0),
                                      topRight: Radius.circular(0.0),
                                    ),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(8.0),
                                      bottomRight: Radius.circular(0.0),
                                      topLeft: Radius.circular(8.0),
                                      topRight: Radius.circular(0.0),
                                    ),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(8.0),
                                      bottomRight: Radius.circular(0.0),
                                      topLeft: Radius.circular(8.0),
                                      topRight: Radius.circular(0.0),
                                    ),
                                  ),
                                  filled: true,
                                  fillColor: (Theme.of(context).brightness ==
                                              Brightness.dark) ==
                                          true
                                      ? const Color(0x80050505)
                                      : const Color(0xFFE6E6E6),
                                  prefixIcon: Icon(
                                    Icons.search_rounded,
                                    color:
                                        FlutterFlowTheme.of(context).tertiary,
                                    size: 22.0,
                                  ),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      font: GoogleFonts.poppins(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontStyle,
                                      ),
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontStyle,
                                    ),
                                cursorColor:
                                    FlutterFlowTheme.of(context).primaryText,
                                validator: _model
                                    .searchFieldTextControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed(FilterScreenWidget.routeName);
                            },
                            child: Container(
                              height: 50.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).peach,
                                borderRadius: BorderRadius.circular(6.0),
                                shape: BoxShape.rectangle,
                              ),
                              child: Align(
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      26.0, 6.0, 26.0, 6.0),
                                  child: Text(
                                    'FILTERS',
                                    style: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .override(
                                          font: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodySmall
                                                    .fontStyle,
                                          ),
                                          color: Colors.white,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
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
                      if (!_model.isLoading)
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 20.0, 0.0, 10.0),
                            child: Builder(
                              builder: (context) {
                                final playerList =
                                    DashboardGroup.eligblePlayersCall
                                            .playerList(
                                              eligiblePlayerEligblePlayersResponse
                                                  .jsonBody,
                                            )
                                            ?.toList() ??
                                        [];
                                if (playerList.isEmpty) {
                                  return const Center(
                                    child: NoDataFoundWidget(),
                                  );
                                }
                                _model.debugGeneratorVariables[
                                        'playerList${playerList.length > 100 ? ' (first 100)' : ''}'] =
                                    debugSerializeParam(
                                  playerList.take(100),
                                  ParamType.JSON,
                                  isList: true,
                                  link:
                                      'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=eligible_player',
                                  name: 'dynamic',
                                  nullable: false,
                                );
                                debugLogWidgetClass(_model);

                                return ListView.builder(
                                  padding: EdgeInsets.only(bottom: 70.0), // Add bottom padding for custom navigation bar
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: playerList.length,
                                  itemBuilder: (context, playerListIndex) {
                                    final playerListItem =
                                        playerList[playerListIndex];
                                    return Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 14.0, 0.0, 14.0),
                                      child: InkWell(
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
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            border: Border.all(
                                              color: const Color(0xFF4E4E4E),
                                            ),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        14.0, 14.0, 14.0, 14.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
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
                                                          clipBehavior:
                                                              Clip.antiAlias,
                                                          decoration:
                                                              const BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                          child: Image.network(
                                                            getJsonField(
                                                              playerListItem,
                                                              r'''$.image''',
                                                            ).toString(),
                                                            fit: BoxFit.cover,
                                                            errorBuilder: (context,
                                                                    error,
                                                                    stackTrace) =>
                                                                Image.asset(
                                                              'assets/images/error_image.webp',
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Expanded(
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
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
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Text(
                                                                  '${getJsonField(
                                                                    playerListItem,
                                                                    r'''$.first_name ''',
                                                                  ).toString()} ${getJsonField(
                                                                    playerListItem,
                                                                    r'''$.last_name''',
                                                                  ).toString()}'
                                                                      .maybeHandleOverflow(
                                                                    maxChars:
                                                                        18,
                                                                    replacement:
                                                                        '…',
                                                                  ),
                                                                  maxLines: 2,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleLarge
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .poppins(
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .titleLarge
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .titleLarge
                                                                              .fontStyle,
                                                                        ),
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .titleLarge
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .titleLarge
                                                                            .fontStyle,
                                                                      ),
                                                                ),
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Text(
                                                                      'Age :',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleLarge
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.poppins(
                                                                              fontWeight: FlutterFlowTheme.of(context).titleLarge.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                                                                            ),
                                                                            color: (Theme.of(context).brightness == Brightness.dark) == true
                                                                                ? const Color(0xFFCDCDCD)
                                                                                : Colors.black,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).titleLarge.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).titleLarge.fontStyle,
                                                                          ),
                                                                    ),
                                                                    Padding(
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          2.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        getJsonField(
                                                                          playerListItem,
                                                                          r'''$.age''',
                                                                        ).toString(),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .titleLarge
                                                                            .override(
                                                                              font: GoogleFonts.poppins(
                                                                                fontWeight: FlutterFlowTheme.of(context).titleLarge.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                                                                              ),
                                                                              color: (Theme.of(context).brightness == Brightness.dark) == true ? const Color(0xFFCDCDCD) : Colors.black,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FlutterFlowTheme.of(context).titleLarge.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ],
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
                                                                        font: GoogleFonts
                                                                            .poppins(
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .bodySmall
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodySmall
                                                                              .fontStyle,
                                                                        ),
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .tertiary,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodySmall
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodySmall
                                                                            .fontStyle,
                                                                      ),
                                                                ),
                                                                Text(
                                                                  getJsonField(
                                                                    playerListItem,
                                                                    r'''$.position_name''',
                                                                  ).toString(),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .start,
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
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .tertiary,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodySmall
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodySmall
                                                                            .fontStyle,
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
                                                                      '#',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .start,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodySmall
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.poppins(
                                                                              fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                            ),
                                                                            color:
                                                                                FlutterFlowTheme.of(context).tertiary,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodySmall.fontStyle,
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
                                                                          playerListItem,
                                                                          r'''$.position_id''',
                                                                        ).toString(),
                                                                        textAlign:
                                                                            TextAlign.start,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodySmall
                                                                            .override(
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
                                                                  ],
                                                                ),
                                                                Align(
                                                                  alignment:
                                                                      const AlignmentDirectional(
                                                                          1.0,
                                                                          0.0),
                                                                  child:
                                                                      InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      if (_model
                                                                              .selectedItems
                                                                              .contains(getJsonField(
                                                                            playerListItem,
                                                                            r'''$.id''',
                                                                          )) ==
                                                                          true) {
                                                                        _model.removeFromSelectedItems(
                                                                            getJsonField(
                                                                          playerListItem,
                                                                          r'''$.id''',
                                                                        ));
                                                                        safeSetState(
                                                                            () {});
                                                                      } else {
                                                                        if (_model.selectedItems.length <
                                                                            2) {
                                                                          _model
                                                                              .addToSelectedItems(getJsonField(
                                                                            playerListItem,
                                                                            r'''$.id''',
                                                                          ));
                                                                          safeSetState(
                                                                              () {});
                                                                        } else {
                                                                          ScaffoldMessenger.of(context)
                                                                              .showSnackBar(
                                                                            const SnackBar(
                                                                              content: Text(
                                                                                'You can only select 2 players for comparison',
                                                                                style: TextStyle(
                                                                                  color: Colors.white,
                                                                                ),
                                                                              ),
                                                                              duration: Duration(milliseconds: 4000),
                                                                              backgroundColor: Colors.black,
                                                                            ),
                                                                          );
                                                                        }
                                                                      }
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: _model.selectedItems.contains(getJsonField(
                                                                          playerListItem,
                                                                          r'''$.id''',
                                                                        ))
                                                                            ? const Color(0xFF398638)
                                                                            : const Color(0x00000000),
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
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            8.0,
                                                                            4.0,
                                                                            8.0,
                                                                            4.0),
                                                                        child:
                                                                            Text(
                                                                          'Compare',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodySmall
                                                                              .override(
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
                                                                    ),
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
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 14.0),
                                                child: Container(
                                                  width: double.infinity,
                                                  height: 1.0,
                                                  decoration: const BoxDecoration(
                                                    gradient: LinearGradient(
                                                      colors: [
                                                        Color(0x00FFFFFF),
                                                        Color(0xFF6B4A4A),
                                                        Color(0x00FFFFFF),
                                                        Color(0xFF6B4A4A)
                                                      ],
                                                      stops: [
                                                        0.0,
                                                        0.1,
                                                        1.0,
                                                        1.0
                                                      ],
                                                      begin:
                                                          AlignmentDirectional(
                                                              1.0, 0.0),
                                                      end: AlignmentDirectional(
                                                          -1.0, 0),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              // Padding(
                                              //   padding: const EdgeInsetsDirectional.fromSTEB(14.0, 0.0, 14.0, 14.0),
                                              //   child: SingleChildScrollView(
                                              //     scrollDirection: Axis.horizontal,
                                              //     child: Row(
                                              //       mainAxisSize: MainAxisSize.max,
                                              //       children: [
                                              //         // PPG Container
                                              //         Container(
                                              //           decoration: BoxDecoration(
                                              //             color: (Theme.of(context).brightness == Brightness.dark) == true
                                              //                 ? const Color(0xFF2D2D2D)
                                              //                 : const Color(0xFFE9E9E9),
                                              //             borderRadius: BorderRadius.circular(1000.0),
                                              //             shape: BoxShape.rectangle,
                                              //           ),
                                              //           child: Padding(
                                              //             padding: const EdgeInsetsDirectional.fromSTEB(4.0, 4.0, 4.0, 4.0),
                                              //             child: Row(
                                              //               mainAxisSize: MainAxisSize.max,
                                              //               children: [
                                              //                 Padding(
                                              //                   padding: const EdgeInsetsDirectional.fromSTEB(4.0, 4.0, 4.0, 4.0),
                                              //                   child: Text(
                                              //                     'PPG :',
                                              //                     style: FlutterFlowTheme.of(context).bodySmall.override(
                                              //                       font: GoogleFonts.poppins(
                                              //                         fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                              //                         fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                              //                       ),
                                              //                       color: FlutterFlowTheme.of(context).tertiary,
                                              //                       letterSpacing: 0.0,
                                              //                       fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                              //                       fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                              //                     ),
                                              //                   ),
                                              //                 ),
                                              //                 Padding(
                                              //                   padding: const EdgeInsetsDirectional.fromSTEB(4.0, 4.0, 4.0, 4.0),
                                              //                   child: Text(
                                              //                     getJsonField(
                                              //                       playerListItem,
                                              //                       r'''$.player_stats[0].ppg''',
                                              //                     )?.toString() ?? '0.0',
                                              //                     style: FlutterFlowTheme.of(context).bodySmall.override(
                                              //                       font: GoogleFonts.poppins(
                                              //                         fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                              //                         fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                              //                       ),
                                              //                       color: FlutterFlowTheme.of(context).tertiary,
                                              //                       letterSpacing: 0.0,
                                              //                       fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                              //                       fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                              //                     ),
                                              //                   ),
                                              //                 ),
                                              //               ],
                                              //             ),
                                              //           ),
                                              //         ),
                                              //         // RPG Container
                                              //         // RPG Container
                                              //         Padding(
                                              //           padding: const EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 4.0, 0.0),
                                              //           child: Container(
                                              //             decoration: BoxDecoration(
                                              //               color: (Theme.of(context).brightness == Brightness.dark) == true
                                              //                   ? const Color(0xFF2D2D2D)
                                              //                   : const Color(0xFFE9E9E9),
                                              //               borderRadius: BorderRadius.circular(1000.0),
                                              //               shape: BoxShape.rectangle,
                                              //             ),
                                              //             child: Padding(
                                              //               padding: const EdgeInsetsDirectional.fromSTEB(4.0, 4.0, 4.0, 4.0),
                                              //               child: Row(
                                              //                 mainAxisSize: MainAxisSize.max,
                                              //                 children: [
                                              //                   Padding(
                                              //                     padding: const EdgeInsetsDirectional.fromSTEB(4.0, 4.0, 4.0, 4.0),
                                              //                     child: Text(
                                              //                       'RPG :',
                                              //                       style: FlutterFlowTheme.of(context).bodySmall.override(
                                              //                         font: GoogleFonts.poppins(
                                              //                           fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                              //                           fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                              //                         ),
                                              //                         color: FlutterFlowTheme.of(context).tertiary,
                                              //                         letterSpacing: 0.0,
                                              //                         fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                              //                         fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                              //                       ),
                                              //                     ),
                                              //                   ),
                                              //                   Padding(
                                              //                     padding: const EdgeInsetsDirectional.fromSTEB(4.0, 4.0, 4.0, 4.0),
                                              //                     child: Text(
                                              //                           () {
                                              //                         final orpg = double.tryParse(getJsonField(
                                              //                           playerListItem,
                                              //                           r'''$.player_stats[0].orpg''',
                                              //                         )?.toString() ?? '0.0') ?? 0.0;
                                              //                         final drpg = double.tryParse(getJsonField(
                                              //                           playerListItem,
                                              //                           r'''$.player_stats[0].drpg''',
                                              //                         )?.toString() ?? '0.0') ?? 0.0;
                                              //                         return (orpg + drpg).toStringAsFixed(1);
                                              //                       }(),
                                              //                       style: FlutterFlowTheme.of(context).bodySmall.override(
                                              //                         font: GoogleFonts.poppins(
                                              //                           fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                              //                           fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                              //                         ),
                                              //                         color: FlutterFlowTheme.of(context).tertiary,
                                              //                         letterSpacing: 0.0,
                                              //                         fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                              //                         fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                              //                       ),
                                              //                     ),
                                              //                   ),
                                              //                 ],
                                              //               ),
                                              //             ),
                                              //           ),
                                              //         ),
                                              //
                                              //         // APG Container
                                              //         Padding(
                                              //           padding: const EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 4.0, 0.0),
                                              //           child: Container(
                                              //             decoration: BoxDecoration(
                                              //               color: (Theme.of(context).brightness == Brightness.dark) == true
                                              //                   ? const Color(0xFF2D2D2D)
                                              //                   : const Color(0xFFE9E9E9),
                                              //               borderRadius: BorderRadius.circular(1000.0),
                                              //               shape: BoxShape.rectangle,
                                              //             ),
                                              //             child: Padding(
                                              //               padding: const EdgeInsetsDirectional.fromSTEB(4.0, 4.0, 4.0, 4.0),
                                              //               child: Row(
                                              //                 mainAxisSize: MainAxisSize.max,
                                              //                 children: [
                                              //                   Padding(
                                              //                     padding: const EdgeInsetsDirectional.fromSTEB(4.0, 4.0, 4.0, 4.0),
                                              //                     child: Text(
                                              //                       'APG :',
                                              //                       style: FlutterFlowTheme.of(context).bodySmall.override(
                                              //                         font: GoogleFonts.poppins(
                                              //                           fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                              //                           fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                              //                         ),
                                              //                         color: FlutterFlowTheme.of(context).tertiary,
                                              //                         letterSpacing: 0.0,
                                              //                         fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                              //                         fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                              //                       ),
                                              //                     ),
                                              //                   ),
                                              //                   Padding(
                                              //                     padding: const EdgeInsetsDirectional.fromSTEB(4.0, 4.0, 4.0, 4.0),
                                              //                     child: Text(
                                              //                       getJsonField(
                                              //                         playerListItem,
                                              //                         r'''$.player_stats[0].apg''',
                                              //                       )?.toString() ?? '0.0',
                                              //                       style: FlutterFlowTheme.of(context).bodySmall.override(
                                              //                         font: GoogleFonts.poppins(
                                              //                           fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                              //                           fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                              //                         ),
                                              //                         color: FlutterFlowTheme.of(context).tertiary,
                                              //                         letterSpacing: 0.0,
                                              //                         fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                              //                         fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                              //                       ),
                                              //                     ),
                                              //                   ),
                                              //                 ],
                                              //               ),
                                              //             ),
                                              //           ),
                                              //         ),
                                              //         // SPG Container
                                              //         Padding(
                                              //           padding: const EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 4.0, 0.0),
                                              //           child: Container(
                                              //             decoration: BoxDecoration(
                                              //               color: (Theme.of(context).brightness == Brightness.dark) == true
                                              //                   ? const Color(0xFF2D2D2D)
                                              //                   : const Color(0xFFE9E9E9),
                                              //               borderRadius: BorderRadius.circular(1000.0),
                                              //               shape: BoxShape.rectangle,
                                              //             ),
                                              //             child: Padding(
                                              //               padding: const EdgeInsetsDirectional.fromSTEB(4.0, 4.0, 4.0, 4.0),
                                              //               child: Row(
                                              //                 mainAxisSize: MainAxisSize.max,
                                              //                 children: [
                                              //                   Padding(
                                              //                     padding: const EdgeInsetsDirectional.fromSTEB(4.0, 4.0, 4.0, 4.0),
                                              //                     child: Text(
                                              //                       'SPG :',
                                              //                       style: FlutterFlowTheme.of(context).bodySmall.override(
                                              //                         font: GoogleFonts.poppins(
                                              //                           fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                              //                           fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                              //                         ),
                                              //                         color: FlutterFlowTheme.of(context).tertiary,
                                              //                         letterSpacing: 0.0,
                                              //                         fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                              //                         fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                              //                       ),
                                              //                     ),
                                              //                   ),
                                              //                   Padding(
                                              //                     padding: const EdgeInsetsDirectional.fromSTEB(4.0, 4.0, 4.0, 4.0),
                                              //                     child: Text(
                                              //                       getJsonField(
                                              //                         playerListItem,
                                              //                         r'''$.player_stats[0].spg''',
                                              //                       )?.toString() ?? '0.0',
                                              //                       style: FlutterFlowTheme.of(context).bodySmall.override(
                                              //                         font: GoogleFonts.poppins(
                                              //                           fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                              //                           fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                              //                         ),
                                              //                         color: FlutterFlowTheme.of(context).tertiary,
                                              //                         letterSpacing: 0.0,
                                              //                         fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                              //                         fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                              //                       ),
                                              //                     ),
                                              //                   ),
                                              //                 ],
                                              //               ),
                                              //             ),
                                              //           ),
                                              //         ),
                                              //         // BPG Container
                                              //         Padding(
                                              //           padding: const EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 4.0, 0.0),
                                              //           child: Container(
                                              //             decoration: BoxDecoration(
                                              //               color: (Theme.of(context).brightness == Brightness.dark) == true
                                              //                   ? const Color(0xFF2D2D2D)
                                              //                   : const Color(0xFFE9E9E9),
                                              //               borderRadius: BorderRadius.circular(1000.0),
                                              //               shape: BoxShape.rectangle,
                                              //             ),
                                              //             child: Padding(
                                              //               padding: const EdgeInsetsDirectional.fromSTEB(4.0, 4.0, 4.0, 4.0),
                                              //               child: Row(
                                              //                 mainAxisSize: MainAxisSize.max,
                                              //                 children: [
                                              //                   Padding(
                                              //                     padding: const EdgeInsetsDirectional.fromSTEB(4.0, 4.0, 4.0, 4.0),
                                              //                     child: Text(
                                              //                       'BPG :',
                                              //                       style: FlutterFlowTheme.of(context).bodySmall.override(
                                              //                         font: GoogleFonts.poppins(
                                              //                           fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                              //                           fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                              //                         ),
                                              //                         color: FlutterFlowTheme.of(context).tertiary,
                                              //                         letterSpacing: 0.0,
                                              //                         fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                              //                         fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                              //                       ),
                                              //                     ),
                                              //                   ),
                                              //                   Padding(
                                              //                     padding: const EdgeInsetsDirectional.fromSTEB(4.0, 4.0, 4.0, 4.0),
                                              //                     child: Text(
                                              //                       getJsonField(
                                              //                         playerListItem,
                                              //                         r'''$.player_stats[0].bpg''',
                                              //                       )?.toString() ?? '0.0',
                                              //                       style: FlutterFlowTheme.of(context).bodySmall.override(
                                              //                         font: GoogleFonts.poppins(
                                              //                           fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                              //                           fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                              //                         ),
                                              //                         color: FlutterFlowTheme.of(context).tertiary,
                                              //                         letterSpacing: 0.0,
                                              //                         fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                              //                         fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                              //                       ),
                                              //                     ),
                                              //                   ),
                                              //                 ],
                                              //               ),
                                              //             ),
                                              //           ),
                                              //         ),
                                              //       ],
                                              //     ),
                                              //   ),
                                              // ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional.fromSTEB(14.0, 0.0, 14.0, 14.0),
                                                child: SingleChildScrollView(
                                                  scrollDirection: Axis.horizontal,
                                                  child: Row(
                                                    mainAxisSize: MainAxisSize.max,
                                                    children: [
                                                      // PPG Container
                                                      Container(
                                                        decoration: BoxDecoration(
                                                          color: (Theme.of(context).brightness == Brightness.dark) == true
                                                              ? const Color(0xFF2D2D2D)
                                                              : const Color(0xFFE9E9E9),
                                                          borderRadius: BorderRadius.circular(1000.0),
                                                          shape: BoxShape.rectangle,
                                                        ),
                                                        child: Padding(
                                                          padding: const EdgeInsetsDirectional.fromSTEB(4.0, 4.0, 4.0, 4.0),
                                                          child: Row(
                                                            mainAxisSize: MainAxisSize.max,
                                                            children: [
                                                              Padding(
                                                                padding: const EdgeInsetsDirectional.fromSTEB(4.0, 4.0, 4.0, 4.0),
                                                                child: Text(
                                                                  'PPG :',
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
                                                              Padding(
                                                                padding: const EdgeInsetsDirectional.fromSTEB(4.0, 4.0, 4.0, 4.0),
                                                                child: Text(
                                                                  (double.tryParse(getJsonField(
                                                                    playerListItem,
                                                                    r'''$.player_stats[0].ppg''',
                                                                  )?.toString() ?? '0.0') ?? 0.0).toStringAsFixed(2),
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
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      // RPG Container
                                                      Padding(
                                                        padding: const EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 4.0, 0.0),
                                                        child: Container(
                                                          decoration: BoxDecoration(
                                                            color: (Theme.of(context).brightness == Brightness.dark) == true
                                                                ? const Color(0xFF2D2D2D)
                                                                : const Color(0xFFE9E9E9),
                                                            borderRadius: BorderRadius.circular(1000.0),
                                                            shape: BoxShape.rectangle,
                                                          ),
                                                          child: Padding(
                                                            padding: const EdgeInsetsDirectional.fromSTEB(4.0, 4.0, 4.0, 4.0),
                                                            child: Row(
                                                              mainAxisSize: MainAxisSize.max,
                                                              children: [
                                                                Padding(
                                                                  padding: const EdgeInsetsDirectional.fromSTEB(4.0, 4.0, 4.0, 4.0),
                                                                  child: Text(
                                                                    'RPG :',
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
                                                                Padding(
                                                                  padding: const EdgeInsetsDirectional.fromSTEB(4.0, 4.0, 4.0, 4.0),
                                                                  child: Text(
                                                                        () {
                                                                      final orpg = double.tryParse(getJsonField(
                                                                        playerListItem,
                                                                        r'''$.player_stats[0].orpg''',
                                                                      )?.toString() ?? '0.0') ?? 0.0;
                                                                      final drpg = double.tryParse(getJsonField(
                                                                        playerListItem,
                                                                        r'''$.player_stats[0].drpg''',
                                                                      )?.toString() ?? '0.0') ?? 0.0;
                                                                      return (orpg + drpg).toStringAsFixed(2);
                                                                    }(),
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
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      // APG Container
                                                      Padding(
                                                        padding: const EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 4.0, 0.0),
                                                        child: Container(
                                                          decoration: BoxDecoration(
                                                            color: (Theme.of(context).brightness == Brightness.dark) == true
                                                                ? const Color(0xFF2D2D2D)
                                                                : const Color(0xFFE9E9E9),
                                                            borderRadius: BorderRadius.circular(1000.0),
                                                            shape: BoxShape.rectangle,
                                                          ),
                                                          child: Padding(
                                                            padding: const EdgeInsetsDirectional.fromSTEB(4.0, 4.0, 4.0, 4.0),
                                                            child: Row(
                                                              mainAxisSize: MainAxisSize.max,
                                                              children: [
                                                                Padding(
                                                                  padding: const EdgeInsetsDirectional.fromSTEB(4.0, 4.0, 4.0, 4.0),
                                                                  child: Text(
                                                                    'APG :',
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
                                                                Padding(
                                                                  padding: const EdgeInsetsDirectional.fromSTEB(4.0, 4.0, 4.0, 4.0),
                                                                  child: Text(
                                                                    (double.tryParse(getJsonField(
                                                                      playerListItem,
                                                                      r'''$.player_stats[0].apg''',
                                                                    )?.toString() ?? '0.0') ?? 0.0).toStringAsFixed(2),
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
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      // SPG Container
                                                      Padding(
                                                        padding: const EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 4.0, 0.0),
                                                        child: Container(
                                                          decoration: BoxDecoration(
                                                            color: (Theme.of(context).brightness == Brightness.dark) == true
                                                                ? const Color(0xFF2D2D2D)
                                                                : const Color(0xFFE9E9E9),
                                                            borderRadius: BorderRadius.circular(1000.0),
                                                            shape: BoxShape.rectangle,
                                                          ),
                                                          child: Padding(
                                                            padding: const EdgeInsetsDirectional.fromSTEB(4.0, 4.0, 4.0, 4.0),
                                                            child: Row(
                                                              mainAxisSize: MainAxisSize.max,
                                                              children: [
                                                                Padding(
                                                                  padding: const EdgeInsetsDirectional.fromSTEB(4.0, 4.0, 4.0, 4.0),
                                                                  child: Text(
                                                                    'SPG :',
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
                                                                Padding(
                                                                  padding: const EdgeInsetsDirectional.fromSTEB(4.0, 4.0, 4.0, 4.0),
                                                                  child: Text(
                                                                    (double.tryParse(getJsonField(
                                                                      playerListItem,
                                                                      r'''$.player_stats[0].spg''',
                                                                    )?.toString() ?? '0.0') ?? 0.0).toStringAsFixed(2),
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
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      // BPG Container
                                                      Padding(
                                                        padding: const EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 4.0, 0.0),
                                                        child: Container(
                                                          decoration: BoxDecoration(
                                                            color: (Theme.of(context).brightness == Brightness.dark) == true
                                                                ? const Color(0xFF2D2D2D)
                                                                : const Color(0xFFE9E9E9),
                                                            borderRadius: BorderRadius.circular(1000.0),
                                                            shape: BoxShape.rectangle,
                                                          ),
                                                          child: Padding(
                                                            padding: const EdgeInsetsDirectional.fromSTEB(4.0, 4.0, 4.0, 4.0),
                                                            child: Row(
                                                              mainAxisSize: MainAxisSize.max,
                                                              children: [
                                                                Padding(
                                                                  padding: const EdgeInsetsDirectional.fromSTEB(4.0, 4.0, 4.0, 4.0),
                                                                  child: Text(
                                                                    'BPG :',
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
                                                                Padding(
                                                                  padding: const EdgeInsetsDirectional.fromSTEB(4.0, 4.0, 4.0, 4.0),
                                                                  child: Text(
                                                                    (double.tryParse(getJsonField(
                                                                      playerListItem,
                                                                      r'''$.player_stats[0].bpg''',
                                                                    )?.toString() ?? '0.0') ?? 0.0).toStringAsFixed(2),
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
                if (_model.selectedItems.length.toString() == '2')
                  Align(
                    alignment: const AlignmentDirectional(0.89, 0.76),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.pushNamed(
                          ComparePlayersWidget.routeName,
                          queryParameters: {
                            'player1Id': serializeParam(
                              _model.selectedItems.elementAtOrNull(0),
                              ParamType.int,
                            ),
                            'player2Id': serializeParam(
                              _model.selectedItems.elementAtOrNull(1),
                              ParamType.int,
                            ),
                          }.withoutNulls,
                        );

                        _model.selectedItems = [];
                        safeSetState(() {});
                      },
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 0.3,
                        height: 40.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).peach,
                          borderRadius: BorderRadius.circular(24.0),
                          shape: BoxShape.rectangle,
                        ),
                        child: Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 6.0, 0.0, 6.0),
                            child: Text(
                              'Compare  now',
                              style: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .override(
                                    font: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .fontStyle,
                                    ),
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .fontStyle,
                                  ),
                            ),
                          ),
                        ),
                      ),
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
              ],
            ),
          ),
        );
      },
    );
  }
}
