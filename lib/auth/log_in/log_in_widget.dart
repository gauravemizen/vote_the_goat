import 'package:vote_for_goat/nav/nav_widget.dart';

import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/permissions_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'log_in_model.dart';
export 'log_in_model.dart';

class LogInWidget extends StatefulWidget {
  const LogInWidget({super.key});

  static String routeName = 'logIn';
  static String routePath = '/logIn';

  @override
  State<LogInWidget> createState() => _LogInWidgetState();
}

class _LogInWidgetState extends State<LogInWidget> with RouteAware {
  late LogInModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LogInModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.fcmToken = await actions.getFcmToken();
      _model.deviceToken = _model.fcmToken!;
      safeSetState(() {});
      await requestPermission(notificationsPermission);
    });

    _model.emailFieldTextController ??= TextEditingController()
      ..addListener(() {
        debugLogWidgetClass(_model);
      });
    _model.emailFieldFocusNode ??= FocusNode();

    _model.passwordFiedTextController ??= TextEditingController()
      ..addListener(() {
        debugLogWidgetClass(_model);
      });
    _model.passwordFiedFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);

    _model.dispose();

    super.dispose();
  }

  @override
  void didUpdateWidget(LogInWidget oldWidget) {
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
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  Theme.of(context).brightness == Brightness.dark
                      ? 'assets/images/logInBg.png'
                      : 'assets/images/light_loginbg_(1).png',
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SingleChildScrollView(
              primary: false,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Align(
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          16.0,
                          valueOrDefault<double>(
                            MediaQuery.sizeOf(context).height * 0.46,
                            0.0,
                          ),
                          16.0,
                          0.0),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: const Color(0x26FFFFFF),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 10.0,
                              color: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? const Color(0x33000000)
                                  : const Color(0x00000000),
                              offset: const Offset(
                                0.0,
                                2.0,
                              ),
                            )
                          ],
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Form(
                          key: _model.formKey,
                          autovalidateMode: AutovalidateMode.disabled,
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                3.0, 5.0, 3.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(
                                  width: double.infinity,
                                  child: TextFormField(
                                    controller: _model.emailFieldTextController,
                                    focusNode: _model.emailFieldFocusNode,
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
                                      hintText: 'Enter your email',
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
                                        borderSide: const BorderSide(
                                          color: Color(0x00000000),
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Color(0x00000000),
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      filled: true,
                                      fillColor:
                                          (Theme.of(context).brightness ==
                                                      Brightness.dark) ==
                                                  true
                                              ? const Color(0x80050505)
                                              : const Color(0x0C050505),
                                      prefixIcon: Icon(
                                        FFIcons.kcomponent56,
                                        color: (Theme.of(context).brightness ==
                                                    Brightness.dark) ==
                                                true
                                            ? Colors.white
                                            : Colors.black,
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
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontStyle,
                                        ),
                                    cursorColor: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    validator: _model
                                        .emailFieldTextControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 16.0, 0.0, 0.0),
                                  child: SizedBox(
                                    width: double.infinity,
                                    child: TextFormField(
                                      controller:
                                          _model.passwordFiedTextController,
                                      focusNode: _model.passwordFiedFocusNode,
                                      autofocus: false,
                                      obscureText:
                                          !_model.passwordFiedVisibility,
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
                                        hintText: 'Password',
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
                                          borderSide: const BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        filled: true,
                                        fillColor:
                                            (Theme.of(context).brightness ==
                                                        Brightness.dark) ==
                                                    true
                                                ? const Color(0x80050505)
                                                : const Color(0x0C050505),
                                        prefixIcon: Icon(
                                          FFIcons.klock,
                                          color:
                                              (Theme.of(context).brightness ==
                                                          Brightness.dark) ==
                                                      true
                                                  ? Colors.white
                                                  : Colors.black,
                                          size: 24.0,
                                        ),
                                        suffixIcon: InkWell(
                                          onTap: () => safeSetState(
                                            () => _model
                                                    .passwordFiedVisibility =
                                                !_model.passwordFiedVisibility,
                                          ),
                                          focusNode:
                                              FocusNode(skipTraversal: true),
                                          child: Icon(
                                            _model.passwordFiedVisibility
                                                ? Icons.visibility_outlined
                                                : Icons.visibility_off_outlined,
                                            color:
                                                (Theme.of(context).brightness ==
                                                            Brightness.dark) ==
                                                        true
                                                    ? Colors.white
                                                    : Colors.black,
                                            size: 20.0,
                                          ),
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
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontStyle,
                                          ),
                                      cursorColor: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      validator: _model
                                          .passwordFiedTextControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 16.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Container(
                                            decoration: const BoxDecoration(),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(1.0, 0.0, 0.0, 0.0),
                                              child: Theme(
                                                data: ThemeData(
                                                  checkboxTheme:
                                                      CheckboxThemeData(
                                                    visualDensity:
                                                        VisualDensity.compact,
                                                    materialTapTargetSize:
                                                        MaterialTapTargetSize
                                                            .shrinkWrap,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4.0),
                                                    ),
                                                  ),
                                                  unselectedWidgetColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .tertiary,
                                                ),
                                                child: Checkbox(
                                                  value: _model
                                                          .checkboxValue ??=
                                                      FFAppState().isRememberMe,
                                                  onChanged: (newValue) async {
                                                    safeSetState(() =>
                                                        _model.checkboxValue =
                                                            newValue!);
                                                  },
                                                  side: (FlutterFlowTheme.of(
                                                                  context)
                                                              .tertiary !=
                                                          null)
                                                      ? BorderSide(
                                                          width: 2,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .tertiary,
                                                        )
                                                      : null,
                                                  activeColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .tertiary,
                                                  checkColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Text(
                                            'Remember Me',
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
                                        ],
                                      ),
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.pushNamed(
                                              ForgotPasswordWidget.routeName);
                                        },
                                        child: Text(
                                          'Forgot Password?',
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
                                Container(
                                  decoration: const BoxDecoration(),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 16.0, 0.0, 0.0),
                                    child: Container(
                                      width: double.infinity,
                                      height: 47.0,
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            FlutterFlowTheme.of(context).peach,
                                            const Color(0xFFE09B6E)
                                          ],
                                          stops: const [0.0, 1.0],
                                          begin:
                                              const AlignmentDirectional(0.0, -1.0),
                                          end: const AlignmentDirectional(0, 1.0),
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      child: FFButtonWidget(
                                        // onPressed: () async {
                                        //   var _shouldSetState = false;
                                        //   _model.validate = true;
                                        //   if (_model.formKey.currentState ==
                                        //           null ||
                                        //       !_model.formKey.currentState!
                                        //           .validate()) {
                                        //     safeSetState(
                                        //         () => _model.validate = false);
                                        //     return;
                                        //   }
                                        //   _shouldSetState = true;
                                        //   if (_model.validate == true) {
                                        //     _model.logInRes =
                                        //         await AuthGroup.logInCall.call(
                                        //       email: _model
                                        //           .emailFieldTextController
                                        //           .text,
                                        //       password: _model
                                        //           .passwordFiedTextController
                                        //           .text,
                                        //       fcmToken: _model.deviceToken,
                                        //       deviceType:
                                        //           isiOS ? 'ios' : 'android',
                                        //     );
                                        //
                                        //     _shouldSetState = true;
                                        //     if ((_model.logInRes?.succeeded ??
                                        //             true) !=
                                        //         true) {
                                        //       ScaffoldMessenger.of(context)
                                        //           .showSnackBar(
                                        //         SnackBar(
                                        //           content: Text(
                                        //             getJsonField(
                                        //               (_model.logInRes
                                        //                       ?.jsonBody ??
                                        //                   ''),
                                        //               r'''$.message''',
                                        //             ).toString(),
                                        //             style: FlutterFlowTheme.of(
                                        //                     context)
                                        //                 .labelMedium
                                        //                 .override(
                                        //                   font: GoogleFonts
                                        //                       .poppins(
                                        //                     fontWeight:
                                        //                         FlutterFlowTheme.of(
                                        //                                 context)
                                        //                             .labelMedium
                                        //                             .fontWeight,
                                        //                     fontStyle:
                                        //                         FlutterFlowTheme.of(
                                        //                                 context)
                                        //                             .labelMedium
                                        //                             .fontStyle,
                                        //                   ),
                                        //                   color: Colors.white,
                                        //                   letterSpacing: 0.0,
                                        //                   fontWeight:
                                        //                       FlutterFlowTheme.of(
                                        //                               context)
                                        //                           .labelMedium
                                        //                           .fontWeight,
                                        //                   fontStyle:
                                        //                       FlutterFlowTheme.of(
                                        //                               context)
                                        //                           .labelMedium
                                        //                           .fontStyle,
                                        //                 ),
                                        //           ),
                                        //           duration: Duration(
                                        //               milliseconds: 3800),
                                        //           backgroundColor: Colors.black,
                                        //         ),
                                        //       );
                                        //       if (_shouldSetState)
                                        //         safeSetState(() {});
                                        //       return;
                                        //     }
                                        //     await Future.wait([
                                        //       Future(() async {
                                        //         ScaffoldMessenger.of(context)
                                        //             .showSnackBar(
                                        //           SnackBar(
                                        //             content: Text(
                                        //               getJsonField(
                                        //                 (_model.logInRes
                                        //                         ?.jsonBody ??
                                        //                     ''),
                                        //                 r'''$.message''',
                                        //               ).toString(),
                                        //               style: FlutterFlowTheme
                                        //                       .of(context)
                                        //                   .labelMedium
                                        //                   .override(
                                        //                     font: GoogleFonts
                                        //                         .poppins(
                                        //                       fontWeight:
                                        //                           FlutterFlowTheme.of(
                                        //                                   context)
                                        //                               .labelMedium
                                        //                               .fontWeight,
                                        //                       fontStyle:
                                        //                           FlutterFlowTheme.of(
                                        //                                   context)
                                        //                               .labelMedium
                                        //                               .fontStyle,
                                        //                     ),
                                        //                     color: Colors.white,
                                        //                     letterSpacing: 0.0,
                                        //                     fontWeight:
                                        //                         FlutterFlowTheme.of(
                                        //                                 context)
                                        //                             .labelMedium
                                        //                             .fontWeight,
                                        //                     fontStyle:
                                        //                         FlutterFlowTheme.of(
                                        //                                 context)
                                        //                             .labelMedium
                                        //                             .fontStyle,
                                        //                   ),
                                        //             ),
                                        //             duration: Duration(
                                        //                 milliseconds: 3800),
                                        //             backgroundColor:
                                        //                 Colors.black,
                                        //           ),
                                        //         );
                                        //       }),
                                        //       Future(() async {
                                        //         context.pushNamed(
                                        //             HomeOnboardingWidget
                                        //                 .routeName);
                                        //
                                        //         FFAppState().authToken =
                                        //             getJsonField(
                                        //           (_model.logInRes?.jsonBody ??
                                        //               ''),
                                        //           r'''$.token''',
                                        //         ).toString();
                                        //         FFAppState().userName =
                                        //             getJsonField(
                                        //           (_model.logInRes?.jsonBody ??
                                        //               ''),
                                        //           r'''$.data.user.name''',
                                        //         ).toString();
                                        //         FFAppState().currentUserId =
                                        //             getJsonField(
                                        //           (_model.logInRes?.jsonBody ??
                                        //               ''),
                                        //           r'''$.data.user.id''',
                                        //         ).toString();
                                        //         safeSetState(() {});
                                        //       }),
                                        //     ]);
                                        //   } else {
                                        //     if (_shouldSetState)
                                        //       safeSetState(() {});
                                        //     return;
                                        //   }
                                        //
                                        //   if (_shouldSetState)
                                        //     safeSetState(() {});
                                        // },

                                    ///2
                                        onPressed: () async {
                                          var shouldSetState = false;
                                          _model.validate = true;
                                          if (_model.formKey.currentState == null ||
                                              !_model.formKey.currentState!.validate()) {
                                            safeSetState(() => _model.validate = false);
                                            return;
                                          }
                                          shouldSetState = true;
                                          if (_model.validate == true) {
                                            _model.logInRes = await AuthGroup.logInCall.call(
                                              email: _model.emailFieldTextController.text,
                                              password: _model.passwordFiedTextController.text,
                                              fcmToken: _model.deviceToken,
                                              deviceType: isiOS ? 'ios' : 'android',
                                            );

                                            shouldSetState = true;
                                            if ((_model.logInRes?.succeeded ?? true) != true) {
                                              ScaffoldMessenger.of(context).showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    getJsonField(
                                                      (_model.logInRes?.jsonBody ?? ''),
                                                      r'''$.message''',
                                                    ).toString(),
                                                    style: FlutterFlowTheme.of(context).labelMedium.override(
                                                      font: GoogleFonts.poppins(),
                                                      color: Colors.white,
                                                      letterSpacing: 0.0,
                                                    ),
                                                  ),
                                                  duration: const Duration(milliseconds: 3800),
                                                  backgroundColor: Colors.black,
                                                ),
                                              );
                                              if (shouldSetState) safeSetState(() {});
                                              return;
                                            }

                                            // Check isAttempt value from response (0 or 1)
                                            final isAttempt = getJsonField(
                                              (_model.logInRes?.jsonBody ?? ''),
                                              r'''$.data.is_attempt''',
                                            );

                                            final minionStatus =getJsonField(
                                              (_model.logInRes?.jsonBody ?? ''),
                                              r'''$.data.minion_status''',
                                            );


                                            await Future.wait([
                                              Future(() async {
                                                ScaffoldMessenger.of(context).showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      getJsonField(
                                                        (_model.logInRes?.jsonBody ?? ''),
                                                        r'''$.message''',
                                                      ).toString(),
                                                      style: FlutterFlowTheme.of(context).labelMedium.override(
                                                        font: GoogleFonts.poppins(),
                                                        color: Colors.white,
                                                        letterSpacing: 0.0,
                                                      ),
                                                    ),
                                                    duration: const Duration(milliseconds: 3800),
                                                    backgroundColor: Colors.black,
                                                  ),
                                                );
                                              }),
                                              Future(() async {
                                                // Set app state values
                                                FFAppState().authToken = getJsonField(
                                                  (_model.logInRes?.jsonBody ?? ''),
                                                  r'''$.token''',
                                                ).toString();
                                                FFAppState().userName = getJsonField(
                                                  (_model.logInRes?.jsonBody ?? ''),
                                                  r'''$.data.user.name''',
                                                ).toString();
                                                FFAppState().currentUserId = getJsonField(
                                                  (_model.logInRes?.jsonBody ?? ''),
                                                  r'''$.data.user.id''',
                                                ).toString();
                                                safeSetState(() {});

                                                // // Navigate based on isAttempt value (0 = false, 1 = true)
                                                // if (isAttempt == 0) {
                                                //   context.goNamed(HomeOnboardingWidget.routeName);
                                                //
                                                //   // Navigate to nav.dart when isAttempt is 0 (false)
                                                // } else {
                                                //   // Navigate to current flow when isAttempt is 1 (true)
                                                //   context.goNamed(NavWidget.routeName);
                                                //
                                                // }




                                                if (isAttempt == 1 || minionStatus == 0) {
                                                  // If ANY is 1 → go to Nav
                                                  context.goNamed(NavWidget.routeName);
                                                } else {
                                                  // Both are 0 → go to onboarding
                                                  context.goNamed(HomeOnboardingWidget.routeName);
                                                }

                                              }),
                                            ]);
                                          } else {
                                            if (shouldSetState) safeSetState(() {});
                                            return;
                                          }

                                          if (shouldSetState) safeSetState(() {});
                                        },

                                        ///

                                        text: 'Login',
                                        options: FFButtonOptions(
                                          width: double.infinity,
                                          height: 47.0,
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 16.0, 0.0),
                                          iconPadding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: const Color(0x00CD4A20),
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleLarge
                                              .override(
                                                font: GoogleFonts.poppins(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleLarge
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleLarge
                                                          .fontStyle,
                                                ),
                                                color: Colors.white,
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .titleLarge
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleLarge
                                                        .fontStyle,
                                              ),
                                          elevation: 0.0,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 24.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 120.0,
                                        height: 1.0,
                                        decoration: BoxDecoration(
                                          color:
                                              (Theme.of(context).brightness ==
                                                          Brightness.dark) ==
                                                      true
                                                  ? FlutterFlowTheme.of(context)
                                                      .lightWhite
                                                  : const Color(0xF1000000),
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: Image.asset(
                                              'assets/images/Vector_1.png',
                                            ).image,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(0.0),
                                          border: Border.all(
                                            color: (Theme.of(context)
                                                            .brightness ==
                                                        Brightness.dark) ==
                                                    true
                                                ? FlutterFlowTheme.of(context)
                                                    .lightWhite
                                                : const Color(0xC0000000),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 10.0, 0.0),
                                        child: Text(
                                          'Or',
                                          style: FlutterFlowTheme.of(context)
                                              .labelMedium
                                              .override(
                                                font: GoogleFonts.poppins(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
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
                                        ),
                                      ),
                                      Container(
                                        width: 120.0,
                                        height: 1.0,
                                        decoration: BoxDecoration(
                                          color:
                                              (Theme.of(context).brightness ==
                                                          Brightness.dark) ==
                                                      true
                                                  ? FlutterFlowTheme.of(context)
                                                      .lightWhite
                                                  : const Color(0xF1000000),
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: Image.asset(
                                              'assets/images/Vector_1.png',
                                            ).image,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(0.0),
                                          border: Border.all(
                                            color: (Theme.of(context)
                                                            .brightness ==
                                                        Brightness.dark) ==
                                                    true
                                                ? FlutterFlowTheme.of(context)
                                                    .lightWhite
                                                : const Color(0xC0000000),
                                          ),
                                        ),
                                      ),
                                    ].divide(const SizedBox(width: 4.0)),
                                  ),
                                ),
                                // Padding(
                                //   padding: EdgeInsetsDirectional.fromSTEB(
                                //       0.0, 16.0, 0.0, 0.0),
                                //   child: Row(
                                //     mainAxisSize: MainAxisSize.max,
                                //     mainAxisAlignment: MainAxisAlignment.center,
                                //     children: [
                                //       if (isiOS)
                                //         InkWell(
                                //           splashColor: Colors.transparent,
                                //           focusColor: Colors.transparent,
                                //           hoverColor: Colors.transparent,
                                //           highlightColor: Colors.transparent,
                                //           onTap: () async {
                                //             _model.isLoading = true;
                                //             safeSetState(() {});
                                //             GoRouter.of(context)
                                //                 .prepareAuthEvent();
                                //             final user = await authManager
                                //                 .signInWithApple(context);
                                //             if (user == null) {
                                //               return;
                                //             }
                                //             _model.appleLogin =
                                //                 await DashboardGroup
                                //                     .socialloginCall
                                //                     .call(
                                //               providerId: currentUserUid,
                                //               deviceType:
                                //                   isiOS ? 'ios' : 'android',
                                //               name: currentUserDisplayName,
                                //               email: currentUserEmail,
                                //               fcmToken: _model.deviceToken,
                                //               providerName: 'apple',
                                //               authToken: _model.fcmToken,
                                //             );
                                //
                                //             if ((_model.appleLogin?.succeeded ??
                                //                 true)) {
                                //               ScaffoldMessenger.of(context)
                                //                   .showSnackBar(
                                //                 SnackBar(
                                //                   content: Text(
                                //                     getJsonField(
                                //                       (_model.appleLogin
                                //                               ?.jsonBody ??
                                //                           ''),
                                //                       r'''$.message''',
                                //                     ).toString(),
                                //                     style: TextStyle(
                                //                       color: Colors.white,
                                //                     ),
                                //                   ),
                                //                   duration: Duration(
                                //                       milliseconds: 1200),
                                //                   backgroundColor: Colors.black,
                                //                 ),
                                //               );
                                //               FFAppState().authToken =
                                //                   getJsonField(
                                //                 (_model.appleLogin?.jsonBody ??
                                //                     ''),
                                //                 r'''$.token''',
                                //               ).toString();
                                //               FFAppState().currentUserId =
                                //                   getJsonField(
                                //                 (_model.appleLogin?.jsonBody ??
                                //                     ''),
                                //                 r'''$.data.id''',
                                //               ).toString();
                                //               safeSetState(() {});
                                //               _model.isLoading = false;
                                //               safeSetState(() {});
                                //
                                //               context.goNamedAuth(
                                //                   HomePageWidget.routeName,
                                //                   context.mounted);
                                //             } else {
                                //               ScaffoldMessenger.of(context)
                                //                   .showSnackBar(
                                //                 SnackBar(
                                //                   content: Text(
                                //                     getJsonField(
                                //                       (_model.appleLogin
                                //                               ?.jsonBody ??
                                //                           ''),
                                //                       r'''$.message''',
                                //                     ).toString(),
                                //                     style: TextStyle(
                                //                       color: Colors.white,
                                //                     ),
                                //                   ),
                                //                   duration: Duration(
                                //                       milliseconds: 2000),
                                //                   backgroundColor: Colors.black,
                                //                 ),
                                //               );
                                //               ScaffoldMessenger.of(context)
                                //                   .showSnackBar(
                                //                 SnackBar(
                                //                   content: Text(
                                //                     getJsonField(
                                //                       (_model.appleLogin
                                //                               ?.jsonBody ??
                                //                           ''),
                                //                       r'''$.message''',
                                //                     ).toString(),
                                //                     style: TextStyle(
                                //                       color: Colors.white,
                                //                     ),
                                //                   ),
                                //                   duration: Duration(
                                //                       milliseconds: 1200),
                                //                   backgroundColor: Colors.black,
                                //                 ),
                                //               );
                                //             }
                                //
                                //             safeSetState(() {});
                                //           },
                                //           child: Container(
                                //             width: 54.0,
                                //             height: 54.0,
                                //             decoration: BoxDecoration(
                                //               shape: BoxShape.circle,
                                //               border: Border.all(
                                //                 color:
                                //                     FlutterFlowTheme.of(context)
                                //                         .tertiary,
                                //               ),
                                //             ),
                                //             child: Padding(
                                //               padding: EdgeInsetsDirectional
                                //                   .fromSTEB(
                                //                       10.0, 10.0, 10.0, 10.0),
                                //               child: ClipRRect(
                                //                 borderRadius:
                                //                     BorderRadius.circular(8.0),
                                //                 child: Image.asset(
                                //                   Theme.of(context)
                                //                               .brightness ==
                                //                           Brightness.dark
                                //                       ? 'assets/images/Frame_(4).png'
                                //                       : 'assets/images/apple_logo.png',
                                //                   width: 200.0,
                                //                   height: 200.0,
                                //                   fit: BoxFit.contain,
                                //                 ),
                                //               ),
                                //             ),
                                //           ),
                                //         ),
                                //       Padding(
                                //         padding: EdgeInsetsDirectional.fromSTEB(
                                //             15.0, 0.0, 0.0, 0.0),
                                //         child: InkWell(
                                //           splashColor: Colors.transparent,
                                //           focusColor: Colors.transparent,
                                //           hoverColor: Colors.transparent,
                                //           highlightColor: Colors.transparent,
                                //           onTap: () async {
                                //             _model.isLoading = true;
                                //             safeSetState(() {});
                                //             GoRouter.of(context)
                                //                 .prepareAuthEvent();
                                //             final user = await authManager
                                //                 .signInWithFacebook(context);
                                //             if (user == null) {
                                //               return;
                                //             }
                                //             _model.socialRes =
                                //                 await DashboardGroup
                                //                     .socialloginCall
                                //                     .call(
                                //               deviceType:
                                //                   isiOS ? 'ios' : 'android',
                                //               name: currentUserDisplayName,
                                //               providerId: currentUserUid,
                                //               email: currentUserEmail,
                                //               fcmToken: _model.deviceToken,
                                //               providerName: 'facebook',
                                //               authToken: _model.fcmToken,
                                //             );
                                //
                                //             if ((_model.socialRes?.succeeded ??
                                //                 true)) {
                                //               _model.isLoading = false;
                                //               safeSetState(() {});
                                //               FFAppState().isLoggedIn = true;
                                //               FFAppState().authToken =
                                //                   getJsonField(
                                //                 (_model.socialRes?.jsonBody ??
                                //                     ''),
                                //                 r'''$.token''',
                                //               ).toString();
                                //               FFAppState().currentUserId =
                                //                   getJsonField(
                                //                 (_model.socialRes?.jsonBody ??
                                //                     ''),
                                //                 r'''$.data.id''',
                                //               ).toString();
                                //               ScaffoldMessenger.of(context)
                                //                   .showSnackBar(
                                //                 SnackBar(
                                //                   content: Text(
                                //                     getJsonField(
                                //                       (_model.socialRes
                                //                               ?.jsonBody ??
                                //                           ''),
                                //                       r'''$.message''',
                                //                     ).toString(),
                                //                     style: TextStyle(
                                //                       color: Colors.white,
                                //                     ),
                                //                   ),
                                //                   duration: Duration(
                                //                       milliseconds: 1100),
                                //                   backgroundColor: Colors.black,
                                //                 ),
                                //               );
                                //
                                //               context.goNamedAuth(
                                //                   HomeOnboardingWidget
                                //                       .routeName,
                                //                   context.mounted);
                                //             } else {
                                //               _model.isLoading = false;
                                //               safeSetState(() {});
                                //               context.safePop();
                                //             }
                                //
                                //             safeSetState(() {});
                                //           },
                                //           child: Container(
                                //             width: 54.0,
                                //             height: 54.0,
                                //             decoration: BoxDecoration(
                                //               shape: BoxShape.circle,
                                //               border: Border.all(
                                //                 color:
                                //                     FlutterFlowTheme.of(context)
                                //                         .tertiary,
                                //               ),
                                //             ),
                                //             child: Padding(
                                //               padding: EdgeInsetsDirectional
                                //                   .fromSTEB(
                                //                       10.0, 10.0, 10.0, 10.0),
                                //               child: ClipRRect(
                                //                 borderRadius:
                                //                     BorderRadius.circular(8.0),
                                //                 child: SvgPicture.asset(
                                //                   'assets/images/Frame.svg',
                                //                   width: 200.0,
                                //                   height: 200.0,
                                //                   fit: BoxFit.contain,
                                //                 ),
                                //               ),
                                //             ),
                                //           ),
                                //         ),
                                //       ),
                                //       Padding(
                                //         padding: EdgeInsetsDirectional.fromSTEB(
                                //             15.0, 0.0, 0.0, 0.0),
                                //         child: InkWell(
                                //           splashColor: Colors.transparent,
                                //           focusColor: Colors.transparent,
                                //           hoverColor: Colors.transparent,
                                //           highlightColor: Colors.transparent,
                                //           onTap: () async {
                                //             _model.isLoading = true;
                                //             safeSetState(() {});
                                //             GoRouter.of(context)
                                //                 .prepareAuthEvent();
                                //             final user = await authManager
                                //                 .signInWithGoogle(context);
                                //             if (user == null) {
                                //               return;
                                //             }
                                //             _model.googleLogIn =
                                //                 await DashboardGroup
                                //                     .socialloginCall
                                //                     .call(
                                //               fcmToken: _model.deviceToken,
                                //               name: currentUserDisplayName,
                                //               email: currentUserEmail,
                                //               providerId: currentUserUid,
                                //               deviceType:
                                //                   isiOS ? 'ios' : 'android',
                                //               authToken: _model.fcmToken,
                                //               providerName: 'google',
                                //             );
                                //
                                //             if ((_model
                                //                     .googleLogIn?.succeeded ??
                                //                 true)) {
                                //               ScaffoldMessenger.of(context)
                                //                   .showSnackBar(
                                //                 SnackBar(
                                //                   content: Text(
                                //                     getJsonField(
                                //                       (_model.googleLogIn
                                //                               ?.jsonBody ??
                                //                           ''),
                                //                       r'''$.message''',
                                //                     ).toString(),
                                //                     style: TextStyle(
                                //                       color: Colors.white,
                                //                     ),
                                //                   ),
                                //                   duration: Duration(
                                //                       milliseconds: 1350),
                                //                   backgroundColor: Colors.black,
                                //                 ),
                                //               );
                                //               FFAppState().authToken =
                                //                   getJsonField(
                                //                 (_model.googleLogIn?.jsonBody ??
                                //                     ''),
                                //                 r'''$.token''',
                                //               ).toString();
                                //               FFAppState().currentUserId =
                                //                   getJsonField(
                                //                 (_model.googleLogIn?.jsonBody ??
                                //                     ''),
                                //                 r'''$.data.id''',
                                //               ).toString();
                                //               safeSetState(() {});
                                //               _model.isLoading = false;
                                //               safeSetState(() {});
                                //
                                //               context.goNamedAuth(
                                //                   HomeOnboardingWidget
                                //                       .routeName,
                                //                   context.mounted);
                                //             } else {
                                //               ScaffoldMessenger.of(context)
                                //                   .showSnackBar(
                                //                 SnackBar(
                                //                   content: Text(
                                //                     getJsonField(
                                //                       (_model.googleLogIn
                                //                               ?.jsonBody ??
                                //                           ''),
                                //                       r'''$.message''',
                                //                     ).toString(),
                                //                     style: TextStyle(
                                //                       color: Colors.white,
                                //                     ),
                                //                   ),
                                //                   duration: Duration(
                                //                       milliseconds: 1350),
                                //                   backgroundColor: Colors.black,
                                //                 ),
                                //               );
                                //               _model.isLoading = false;
                                //               safeSetState(() {});
                                //             }
                                //
                                //             safeSetState(() {});
                                //           },
                                //           child: Container(
                                //             width: 54.0,
                                //             height: 54.0,
                                //             decoration: BoxDecoration(
                                //               shape: BoxShape.circle,
                                //               border: Border.all(
                                //                 color:
                                //                     FlutterFlowTheme.of(context)
                                //                         .tertiary,
                                //               ),
                                //             ),
                                //             child: Padding(
                                //               padding: EdgeInsetsDirectional
                                //                   .fromSTEB(
                                //                       10.0, 10.0, 10.0, 10.0),
                                //               child: ClipRRect(
                                //                 borderRadius:
                                //                     BorderRadius.circular(8.0),
                                //                 child: SvgPicture.asset(
                                //                   'assets/images/Frame-1.svg',
                                //                   width: 200.0,
                                //                   height: 200.0,
                                //                   fit: BoxFit.contain,
                                //                 ),
                                //               ),
                                //             ),
                                //           ),
                                //         ),
                                //       ),
                                //     ],
                                //   ),
                                // ),


                                ///2
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      if (isiOS)
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            _model.isLoading = true;
                                            safeSetState(() {});
                                            GoRouter.of(context).prepareAuthEvent();
                                            final user = await authManager.signInWithApple(context);
                                            if (user == null) {
                                              return;
                                            }
                                            _model.appleLogin = await DashboardGroup.socialloginCall.call(
                                              providerId: currentUserUid,
                                              deviceType: isiOS ? 'ios' : 'android',
                                              name: currentUserDisplayName,
                                              email: currentUserEmail,
                                              fcmToken: _model.deviceToken,
                                              providerName: 'apple',
                                              authToken: _model.fcmToken,
                                            );

                                            if ((_model.appleLogin?.succeeded ?? true)) {
                                              // Check isAttempt value from response
                                              final isAttempt = getJsonField(
                                                (_model.appleLogin?.jsonBody ?? ''),
                                                r'''$.is_attempt''',
                                              );

                                              ScaffoldMessenger.of(context).showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    getJsonField(
                                                      (_model.appleLogin?.jsonBody ?? ''),
                                                      r'''$.message''',
                                                    ).toString(),
                                                    style: const TextStyle(color: Colors.white),
                                                  ),
                                                  duration: const Duration(milliseconds: 1200),
                                                  backgroundColor: Colors.black,
                                                ),
                                              );

                                              FFAppState().authToken = getJsonField(
                                                (_model.appleLogin?.jsonBody ?? ''),
                                                r'''$.token''',
                                              ).toString();
                                              FFAppState().currentUserId = getJsonField(
                                                (_model.appleLogin?.jsonBody ?? ''),
                                                r'''$.data.id''',
                                              ).toString();
                                              safeSetState(() {});
                                              _model.isLoading = false;
                                              safeSetState(() {});

                                              // Navigate based on isAttempt value
                                              if (isAttempt == 0) {
                                                context.goNamedAuth(HomeOnboardingWidget.routeName, context.mounted);
                                              } else {
                                                context.goNamedAuth(NavWidget.routeName, context.mounted);
                                              }
                                            } else {
                                              ScaffoldMessenger.of(context).showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    getJsonField(
                                                      (_model.appleLogin?.jsonBody ?? ''),
                                                      r'''$.message''',
                                                    ).toString(),
                                                    style: const TextStyle(color: Colors.white),
                                                  ),
                                                  duration: const Duration(milliseconds: 2000),
                                                  backgroundColor: Colors.black,
                                                ),
                                              );
                                            }
                                            safeSetState(() {});
                                          },
                                          child: Container(
                                            width: 54.0,
                                            height: 54.0,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                color: FlutterFlowTheme.of(context).tertiary,
                                              ),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.circular(8.0),
                                                child: Image.asset(
                                                  Theme.of(context).brightness == Brightness.dark
                                                      ? 'assets/images/Frame_(4).png'
                                                      : 'assets/images/apple_logo.png',
                                                  width: 200.0,
                                                  height: 200.0,
                                                  fit: BoxFit.contain,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 0.0, 0.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            _model.isLoading = true;
                                            safeSetState(() {});
                                            GoRouter.of(context).prepareAuthEvent();
                                            final user = await authManager.signInWithFacebook(context);
                                            if (user == null) {
                                              return;
                                            }
                                            _model.socialRes = await DashboardGroup.socialloginCall.call(
                                              deviceType: isiOS ? 'ios' : 'android',
                                              name: currentUserDisplayName,
                                              providerId: currentUserUid,
                                              email: currentUserEmail,
                                              fcmToken: _model.deviceToken,
                                              providerName: 'facebook',
                                              authToken: _model.fcmToken,
                                            );

                                            if ((_model.socialRes?.succeeded ?? true)) {
                                              // Check isAttempt value from response
                                              final isAttempt = getJsonField(
                                                (_model.socialRes?.jsonBody ?? ''),
                                                r'''$.is_attempt''',
                                              );

                                              _model.isLoading = false;
                                              safeSetState(() {});
                                              FFAppState().isLoggedIn = true;
                                              FFAppState().authToken = getJsonField(
                                                (_model.socialRes?.jsonBody ?? ''),
                                                r'''$.token''',
                                              ).toString();
                                              FFAppState().currentUserId = getJsonField(
                                                (_model.socialRes?.jsonBody ?? ''),
                                                r'''$.data.id''',
                                              ).toString();

                                              ScaffoldMessenger.of(context).showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    getJsonField(
                                                      (_model.socialRes?.jsonBody ?? ''),
                                                      r'''$.message''',
                                                    ).toString(),
                                                    style: const TextStyle(color: Colors.white),
                                                  ),
                                                  duration: const Duration(milliseconds: 1100),
                                                  backgroundColor: Colors.black,
                                                ),
                                              );

                                              // Navigate based on isAttempt value
                                              if (isAttempt == 0) {
                                                context.goNamedAuth(HomeOnboardingWidget.routeName, context.mounted);
                                              } else {
                                                context.goNamedAuth(NavWidget.routeName, context.mounted);
                                              }
                                            } else {
                                              _model.isLoading = false;
                                              safeSetState(() {});
                                              context.safePop();
                                            }
                                            safeSetState(() {});
                                          },
                                          child: Container(
                                            width: 54.0,
                                            height: 54.0,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                color: FlutterFlowTheme.of(context).tertiary,
                                              ),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.circular(8.0),
                                                child: SvgPicture.asset(
                                                  'assets/images/Frame.svg',
                                                  width: 200.0,
                                                  height: 200.0,
                                                  fit: BoxFit.contain,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 0.0, 0.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            _model.isLoading = true;
                                            safeSetState(() {});
                                            GoRouter.of(context).prepareAuthEvent();
                                            final user = await authManager.signInWithGoogle(context);
                                            if (user == null) {
                                              return;
                                            }
                                            _model.googleLogIn = await DashboardGroup.socialloginCall.call(
                                              fcmToken: _model.deviceToken,
                                              name: currentUserDisplayName,
                                              email: currentUserEmail,
                                              providerId: currentUserUid,
                                              deviceType: isiOS ? 'ios' : 'android',
                                              authToken: _model.fcmToken,
                                              providerName: 'google',
                                            );

                                            if ((_model.googleLogIn?.succeeded ?? true)) {
                                              // Check isAttempt value from response
                                              final isAttempt = getJsonField(
                                                (_model.googleLogIn?.jsonBody ?? ''),
                                                r'''$.is_attempt''',
                                              );

                                              ScaffoldMessenger.of(context).showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    getJsonField(
                                                      (_model.googleLogIn?.jsonBody ?? ''),
                                                      r'''$.message''',
                                                    ).toString(),
                                                    style: const TextStyle(color: Colors.white),
                                                  ),
                                                  duration: const Duration(milliseconds: 1350),
                                                  backgroundColor: Colors.black,
                                                ),
                                              );

                                              FFAppState().authToken = getJsonField(
                                                (_model.googleLogIn?.jsonBody ?? ''),
                                                r'''$.token''',
                                              ).toString();
                                              FFAppState().currentUserId = getJsonField(
                                                (_model.googleLogIn?.jsonBody ?? ''),
                                                r'''$.data.id''',
                                              ).toString();
                                              safeSetState(() {});
                                              _model.isLoading = false;
                                              safeSetState(() {});

                                              // Navigate based on isAttempt value
                                              if (isAttempt == 0) {
                                                context.goNamedAuth(HomeOnboardingWidget.routeName, context.mounted);
                                              } else {
                                                context.goNamedAuth(NavWidget.routeName, context.mounted);
                                              }
                                            } else {
                                              ScaffoldMessenger.of(context).showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    getJsonField(
                                                      (_model.googleLogIn?.jsonBody ?? ''),
                                                      r'''$.message''',
                                                    ).toString(),
                                                    style: const TextStyle(color: Colors.white),
                                                  ),
                                                  duration: const Duration(milliseconds: 1350),
                                                  backgroundColor: Colors.black,
                                                ),
                                              );
                                              _model.isLoading = false;
                                              safeSetState(() {});
                                            }
                                            safeSetState(() {});
                                          },
                                          child: Container(
                                            width: 54.0,
                                            height: 54.0,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                color: FlutterFlowTheme.of(context).tertiary,
                                              ),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.circular(8.0),
                                                child: SvgPicture.asset(
                                                  'assets/images/Frame-1.svg',
                                                  width: 200.0,
                                                  height: 200.0,
                                                  fit: BoxFit.contain,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                ///
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 22.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 16.0, 0.0, 0.0),
                                        child: Text(
                                          'Don’t have an account?',
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
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .lightWhite,
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
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 16.0, 0.0, 0.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.pushNamed(
                                                SignUpWidget.routeName);
                                          },
                                          child: Text(
                                            ' Sign Up',
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
                ],
              ),
            ),
            if (_model.isLoading)
              const Align(
                alignment: AlignmentDirectional(0.0, 0.0),
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
          ],
        ),
      ),
    );
  }
}
