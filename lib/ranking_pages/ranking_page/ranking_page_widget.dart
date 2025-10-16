import '../save_progress/save_progress_ranking_widget.dart';
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

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RankingPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.isLoading = true;
      safeSetState(() {});
      await Future.delayed(
        const Duration(
          milliseconds: 3000,
        ),
      );
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
                              'Drag & Drop the Players and release them\nin the desired ranking position',
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
                        // Padding(
                        //   padding: EdgeInsetsDirectional.fromSTEB(
                        //       0.0, 0.0, 0.0, 20.0),
                        //   child: Container(
                        //     width: double.infinity,
                        //     child: TextFormField(
                        //       controller: _model.searchFieldTextController,
                        //       focusNode: _model.searchFieldFocusNode,
                        //       autofocus: false,
                        //       obscureText: false,
                        //       decoration: InputDecoration(
                        //         isDense: true,
                        //         labelStyle: FlutterFlowTheme.of(context)
                        //             .labelMedium
                        //             .override(
                        //               font: GoogleFonts.poppins(
                        //                 fontWeight: FlutterFlowTheme.of(context)
                        //                     .labelMedium
                        //                     .fontWeight,
                        //                 fontStyle: FlutterFlowTheme.of(context)
                        //                     .labelMedium
                        //                     .fontStyle,
                        //               ),
                        //               letterSpacing: 0.0,
                        //               fontWeight: FlutterFlowTheme.of(context)
                        //                   .labelMedium
                        //                   .fontWeight,
                        //               fontStyle: FlutterFlowTheme.of(context)
                        //                   .labelMedium
                        //                   .fontStyle,
                        //             ),
                        //         hintText: 'Search player...',
                        //         hintStyle: FlutterFlowTheme.of(context)
                        //             .labelMedium
                        //             .override(
                        //               font: GoogleFonts.poppins(
                        //                 fontWeight: FlutterFlowTheme.of(context)
                        //                     .labelMedium
                        //                     .fontWeight,
                        //                 fontStyle: FlutterFlowTheme.of(context)
                        //                     .labelMedium
                        //                     .fontStyle,
                        //               ),
                        //               letterSpacing: 0.0,
                        //               fontWeight: FlutterFlowTheme.of(context)
                        //                   .labelMedium
                        //                   .fontWeight,
                        //               fontStyle: FlutterFlowTheme.of(context)
                        //                   .labelMedium
                        //                   .fontStyle,
                        //             ),
                        //         enabledBorder: OutlineInputBorder(
                        //           borderSide: BorderSide(
                        //             color: Color(0x00000000),
                        //             width: 1.0,
                        //           ),
                        //           borderRadius: BorderRadius.circular(8.0),
                        //         ),
                        //         focusedBorder: OutlineInputBorder(
                        //           borderSide: BorderSide(
                        //             color: Color(0x00000000),
                        //             width: 1.0,
                        //           ),
                        //           borderRadius: BorderRadius.circular(8.0),
                        //         ),
                        //         errorBorder: OutlineInputBorder(
                        //           borderSide: BorderSide(
                        //             color: FlutterFlowTheme.of(context).error,
                        //             width: 1.0,
                        //           ),
                        //           borderRadius: BorderRadius.circular(8.0),
                        //         ),
                        //         focusedErrorBorder: OutlineInputBorder(
                        //           borderSide: BorderSide(
                        //             color: FlutterFlowTheme.of(context).error,
                        //             width: 1.0,
                        //           ),
                        //           borderRadius: BorderRadius.circular(8.0),
                        //         ),
                        //         filled: true,
                        //         fillColor: (Theme.of(context).brightness ==
                        //                     Brightness.dark) ==
                        //                 true
                        //             ? Color(0x80050505)
                        //             : Color(0xFFE6E6E6),
                        //         prefixIcon: Icon(
                        //           Icons.search_rounded,
                        //           color: FlutterFlowTheme.of(context).tertiary,
                        //           size: 18.0,
                        //         ),
                        //       ),
                        //       style: FlutterFlowTheme.of(context)
                        //           .labelMedium
                        //           .override(
                        //             font: GoogleFonts.poppins(
                        //               fontWeight: FlutterFlowTheme.of(context)
                        //                   .labelMedium
                        //                   .fontWeight,
                        //               fontStyle: FlutterFlowTheme.of(context)
                        //                   .labelMedium
                        //                   .fontStyle,
                        //             ),
                        //             letterSpacing: 0.0,
                        //             fontWeight: FlutterFlowTheme.of(context)
                        //                 .labelMedium
                        //                 .fontWeight,
                        //             fontStyle: FlutterFlowTheme.of(context)
                        //                 .labelMedium
                        //                 .fontStyle,
                        //           ),
                        //       cursorColor:
                        //           FlutterFlowTheme.of(context).primaryText,
                        //       validator: _model
                        //           .searchFieldTextControllerValidator
                        //           .asValidator(context),
                        //     ),
                        //   ),
                        // ),

                        ///select how many players you want to rank

                        Container(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16, 10, 0, 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Please select how many players you want to rank',
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
                              const SizedBox(height: 12),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [10, 20, 50]
                                    .map(
                                      (count) => Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Row(
                                          children: [
                                            Radio<int>(
                                              value: count,
                                              groupValue:
                                                  _model.selectedPlayerCount,
                                              activeColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              onChanged: (value) {
                                                setState(() {
                                                  _model.selectedPlayerCount =
                                                      value;
                                                });
                                              },
                                            ),
                                            Text(
                                              count.toString(),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                      ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                    .toList(),
                              ),
                            ],
                          ),
                        ),

                        ///
                        ///

                        ///

                        if (!_model.isLoading)
                          Expanded(
                            child: Builder(
                              builder: (context) {
                                final players = DashboardGroup.positionlistCall
                                        .positionList(
                                          rankingPagePositionlistResponse
                                              .jsonBody,
                                        )
                                        ?.toList() ??
                                    [];
                                _model.debugGeneratorVariables[
                                        'players${players.length > 100 ? ' (first 100)' : ''}'] =
                                    debugSerializeParam(
                                  players.take(100),
                                  ParamType.JSON,
                                  isList: true,
                                  link:
                                      'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=rankingPage',
                                  name: 'dynamic',
                                  nullable: false,
                                );
                                debugLogWidgetClass(_model);

                                return ReorderableListView.builder(
                                  padding: EdgeInsets.zero,
                                  proxyDecorator: (Widget child, int index,
                                          Animation<double> animation) =>
                                      Material(
                                          color: Colors.transparent,
                                          child: child),
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: players.length,
                                  itemBuilder: (context, playersIndex) {
                                    final playersItem = players[playersIndex];
                                    return Container(
                                      key: ValueKey("ListView_1woyhxpx" +
                                          '_' +
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
                                                  alignment:
                                                      AlignmentDirectional(
                                                          valueOrDefault<
                                                              double>(
                                                            MediaQuery.sizeOf(
                                                                            context)
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
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .peach,
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                        child: Align(
                                                          alignment:
                                                              const AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: Text(
                                                            getJsonField(
                                                              playersItem,
                                                              r'''$.position''',
                                                            ).toString(),
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
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
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
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                14.0,
                                                                14.0,
                                                                14.0,
                                                                14.0),
                                                        child: Row(
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
                                                                  MainAxisSize
                                                                      .max,
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
                                                                    shape: BoxShape
                                                                        .circle,
                                                                  ),
                                                                  child: Image.network(
                                                                      getJsonField(
                                                                        playersItem,
                                                                        r'''$.player.image''',
                                                                      ),
                                                                      fit: BoxFit.fitHeight,
                                                                      errorBuilder: (context, error, stackTrace) => Image.asset(
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
                                                                    padding: const EdgeInsetsDirectional
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
                                                                            playersItem,
                                                                            r'''$.player.first_name''',
                                                                          ).toString()} ${getJsonField(
                                                                            playersItem,
                                                                            r'''$.player.last_name''',
                                                                          ).toString()}'
                                                                              .maybeHandleOverflow(
                                                                            maxChars:
                                                                                14,
                                                                            replacement:
                                                                                '…',
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .titleLarge
                                                                              .override(
                                                                                font: GoogleFonts.poppins(
                                                                                  fontWeight: FlutterFlowTheme.of(context).titleLarge.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                                                                                ),
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FlutterFlowTheme.of(context).titleLarge.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                                                                              ),
                                                                        ),
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Text(
                                                                              'Age :',
                                                                              style: FlutterFlowTheme.of(context).titleLarge.override(
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
                                                                            Padding(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 0.0, 0.0),
                                                                              child: Text(
                                                                                getJsonField(
                                                                                  playersItem,
                                                                                  r'''$.player.age''',
                                                                                ).toString(),
                                                                                style: FlutterFlowTheme.of(context).titleLarge.override(
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
                                                                    padding: const EdgeInsetsDirectional
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
                                                                        Text(
                                                                          getJsonField(
                                                                            playersItem,
                                                                            r'''$.player.position_name''',
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
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: const EdgeInsetsDirectional
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
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Text(
                                                                              'Jersey Number : ',
                                                                              textAlign: TextAlign.start,
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
                                                                            Text(
                                                                              ' #',
                                                                              textAlign: TextAlign.start,
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
                                                                            Padding(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(1.0, 0.0, 0.0, 0.0),
                                                                              child: Text(
                                                                                getJsonField(
                                                                                  playersItem,
                                                                                  r'''$.player.jersey_number''',
                                                                                ).toString(),
                                                                                textAlign: TextAlign.start,
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
                                  onReorder: (int reorderableOldIndex,
                                      int reorderableNewIndex) async {
                                    _model.apiResult156 = await DashboardGroup
                                        .rankingPostCall
                                        .call(
                                      position: reorderableNewIndex,
                                      authToken: FFAppState().authToken,
                                      playerId: getJsonField(
                                        players.elementAtOrNull(
                                            reorderableOldIndex),
                                        r'''$.player.player_id''',
                                      ),
                                    );

                                    if ((_model.apiResult156?.succeeded ??
                                        true)) {
                                      safeSetState(() =>
                                          _model.apiRequestCompleter = null);
                                      await _model.waitForApiRequestCompleted();
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            getJsonField(
                                              (_model.apiResult156?.jsonBody ??
                                                  ''),
                                              r'''$.message''',
                                            ).toString(),
                                            style: const TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          duration: const Duration(
                                              milliseconds: 2000),
                                          backgroundColor: Colors.black,
                                        ),
                                      );
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            getJsonField(
                                              (_model.apiResult156?.jsonBody ??
                                                  ''),
                                              r'''$.message''',
                                            ).toString(),
                                            style: const TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          duration: const Duration(
                                              milliseconds: 2000),
                                          backgroundColor: Colors.black,
                                        ),
                                      );

                                      safeSetState(() {});
                                      return;
                                    }

                                    safeSetState(() =>
                                        _model.apiRequestCompleter = null);
                                    await _model.waitForApiRequestCompleted(
                                        minWait: 1000, maxWait: 1200);

                                    safeSetState(() {});
                                  },
                                );
                              },
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
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
                        Container(
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
                                  // Navigate to the save progress ranking screen
                                  context.pushNamed(
                                      SaveProgressRankingWidget.routeName);
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
                            child:

                                // FFButtonWidget(
                                //   onPressed: () async {
                                //     _model.apiResultxjo = await DashboardGroup
                                //         .finalizeRankingCall
                                //         .call(
                                //       authToken: FFAppState().authToken,
                                //     );
                                //
                                //     if ((_model.apiResultxjo?.succeeded ?? true)) {
                                //       ScaffoldMessenger.of(context).showSnackBar(
                                //         SnackBar(
                                //           content: Text(
                                //             getJsonField(
                                //               (_model.apiResultxjo?.jsonBody ?? ''),
                                //               r'''$.message''',
                                //             ).toString(),
                                //             style: const TextStyle(
                                //               color: Colors.white,
                                //             ),
                                //           ),
                                //           duration:
                                //               const Duration(milliseconds: 1000),
                                //           backgroundColor: Colors.black,
                                //         ),
                                //       );
                                //     } else {
                                //       ScaffoldMessenger.of(context).showSnackBar(
                                //         SnackBar(
                                //           content: Text(
                                //             getJsonField(
                                //               (_model.apiResultxjo?.jsonBody ?? ''),
                                //               r'''$.message''',
                                //             ).toString(),
                                //             style: const TextStyle(
                                //               color: Colors.white,
                                //             ),
                                //           ),
                                //           duration:
                                //               const Duration(milliseconds: 1000),
                                //           backgroundColor: Colors.black,
                                //         ),
                                //       );
                                //     }
                                //
                                //     safeSetState(() {});
                                //   },
                                //   text: 'Finalize',
                                //   options: FFButtonOptions(
                                //     height: 40.0,
                                //     padding: const EdgeInsetsDirectional.fromSTEB(
                                //         16.0, 0.0, 16.0, 0.0),
                                //     iconPadding:
                                //         const EdgeInsetsDirectional.fromSTEB(
                                //             0.0, 0.0, 0.0, 0.0),
                                //     color: const Color(0x00CD4A20),
                                //     textStyle: FlutterFlowTheme.of(context)
                                //         .titleSmall
                                //         .override(
                                //           font: GoogleFonts.poppins(
                                //             fontWeight: FontWeight.w500,
                                //             fontStyle: FlutterFlowTheme.of(context)
                                //                 .titleSmall
                                //                 .fontStyle,
                                //           ),
                                //           color: Colors.white,
                                //           letterSpacing: 0.0,
                                //           fontWeight: FontWeight.w500,
                                //           fontStyle: FlutterFlowTheme.of(context)
                                //               .titleSmall
                                //               .fontStyle,
                                //         ),
                                //     elevation: 0.0,
                                //     borderRadius: BorderRadius.circular(8.0),
                                //   ),
                                // ),

                                ///2
                                // FFButtonWidget(
                                //   onPressed: () async {
                                //     if (_model.selectedPlayerCount == null) {
                                //       await showDialog(
                                //         context: context,
                                //         barrierDismissible: false,
                                //         builder: (alertDialogContext) {
                                //           return BackdropFilter(
                                //             filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                                //             child: AlertDialog(
                                //               backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
                                //               shape: RoundedRectangleBorder(
                                //                 borderRadius: BorderRadius.circular(16),
                                //                 side: BorderSide(
                                //                   color: (Theme.of(context).brightness == Brightness.dark)
                                //                       ? const Color(0xFF4E4E4E)
                                //                       : Colors.transparent,
                                //                   width: 1,
                                //                 ),
                                //               ),
                                //               title: Text(
                                //                 'Selection Required',
                                //                 style: FlutterFlowTheme.of(context).headlineMedium.override(
                                //                   fontFamily: 'Poppins',
                                //                   color: FlutterFlowTheme.of(context).primaryText,
                                //                   fontSize: 20,
                                //                   fontWeight: FontWeight.w600,
                                //                 ),
                                //               ),
                                //               content: Text(
                                //                 'Please select how many players you want to rank',
                                //                 style: FlutterFlowTheme.of(context).bodyMedium.override(
                                //                   fontFamily: 'Poppins',
                                //                   color: FlutterFlowTheme.of(context).secondaryText,
                                //                   fontSize: 14,
                                //                 ),
                                //               ),
                                //               actions: [
                                //                 TextButton(
                                //                   onPressed: () => Navigator.pop(alertDialogContext),
                                //                   child: Container(
                                //                     padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                //                     decoration: BoxDecoration(
                                //                       color: FlutterFlowTheme.of(context).primary,
                                //                       borderRadius: BorderRadius.circular(8),
                                //                     ),
                                //                     child: Text(
                                //                       'OK',
                                //                       style: FlutterFlowTheme.of(context).titleSmall.override(
                                //                         fontFamily: 'Poppins',
                                //                         color: Colors.white,
                                //                         fontSize: 14,
                                //                         fontWeight: FontWeight.w500,
                                //                       ),
                                //                     ),
                                //                   ),
                                //                 ),
                                //               ],
                                //               elevation: 5,
                                //             ),
                                //           );
                                //         },
                                //       );
                                //       return;
                                //     }
                                //
                                //     print('Selected player count: ${_model.selectedPlayerCount}');
                                //
                                //     _model.apiResultxjo = await DashboardGroup.finalizeRankingCall.call(
                                //       authToken: FFAppState().authToken,
                                //     );
                                //
                                //     if ((_model.apiResultxjo?.succeeded ?? true)) {
                                //       ScaffoldMessenger.of(context).showSnackBar(
                                //         SnackBar(
                                //           content: Text(
                                //             getJsonField(
                                //               (_model.apiResultxjo?.jsonBody ?? ''),
                                //               r'''$.message''',
                                //             ).toString(),
                                //             style: const TextStyle(
                                //               color: Colors.white,
                                //             ),
                                //           ),
                                //           duration: const Duration(milliseconds: 1000),
                                //           backgroundColor: Colors.black,
                                //         ),
                                //       );
                                //     } else {
                                //       ScaffoldMessenger.of(context).showSnackBar(
                                //         SnackBar(
                                //           content: Text(
                                //             getJsonField(
                                //               (_model.apiResultxjo?.jsonBody ?? ''),
                                //               r'''$.message''',
                                //             ).toString(),
                                //             style: const TextStyle(
                                //               color: Colors.white,
                                //             ),
                                //           ),
                                //           duration: const Duration(milliseconds: 1000),
                                //           backgroundColor: Colors.black,
                                //         ),
                                //       );
                                //     }
                                //
                                //     safeSetState(() {});
                                //   },
                                //   text: 'Finalize',
                                //   options: FFButtonOptions(
                                //     height: 40.0,
                                //     padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                //     iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                //     color: const Color(0x00CD4A20),
                                //     textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                //       font: GoogleFonts.poppins(
                                //         fontWeight: FontWeight.w500,
                                //         fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                //       ),
                                //       color: Colors.white,
                                //       letterSpacing: 0.0,
                                //       fontWeight: FontWeight.w500,
                                //       fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                //     ),
                                //     elevation: 0.0,
                                //     borderRadius: BorderRadius.circular(8.0),
                                //   ),
                                // ),

                                FFButtonWidget(
                              onPressed: () async {
                                if (_model.selectedPlayerCount == null) {
                                  await showDialog(
                                    context: context,
                                    barrierDismissible: false,
                                    builder: (alertDialogContext) {
                                      return BackdropFilter(
                                        filter: ImageFilter.blur(
                                            sigmaX: 5, sigmaY: 5),
                                        child: AlertDialog(
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(16),
                                            side: BorderSide(
                                              color: (Theme.of(context)
                                                          .brightness ==
                                                      Brightness.dark)
                                                  ? const Color(0xFF4E4E4E)
                                                  : Colors.transparent,
                                              width: 1,
                                            ),
                                          ),
                                          title: Text(
                                            'Selection Required',
                                            style: FlutterFlowTheme.of(context)
                                                .headlineMedium
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                          content: Text(
                                            'Please select how many players you want to rank',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  fontSize: 14,
                                                ),
                                          ),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext),
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 16,
                                                        vertical: 8),
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                child: Text(
                                                  'OK',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color: Colors.white,
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w500,
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
                                  return;
                                }

                                await showDialog(
                                  context: context,
                                  barrierDismissible: false,
                                  builder: (alertDialogContext) {
                                    return BackdropFilter(
                                      filter: ImageFilter.blur(
                                          sigmaX: 5, sigmaY: 5),
                                      child: AlertDialog(
                                        backgroundColor: Colors.transparent,
                                        insetPadding: EdgeInsets.zero,
                                        // ✅ Removes dialog default margin from screen edges
                                        contentPadding: EdgeInsets.zero,
                                        // ✅ Removes internal content padding
                                        content: Align(
                                          alignment: Alignment.center,
                                          child: Container(
                                            width: MediaQuery.sizeOf(context)
                                                .width, // ✅ Full screen width
                                            height: MediaQuery.sizeOf(context)
                                                    .height *
                                                0.42,
                                            decoration: const BoxDecoration(),
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 8.0),
                                                // Optional small margin
                                                child: Container(
                                                  width: double.infinity,
                                                  height:
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          0.38,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    boxShadow: const [
                                                      BoxShadow(
                                                        blurRadius: 3.0,
                                                        color:
                                                            Color(0x33000000),
                                                        offset:
                                                            Offset(0.0, 1.0),
                                                      )
                                                    ],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            24.0),
                                                    border: Border.all(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                      width: 1.0,
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                            0.0, 12.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                  24.0,
                                                                  16.0,
                                                                  24.0,
                                                                  16.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Align(
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                child: Lottie
                                                                    .asset(
                                                                  'assets/jsons/Bouncing_Basket_Ball.json',
                                                                  width: 100.0,
                                                                  height: 100.0,
                                                                  fit: BoxFit
                                                                      .contain,
                                                                  animate: true,
                                                                ),
                                                              ),
                                                              Align(
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                child: Padding(
                                                                  padding:
                                                                      const EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          8.0),
                                                                  child: Text(
                                                                    'Finalize Ranking',
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.poppins(
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                          ),
                                                                          color:
                                                                              Colors.black,
                                                                          fontSize:
                                                                              20.0,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Align(
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                child: Padding(
                                                                  padding:
                                                                      const EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                          0.0,
                                                                          12.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    'Are you sure you want to finalize your ranking for ${_model.selectedPlayerCount} players?',
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineLarge
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.poppins(
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                          ),
                                                                          color:
                                                                              Colors.black,
                                                                          fontSize:
                                                                              16.0,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                    24.0,
                                                                    0.0,
                                                                    24.0,
                                                                    10.0),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .end,
                                                              children: [
                                                                Container(
                                                                  width: 70.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: const Color(
                                                                        0x54808080),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            24.0),
                                                                  ),
                                                                  child:
                                                                      FFButtonWidget(
                                                                    onPressed:
                                                                        () async {
                                                                      Navigator.pop(
                                                                          alertDialogContext);
                                                                    },
                                                                    text: 'NO',
                                                                    options:
                                                                        FFButtonOptions(
                                                                      height:
                                                                          40.0,
                                                                      color: const Color(
                                                                          0x00FFFFFF),
                                                                      textStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .headlineLarge
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.poppins(
                                                                              fontWeight: FlutterFlowTheme.of(context).headlineLarge.fontWeight,
                                                                            ),
                                                                            color:
                                                                                Colors.black,
                                                                            fontSize:
                                                                                16.0,
                                                                          ),
                                                                      elevation:
                                                                          0.0,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              24.0),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding:
                                                                      const EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                          12.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      Container(
                                                                    width: 70.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              24.0),
                                                                    ),
                                                                    child:
                                                                    //     FFButtonWidget(
                                                                    //   onPressed:
                                                                    //       () async {
                                                                    //     Navigator.pop(
                                                                    //         alertDialogContext);
                                                                    //
                                                                    //     _model.apiResultxjo = await DashboardGroup
                                                                    //         .finalizeRankingCall
                                                                    //         .call(
                                                                    //       authToken:
                                                                    //           FFAppState().authToken,
                                                                    //     );
                                                                    //
                                                                    //     final message =
                                                                    //         getJsonField(
                                                                    //       (_model.apiResultxjo?.jsonBody ??
                                                                    //           ''),
                                                                    //       r'''$.message''',
                                                                    //     ).toString();
                                                                    //
                                                                    //     ScaffoldMessenger.of(context)
                                                                    //         .showSnackBar(
                                                                    //       SnackBar(
                                                                    //         content:
                                                                    //             Text(message, style: const TextStyle(color: Colors.white)),
                                                                    //         duration:
                                                                    //             const Duration(milliseconds: 1000),
                                                                    //         backgroundColor:
                                                                    //             Colors.black,
                                                                    //       ),
                                                                    //     );
                                                                    //
                                                                    //     safeSetState(
                                                                    //         () {});
                                                                    //   },
                                                                    //   text:
                                                                    //       'YES',
                                                                    //   options:
                                                                    //       FFButtonOptions(
                                                                    //     height:
                                                                    //         40.0,
                                                                    //     color: FlutterFlowTheme.of(context)
                                                                    //         .primary,
                                                                    //     textStyle: FlutterFlowTheme.of(context)
                                                                    //         .headlineLarge
                                                                    //         .override(
                                                                    //           font: GoogleFonts.poppins(
                                                                    //             fontWeight: FlutterFlowTheme.of(context).headlineLarge.fontWeight,
                                                                    //           ),
                                                                    //           color: Colors.white,
                                                                    //           fontSize: 16.0,
                                                                    //         ),
                                                                    //     elevation:
                                                                    //         0.0,
                                                                    //     borderRadius:
                                                                    //         BorderRadius.circular(40.0),
                                                                    //   ),
                                                                    // ),

                                                                    ///2
                                                                    // FFButtonWidget(
                                                                    //   onPressed: () async {
                                                                    //     // Call API first
                                                                    //     _model.apiResultxjo = await DashboardGroup.finalizeRankingCall.call(
                                                                    //       authToken: FFAppState().authToken,
                                                                    //     );
                                                                    //
                                                                    //     // Print API response to console for debugging
                                                                    //     print('API Response: ${_model.apiResultxjo?.jsonBody}');
                                                                    //     print('Status Code: ${_model.apiResultxjo?.statusCode}');
                                                                    //     print('Succeeded: ${_model.apiResultxjo?.succeeded}');
                                                                    //
                                                                    //     // Extract message from API response
                                                                    //     final message = getJsonField(
                                                                    //       (_model.apiResultxjo?.jsonBody ?? ''),
                                                                    //       r'''$.message''',
                                                                    //     ).toString();
                                                                    //
                                                                    //     // Show a SnackBar with the message
                                                                    //     ScaffoldMessenger.of(context).showSnackBar(
                                                                    //       SnackBar(
                                                                    //         content: Text(
                                                                    //           message,
                                                                    //           style: const TextStyle(color: Colors.white),
                                                                    //         ),
                                                                    //         duration: const Duration(milliseconds: 1000),
                                                                    //         backgroundColor: Colors.black,
                                                                    //       ),
                                                                    //     );
                                                                    //
                                                                    //     // Close the dialog
                                                                    //     Navigator.pop(alertDialogContext);
                                                                    //
                                                                    //     // Refresh the UI if needed
                                                                    //     safeSetState(() {});
                                                                    //   },
                                                                    //   text: 'YES',
                                                                    //   options: FFButtonOptions(
                                                                    //     height: 40.0,
                                                                    //     color: FlutterFlowTheme.of(context).primary,
                                                                    //     textStyle: FlutterFlowTheme.of(context).headlineLarge.override(
                                                                    //       font: GoogleFonts.poppins(
                                                                    //         fontWeight: FlutterFlowTheme.of(context).headlineLarge.fontWeight,
                                                                    //       ),
                                                                    //       color: Colors.white,
                                                                    //       fontSize: 16.0,
                                                                    //     ),
                                                                    //     elevation: 0.0,
                                                                    //     borderRadius: BorderRadius.circular(40.0),
                                                                    //   ),
                                                                    // ),

                                                                        ///3
                                                                    FFButtonWidget(
                                                                      onPressed: () async {
                                                                        // Call the API first
                                                                        _model.apiResultxjo = await DashboardGroup.finalizeRankingCall.call(
                                                                          authToken: FFAppState().authToken,
                                                                        );

                                                                        // Print logs for debugging
                                                                        print('API Response: ${_model.apiResultxjo?.jsonBody}');
                                                                        print('Status Code: ${_model.apiResultxjo?.statusCode}');
                                                                        print('Succeeded: ${_model.apiResultxjo?.succeeded}');

                                                                        // Extract message
                                                                        final message = getJsonField(
                                                                          (_model.apiResultxjo?.jsonBody ?? ''),
                                                                          r'''$.message''',
                                                                        ).toString();

                                                                        // Close the current confirmation dialog
                                                                        Navigator.pop(alertDialogContext);

                                                                        // Show API result in a new alert dialog
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
                                                                                  width: MediaQuery.sizeOf(context).width * 0.8, // 80% of screen width
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
                                                                                          color: Colors.black, // ✅ message in red
                                                                                        ),
                                                                                      ),
                                                                                      const SizedBox(height: 24),
                                                                                      FFButtonWidget(
                                                                                        onPressed: () => Navigator.pop(context),
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

                                                                        // Refresh UI if needed
                                                                        safeSetState(() {});
                                                                      },
                                                                      text: 'YES',
                                                                      options: FFButtonOptions(
                                                                        height: 40.0,
                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                        textStyle: FlutterFlowTheme.of(context).headlineLarge.override(
                                                                          font: GoogleFonts.poppins(
                                                                            fontWeight: FlutterFlowTheme.of(context).headlineLarge.fontWeight,
                                                                          ),
                                                                          color: Colors.white,
                                                                          fontSize: 16.0,
                                                                        ),
                                                                        elevation: 0.0,
                                                                        borderRadius: BorderRadius.circular(40.0),
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
                                              ),
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
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                iconPadding:
                                    const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                color: const Color(0x00CD4A20),
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      font: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontStyle,
                                      ),
                                      color: Colors.white,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
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
                if (_model.isLoading)
                  Align(
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          0.0, 80.0, 0.0, 0.0),
                      child: Container(
                        width: 100.0,
                        height: 100.0,
                        child: const custom_widgets.CubeGridLoader(
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
