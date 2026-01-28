import '/backend/api_requests/api_calls.dart';
import '/components/gradient_button_custom/gradient_button_custom_widget.dart';
import '/components/no_data_found/no_data_found_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'about_screen_model.dart';
import 'package:flutter_html/flutter_html.dart';

export 'about_screen_model.dart';

class AboutScreenWidget extends StatefulWidget {
  const AboutScreenWidget({super.key});

  static String routeName = 'aboutScreen';
  static String routePath = '/aboutScreen';

  @override
  State<AboutScreenWidget> createState() => _AboutScreenWidgetState();
}

class _AboutScreenWidgetState extends State<AboutScreenWidget> with RouteAware {
  late AboutScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AboutScreenModel());
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);

    _model.dispose();

    super.dispose();
  }

  @override
  void didUpdateWidget(AboutScreenWidget oldWidget) {
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

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).oposite,
        body: SafeArea(top: false,
          bottom: true,
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  Theme.of(context).brightness == Brightness.dark
                      ? 'assets/images/Setting.png'
                      : 'assets/images/plain_whiteBg.png',
                  width: double.infinity,
                  fit: BoxFit.fitWidth,
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 40.0, 16.0, 0.0),
                child: SingleChildScrollView(
                  primary: false,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
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
                                color: FlutterFlowTheme.of(context).oposite,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 4.0,
                                    color: (Theme.of(context).brightness ==
                                                Brightness.dark) ==
                                            true
                                        ? const Color(0x00000000)
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
                                Icons.arrow_back_rounded,
                                color: FlutterFlowTheme.of(context).tertiary,
                                size: 24.0,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 40.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Align(
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Text(
                                      'About Vote',
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
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Align(
                                        alignment: const AlignmentDirectional(0.0, 0.0),
                                        child: Text(
                                          'The',
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
                                      ),
                                      Align(
                                        alignment: const AlignmentDirectional(0.0, 0.0),
                                        child: Text(
                                          ' Goat',
                                          style: FlutterFlowTheme.of(context)
                                              .customTextStyle1
                                              .override(
                                                fontFamily: 'good times',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .tertiary,
                                                fontSize: 24.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.normal,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: MediaQuery.sizeOf(context).height * 0.75,
                        decoration: const BoxDecoration(),
                        child: FutureBuilder<ApiCallResponse>(
                          future: DashboardGroup.aboutPageContentCall.call(
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
                            final listViewAboutPageContentResponse =
                                snapshot.data!;
                            _model.debugBackendQueries[
                                    'DashboardGroup.aboutPageContentCall_statusCode_ListView_ihn5i4jl'] =
                                debugSerializeParam(
                              listViewAboutPageContentResponse.statusCode,
                              ParamType.int,
                              link:
                                  'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=aboutScreen',
                              name: 'int',
                              nullable: false,
                            );
                            _model.debugBackendQueries[
                                    'DashboardGroup.aboutPageContentCall_responseBody_ListView_ihn5i4jl'] =
                                debugSerializeParam(
                              listViewAboutPageContentResponse.bodyText,
                              ParamType.String,
                              link:
                                  'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=aboutScreen',
                              name: 'String',
                              nullable: false,
                            );
                            debugLogWidgetClass(_model);
          
                            return Builder(
                              builder: (context) {
                                final listItems =
                                    DashboardGroup.aboutPageContentCall
                                            .contentList(
                                              listViewAboutPageContentResponse
                                                  .jsonBody,
                                            )
                                            ?.toList() ??
                                        [];
                                if (listItems.isEmpty) {
                                  return const Center(
                                    child: NoDataFoundWidget(),
                                  );
                                }
                                _model.debugGeneratorVariables[
                                        'listItems${listItems.length > 100 ? ' (first 100)' : ''}'] =
                                    debugSerializeParam(
                                  listItems.take(100),
                                  ParamType.JSON,
                                  isList: true,
                                  link:
                                      'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=aboutScreen',
                                  name: 'dynamic',
                                  nullable: false,
                                );
                                debugLogWidgetClass(_model);
          
                                return ListView.builder(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: listItems.length,
                                  itemBuilder: (context, listItemsIndex) {
                                    final listItemsItem =
                                        listItems[listItemsIndex];
                                    return Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 8.0, 0.0, 0.0),
                                      child: Container(
                                        width: double.infinity,
                                        decoration: const BoxDecoration(),
                                        child: Padding(
                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                              0.0, 30.0, 0.0, 0.0),
                                          child: ExpandableNotifier(
                                            initialExpanded: false,
                                            child: ExpandablePanel(
                                              header: Container(),
                                              collapsed: Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(12.0),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .homeBoxBorder,
                                                  ),
                                                ),
                                                child: Row(
                                                  mainAxisSize: MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  14.0,
                                                                  10.0,
                                                                  14.0,
                                                                  10.0),
                                                      child: Text(
                                                        getJsonField(
                                                          listItemsItem,
                                                          r'''$.title''',
                                                        )
                                                            .toString()
                                                            .maybeHandleOverflow(
                                                              maxChars: 32,
                                                              replacement: '…',
                                                            ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleMedium
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .poppins(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMedium
                                                                      .fontStyle,
                                                                ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(0.0, 0.0,
                                                                  14.0, 0.0),
                                                      child: Icon(
                                                        Icons.add,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tertiary,
                                                        size: 20.0,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              expanded: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    child: Container(
                                                      width: double.infinity,
                                                      decoration: BoxDecoration(
                                                        color: (Theme.of(context)
                                                                        .brightness ==
                                                                    Brightness
                                                                        .dark) ==
                                                                false
                                                            ? const Color(0xFFFFEDDF)
                                                            : Colors.transparent,
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                10.0),
                                                        border: Border.all(
                                                          color:
                                                              const Color(0x2AFFFFFF),
                                                        ),
                                                      ),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        14.0,
                                                                        10.0,
                                                                        14.0,
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
                                                                  getJsonField(
                                                                    listItemsItem,
                                                                    r'''$.title''',
                                                                  )
                                                                      .toString()
                                                                      .maybeHandleOverflow(
                                                                        maxChars:
                                                                            32,
                                                                        replacement:
                                                                            '…',
                                                                      ),
                                                                  maxLines: 2,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .poppins(
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .titleMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .titleMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(
                                                                                context)
                                                                            .titleMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(
                                                                                context)
                                                                            .titleMedium
                                                                            .fontStyle,
                                                                      ),
                                                                ),
                                                                Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    shape: BoxShape
                                                                        .circle,
                                                                    border: Border
                                                                        .all(
                                                                      color: const Color(
                                                                          0xFF2F2F2F),
                                                                    ),
                                                                  ),
                                                                  child: Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            4.0,
                                                                            4.0,
                                                                            4.0,
                                                                            4.0),
                                                                    child: FaIcon(
                                                                      FontAwesomeIcons
                                                                          .minus,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .tertiary,
                                                                      size: 12.0,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          // Padding(
                                                          //   padding:
                                                          //       const EdgeInsetsDirectional
                                                          //           .fromSTEB(
                                                          //               14.0,
                                                          //               10.0,
                                                          //               14.0,
                                                          //               10.0),
                                                          //   child: Text(
                                                          //     getJsonField(
                                                          //       listItemsItem,
                                                          //       r'''$.description''',
                                                          //     ).toString(),
                                                          //     style: FlutterFlowTheme
                                                          //             .of(context)
                                                          //         .bodySmall
                                                          //         .override(
                                                          //           font: GoogleFonts
                                                          //               .poppins(
                                                          //             fontWeight: FlutterFlowTheme.of(
                                                          //                     context)
                                                          //                 .bodySmall
                                                          //                 .fontWeight,
                                                          //             fontStyle: FlutterFlowTheme.of(
                                                          //                     context)
                                                          //                 .bodySmall
                                                          //                 .fontStyle,
                                                          //           ),
                                                          //           color: FlutterFlowTheme.of(
                                                          //                   context)
                                                          //               .lightWhite,
                                                          //           letterSpacing:
                                                          //               0.0,
                                                          //           fontWeight: FlutterFlowTheme.of(
                                                          //                   context)
                                                          //               .bodySmall
                                                          //               .fontWeight,
                                                          //           fontStyle: FlutterFlowTheme.of(
                                                          //                   context)
                                                          //               .bodySmall
                                                          //               .fontStyle,
                                                          //         ),
                                                          //   ),
                                                          // ),
          
                                                          Padding(
                                                            padding:  const EdgeInsetsDirectional.fromSTEB(14.0, 10.0, 14.0, 10.0),
                                                            child: Html(
                                                              data: getJsonField(
                                                                listItemsItem,
                                                                r'''$.description''',
                                                              ).toString(),
                                                              style: {
                                                                "body": Style(
                                                                  color: FlutterFlowTheme.of(context).lightWhite,
                                                                  fontSize: FontSize(FlutterFlowTheme.of(context).bodySmall.fontSize ??12),
                                                                  fontFamily: 'Poppins',
                                                                ),
                                                              },
                                                            ),
                                                          ),
          
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              theme: const ExpandableThemeData(
                                                tapHeaderToExpand: true,
                                                tapBodyToExpand: true,
                                                tapBodyToCollapse: true,
                                                headerAlignment:
                                                    ExpandablePanelHeaderAlignment
                                                        .top,
                                                hasIcon: false,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
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
              Align(
                alignment: const AlignmentDirectional(0.0, 1.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    context.pushNamed(SubscriptionPageWidget.routeName);
                  },
                  child: Container(
                    decoration: const BoxDecoration(),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 20.0),
                      child: wrapWithModel(
                        model: _model.gradientButtonCustomModel,
                        updateCallback: () => safeSetState(() {}),
                        child: Builder(builder: (_) {
                          return DebugFlutterFlowModelContext(
                            rootModel: _model.rootModel,
                            child: const GradientButtonCustomWidget(
                              text: 'PREMIUM PLANS',
                            ),
                          );
                        }),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
