import 'package:http/http.dart' as http;
import 'package:vote_for_goat/custom_code/widgets/cube_grid_loader.dart';

import '/backend/api_requests/api_calls.dart';
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
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'contest_page_model.dart';
export 'contest_page_model.dart';

class ContestPageWidget extends StatefulWidget {
  const ContestPageWidget({super.key});

  static String routeName = 'ContestPage';
  static String routePath = '/contestPage';

  @override
  State<ContestPageWidget> createState() => _ContestPageWidgetState();
}

class _ContestPageWidgetState extends State<ContestPageWidget>
    with TickerProviderStateMixin, RouteAware {
  late ContestPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ContestPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.isLoading = true;
      safeSetState(() {});
      await Future.wait([
        Future(() async {}),
        Future(() async {
          _model.completedContestRes =
              await DashboardGroup.completedContestCall.call(
            authToken: FFAppState().authToken,
          );

          if ((_model.completedContestRes?.succeeded ?? true)) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  getJsonField(
                    (_model.completedContestRes?.jsonBody ?? ''),
                    r'''$.message''',
                  ).toString(),
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
                duration: const Duration(milliseconds: 2200),
                backgroundColor: Colors.black,
              ),
            );
            _model.isLoading = false;
            safeSetState(() {});
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  getJsonField(
                    (_model.completedContestRes?.jsonBody ?? ''),
                    r'''$.message''',
                  ).toString(),
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
                duration: const Duration(milliseconds: 2200),
                backgroundColor: Colors.black,
              ),
            );
            _model.isLoading = false;
            safeSetState(() {});
          }
        }),
      ]);
    });



    ///



    ///
    _model.searchContestTextController ??= TextEditingController()
      ..addListener(() {
        debugLogWidgetClass(_model);
      });
    _model.searchContestFocusNode ??= FocusNode();

    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )
      ..addListener(() => safeSetState(() {}))
      ..addListener(() {
        debugLogWidgetClass(_model);
      });
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);

    _model.dispose();

    super.dispose();
  }

  @override
  void didUpdateWidget(ContestPageWidget oldWidget) {
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
            ..complete(DashboardGroup.contestListCall.call(
              authToken: FFAppState().authToken,
              search: _model.searchContestTextController.text,
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
        final contestPageContestListResponse = snapshot.data!;
        _model.debugBackendQueries[
                'DashboardGroup.contestListCall_statusCode_Scaffold_xd0r1w0t'] =
            debugSerializeParam(
          contestPageContestListResponse.statusCode,
          ParamType.int,
          link:
              'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=ContestPage',
          name: 'int',
          nullable: false,
        );
        _model.debugBackendQueries[
                'DashboardGroup.contestListCall_responseBody_Scaffold_xd0r1w0t'] =
            debugSerializeParam(
          contestPageContestListResponse.bodyText,
          ParamType.String,
          link:
              'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=ContestPage',
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
            body: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    Theme.of(context).brightness == Brightness.dark
                        ? 'assets/images/forgotBg.png'
                        : 'assets/images/plain_whiteBg.png',
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(
                      16.0, 40.0, 16.0, 0.0),
                  child: SingleChildScrollView(
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
                                      ? Colors.transparent
                                      : const Color(0xD5999999),
                                ),
                              ),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.safePop();
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
                                  'Con',
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
                                Text(
                                  't',
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
                                Text(
                                  'est',
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
                              ],
                            ),
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
                                      ? Colors.transparent
                                      : const Color(0xD5999999),
                                ),
                              ),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context
                                      .pushNamed(AboutScreenWidget.routeName);
                                },
                                child: Icon(
                                  FFIcons.kessentialUi1,
                                  color: FlutterFlowTheme.of(context).tertiary,
                                  size: 24.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          decoration: const BoxDecoration(),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 16.0, 0.0, 0.0),
                            child: Container(
                              width: double.infinity,
                              child: TextFormField(
                                controller: _model.searchContestTextController,
                                focusNode: _model.searchContestFocusNode,
                                onChanged: (_) => EasyDebounce.debounce(
                                  '_model.searchContestTextController',
                                  const Duration(milliseconds: 2000),
                                  () async {
                                    safeSetState(() =>
                                        _model.apiRequestCompleter = null);
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
                                  hintText: 'Search contest...',
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
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  filled: true,
                                  fillColor: (Theme.of(context).brightness ==
                                              Brightness.dark) ==
                                          true
                                      ? const Color(0x80050505)
                                      : const Color(0x0C050505),
                                  prefixIcon: Icon(
                                    Icons.search_rounded,
                                    color:
                                        FlutterFlowTheme.of(context).tertiary,
                                    size: 18.0,
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
                                    .searchContestTextControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          decoration: const BoxDecoration(),
                          child: Container(
                            height: MediaQuery.sizeOf(context).height * 0.8,
                            child: Column(
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
                                    tabs: [
                                      const Tab(
                                        text: 'Active',
                                      ),
                                      const Tab(
                                        text: 'Completed',
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
                                      Container(
                                        height: 60.0,
                                        decoration: const BoxDecoration(),
                                        child: Builder(
                                          builder: (context) {
                                            final contestList =
                                                DashboardGroup.contestListCall
                                                        .contestList(
                                                          contestPageContestListResponse
                                                              .jsonBody,
                                                        )
                                                        ?.toList() ??
                                                    [];
                                            if (contestList.isEmpty) {
                                              return Center(
                                                child: Container(
                                                  height:
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          0.2,
                                                  child:
                                                      const NoDataFoundWidget(),
                                                ),
                                              );
                                            }
                                            _model.debugGeneratorVariables[
                                                    'contestList${contestList.length > 100 ? ' (first 100)' : ''}'] =
                                                debugSerializeParam(
                                              contestList.take(100),
                                              ParamType.JSON,
                                              isList: true,
                                              link:
                                                  'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=ContestPage',
                                              name: 'dynamic',
                                              nullable: false,
                                            );
                                            debugLogWidgetClass(_model);

                                            return ListView.builder(
                                              padding: EdgeInsets.zero,
                                              shrinkWrap: true,
                                              scrollDirection: Axis.vertical,
                                              itemCount: contestList.length,
                                              itemBuilder:
                                                  (context, contestListIndex) {
                                                final contestListItem =
                                                    contestList[
                                                        contestListIndex];
                                                return Padding(
                                                  padding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(
                                                          0.0, 20.0, 0.0, 0.0),
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      context.pushNamed(
                                                        ActiveContastDetailsWidget
                                                            .routeName,
                                                        queryParameters: {
                                                          'contestId':
                                                              serializeParam(
                                                            getJsonField(
                                                              contestListItem,
                                                              r'''$.id''',
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
                                                            BorderRadius
                                                                .circular(15.0),
                                                        border: Border.all(
                                                          color: (Theme.of(context)
                                                                          .brightness ==
                                                                      Brightness
                                                                          .dark) ==
                                                                  true
                                                              ? const Color(
                                                                  0xFF4E4E4E)
                                                              : const Color(
                                                                  0xFFCCCCCC),
                                                        ),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(1.0,
                                                                0.0, 0.0, 0.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            ClipRRect(
                                                              borderRadius:
                                                                  const BorderRadius
                                                                      .only(
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        0.0),
                                                                bottomRight: Radius
                                                                    .circular(
                                                                        0.0),
                                                                topLeft: Radius
                                                                    .circular(
                                                                        12.0),
                                                                topRight: Radius
                                                                    .circular(
                                                                        12.0),
                                                              ),
                                                              child: Container(
                                                                width: double
                                                                    .infinity,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: (Theme.of(context).brightness ==
                                                                              Brightness
                                                                                  .dark) ==
                                                                          true
                                                                      ? const Color(
                                                                          0xFF3E2C25)
                                                                      : Colors
                                                                          .white,
                                                                  borderRadius:
                                                                      const BorderRadius
                                                                          .only(
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            0.0),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            0.0),
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            12.0),
                                                                    topRight: Radius
                                                                        .circular(
                                                                            12.0),
                                                                  ),
                                                                ),
                                                                child: Padding(
                                                                  padding:
                                                                      const EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                          16.0,
                                                                          16.0,
                                                                          16.0,
                                                                          16.0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Align(
                                                                            alignment:
                                                                                const AlignmentDirectional(-1.0, 0.0),
                                                                            child:
                                                                                Container(
                                                                              width: 60.0,
                                                                              height: 60.0,
                                                                              decoration: BoxDecoration(
                                                                                shape: BoxShape.circle,
                                                                                border: Border.all(
                                                                                  color: Colors.white,
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
                                                                                  errorBuilder: (context, error, stackTrace) => Image.asset('assets/images/error_image.webp', fit: BoxFit.fill),
                                                                                  // 'https://picsum.photos/seed/248/600',
                                                                                  getJsonField(
                                                                                    contestListItem,
                                                                                    r'''$.logo''',
                                                                                  ).toString(),
                                                                                  fit: BoxFit.cover,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Flexible(
                                                                            child:
                                                                                Align(
                                                                              alignment: const AlignmentDirectional(1.0, 1.0),
                                                                              child: Padding(
                                                                                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                                                                                child: InkWell(
                                                                                  splashColor: Colors.transparent,
                                                                                  focusColor: Colors.transparent,
                                                                                  hoverColor: Colors.transparent,
                                                                                  highlightColor: Colors.transparent,
                                                                                  // onTap: () async {
                                                                                  //   context.pushNamed(
                                                                                  //     ContestQuestionWidget.routeName,
                                                                                  //     queryParameters: {
                                                                                  //       'contestId': serializeParam(
                                                                                  //         getJsonField(
                                                                                  //           contestListItem,
                                                                                  //           r'''$.id''',
                                                                                  //         ),
                                                                                  //         ParamType.int,
                                                                                  //       ),
                                                                                  //     }.withoutNulls,
                                                                                  //   );
                                                                                  // },

                                                                                  onTap: ()


                                                                                  async {
                                                                                    await _showCountdownDialog(context, contestListItem);
                                                                                  },
                                                                                  // async {
                                                                                  //   final contestId = getJsonField(contestListItem, r'$.id');
                                                                                  //
                                                                                  //   final authToken = FFAppState().authToken;
                                                                                  //
                                                                                  //   // Optional: Show loader here
                                                                                  //
                                                                                  //   final response = await http.post(
                                                                                  //     Uri.parse('https://votethegoat.ezxdemo.com/api/contest-join'),
                                                                                  //     headers: {
                                                                                  //       'Content-Type': 'application/json',
                                                                                  //       'Authorization': 'Bearer $authToken',
                                                                                  //     },
                                                                                  //     body: '{"contest_id": $contestId}',
                                                                                  //   );
                                                                                  //
                                                                                  //   // Optional: Hide loader here
                                                                                  //
                                                                                  //   if (response.statusCode == 200) {
                                                                                  //     print('Join successful: ${response.body}');
                                                                                  //     // Navigate or show success message
                                                                                  //   } else {
                                                                                  //     print('Join failed: ${response.body}');
                                                                                  //     // Show error message
                                                                                  //   }
                                                                                  //
                                                                                  //   print('Contest ID: $contestId');
                                                                                  //   context.pushNamed(
                                                                                  //     ContestQuestionWidget.routeName,
                                                                                  //     queryParameters: {
                                                                                  //       'contestId': serializeParam(
                                                                                  //         contestId,
                                                                                  //         ParamType.int,
                                                                                  //       ),
                                                                                  //     }.withoutNulls,
                                                                                  //   );
                                                                                  // },

                                                                                  child: Container(
                                                                                    decoration: BoxDecoration(
                                                                                      color: const Color(0xFF038500),
                                                                                      borderRadius: BorderRadius.circular(12.0),
                                                                                    ),
                                                                                    child: Padding(
                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(12.0, 6.0, 12.0, 6.0),
                                                                                      child: Text(
                                                                                        'Join Contest',
                                                                                        style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                              font: GoogleFonts.poppins(
                                                                                                fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                              ),
                                                                                              color: Colors.white,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Align(
                                                                        alignment: const AlignmentDirectional(
                                                                            -1.0,
                                                                            0.0),
                                                                        child:
                                                                            Padding(
                                                                          padding: const EdgeInsetsDirectional
                                                                              .fromSTEB(
                                                                              0.0,
                                                                              10.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            getJsonField(
                                                                              contestListItem,
                                                                              r'''$.title''',
                                                                            ).toString(),
                                                                            style: FlutterFlowTheme.of(context).titleLarge.override(
                                                                                  font: GoogleFonts.poppins(
                                                                                    fontWeight: FontWeight.w600,
                                                                                    fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                                                                                  ),
                                                                                  fontSize: 15.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w600,
                                                                                  fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            ClipRRect(
                                                              borderRadius:
                                                                  const BorderRadius
                                                                      .only(
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        12.0),
                                                                bottomRight: Radius
                                                                    .circular(
                                                                        12.0),
                                                                topLeft: Radius
                                                                    .circular(
                                                                        0.0),
                                                                topRight: Radius
                                                                    .circular(
                                                                        0.0),
                                                              ),
                                                              child: Container(
                                                                width: double
                                                                    .infinity,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: (Theme.of(context).brightness ==
                                                                              Brightness
                                                                                  .dark) ==
                                                                          true
                                                                      ? const Color(
                                                                          0xFF1D1D23)
                                                                      : Colors
                                                                          .white,
                                                                  borderRadius:
                                                                      const BorderRadius
                                                                          .only(
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            12.0),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            12.0),
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            0.0),
                                                                    topRight: Radius
                                                                        .circular(
                                                                            0.0),
                                                                  ),
                                                                ),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Padding(
                                                                      padding: const EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                          0.0,
                                                                          10.0,
                                                                          0.0,
                                                                          10.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.start,
                                                                        children: [
                                                                          Padding(
                                                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                                                16.0,
                                                                                0.0,
                                                                                16.0,
                                                                                0.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                const Icon(
                                                                                  Icons.groups_rounded,
                                                                                  color: Color(0xFFC0C0C0),
                                                                                  size: 18.0,
                                                                                ),
                                                                                Padding(
                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                  child: Text(
                                                                                    '${getJsonField(
                                                                                      contestListItem,
                                                                                      r'''$.participants''',
                                                                                    ).toString()} Participants',
                                                                                    style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                          font: GoogleFonts.poppins(
                                                                                            fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                                                            fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                                          ),
                                                                                          fontSize: 13.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                                                          fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          Expanded(
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                const Icon(
                                                                                  Icons.access_time_sharp,
                                                                                  color: Color(0xFFC0C0C0),
                                                                                  size: 18.0,
                                                                                ),
                                                                                Padding(
                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                  child: Text(
                                                                                    getJsonField(
                                                                                      contestListItem,
                                                                                      r'''$.days_remaining''',
                                                                                    ).toString(),
                                                                                    style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                          font: GoogleFonts.poppins(
                                                                                            fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                                                            fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                                          ),
                                                                                          fontSize: 13.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                                                          fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
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
                                                                      padding: const EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                          0.0,
                                                                          10.0,
                                                                          0.0,
                                                                          10.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.start,
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                                Padding(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  const Icon(
                                                                                    Icons.tornado_sharp,
                                                                                    color: Color(0xFFC0C0C0),
                                                                                    size: 18.0,
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                    child: Text(
                                                                                      'Difficulty :  ${getJsonField(
                                                                                        contestListItem,
                                                                                        r'''$.difficulty_type''',
                                                                                      ).toString()}',
                                                                                      style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                            font: GoogleFonts.poppins(
                                                                                              fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                                            ),
                                                                                            fontSize: 13.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                                                            fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                16.0,
                                                                                0.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                                                                  child: Text(
                                                                                    ' ${getJsonField(
                                                                                      contestListItem,
                                                                                      r'''$.bar_perc''',
                                                                                    ).toString()}',
                                                                                    style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                          font: GoogleFonts.poppins(
                                                                                            fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                                                            fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                                          ),
                                                                                          fontSize: 13.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                                                          fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                                Padding(
                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(3.0, 0.0, 3.0, 0.0),
                                                                                  child: Text(
                                                                                    '/',
                                                                                    style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                          font: GoogleFonts.poppins(
                                                                                            fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                                                            fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                                          ),
                                                                                          fontSize: 13.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                                                          fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                                Text(
                                                                                  '100%',
                                                                                  style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                        font: GoogleFonts.poppins(
                                                                                          fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                                                          fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                                        ),
                                                                                        fontSize: 13.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                                                        fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
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
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          10.0),
                                                                      child:
                                                                      //     LinearPercentIndicator(
                                                                      //   percent:
                                                                      //       0.8,
                                                                      //   lineHeight:
                                                                      //       8.0,
                                                                      //   animation:
                                                                      //       true,
                                                                      //   animateFromLastPercent:
                                                                      //       true,
                                                                      //   progressColor:
                                                                      //       FlutterFlowTheme.of(context).primary,
                                                                      //   backgroundColor: (Theme.of(context).brightness == Brightness.dark) ==
                                                                      //           true
                                                                      //       ? const Color(0xFF39393D)
                                                                      //       : const Color(0xFFD5D5D5),
                                                                      //   center:
                                                                      //       Text(
                                                                      //     '',
                                                                      //     style: FlutterFlowTheme.of(context)
                                                                      //         .headlineSmall
                                                                      //         .override(
                                                                      //           font: GoogleFonts.poppins(
                                                                      //             fontWeight: FlutterFlowTheme.of(context).headlineSmall.fontWeight,
                                                                      //             fontStyle: FlutterFlowTheme.of(context).headlineSmall.fontStyle,
                                                                      //           ),
                                                                      //           letterSpacing: 0.0,
                                                                      //           fontWeight: FlutterFlowTheme.of(context).headlineSmall.fontWeight,
                                                                      //           fontStyle: FlutterFlowTheme.of(context).headlineSmall.fontStyle,
                                                                      //         ),
                                                                      //   ),
                                                                      //   barRadius: const Radius
                                                                      //       .circular(
                                                                      //       10.0),
                                                                      //   padding:
                                                                      //       EdgeInsets.zero,
                                                                      // ),

                                                                      LinearPercentIndicator(
                                                                        percent: double.parse(getJsonField(
                                                                          contestListItem,
                                                                          r'''$.bar_perc''',
                                                                        ).toString().replaceAll('%', '')) / 100,
                                                                        lineHeight: 8.0,
                                                                        animation: true,
                                                                        animateFromLastPercent: true,
                                                                        progressColor: FlutterFlowTheme.of(context).primary,
                                                                        backgroundColor: (Theme.of(context).brightness == Brightness.dark) == true
                                                                            ? const Color(0xFF39393D)
                                                                            : const Color(0xFFD5D5D5),
                                                                        center: Text(
                                                                          '',
                                                                          style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                            font: GoogleFonts.poppins(
                                                                              fontWeight: FlutterFlowTheme.of(context).headlineSmall.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).headlineSmall.fontStyle,
                                                                            ),
                                                                            letterSpacing: 0.0,
                                                                            fontWeight: FlutterFlowTheme.of(context).headlineSmall.fontWeight,
                                                                            fontStyle: FlutterFlowTheme.of(context).headlineSmall.fontStyle,
                                                                          ),
                                                                        ),
                                                                        barRadius: const Radius.circular(10.0),
                                                                        padding: EdgeInsets.zero,
                                                                      ),

                                                                    ),
                                                                    Padding(
                                                                      padding: const EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          10.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.start,
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                                Padding(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  ClipRRect(
                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                    child: SvgPicture.asset(
                                                                                      'assets/images/Group_(3).svg',
                                                                                      fit: BoxFit.cover,
                                                                                    ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                    child: Text(
                                                                                      'Points',
                                                                                      style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                            font: GoogleFonts.poppins(
                                                                                              fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                                            ),
                                                                                            fontSize: 13.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                                                            fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                16.0,
                                                                                0.0),
                                                                            child:
                                                                                Container(
                                                                              decoration: BoxDecoration(
                                                                                color: (Theme.of(context).brightness == Brightness.dark) == true ? const Color(0xFF39393D) : const Color(0xFFEBEBEB),
                                                                                borderRadius: BorderRadius.circular(50.0),
                                                                              ),
                                                                              child: Padding(
                                                                                padding: const EdgeInsetsDirectional.fromSTEB(6.0, 4.0, 6.0, 4.0),
                                                                                child: Text(
                                                                                  getJsonField(
                                                                                    contestListItem,
                                                                                    r'''$.rewards''',
                                                                                  ).toString(),
                                                                                  style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                        font: GoogleFonts.poppins(
                                                                                          fontWeight: FontWeight.w600,
                                                                                          fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                                        ),
                                                                                        color: const Color(0xFFDF7D35),
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w600,
                                                                                        fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
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
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                      Container(
                                        width: 100.0,
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.6,
                                        decoration: const BoxDecoration(),
                                        child: Builder(
                                          builder: (context) {
                                            final completedContestList =
                                                DashboardGroup
                                                        .completedContestCall
                                                        .completedContest(
                                                          (_model.completedContestRes
                                                                  ?.jsonBody ??
                                                              ''),
                                                        )
                                                        ?.toList() ??
                                                    [];
                                            if (completedContestList.isEmpty) {
                                              return Center(
                                                child: Container(
                                                  height:
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          0.2,
                                                  child:
                                                      const NoDataFoundWidget(),
                                                ),
                                              );
                                            }
                                            _model.debugGeneratorVariables[
                                                    'completedContestList${completedContestList.length > 100 ? ' (first 100)' : ''}'] =
                                                debugSerializeParam(
                                              completedContestList.take(100),
                                              ParamType.JSON,
                                              isList: true,
                                              link:
                                                  'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=ContestPage',
                                              name: 'dynamic',
                                              nullable: false,
                                            );
                                            debugLogWidgetClass(_model);

                                            return ListView.builder(
                                              padding: EdgeInsets.zero,
                                              shrinkWrap: true,
                                              scrollDirection: Axis.vertical,
                                              itemCount:
                                                  completedContestList.length,
                                              itemBuilder: (context,
                                                  completedContestListIndex) {
                                                final completedContestListItem =
                                                    completedContestList[
                                                        completedContestListIndex];
                                                return Padding(
                                                  padding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(
                                                          0.0, 20.0, 0.0, 0.0),
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      context.pushNamed(
                                                        ContestDetailsWidget
                                                            .routeName,
                                                        queryParameters: {
                                                          'contestId':
                                                              serializeParam(
                                                            getJsonField(
                                                              completedContestListItem,
                                                              r'''$.id''',
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
                                                            BorderRadius
                                                                .circular(15.0),
                                                        border: Border.all(
                                                          color: (Theme.of(context)
                                                                          .brightness ==
                                                                      Brightness
                                                                          .dark) ==
                                                                  true
                                                              ? const Color(
                                                                  0xFF4E4E4E)
                                                              : const Color(
                                                                  0xFFCCCCCC),
                                                        ),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(1.0,
                                                                0.0, 0.0, 0.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            ClipRRect(
                                                              borderRadius:
                                                                  const BorderRadius
                                                                      .only(
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        0.0),
                                                                bottomRight: Radius
                                                                    .circular(
                                                                        0.0),
                                                                topLeft: Radius
                                                                    .circular(
                                                                        12.0),
                                                                topRight: Radius
                                                                    .circular(
                                                                        12.0),
                                                              ),
                                                              child: Container(
                                                                width: double
                                                                    .infinity,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: (Theme.of(context).brightness ==
                                                                              Brightness
                                                                                  .dark) ==
                                                                          true
                                                                      ? const Color(
                                                                          0xFF3E2C25)
                                                                      : Colors
                                                                          .white,
                                                                  borderRadius:
                                                                      const BorderRadius
                                                                          .only(
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            0.0),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            0.0),
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            12.0),
                                                                    topRight: Radius
                                                                        .circular(
                                                                            12.0),
                                                                  ),
                                                                ),
                                                                child: Padding(
                                                                  padding:
                                                                      const EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                          16.0,
                                                                          16.0,
                                                                          16.0,
                                                                          16.0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Align(
                                                                            alignment:
                                                                                const AlignmentDirectional(-1.0, 0.0),
                                                                            child:
                                                                                Container(
                                                                              width: 60.0,
                                                                              height: 60.0,
                                                                              decoration: BoxDecoration(
                                                                                shape: BoxShape.circle,
                                                                                border: Border.all(
                                                                                  color: Colors.white,
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
                                                                                  'https://picsum.photos/seed/248/600',
                                                                                  fit: BoxFit.cover,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Align(
                                                                        alignment: const AlignmentDirectional(
                                                                            -1.0,
                                                                            0.0),
                                                                        child:
                                                                            Padding(
                                                                          padding: const EdgeInsetsDirectional
                                                                              .fromSTEB(
                                                                              0.0,
                                                                              10.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            getJsonField(
                                                                              completedContestListItem,
                                                                              r'''$.title''',
                                                                            ).toString(),
                                                                            style: FlutterFlowTheme.of(context).titleLarge.override(
                                                                                  font: GoogleFonts.poppins(
                                                                                    fontWeight: FontWeight.w600,
                                                                                    fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                                                                                  ),
                                                                                  fontSize: 15.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w600,
                                                                                  fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            ClipRRect(
                                                              borderRadius:
                                                                  const BorderRadius
                                                                      .only(
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        12.0),
                                                                bottomRight: Radius
                                                                    .circular(
                                                                        12.0),
                                                                topLeft: Radius
                                                                    .circular(
                                                                        0.0),
                                                                topRight: Radius
                                                                    .circular(
                                                                        0.0),
                                                              ),
                                                              child: Container(
                                                                width: double
                                                                    .infinity,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: (Theme.of(context).brightness ==
                                                                              Brightness
                                                                                  .dark) ==
                                                                          true
                                                                      ? const Color(
                                                                          0xFF1D1D23)
                                                                      : Colors
                                                                          .white,
                                                                  borderRadius:
                                                                      const BorderRadius
                                                                          .only(
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            12.0),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            12.0),
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            0.0),
                                                                    topRight: Radius
                                                                        .circular(
                                                                            0.0),
                                                                  ),
                                                                ),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Padding(
                                                                      padding: const EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                          0.0,
                                                                          10.0,
                                                                          0.0,
                                                                          10.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.start,
                                                                        children: [
                                                                          Padding(
                                                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                                                16.0,
                                                                                0.0,
                                                                                16.0,
                                                                                0.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                const Icon(
                                                                                  Icons.groups_rounded,
                                                                                  color: Color(0xFFC0C0C0),
                                                                                  size: 18.0,
                                                                                ),
                                                                                Padding(
                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                  child: Text(
                                                                                    '${getJsonField(
                                                                                      completedContestListItem,
                                                                                      r'''$.participants''',
                                                                                    ).toString()} Participants',
                                                                                    style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                          font: GoogleFonts.poppins(
                                                                                            fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                                                            fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                                          ),
                                                                                          fontSize: 13.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                                                          fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          Expanded(
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                const Icon(
                                                                                  Icons.access_time_sharp,
                                                                                  color: Color(0xFFC0C0C0),
                                                                                  size: 18.0,
                                                                                ),
                                                                                Padding(
                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                  child: Text(
                                                                                    getJsonField(
                                                                                      completedContestListItem,
                                                                                      r'''$.days_remaining''',
                                                                                    ).toString(),
                                                                                    style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                          font: GoogleFonts.poppins(
                                                                                            fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                                                            fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                                          ),
                                                                                          fontSize: 13.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                                                          fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
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
                                                                      padding: const EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                          0.0,
                                                                          10.0,
                                                                          0.0,
                                                                          10.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.start,
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                                Padding(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  ClipRRect(
                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                    child: SvgPicture.asset(
                                                                                      'assets/images/Vector_(2).svg',
                                                                                      fit: BoxFit.cover,
                                                                                    ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                    child: Text(
                                                                                      'Your position',
                                                                                      style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                            font: GoogleFonts.poppins(
                                                                                              fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                                            ),
                                                                                            fontSize: 13.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                                                            fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                16.0,
                                                                                0.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                                                                  child: Text(
                                                                                    '80',
                                                                                    style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                          font: GoogleFonts.poppins(
                                                                                            fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                                                            fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                                          ),
                                                                                          fontSize: 13.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                                                          fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                                Padding(
                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(3.0, 0.0, 3.0, 0.0),
                                                                                  child: Text(
                                                                                    '/',
                                                                                    style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                          font: GoogleFonts.poppins(
                                                                                            fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                                                            fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                                          ),
                                                                                          fontSize: 13.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                                                          fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                                Text(
                                                                                  '100%',
                                                                                  style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                        font: GoogleFonts.poppins(
                                                                                          fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                                                          fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                                        ),
                                                                                        fontSize: 13.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                                                        fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
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
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          10.0),
                                                                      child:
                                                                          LinearPercentIndicator(
                                                                        percent:
                                                                            0.8,
                                                                        lineHeight:
                                                                            8.0,
                                                                        animation:
                                                                            true,
                                                                        animateFromLastPercent:
                                                                            true,
                                                                        progressColor:
                                                                            FlutterFlowTheme.of(context).primary,
                                                                        backgroundColor: (Theme.of(context).brightness == Brightness.dark) ==
                                                                                true
                                                                            ? const Color(0xFF39393D)
                                                                            : const Color(0xFFD5D5D5),
                                                                        center:
                                                                            Text(
                                                                          '50%',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .headlineSmall
                                                                              .override(
                                                                                font: GoogleFonts.poppins(
                                                                                  fontWeight: FlutterFlowTheme.of(context).headlineSmall.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).headlineSmall.fontStyle,
                                                                                ),
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FlutterFlowTheme.of(context).headlineSmall.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).headlineSmall.fontStyle,
                                                                              ),
                                                                        ),
                                                                        barRadius: const Radius
                                                                            .circular(
                                                                            10.0),
                                                                        padding:
                                                                            EdgeInsets.zero,
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: const EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          10.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.start,
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                                Padding(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  ClipRRect(
                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                    child: SvgPicture.asset(
                                                                                      'assets/images/Group_(3).svg',
                                                                                      fit: BoxFit.cover,
                                                                                    ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                    child: Text(
                                                                                      'Points Earned',
                                                                                      style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                            font: GoogleFonts.poppins(
                                                                                              fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                                            ),
                                                                                            fontSize: 13.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                                                            fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                16.0,
                                                                                0.0),
                                                                            child:
                                                                                Container(
                                                                              decoration: BoxDecoration(
                                                                                color: (Theme.of(context).brightness == Brightness.dark) == true ? const Color(0xFF39393D) : const Color(0xFFEBEBEB),
                                                                                borderRadius: BorderRadius.circular(50.0),
                                                                              ),
                                                                              child: Padding(
                                                                                padding: const EdgeInsetsDirectional.fromSTEB(6.0, 4.0, 6.0, 4.0),
                                                                                child: Text(
                                                                                  '${getJsonField(
                                                                                    completedContestListItem,
                                                                                    r'''$.rewards''',
                                                                                  ).toString()} Pts',
                                                                                  style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                        font: GoogleFonts.poppins(
                                                                                          fontWeight: FontWeight.w600,
                                                                                          fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                                        ),
                                                                                        color: const Color(0xFFDF7D35),
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w600,
                                                                                        fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
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
                                                          ],
                                                        ),
                                                      ),
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
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                if (_model.isLoading == true)
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



  // Future<void> _showCountdownDialog(BuildContext context, dynamic contestListItem) async {
  //   int countdown = 3;
  //   bool dialogClosed = false;
  //
  //   showDialog(
  //     context: context,
  //     barrierDismissible: false,
  //     builder: (BuildContext dialogContext) {
  //       return StatefulBuilder(
  //         builder: (context, setState) {
  //           // Start the countdown timer
  //           if (countdown > 0) {
  //             Timer(const Duration(seconds: 1), () {
  //               if (!dialogClosed && mounted) {
  //                 setState(() {
  //                   countdown--;
  //                 });
  //
  //                 // Auto-close dialog when countdown reaches 0
  //                 if (countdown == 0) {
  //                   dialogClosed = true;
  //                   Navigator.of(dialogContext).pop(true);
  //                 }
  //               }
  //             });
  //           }
  //
  //           return AlertDialog(
  //             backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
  //             shape: RoundedRectangleBorder(
  //               borderRadius: BorderRadius.circular(16.0),
  //             ),
  //             title: Text(
  //               'Are you ready to play?',
  //               style: FlutterFlowTheme.of(context).headlineSmall.override(
  //                 fontFamily: 'Poppins',
  //                 fontWeight: FontWeight.w600,
  //               ),
  //               textAlign: TextAlign.center,
  //             ),
  //             content: Column(
  //               mainAxisSize: MainAxisSize.min,
  //               children: [
  //
  //                 Container(
  //                   width: 80,
  //                   height: 80,
  //                   decoration: BoxDecoration(
  //                     shape: BoxShape.circle,
  //                     color: FlutterFlowTheme.of(context).primary,
  //                   ),
  //                   child: Center(
  //                     child: Text(
  //                       countdown > 0 ? countdown.toString() : 'GO!',
  //                       style: FlutterFlowTheme.of(context).headlineLarge.override(
  //                         fontFamily: 'Poppins',
  //                         color: Colors.white,
  //                         fontWeight: FontWeight.bold,
  //                         fontSize: 32,
  //                       ),
  //                     ),
  //                   ),
  //                 ),
  //                 // const SizedBox(height: 20),
  //                 // Text(
  //                 //   countdown > 0
  //                 //       ? 'Starting in $countdown second${countdown == 1 ? '' : 's'}...'
  //                 //       : 'Let\'s go!',
  //                 //   style: FlutterFlowTheme.of(context).bodySmall.override(
  //                 //     fontFamily: 'Poppins',
  //                 //     color: FlutterFlowTheme.of(context).secondaryText,
  //                 //   ),
  //                 //   textAlign: TextAlign.center,
  //                 // ),
  //               ],
  //             ),
  //             actions: [
  //               Row(
  //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                 children: [
  //                   if (countdown > 0)
  //                     TextButton(
  //                       onPressed: () {
  //                         dialogClosed = true;
  //                         Navigator.of(dialogContext).pop(false);
  //                       },
  //                       child: Text(
  //                         'no',
  //                         style: FlutterFlowTheme.of(context).bodyMedium.override(
  //                           fontFamily: 'Poppins',
  //                           color: FlutterFlowTheme.of(context).secondaryText,
  //                         ),
  //                       ),
  //                     ),
  //                   ElevatedButton(
  //                     onPressed: () {
  //                       dialogClosed = true;
  //                       Navigator.of(dialogContext).pop(true);
  //                     },
  //                     style: ElevatedButton.styleFrom(
  //                       backgroundColor: const Color(0xFF038500),
  //                       shape: RoundedRectangleBorder(
  //                         borderRadius: BorderRadius.circular(8.0),
  //                       ),
  //                     ),
  //                     child: Text(
  //                       countdown > 0 ? 'Yes' : 'Start',
  //                       style: const TextStyle(
  //                         color: Colors.white,
  //                         fontWeight: FontWeight.w600,
  //                       ),
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ],
  //           );
  //         },
  //       );
  //     },
  //   ).then((result) async {
  //     // Handle the result after dialog closes
  //     if (result == true) {
  //       await _joinContest(context, contestListItem);
  //     }
  //   });
  // }




  Future<void> _showCountdownDialog(BuildContext context, dynamic contestListItem) async {
    int countdown = 3;
    bool dialogClosed = false;
    Timer? timer;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext dialogContext) {
        return StatefulBuilder(
          builder: (context, setState) {
            // Start the countdown timer only if not already started
            if (countdown > 0 && timer == null) {
              timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
                if (!dialogClosed && mounted) {
                  setState(() {
                    countdown--;
                  });

                  // Auto-close dialog when countdown reaches 0
                  if (countdown == 0) {
                    dialogClosed = true;
                    t.cancel();
                    Navigator.of(dialogContext).pop(true);
                  }
                } else {
                  t.cancel();
                }
              });
            }

            return AlertDialog(
              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              title: Text(
                'Are you ready to play?',
                style: FlutterFlowTheme.of(context).headlineSmall.override(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 20),
                  // Circular Progress Timer
                  Container(
                    width: 120,
                    height: 120,
                    child: Stack(
                      children: [
                        // Background circle
                        Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey.withOpacity(0.2),
                          ),
                        ),
                        // Progress circle
                        SizedBox(
                          width: 120,
                          height: 120,
                          child: CircularProgressIndicator(
                            value: countdown > 0 ? (4 - countdown) / 3 : 1.0,
                            strokeWidth: 8.0,
                            backgroundColor: Colors.grey.withOpacity(0.3),
                            valueColor: AlwaysStoppedAnimation<Color>(
                              countdown > 0 ? const Color(0xFF038500) : Colors.green,
                            ),
                          ),
                        ),
                        // Center number/text
                        Positioned.fill(
                          child: Center(
                            child: Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 4,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Center(
                                child: Text(
                                  countdown > 0 ? countdown.toString() : 'GO!',
                                  style: FlutterFlowTheme.of(context).headlineLarge.override(
                                    fontFamily: 'Poppins',
                                    color: countdown > 0
                                        ? FlutterFlowTheme.of(context).primaryText
                                        : const Color(0xFF038500),
                                    fontWeight: FontWeight.bold,
                                    fontSize: countdown > 0 ? 36 : 24,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  // Optional subtitle text
                  if (countdown > 0)
                    Text(
                      'Contest starting in...',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Poppins',
                        color: FlutterFlowTheme.of(context).secondaryText,
                      ),
                      textAlign: TextAlign.center,
                    ),
                ],
              ),
              actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    if (countdown > 0)
                      TextButton(
                        onPressed: () {
                          dialogClosed = true;
                          timer?.cancel();
                          Navigator.of(dialogContext).pop(false);
                        },
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                        ),
                        child: Text(
                          'Cancel',
                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Poppins',
                            color: FlutterFlowTheme.of(context).secondaryText,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ElevatedButton(
                      onPressed: () {
                        dialogClosed = true;
                        timer?.cancel();
                        Navigator.of(dialogContext).pop(true);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF038500),
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      child: Text(
                        countdown > 0 ? 'Ready!' : 'Start Contest',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        );
      },
    ).then((result) async {
      timer?.cancel(); // Ensure timer is cancelled when dialog closes
      if (result == true) {
        await _joinContest(context, contestListItem);
      }
    });
  }

  Future<void> _joinContest(BuildContext context, dynamic contestListItem) async {
    final contestId = getJsonField(contestListItem, r'$.id');
    final authToken = FFAppState().authToken;

    try {
      // Show loading indicator
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(
          child: CubeGridLoader(size: 40.0),
        ),
      );

      final response = await http.post(
        Uri.parse('https://votethegoat.ezxdemo.com/api/contest-join'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $authToken',
        },
        body: '{"contest_id": $contestId}',
      );

      // Hide loading indicator
      Navigator.of(context).pop();

      if (response.statusCode == 200) {
        print('Join successful: ${response.body}');

        // Navigate to contest questions
        context.pushNamed(
          ContestQuestionWidget.routeName,
          queryParameters: {
            'contestId': serializeParam(
              contestId,
              ParamType.int,
            ),
          }.withoutNulls,
        );
      } else {
        print('Join failed: ${response.body}');
        // Show error message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to join contest. Please try again.'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      // Hide loading indicator if still showing
      Navigator.of(context).pop();
      print('Error joining contest: $e');

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('An error occurred. Please try again.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
