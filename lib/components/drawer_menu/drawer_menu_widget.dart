
import '../../nav/nav_widget.dart';
import '/backend/api_requests/api_calls.dart';
import '/components/log_out/log_out_widget.dart';
import '/components/delete_account/delete_account_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'drawer_menu_model.dart';
export 'drawer_menu_model.dart';

class DrawerMenuWidget extends StatefulWidget {
  const DrawerMenuWidget({super.key});

  @override
  State<DrawerMenuWidget> createState() => _DrawerMenuWidgetState();
}

class _DrawerMenuWidgetState extends State<DrawerMenuWidget> with RouteAware {
  late DrawerMenuModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DrawerMenuModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.getProfileRes = await DashboardGroup.getProfileCall.call(
        authToken: FFAppState().authToken,
      );

      if ((_model.getProfileRes?.succeeded ?? true)) {
        FFAppState().userName = getJsonField(
          (_model.getProfileRes?.jsonBody ?? ''),
          r'''$.data.name''',
        )?.toString()??"";

        FFAppState().userImage = getJsonField(
          (_model.getProfileRes?.jsonBody ?? ''),
          r'''$.data.image''',
        ).toString();
        FFAppState().update(() {});
      }




    });

    // Initialize theme switch based on current saved theme preference / system.
    final savedMode = FlutterFlowTheme.themeMode;
    bool isDark;
    if (savedMode == ThemeMode.system) {
      final platformBrightness = WidgetsBinding.instance.platformDispatcher.platformBrightness;
      isDark = platformBrightness == Brightness.dark;
    } else {
      isDark = savedMode == ThemeMode.dark;
    }
    _model.switchValue1 = isDark; // true => dark mode enabled
    _model.switchValue2 = true;
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);

    _model.maybeDispose();

    super.dispose();
  }

  @override
  void didUpdateWidget(DrawerMenuWidget oldWidget) {
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

    return Container(
      decoration: BoxDecoration(
        color: (Theme.of(context).brightness == Brightness.dark) == true
            ? const Color(0xFF1C1C22)
            : Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 1.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Align(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: Container(
                                width: 100.0,
                                height: 100.0,
                                clipBehavior: Clip.antiAlias,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child:


                                // Image.network(
                                //   'https://picsum.photos/seed/905/600',
                                //   errorBuilder: (context,
                                //       error,
                                //       stackTrace) =>
                                //       Image.asset(
                                //         'assets/images/error_image.webp',
                                //         fit: BoxFit.cover,
                                //       ),
                                //   fit: BoxFit.cover,
                                // ),


                              ///2
                                Image.network(
                                  FFAppState().userImage.isNotEmpty
                                      ? FFAppState().userImage
                                      : 'assets/images/error_image.web',
                                  errorBuilder: (context, error, stackTrace) => Image.asset(
                                    'assets/images/error_image.webp',
                                    fit: BoxFit.cover,
                                  ),
                                  fit: BoxFit.cover,
                                )

                              ),
                            ),
                            Align(
                              alignment: const AlignmentDirectional(0.0, 0.98),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 16.0, 0.0, 0.0),
                                child: Text(
                                  FFAppState().userName,
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
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .displayMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .displayMedium
                                            .fontStyle,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Builder(
                            builder: (context) => Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 4.0, 0.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  Navigator.pop(context);
                                  await showDialog(
                                    context: context,
                                    builder: (dialogContext) {
                                      return Dialog(
                                        elevation: 0,
                                        insetPadding: EdgeInsets.zero,
                                        backgroundColor: Colors.transparent,
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(dialogContext)),
                                        child: WebViewAware(
                                          child: SizedBox(
                                            height: MediaQuery.sizeOf(dialogContext)
                                                    .height *
                                                0.33,
                                            child: const LogOutWidget(),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(
                                      color: (Theme.of(context).brightness ==
                                                  Brightness.dark) ==
                                              true
                                          ? const Color(0xFF282727)
                                          : const Color(0xFFBABABA),
                                      width: 2.0,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        8.0, 8.0, 8.0, 8.0),
                                    child: Icon(
                                      Icons.logout_rounded,
                                      color:
                                          FlutterFlowTheme.of(context).tertiary,
                                      size: 24.0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 2.0, 0.0, 0.0),
                            child: Text(
                              'Logout',
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
                                    fontSize: 9.0,
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
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // Padding(
              //   padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
              //   child: Row(
              //     mainAxisSize: MainAxisSize.max,
              //     children: [
              //       Transform.rotate(
              //         angle: 180.0 * (math.pi / 180),
              //         child: const Icon(
              //           Icons.tornado_outlined,
              //           color: Color(0xFFC0BFBF),
              //           size: 16.0,
              //         ),
              //       ),
              //       Expanded(
              //         child: Padding(
              //           padding:
              //               const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
              //           child: Text(
              //             'Profile Status',
              //             style: FlutterFlowTheme.of(context)
              //                 .labelMedium
              //                 .override(
              //                   font: GoogleFonts.poppins(
              //                     fontWeight: FlutterFlowTheme.of(context)
              //                         .labelMedium
              //                         .fontWeight,
              //                     fontStyle: FlutterFlowTheme.of(context)
              //                         .labelMedium
              //                         .fontStyle,
              //                   ),
              //                   color: FlutterFlowTheme.of(context).tertiary,
              //                   letterSpacing: 0.0,
              //                   fontWeight: FlutterFlowTheme.of(context)
              //                       .labelMedium
              //                       .fontWeight,
              //                   fontStyle: FlutterFlowTheme.of(context)
              //                       .labelMedium
              //                       .fontStyle,
              //                 ),
              //           ),
              //         ),
              //       ),
              //       // Padding(
              //       //   padding:
              //       //       const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
              //       //   child: Text(
              //       //     '75%',
              //       //     style:
              //       //         FlutterFlowTheme.of(context).labelMedium.override(
              //       //               font: GoogleFonts.poppins(
              //       //                 fontWeight: FlutterFlowTheme.of(context)
              //       //                     .labelMedium
              //       //                     .fontWeight,
              //       //                 fontStyle: FlutterFlowTheme.of(context)
              //       //                     .labelMedium
              //       //                     .fontStyle,
              //       //               ),
              //       //               color: FlutterFlowTheme.of(context).tertiary,
              //       //               letterSpacing: 0.0,
              //       //               fontWeight: FlutterFlowTheme.of(context)
              //       //                   .labelMedium
              //       //                   .fontWeight,
              //       //               fontStyle: FlutterFlowTheme.of(context)
              //       //                   .labelMedium
              //       //                   .fontStyle,
              //       //             ),
              //       //   ),
              //       // ),
              //     ],
              //   ),
              // ),


              // Padding(
              //   padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
              //   child: LinearPercentIndicator(
              //     percent: 0.8,
              //     lineHeight: 8.0,
              //     animation: true,
              //     animateFromLastPercent: true,
              //     progressColor: FlutterFlowTheme.of(context).primary,
              //     backgroundColor:
              //         (Theme.of(context).brightness == Brightness.dark) == true
              //             ? const Color(0xFF494747)
              //             : const Color(0xFF636363),
              //     center: Text(
              //       '50%',
              //       style: FlutterFlowTheme.of(context).headlineSmall.override(
              //             font: GoogleFonts.poppins(
              //               fontWeight: FlutterFlowTheme.of(context)
              //                   .headlineSmall
              //                   .fontWeight,
              //               fontStyle: FlutterFlowTheme.of(context)
              //                   .headlineSmall
              //                   .fontStyle,
              //             ),
              //             letterSpacing: 0.0,
              //             fontWeight: FlutterFlowTheme.of(context)
              //                 .headlineSmall
              //                 .fontWeight,
              //             fontStyle: FlutterFlowTheme.of(context)
              //                 .headlineSmall
              //                 .fontStyle,
              //           ),
              //     ),
              //     barRadius: const Radius.circular(10.0),
              //     padding: EdgeInsets.zero,
              //   ),
              // ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 5.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            color: const Color(0xFF282727),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              7.0, 7.0, 7.0, 7.0),
                          child: Icon(
                            Icons.contrast,
                            color: FlutterFlowTheme.of(context).tertiary,
                            size: 20.0,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 0.0, 0.0),
                        child: Text(
                          'Theme',
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
                                color: FlutterFlowTheme.of(context).tertiary,
                                letterSpacing: 0.0,
                                fontWeight: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .fontStyle,
                              ),
                        ),
                      ),
                    ),
                    Container(
                      width: 40.0,
                      height: 20.0,
                      decoration: const BoxDecoration(),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                        child:


                        // Switch.adaptive(
                        //   value: _model.switchValue1!,
                        //   onChanged: (newValue) async {
                        //     safeSetState(() => _model.switchValue1 = newValue!);
                        //   },
                        //   activeColor: FlutterFlowTheme.of(context).primary,
                        //   activeTrackColor:
                        //       FlutterFlowTheme.of(context).primary,
                        //   inactiveTrackColor: const Color(0xFF6B6B6B),
                        //   inactiveThumbColor: Colors.white,
                        // ),
                        Switch.adaptive(
                          value: _model.switchValue1!,
                          onChanged: (newValue) async {
                            setState(() => _model.switchValue1 = newValue);

                            // Set the theme mode based on the switch value
                            if (newValue) {
                              // Dark mode
                              setDarkModeSetting(context, ThemeMode.dark);
                            } else {
                              // Light mode
                              setDarkModeSetting(context, ThemeMode.light);
                            }

                            // Optional: Update your local theme state if needed
                            FFAppState().update(() {
                              // Update any theme-related state if needed
                            });
                          },
                          activeColor: FlutterFlowTheme.of(context).primary,
                          activeTrackColor: FlutterFlowTheme.of(context).primary,
                          inactiveTrackColor: const Color(0xFF6B6B6B),
                          inactiveThumbColor: Colors.white,
                        )



                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                child: Divider(
                  color: FlutterFlowTheme.of(context).tertiary.withOpacity(0.2),
                  thickness: 1.0,
                ),
              ),

              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 5.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            color: const Color(0xFF282727),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              7.0, 7.0, 7.0, 7.0),
                          child: Icon(
                            FFIcons.kgroup,
                            color: FlutterFlowTheme.of(context).tertiary,
                            size: 20.0,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 0.0, 0.0),
                        child: Text(
                          'Notifications',
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
                                color: FlutterFlowTheme.of(context).tertiary,
                                letterSpacing: 0.0,
                                fontWeight: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .fontStyle,
                              ),
                        ),
                      ),
                    ),
                    Container(
                      width: 40.0,
                      height: 20.0,
                      decoration: const BoxDecoration(),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                        child: Switch.adaptive(
                          value: _model.switchValue2!,
                          // onChanged: (newValue) async {
                          //   safeSetState(() => _model.switchValue2 = newValue!);
                          // },

                            // onChanged: (newValue) async {
                            //   safeSetState(() => _model.switchValue2 = newValue!);
                            //
                            //   await EnableNotificationCall().call(
                            //     authToken: FFAppState().authToken,
                            //   );
                            // }

                            onChanged: (newValue) async {
                              safeSetState(() => _model.switchValue2 = newValue);

                              final response = await EnableNotificationCall().call(
                                authToken: FFAppState().authToken,
                              );

                              // Print the message from the API response (assuming it's in `message`)
                              final message = getJsonField(response.jsonBody, r'$.message');
                              print('API Message: $message');

                              // Optionally, show as a SnackBar
                              if (message != null) {
                                // ScaffoldMessenger.of(context).showSnackBar(
                                //   SnackBar(content: Text(message.toString())),
                                // );
                                print('API Message: $message');
                              }
                            },



                          activeColor: FlutterFlowTheme.of(context).primary,
                          activeTrackColor:
                          FlutterFlowTheme.of(context).primary,
                          inactiveTrackColor: const Color(0xFF6B6B6B),
                          inactiveThumbColor: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                child: Divider(
                  color: FlutterFlowTheme.of(context).tertiary.withOpacity(0.2),
                  thickness: 1.0,
                ),
              ),

              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    context.pushNamed(MyProfileCopyWidget.routeName);
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 5.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(
                              color: const Color(0xFF282727),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                7.0, 7.0, 7.0, 7.0),
                            child: Icon(
                              FFIcons.kcomponent57,
                              color: FlutterFlowTheme.of(context).tertiary,
                              size: 20.0,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              15.0, 0.0, 0.0, 0.0),
                          child: Text(
                            'My Profile',
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
                                  color: FlutterFlowTheme.of(context).tertiary,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .fontStyle,
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                child: Divider(
                  color: FlutterFlowTheme.of(context).tertiary.withOpacity(0.2),
                  thickness: 1.0,
                ),
              ),

              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    context.pushNamed(AboutScreenWidget.routeName);
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 5.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(
                              color: const Color(0xFF282727),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                7.0, 7.0, 7.0, 7.0),
                            child: Icon(
                              Icons.info_outline,
                              color: FlutterFlowTheme.of(context).tertiary,
                              size: 20.0,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              15.0, 0.0, 0.0, 0.0),
                          child: Text(
                            'About Vote The Goat',
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
                                  color: FlutterFlowTheme.of(context).tertiary,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .fontStyle,
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                child: Divider(
                  color: FlutterFlowTheme.of(context).tertiary.withOpacity(0.2),
                  thickness: 1.0,
                ),
              ),

              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    // context.pushNamed(EligiblePlayerWidget.routeName);
                    context.pushNamed(
                      NavWidget.routeName,
                      queryParameters: {
                        'initialTab': '1'
                      }, // Pass initialTab as 1 for TabNotifications
                    );
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 5.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(
                              color: const Color(0xFF282727),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                7.0, 7.0, 7.0, 7.0),
                            child: Icon(
                              Icons.groups_outlined,
                              color: FlutterFlowTheme.of(context).tertiary,
                              size: 20.0,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              15.0, 0.0, 0.0, 0.0),
                          child: Text(
                            'Eligible Players',
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
                                  color: FlutterFlowTheme.of(context).tertiary,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .fontStyle,
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                child: Divider(
                  color: FlutterFlowTheme.of(context).tertiary.withOpacity(0.2),
                  thickness: 1.0,
                ),
              ),

              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    context.pushNamed(AllPlayersWidget.routeName);
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 5.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(
                              color: const Color(0xFF282727),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                7.0, 7.0, 7.0, 7.0),
                            child: Icon(
                              Icons.person_outline_outlined,
                              color: FlutterFlowTheme.of(context).tertiary,
                              size: 20.0,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              15.0, 0.0, 0.0, 0.0),
                          child: Text(
                            'Player Bio',
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
                                  color: FlutterFlowTheme.of(context).tertiary,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .fontStyle,
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                child: Divider(
                  color: FlutterFlowTheme.of(context).tertiary.withOpacity(0.2),
                  thickness: 1.0,
                ),
              ),

              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    // context.pushNamed(RankingPageWidget.routeName);


                    context.pushNamed(
                      NavWidget.routeName,
                      queryParameters: {
                        'initialTab': '2'
                      }, // Pass initialTab as 1 for TabNotifications
                    );



                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 5.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(
                              color: const Color(0xFF282727),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                7.0, 7.0, 7.0, 7.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset(
                                Theme.of(context).brightness == Brightness.dark
                                    ? 'assets/images/Vector.png'
                                    : 'assets/images/Group.png',
                                width: 20.0,
                                height: 20.0,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              15.0, 0.0, 0.0, 0.0),
                          child: Text(
                            'Your Ranking',
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
                                  color: FlutterFlowTheme.of(context).tertiary,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .fontStyle,
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                child: Divider(
                  color: FlutterFlowTheme.of(context).tertiary.withOpacity(0.2),
                  thickness: 1.0,
                ),
              ),

              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    // context.pushNamed(YourFinalRankingWidget.routeName);

                    context.pushNamed(
                      NavWidget.routeName,
                      queryParameters: {
                        'initialTab': '3'
                      }, // Pass initialTab as 1 for TabNotifications
                    );

                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 5.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(
                              color: const Color(0xFF282727),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                7.0, 7.0, 7.0, 7.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(0.0),
                              child: Image.asset(
                                Theme.of(context).brightness == Brightness.dark
                                    ? 'assets/images/Group(1).png'
                                    : 'assets/images/Group-1.png',
                                width: 20.0,
                                height: 20.0,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              15.0, 0.0, 0.0, 0.0),
                          child: Text(
                            'The Goat Global Ranking',
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
                                  color: FlutterFlowTheme.of(context).tertiary,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .fontStyle,
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                child: Divider(
                  color: FlutterFlowTheme.of(context).tertiary.withOpacity(0.2),
                  thickness: 1.0,
                ),
              ),

              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    // context.pushNamed(PlayWithFriendsWidget.routeName);

                    context.pushNamed(
                      NavWidget.routeName,
                      queryParameters: {
                        'initialTab': '4'
                      }, // Pass initialTab as 1 for TabNotifications
                    );

                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 5.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(
                              color: const Color(0xFF282727),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                7.0, 7.0, 7.0, 7.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(0.0),
                              child: Image.asset(
                                Theme.of(context).brightness == Brightness.dark
                                    ? 'assets/images/Group-1(1).png'
                                    : 'assets/images/Group-2.png',
                                width: 20.0,
                                height: 20.0,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              15.0, 0.0, 0.0, 0.0),
                          child: Text(
                            'Play With Friends',
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
                                  color: FlutterFlowTheme.of(context).tertiary,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .fontStyle,
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                child: Divider(
                  color: FlutterFlowTheme.of(context).tertiary.withOpacity(0.2),
                  thickness: 1.0,
                ),
              ),


              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                child: InkWell(


                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    context.pushNamed(ContestPageWidget.routeName);
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 5.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(
                              color: const Color(0xFF282727),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                7.0, 7.0, 7.0, 7.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(0.0),
                              child: Image.asset(
                                Theme.of(context).brightness == Brightness.dark
                                    ? 'assets/images/Group-2(1).png'
                                    : 'assets/images/Group-3.png',
                                width: 20.0,
                                height: 20.0,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 0.0, 0.0),
                          child: Text(
                            'Contest',
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
                                  color: FlutterFlowTheme.of(context).tertiary,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .fontStyle,
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                child: Divider(
                  color: FlutterFlowTheme.of(context).tertiary.withOpacity(0.2),
                  thickness: 1.0,
                ),
              ),

              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    context.pushNamed(SubscriptionPageWidget.routeName);
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 5.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(
                              color: const Color(0xFF282727),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                7.0, 7.0, 7.0, 7.0),
                            child: Icon(
                              Icons.paid_outlined,
                              color: FlutterFlowTheme.of(context).tertiary,
                              size: 20.0,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              15.0, 0.0, 0.0, 0.0),
                          child: Text(
                            'Premium Plans',
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
                                  color: FlutterFlowTheme.of(context).tertiary,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .fontStyle,
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                child: Divider(
                  color: FlutterFlowTheme.of(context).tertiary.withOpacity(0.2),
                  thickness: 1.0,
                ),
              ),

              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    context.pushNamed(PrivacyPolicyWidget.routeName);
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 5.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(
                              color: const Color(0xFF282727),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                7.0, 7.0, 7.0, 7.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(0.0),
                              child: Image.asset(
                                Theme.of(context).brightness == Brightness.dark
                                    ? 'assets/images/Vector-1.png'
                                    : 'assets/images/Group-3.png',
                                width: 20.0,
                                height: 20.0,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              15.0, 0.0, 0.0, 0.0),
                          child: Text(
                            'Legal & Privacy',
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
                                  color: FlutterFlowTheme.of(context).tertiary,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .fontStyle,
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                child: Divider(
                  color: FlutterFlowTheme.of(context).tertiary.withOpacity(0.2),
                  thickness: 1.0,
                ),
              ),
              
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    var shouldSetState = false;
                    _model.cmsRes =
                        await DashboardGroup.contactSupportCall.call(
                      authToken: FFAppState().authToken,
                    );

                    shouldSetState = true;
                    if ((_model.cmsRes?.succeeded ?? true) != true) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            '\"Something went wrong\"',
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
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .fontStyle,
                                ),
                          ),
                          duration: const Duration(milliseconds: 4000),
                          backgroundColor: Colors.black,
                        ),
                      );
                      if (shouldSetState) safeSetState(() {});
                      return;
                    }

                    context.pushNamed(ContactAndSupportWidget.routeName);

                    if (shouldSetState) safeSetState(() {});
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 5.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(
                              color: const Color(0xFF282727),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                7.0, 7.0, 7.0, 7.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(0.0),
                              child: Image.asset(
                                Theme.of(context).brightness == Brightness.dark
                                    ? 'assets/images/Group-3(1).png'
                                    : 'assets/images/Group-3.png',
                                width: 20.0,
                                height: 20.0,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              15.0, 0.0, 0.0, 0.0),
                          child: Text(
                            'Contact & Support',
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
                                  color: FlutterFlowTheme.of(context).tertiary,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .fontStyle,
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                child: Divider(
                  color: FlutterFlowTheme.of(context).tertiary.withOpacity(0.2),
                  thickness: 1.0,
                ),
              ),



              ///1

              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 60.0),
                child: Builder(
                  builder: (context) => InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    // onTap: () async {
                    //   Navigator.pop(context);
                    //   await showDialog(
                    //     context: context,
                    //     barrierDismissible: false,
                    //     builder: (alertDialogContext) {
                    //       return BackdropFilter(
                    //         filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                    //         child: AlertDialog(
                    //           backgroundColor: Colors.transparent,
                    //           insetPadding: EdgeInsets.zero,
                    //           contentPadding: EdgeInsets.zero,
                    //           content: Align(
                    //             alignment: Alignment.center,
                    //             child: Container(
                    //               width: MediaQuery.sizeOf(context).width,
                    //               height: MediaQuery.sizeOf(context).height * 0.6,
                    //               child: Align(
                    //                 alignment: Alignment.center,
                    //                 child: Padding(
                    //                   padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    //                   child: Container(
                    //                     width: double.infinity,
                    //                     height: MediaQuery.sizeOf(context).height,
                    //                     decoration: BoxDecoration(
                    //                       color: Colors.white,
                    //                       boxShadow: const [
                    //                         BoxShadow(
                    //                           blurRadius: 3.0,
                    //                           color: Color(0x33000000),
                    //                           offset: Offset(0.0, 1.0),
                    //                         )
                    //                       ],
                    //                       borderRadius: BorderRadius.circular(24.0),
                    //                       border: Border.all(
                    //                         color: FlutterFlowTheme.of(context).primaryBackground,
                    //                         width: 1.0,
                    //                       ),
                    //                     ),
                    //                     child: Padding(
                    //                       padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    //                       child: Column(
                    //                         mainAxisSize: MainAxisSize.max,
                    //                         crossAxisAlignment: CrossAxisAlignment.start,
                    //                         children: [
                    //                           Padding(
                    //                             padding: const EdgeInsetsDirectional.fromSTEB(24.0, 16.0, 24.0, 16.0),
                    //                             child: Column(
                    //                               mainAxisSize: MainAxisSize.max,
                    //                               crossAxisAlignment: CrossAxisAlignment.start,
                    //                               children: [
                    //                                 Align(
                    //                                   alignment: Alignment.center,
                    //                                   child: Icon( 
                    //                                     Icons.warning_amber_rounded,
                    //                                     color: Colors.red,
                    //                                     size: 100.0,
                    //                                   ),
                    //                                 ),
                    //                                 Align(
                    //                                   alignment: Alignment.center,
                    //                                   child: Padding(
                    //                                     padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                    //                                     child: Text.rich(
                    //                                       TextSpan(
                    //                                         children: [
                    //                                           TextSpan(
                    //                                             text: 'You\'re about to permanently delete your account\n\n',
                    //                                             style: FlutterFlowTheme.of(context).headlineLarge.override(
                    //                                               font: GoogleFonts.poppins(fontWeight: FontWeight.normal),
                    //                                               color: Colors.black,
                    //                                               fontSize: 16.0,
                    //                                             ),
                    //                                           ),
                    //                                           TextSpan(
                    //                                             text: 'ATTENTION: ',
                    //                                             style: FlutterFlowTheme.of(context).headlineLarge.override(
                    //                                               font: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                    //                                               color: Colors.red,
                    //                                               fontSize: 16.0,
                    //                                             ),
                    //                                           ),
                    //                                           TextSpan(
                    //                                             text: 'This action is irreversible!\n\nAll your data, rankings, and progress will be permanently deleted.\n\nAre you sure you want to proceed?',
                    //                                             style: FlutterFlowTheme.of(context).headlineLarge.override(
                    //                                               font: GoogleFonts.poppins(fontWeight: FontWeight.normal),
                    //                                               color: Colors.black,
                    //                                               fontSize: 16.0,
                    //                                             ),
                    //                                           ),
                    //                                         ],
                    //                                       ),
                    //                                       textAlign: TextAlign.left,
                    //                                     ),
                    //                                   ),
                    //                                 ),
                    //                               ],
                    //                             ),
                    //                           ),
                    //                           Expanded(
                    //                             child: Padding(
                    //                               padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 10.0),
                    //                               child: Row(
                    //                                 mainAxisAlignment: MainAxisAlignment.end,
                    //                                 children: [
                    //                                   Container(
                    //                                     width: 70.0,
                    //                                     decoration: BoxDecoration(
                    //                                       color: const Color(0x54808080),
                    //                                       borderRadius: BorderRadius.circular(12.0),
                    //                                     ),
                    //                                     child: FFButtonWidget(
                    //                                       onPressed: () async {
                    //                                         Navigator.pop(alertDialogContext);
                    //                                       },
                    //                                       text: 'Back',
                    //                                       options: FFButtonOptions(
                    //                                         height: 40.0,
                    //                                         color: const Color(0xff000000),
                    //                                         textStyle: FlutterFlowTheme.of(context).headlineLarge.override(
                    //                                           font: GoogleFonts.poppins(),
                    //                                           color: Colors.white,
                    //                                           fontSize: 16.0,
                    //                                         ),
                    //                                         elevation: 0.0,
                    //                                         borderRadius: BorderRadius.circular(12.0),
                    //                                       ),
                    //                                     ),
                    //                                   ),
                    //                                   Padding(
                    //                                     padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                    //                                     child: Container(
                    //                                       width: 90.0,
                    //                                       decoration: BoxDecoration(
                    //                                         color: Colors.red,
                    //                                         borderRadius: BorderRadius.circular(12.0),
                    //                                       ),
                    //                                       child: FFButtonWidget(
                    //                                         onPressed: () async {
                    //                                           try {
                    //                                             // Step 1: Close the confirmation dialog first
                    //                                             // Navigator.pop(alertDialogContext);
                    //
                    //                                             // Step 2: Clear app state and navigate to login
                    //                                             // FFAppState().deleteAuthToken();
                    //
                    //
                    //                                             // Wait a frame so context is ready for navigation
                    //                                             await Future.delayed(const Duration(milliseconds: 300));
                    //                                             context.goNamed(LogInWidget.routeName);
                    //                                             FFAppState().deleteAuthToken();
                    //                                             FFAppState().authToken = '';
                    //                                             FFAppState().navigationType = 1;
                    //
                    //                                             // Step 3: Trigger delete API call in background
                    //                                             Future.microtask(() async {
                    //                                               try {
                    //                                                 final response = await http.delete(
                    //                                                   Uri.parse('https://votethegoat.ezxdemo.com/api/delete-user'),
                    //                                                   headers: {
                    //                                                     'Content-Type': 'application/json',
                    //                                                     'Authorization': 'Bearer ${FFAppState().authToken}',
                    //                                                   },
                    //                                                 );
                    //
                    //                                                 print('🗑️ Delete Account Response: ${response.body}');
                    //                                                 print('Status Code: ${response.statusCode}');
                    //                                               } catch (e) {
                    //                                                 print('⚠️ Error deleting account: $e');
                    //                                               }
                    //                                             });
                    //                                           } catch (e) {
                    //                                             print('⚠️ Unexpected error: $e');
                    //                                             ScaffoldMessenger.of(context).showSnackBar(
                    //                                               SnackBar(
                    //                                                 content: Text('Error: $e'),
                    //                                                 backgroundColor: Colors.red,
                    //                                               ),
                    //                                             );
                    //                                           }
                    //                                         },
                    //
                    //
                    //                                         text: 'Delete',
                    //                                         options: FFButtonOptions(
                    //                                           height: 40.0,
                    //                                           color: Colors.red,
                    //                                           textStyle: FlutterFlowTheme.of(context).headlineLarge.override(
                    //                                             font: GoogleFonts.poppins(),
                    //                                             color: Colors.white,
                    //                                             fontSize: 16.0,
                    //                                           ),
                    //                                           elevation: 0.0,
                    //                                           borderRadius: BorderRadius.circular(10.0),
                    //                                         ),
                    //                                       ),
                    //                                     ),
                    //                                   ),
                    //                                 ],
                    //                               ),
                    //                             ),
                    //                           ),
                    //                         ],
                    //                       ),
                    //                     ),
                    //                   ),
                    //                 ),
                    //               ),
                    //             ),
                    //           ),
                    //         ),
                    //       );
                    //     },
                    //   );
                    // },

                    onTap: () async {
                      Navigator.pop(context);
                      await showDialog(
                        context: context,
                        builder: (dialogContext) {
                          return Dialog(
                            elevation: 0,
                            insetPadding: EdgeInsets.zero,
                            backgroundColor: Colors.transparent,
                            alignment:
                                const AlignmentDirectional(0.0, 0.0)
                                    .resolve(
                                        Directionality.of(dialogContext)),
                            child: WebViewAware(
                              child: SizedBox(
                                height: MediaQuery.sizeOf(dialogContext)
                                        .height *
                                    0.9,
                                child: const DeleteAccountWidget(),
                              ),
                            ),
                          );
                        },
                      );
                    },

                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 5.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(color: const Color(0xFF282727)),
                            ),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(7.0, 7.0, 7.0, 7.0),
                              child: Icon(
                                Icons.delete_outline,
                                color: FlutterFlowTheme.of(context).tertiary,
                                size: 20.0,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 0.0, 0.0),
                            child: Text(
                              'Delete Account',
                              style: FlutterFlowTheme.of(context).labelMedium.override(
                                font: GoogleFonts.poppins(),
                                color: FlutterFlowTheme.of(context).tertiary,
                                letterSpacing: 0.0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              ///

              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                child: Divider(
                  color: FlutterFlowTheme.of(context).tertiary.withOpacity(0.2),
                  thickness: 1.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
