import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'my_profile_copy_model.dart';
export 'my_profile_copy_model.dart';

class MyProfileCopyWidget extends StatefulWidget {
  const MyProfileCopyWidget({super.key});

  static String routeName = 'MyProfileCopy';
  static String routePath = '/myProfileCopy';

  @override
  State<MyProfileCopyWidget> createState() => _MyProfileCopyWidgetState();
}

class _MyProfileCopyWidgetState extends State<MyProfileCopyWidget> {
  late MyProfileCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MyProfileCopyModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.getProfileRes = await DashboardGroup.getProfileCall.call(
        authToken: FFAppState().authToken,
      );

      if ((_model.getProfileRes?.succeeded ?? true)) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              getJsonField(
                (_model.getProfileRes?.jsonBody ?? ''),
                r'''$.message''',
              ).toString(),
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            duration: Duration(milliseconds: 2350),
            backgroundColor: Colors.black,
          ),
        );
        await DashboardGroup.getProfileCall.call(
          authToken: FFAppState().authToken,
        );

        safeSetState(() {});
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              getJsonField(
                (_model.getProfileRes?.jsonBody ?? ''),
                r'''$.message''',
              ).toString(),
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            duration: Duration(milliseconds: 2350),
            backgroundColor: Colors.black,
          ),
        );
      }
    });

    _model.emailFIeldTextController1 ??= TextEditingController(
        text: getJsonField(
      (_model.getProfileRes?.jsonBody ?? ''),
      r'''$.data.name''',
    ).toString());
    _model.emailFIeldFocusNode1 ??= FocusNode();

    _model.emailFIeldTextController2 ??= TextEditingController();
    _model.emailFIeldFocusNode2 ??= FocusNode();

    _model.passwordFieldTextController ??= TextEditingController();
    _model.passwordFieldFocusNode ??= FocusNode();
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
        resizeToAvoidBottomInset: false,
        backgroundColor: FlutterFlowTheme.of(context).oposite,
        body: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                Theme.of(context).brightness == Brightness.dark
                    ? 'assets/images/profileBg.png'
                    : 'assets/images/plain_whiteBg.png',
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 40.0, 16.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
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
                                ? Colors.transparent
                                : Color(0xD5999999),
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'my',
                            style: FlutterFlowTheme.of(context)
                                .customTextStyle1
                                .override(
                                  fontFamily: 'goodtimes',
                                  color: FlutterFlowTheme.of(context).tertiary,
                                  fontSize: 24.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                ),
                          ),
                          Text(
                            ' Profile',
                            style: FlutterFlowTheme.of(context)
                                .customTextStyle1
                                .override(
                                  fontFamily: 'goodtimes',
                                  color: Color(0xFFEB6027),
                                  fontSize: 24.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                ),
                          ),
                        ],
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
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
                                  ? Colors.transparent
                                  : Color(0xD5999999),
                            ),
                          ),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed(AboutScreenWidget.routeName);
                            },
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
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: double.infinity,
                            height: MediaQuery.sizeOf(context).height * 0.292,
                            decoration: BoxDecoration(
                              color: (Theme.of(context).brightness ==
                                          Brightness.dark) ==
                                      true
                                  ? Color(0xFF3C3939)
                                  : Color(0xD3DADADA),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Stack(
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.network(
                                        'https://plus.unsplash.com/premium_photo-1689530775582-83b8abdb5020?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cmFuZG9tJTIwcGVyc29ufGVufDB8fDB8fHww',
                                        width: double.infinity,
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.24,
                                        fit: BoxFit.fill,
                                        alignment: Alignment(0.0, 0.0),
                                      ),
                                    ),
                                  ],
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.95, 0.5),
                                  child: Container(
                                    width: 42.0,
                                    height: 42.0,
                                    decoration: BoxDecoration(
                                      color: Color(0xFF1B2E5F),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      Icons.camera_alt,
                                      color: Colors.white,
                                      size: 24.0,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, 1.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 5.0),
                                    child: Text(
                                      getJsonField(
                                        DashboardGroup.getProfileCall
                                            .profileDetail(
                                          (_model.getProfileRes?.jsonBody ??
                                              ''),
                                        ),
                                        r'''$.name''',
                                      ).toString(),
                                      style: FlutterFlowTheme.of(context)
                                          .displayMedium
                                          .override(
                                            font: GoogleFonts.bebasNeue(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .displayMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .displayMedium
                                                      .fontStyle,
                                            ),
                                            fontSize: 24.0,
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .displayMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .displayMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Form(
                            key: _model.formKey3,
                            autovalidateMode: AutovalidateMode.disabled,
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 20.0, 0.0, 8.0),
                              child: Container(
                                width: double.infinity,
                                child: TextFormField(
                                  controller: _model.emailFIeldTextController1,
                                  focusNode: _model.emailFIeldFocusNode1,
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
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontStyle,
                                        ),
                                    hintText: getJsonField(
                                      DashboardGroup.getProfileCall
                                          .profileDetail(
                                        (_model.getProfileRes?.jsonBody ?? ''),
                                      ),
                                      r'''$.name''',
                                    ).toString(),
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
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
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
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    filled: true,
                                    fillColor: (Theme.of(context).brightness ==
                                                Brightness.dark) ==
                                            true
                                        ? Color(0x80050505)
                                        : Color(0x0C050505),
                                    prefixIcon: Icon(
                                      FFIcons.kcomponent57,
                                      color:
                                          FlutterFlowTheme.of(context).tertiary,
                                      size: 24.0,
                                    ),
                                  ),
                                  style: FlutterFlowTheme.of(context)
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
                                  cursorColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                  validator: _model
                                      .emailFIeldTextController1Validator
                                      .asValidator(context),
                                ),
                              ),
                            ),
                          ),
                          Form(
                            key: _model.formKey2,
                            autovalidateMode: AutovalidateMode.disabled,
                            child: Container(
                              width: double.infinity,
                              child: TextFormField(
                                controller: _model.emailFIeldTextController2,
                                focusNode: _model.emailFIeldFocusNode2,
                                autofocus: false,
                                readOnly: true,
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
                                  hintText: getJsonField(
                                    DashboardGroup.getProfileCall.profileDetail(
                                      (_model.getProfileRes?.jsonBody ?? ''),
                                    ),
                                    r'''$.email''',
                                  ).toString(),
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
                                      : Color(0x0C050505),
                                  prefixIcon: Icon(
                                    FFIcons.kcomponent56,
                                    color:
                                        FlutterFlowTheme.of(context).tertiary,
                                    size: 24.0,
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
                                    .emailFIeldTextController2Validator
                                    .asValidator(context),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 6.0, 0.0, 0.0),
                            child: Form(
                              key: _model.formKey1,
                              autovalidateMode: AutovalidateMode.disabled,
                              child: Container(
                                width: double.infinity,
                                child: TextFormField(
                                  controller:
                                      _model.passwordFieldTextController,
                                  focusNode: _model.passwordFieldFocusNode,
                                  autofocus: false,
                                  readOnly: true,
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
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontStyle,
                                        ),
                                    hintText: '***********',
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
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
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
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    filled: true,
                                    fillColor: (Theme.of(context).brightness ==
                                                Brightness.dark) ==
                                            true
                                        ? Color(0x80050505)
                                        : Color(0x0C050505),
                                    prefixIcon: Icon(
                                      FFIcons.kshare,
                                      color:
                                          FlutterFlowTheme.of(context).tertiary,
                                      size: 24.0,
                                    ),
                                  ),
                                  style: FlutterFlowTheme.of(context)
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
                                  cursorColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                  validator: _model
                                      .passwordFieldTextControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                            ),
                          ),
                          Flexible(
                            child: Align(
                              alignment: AlignmentDirectional(0.0, 1.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 70.0),
                                child: Container(
                                  width: double.infinity,
                                  height: 47.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context).peach,
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      _model.apiResultz40 = await DashboardGroup
                                          .updateProfileCall
                                          .call(
                                        name: _model
                                            .emailFIeldTextController1.text,
                                        authToken: FFAppState().authToken,
                                      );

                                      if ((_model.apiResultz40?.succeeded ??
                                          true)) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              getJsonField(
                                                (_model.apiResultz40
                                                        ?.jsonBody ??
                                                    ''),
                                                r'''$.message''',
                                              ).toString(),
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                            duration:
                                                Duration(milliseconds: 2100),
                                            backgroundColor: Colors.black,
                                          ),
                                        );

                                        safeSetState(() {});

                                        context
                                            .goNamed(HomePageWidget.routeName);
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              getJsonField(
                                                (_model.apiResultz40
                                                        ?.jsonBody ??
                                                    ''),
                                                r'''$.message''',
                                              ).toString(),
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                            duration:
                                                Duration(milliseconds: 2100),
                                            backgroundColor: Colors.black,
                                          ),
                                        );
                                      }

                                      safeSetState(() {});
                                    },
                                    text: 'Save',
                                    options: FFButtonOptions(
                                      height: 47.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 16.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: FlutterFlowTheme.of(context).peach,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            font: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w500,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .fontStyle,
                                            ),
                                            color: Colors.white,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .fontStyle,
                                          ),
                                      elevation: 0.0,
                                      borderRadius: BorderRadius.circular(12.0),
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
