import '/backend/api_requests/api_calls.dart';
import '/components/drawer_menu/drawer_menu_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
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

class _RankingPageWidgetState extends State<RankingPageWidget> {
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
        Duration(
          milliseconds: 2000,
        ),
      );
      _model.isLoading = false;
      safeSetState(() {});
    });

    _model.searchFieldTextController ??= TextEditingController();
    _model.searchFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
              child: DrawerMenuWidget(),
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
                alignment: Alignment(0.0, -1.0),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 40.0, 16.0, 0.0),
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
                                    ? Color(0x335D4E4E)
                                    : Colors.white,
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
                                  : Color(0xD5999999),
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
                                    fontFamily: 'goodtimes',
                                    color:
                                        FlutterFlowTheme.of(context).tertiary,
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
                                    fontFamily: 'goodtimes',
                                    color: Color(0xFFEB6027),
                                    fontSize: 28.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
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
                                        ? Color(0x335D4E4E)
                                        : Colors.white,
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
                                      : Color(0xD5999999),
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
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0,
                            valueOrDefault<double>(
                              MediaQuery.sizeOf(context).height * 0.04,
                              0.0,
                            ),
                            0.0,
                            valueOrDefault<double>(
                              MediaQuery.sizeOf(context).height * 0.04,
                              0.0,
                            )),
                        child: Text(
                          'Drag & Drop the Players and release them\nin the desired ranking position',
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
                                    color: (Theme.of(context).brightness ==
                                                Brightness.dark) ==
                                            true
                                        ? Colors.white
                                        : Color(0xBF000000),
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
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                      child: Container(
                        width: double.infinity,
                        child: TextFormField(
                          controller: _model.searchFieldTextController,
                          focusNode: _model.searchFieldFocusNode,
                          autofocus: false,
                          obscureText: false,
                          decoration: InputDecoration(
                            isDense: true,
                            labelStyle: FlutterFlowTheme.of(context)
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
                            hintText: 'Search player...',
                            hintStyle: FlutterFlowTheme.of(context)
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
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
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
                                ? Color(0x80050505)
                                : Color(0xFFE6E6E6),
                            prefixIcon: Icon(
                              Icons.search_rounded,
                              color: FlutterFlowTheme.of(context).tertiary,
                              size: 18.0,
                            ),
                          ),
                          style:
                              FlutterFlowTheme.of(context).labelMedium.override(
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
                          cursorColor: FlutterFlowTheme.of(context).primaryText,
                          validator: _model.searchFieldTextControllerValidator
                              .asValidator(context),
                        ),
                      ),
                    ),
                    if (!_model.isLoading)
                      Expanded(
                        child: FutureBuilder<ApiCallResponse>(
                          future: (_model.apiRequestCompleter ??= Completer<
                                  ApiCallResponse>()
                                ..complete(DashboardGroup.positionlistCall.call(
                                  authToken: FFAppState().authToken,
                                )))
                              .future,
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
                            final positionPositionlistResponse = snapshot.data!;

                            return Builder(
                              builder: (context) {
                                final players = DashboardGroup.positionlistCall
                                        .positionList(
                                          positionPositionlistResponse.jsonBody,
                                        )
                                        ?.toList() ??
                                    [];

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
                                        decoration: BoxDecoration(),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 8.0, 10.0, 8.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                              border: Border.all(
                                                color: (Theme.of(context)
                                                                .brightness ==
                                                            Brightness.dark) ==
                                                        true
                                                    ? Color(0xFF4E4E4E)
                                                    : Color(0xFFE6E6E6),
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
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(5.0, 0.0,
                                                                0.0, 0.0),
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
                                                              AlignmentDirectional(
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
                                                                  color: Color(
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
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(10.0, 10.0,
                                                          10.0, 10.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
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
                                                                      BoxDecoration(
                                                                    shape: BoxShape
                                                                        .circle,
                                                                  ),
                                                                  child: Image
                                                                      .network(
                                                                    'https://img.freepik.com/free-photo/close-up-portrait-curly-handsome-european-male_176532-8133.jpg?semt=ais_hybrid&w=740',
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
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
                                                                    padding: EdgeInsetsDirectional
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
                                                                            r'''$.first_name''',
                                                                          ).toString()}${getJsonField(
                                                                            playersItem,
                                                                            r'''$.last_name''',
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
                                                                                    color: (Theme.of(context).brightness == Brightness.dark) == true ? Color(0xFFCDCDCD) : Colors.black,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FlutterFlowTheme.of(context).titleLarge.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                                                                                  ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 0.0, 0.0),
                                                                              child: Text(
                                                                                getJsonField(
                                                                                  playersItem,
                                                                                  r'''$.age''',
                                                                                ).toString(),
                                                                                style: FlutterFlowTheme.of(context).titleLarge.override(
                                                                                      font: GoogleFonts.poppins(
                                                                                        fontWeight: FlutterFlowTheme.of(context).titleLarge.fontWeight,
                                                                                        fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                                                                                      ),
                                                                                      color: (Theme.of(context).brightness == Brightness.dark) == true ? Color(0xFFCDCDCD) : Colors.black,
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
                                                                    padding: EdgeInsetsDirectional
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
                                                                          'Center',
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
                                                                    padding: EdgeInsetsDirectional
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
                                                                              '#',
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
                                                                              padding: EdgeInsetsDirectional.fromSTEB(1.0, 0.0, 0.0, 0.0),
                                                                              child: Text(
                                                                                getJsonField(
                                                                                  playersItem,
                                                                                  r'''$.jersey_number''',
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
                                        r'''$.player_id''',
                                      ),
                                    );

                                    if ((_model.apiResult156?.succeeded ??
                                        true)) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            getJsonField(
                                              (_model.apiResult156?.jsonBody ??
                                                  ''),
                                              r'''$.message''',
                                            ).toString(),
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 2000),
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
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 2000),
                                          backgroundColor: Colors.black,
                                        ),
                                      );

                                      safeSetState(() {});
                                      return;
                                    }

                                    safeSetState(() =>
                                        _model.apiRequestCompleter = null);
                                    await _model.waitForApiRequestCompleted();

                                    safeSetState(() {});
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
              alignment: AlignmentDirectional(0.0, 0.92),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 70.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      height: 60.0,
                      decoration: BoxDecoration(
                        color:
                            (Theme.of(context).brightness == Brightness.dark) ==
                                    true
                                ? Color(0xFF2C2C2C)
                                : Color(0xFFE5E5E5),
                        borderRadius: BorderRadius.circular(12.0),
                        border: Border.all(
                          color: (Theme.of(context).brightness ==
                                      Brightness.dark) ==
                                  true
                              ? Color(0xFF4E4E4E)
                              : Color(0xFFB7B7B7),
                        ),
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              25.0, 13.0, 25.0, 13.0),
                          child: Text(
                            'Save Progress',
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
                      ),
                    ),
                    Container(
                      width: 10.0,
                      decoration: BoxDecoration(),
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
                                ? Color(0xFF4E4E4E)
                                : Colors.transparent,
                          ),
                        ),
                        child: Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                25.0, 13.0, 25.0, 13.0),
                            child: Text(
                              'Finalize',
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
                                    color: Colors.white,
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
                  ],
                ),
              ),
            ),
            if (!_model.isLoading)
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Container(
                  width: 100.0,
                  height: 100.0,
                  decoration: BoxDecoration(),
                  child: Container(
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
