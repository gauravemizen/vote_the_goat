// import '/backend/api_requests/api_calls.dart';
// import '/components/gradient_button_custom/gradient_button_custom_widget.dart';
// import '/flutter_flow/flutter_flow_theme.dart';
// import '/flutter_flow/flutter_flow_util.dart';
// import '/index.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'change_password_model.dart';
// export 'change_password_model.dart';
//
// class ChangePasswordWidget extends StatefulWidget {
//   const ChangePasswordWidget({
//     super.key,
//     required this.userId,
//   });
//
//   final int? userId;
//
//   static String routeName = 'changePassword';
//   static String routePath = '/changePassword';
//
//   @override
//   State<ChangePasswordWidget> createState() => _ChangePasswordWidgetState();
// }
//
// class _ChangePasswordWidgetState extends State<ChangePasswordWidget>
//     with RouteAware {
//   late ChangePasswordModel _model;
//
//   final scaffoldKey = GlobalKey<ScaffoldState>();
//
//   @override
//   void initState() {
//     super.initState();
//     _model = createModel(context, () => ChangePasswordModel());
//
//     _model.passwordFieldTextController ??= TextEditingController()
//       ..addListener(() {
//         debugLogWidgetClass(_model);
//       });
//     _model.passwordFieldFocusNode ??= FocusNode();
//
//     _model.coPasswordFieldTextController ??= TextEditingController()
//       ..addListener(() {
//         debugLogWidgetClass(_model);
//       });
//     _model.coPasswordFieldFocusNode ??= FocusNode();
//   }
//
//   @override
//   void dispose() {
//     routeObserver.unsubscribe(this);
//
//     _model.dispose();
//
//     super.dispose();
//   }
//
//   @override
//   void didUpdateWidget(ChangePasswordWidget oldWidget) {
//     super.didUpdateWidget(oldWidget);
//     _model.widget = widget;
//   }
//
//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     final route = DebugModalRoute.of(context);
//     if (route != null) {
//       routeObserver.subscribe(this, route);
//     }
//     debugLogGlobalProperty(context);
//   }
//
//   @override
//   void didPopNext() {
//     if (mounted && DebugFlutterFlowModelContext.maybeOf(context) == null) {
//       setState(() => _model.isRouteVisible = true);
//       debugLogWidgetClass(_model);
//     }
//   }
//
//   @override
//   void didPush() {
//     if (mounted && DebugFlutterFlowModelContext.maybeOf(context) == null) {
//       setState(() => _model.isRouteVisible = true);
//       debugLogWidgetClass(_model);
//     }
//   }
//
//   @override
//   void didPop() {
//     _model.isRouteVisible = false;
//   }
//
//   @override
//   void didPushNext() {
//     _model.isRouteVisible = false;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     DebugFlutterFlowModelContext.maybeOf(context)
//         ?.parentModelCallback
//         ?.call(_model);
//
//     return GestureDetector(
//       onTap: () {
//         FocusScope.of(context).unfocus();
//         FocusManager.instance.primaryFocus?.unfocus();
//       },
//       child: Scaffold(
//         key: scaffoldKey,
//         backgroundColor: FlutterFlowTheme.of(context).oposite,
//         body: Stack(
//           children: [
//             Align(
//               alignment: const AlignmentDirectional(0.0, 0.0),
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(8.0),
//                 child: Image.asset(
//                   Theme.of(context).brightness == Brightness.dark
//                       ? 'assets/images/forgotBg.png'
//                       : 'assets/images/plain_whiteBg.png',
//                   width: double.infinity,
//                   height: double.infinity,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsetsDirectional.fromSTEB(16.0, 40.0, 16.0, 0.0),
//               child: Column(
//                 mainAxisSize: MainAxisSize.max,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     mainAxisSize: MainAxisSize.max,
//                     children: [
//                       InkWell(
//                         splashColor: Colors.transparent,
//                         focusColor: Colors.transparent,
//                         hoverColor: Colors.transparent,
//                         highlightColor: Colors.transparent,
//                         onTap: () async {
//                           context.safePop();
//                         },
//                         child: Container(
//                           width: 40.0,
//                           height: 40.0,
//                           decoration: BoxDecoration(
//                             color: FlutterFlowTheme.of(context).oposite,
//                             boxShadow: [
//                               BoxShadow(
//                                 blurRadius: 4.0,
//                                 color: (Theme.of(context).brightness ==
//                                             Brightness.dark) ==
//                                         true
//                                     ? const Color(0x00000000)
//                                     : Colors.white,
//                                 offset: const Offset(
//                                   0.0,
//                                   2.0,
//                                 ),
//                               )
//                             ],
//                             borderRadius: BorderRadius.circular(12.0),
//                             border: Border.all(
//                               color: (Theme.of(context).brightness ==
//                                           Brightness.dark) ==
//                                       true
//                                   ? Colors.black
//                                   : const Color(0xD5999999),
//                             ),
//                           ),
//                           child: Icon(
//                             Icons.arrow_back_rounded,
//                             color: FlutterFlowTheme.of(context).tertiary,
//                             size: 24.0,
//                           ),
//                         ),
//                       ),
//                       Expanded(
//                         child: Align(
//                           alignment: const AlignmentDirectional(0.0, 0.0),
//                           child: Padding(
//                             padding: const EdgeInsetsDirectional.fromSTEB(
//                                 0.0, 0.0, 24.0, 0.0),
//                             child: SingleChildScrollView(
//                               child: Column(
//                                 mainAxisSize: MainAxisSize.max,
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Text(
//                                     'Create new',
//                                     style: FlutterFlowTheme.of(context)
//                                         .customTextStyle1
//                                         .override(
//                                           fontFamily: 'good times',
//                                           color: FlutterFlowTheme.of(context)
//                                               .tertiary,
//                                           fontSize: 24.0,
//                                           letterSpacing: 0.0,
//                                           fontWeight: FontWeight.normal,
//                                         ),
//                                   ),
//                                   Text(
//                                     'PASSWORD',
//                                     style: FlutterFlowTheme.of(context)
//                                         .customTextStyle1
//                                         .override(
//                                           fontFamily: 'good times',
//                                           color: const Color(0xFFEB6027),
//                                           fontSize: 24.0,
//                                           letterSpacing: 0.0,
//                                           fontWeight: FontWeight.normal,
//                                         ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   Align(
//                     alignment: const AlignmentDirectional(0.0, 0.0),
//                     child: Padding(
//                       padding:
//                           const EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
//                       child: Text(
//                         'Please create the new password',
//                         style: FlutterFlowTheme.of(context)
//                             .titleMedium
//                             .override(
//                               font: GoogleFonts.poppins(
//                                 fontWeight: FlutterFlowTheme.of(context)
//                                     .titleMedium
//                                     .fontWeight,
//                                 fontStyle: FlutterFlowTheme.of(context)
//                                     .titleMedium
//                                     .fontStyle,
//                               ),
//                               color: FlutterFlowTheme.of(context).lightWhite,
//                               letterSpacing: 0.0,
//                               fontWeight: FlutterFlowTheme.of(context)
//                                   .titleMedium
//                                   .fontWeight,
//                               fontStyle: FlutterFlowTheme.of(context)
//                                   .titleMedium
//                                   .fontStyle,
//                             ),
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding:
//                         const EdgeInsetsDirectional.fromSTEB(0.0, 37.0, 0.0, 0.0),
//                     child: SizedBox(
//                       width: double.infinity,
//                       child: TextFormField(
//                         controller: _model.passwordFieldTextController,
//                         focusNode: _model.passwordFieldFocusNode,
//                         autofocus: false,
//                         obscureText: !_model.passwordFieldVisibility,
//                         decoration: InputDecoration(
//                           isDense: true,
//                           labelStyle:
//                               FlutterFlowTheme.of(context).labelMedium.override(
//                                     font: GoogleFonts.poppins(
//                                       fontWeight: FlutterFlowTheme.of(context)
//                                           .labelMedium
//                                           .fontWeight,
//                                       fontStyle: FlutterFlowTheme.of(context)
//                                           .labelMedium
//                                           .fontStyle,
//                                     ),
//                                     letterSpacing: 0.0,
//                                     fontWeight: FlutterFlowTheme.of(context)
//                                         .labelMedium
//                                         .fontWeight,
//                                     fontStyle: FlutterFlowTheme.of(context)
//                                         .labelMedium
//                                         .fontStyle,
//                                   ),
//                           hintText: 'New Password',
//                           hintStyle:
//                               FlutterFlowTheme.of(context).labelMedium.override(
//                                     font: GoogleFonts.poppins(
//                                       fontWeight: FlutterFlowTheme.of(context)
//                                           .labelMedium
//                                           .fontWeight,
//                                       fontStyle: FlutterFlowTheme.of(context)
//                                           .labelMedium
//                                           .fontStyle,
//                                     ),
//                                     letterSpacing: 0.0,
//                                     fontWeight: FlutterFlowTheme.of(context)
//                                         .labelMedium
//                                         .fontWeight,
//                                     fontStyle: FlutterFlowTheme.of(context)
//                                         .labelMedium
//                                         .fontStyle,
//                                   ),
//                           enabledBorder: OutlineInputBorder(
//                             borderSide: const BorderSide(
//                               color: Color(0x00000000),
//                               width: 1.0,
//                             ),
//                             borderRadius: BorderRadius.circular(8.0),
//                           ),
//                           focusedBorder: OutlineInputBorder(
//                             borderSide: const BorderSide(
//                               color: Color(0x00000000),
//                               width: 1.0,
//                             ),
//                             borderRadius: BorderRadius.circular(8.0),
//                           ),
//                           errorBorder: OutlineInputBorder(
//                             borderSide: BorderSide(
//                               color: FlutterFlowTheme.of(context).error,
//                               width: 1.0,
//                             ),
//                             borderRadius: BorderRadius.circular(8.0),
//                           ),
//                           focusedErrorBorder: OutlineInputBorder(
//                             borderSide: BorderSide(
//                               color: FlutterFlowTheme.of(context).error,
//                               width: 1.0,
//                             ),
//                             borderRadius: BorderRadius.circular(8.0),
//                           ),
//                           filled: true,
//                           fillColor: (Theme.of(context).brightness ==
//                                       Brightness.dark) ==
//                                   true
//                               ? const Color(0x80050505)
//                               : const Color(0x0C050505),
//                           prefixIcon: Icon(
//                             FFIcons.klock,
//                             color: FlutterFlowTheme.of(context).tertiary,
//                             size: 24.0,
//                           ),
//                           suffixIcon: InkWell(
//                             onTap: () => safeSetState(
//                               () => _model.passwordFieldVisibility =
//                                   !_model.passwordFieldVisibility,
//                             ),
//                             focusNode: FocusNode(skipTraversal: true),
//                             child: Icon(
//                               _model.passwordFieldVisibility
//                                   ? Icons.visibility_outlined
//                                   : Icons.visibility_off_outlined,
//                               color: FlutterFlowTheme.of(context).tertiary,
//                               size: 20.0,
//                             ),
//                           ),
//                         ),
//                         style:
//                             FlutterFlowTheme.of(context).labelMedium.override(
//                                   font: GoogleFonts.poppins(
//                                     fontWeight: FlutterFlowTheme.of(context)
//                                         .labelMedium
//                                         .fontWeight,
//                                     fontStyle: FlutterFlowTheme.of(context)
//                                         .labelMedium
//                                         .fontStyle,
//                                   ),
//                                   letterSpacing: 0.0,
//                                   fontWeight: FlutterFlowTheme.of(context)
//                                       .labelMedium
//                                       .fontWeight,
//                                   fontStyle: FlutterFlowTheme.of(context)
//                                       .labelMedium
//                                       .fontStyle,
//                                 ),
//                         cursorColor: FlutterFlowTheme.of(context).primaryText,
//                         validator: _model.passwordFieldTextControllerValidator
//                             .asValidator(context),
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding:
//                         const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
//                     child: SizedBox(
//                       width: double.infinity,
//                       child: TextFormField(
//                         controller: _model.coPasswordFieldTextController,
//                         focusNode: _model.coPasswordFieldFocusNode,
//                         autofocus: false,
//                         obscureText: !_model.coPasswordFieldVisibility,
//                         decoration: InputDecoration(
//                           isDense: true,
//                           labelStyle:
//                               FlutterFlowTheme.of(context).labelMedium.override(
//                                     font: GoogleFonts.poppins(
//                                       fontWeight: FlutterFlowTheme.of(context)
//                                           .labelMedium
//                                           .fontWeight,
//                                       fontStyle: FlutterFlowTheme.of(context)
//                                           .labelMedium
//                                           .fontStyle,
//                                     ),
//                                     letterSpacing: 0.0,
//                                     fontWeight: FlutterFlowTheme.of(context)
//                                         .labelMedium
//                                         .fontWeight,
//                                     fontStyle: FlutterFlowTheme.of(context)
//                                         .labelMedium
//                                         .fontStyle,
//                                   ),
//                           hintText: 'Confirm New Password',
//                           hintStyle:
//                               FlutterFlowTheme.of(context).labelMedium.override(
//                                     font: GoogleFonts.poppins(
//                                       fontWeight: FlutterFlowTheme.of(context)
//                                           .labelMedium
//                                           .fontWeight,
//                                       fontStyle: FlutterFlowTheme.of(context)
//                                           .labelMedium
//                                           .fontStyle,
//                                     ),
//                                     letterSpacing: 0.0,
//                                     fontWeight: FlutterFlowTheme.of(context)
//                                         .labelMedium
//                                         .fontWeight,
//                                     fontStyle: FlutterFlowTheme.of(context)
//                                         .labelMedium
//                                         .fontStyle,
//                                   ),
//                           enabledBorder: OutlineInputBorder(
//                             borderSide: const BorderSide(
//                               color: Color(0x00000000),
//                               width: 1.0,
//                             ),
//                             borderRadius: BorderRadius.circular(8.0),
//                           ),
//                           focusedBorder: OutlineInputBorder(
//                             borderSide: const BorderSide(
//                               color: Color(0x00000000),
//                               width: 1.0,
//                             ),
//                             borderRadius: BorderRadius.circular(8.0),
//                           ),
//                           errorBorder: OutlineInputBorder(
//                             borderSide: BorderSide(
//                               color: FlutterFlowTheme.of(context).error,
//                               width: 1.0,
//                             ),
//                             borderRadius: BorderRadius.circular(8.0),
//                           ),
//                           focusedErrorBorder: OutlineInputBorder(
//                             borderSide: BorderSide(
//                               color: FlutterFlowTheme.of(context).error,
//                               width: 1.0,
//                             ),
//                             borderRadius: BorderRadius.circular(8.0),
//                           ),
//                           filled: true,
//                           fillColor: (Theme.of(context).brightness ==
//                                       Brightness.dark) ==
//                                   true
//                               ? const Color(0x80050505)
//                               : const Color(0x0C050505),
//                           prefixIcon: Icon(
//                             FFIcons.klock,
//                             color: FlutterFlowTheme.of(context).tertiary,
//                             size: 24.0,
//                           ),
//                           suffixIcon: InkWell(
//                             onTap: () => safeSetState(
//                               () => _model.coPasswordFieldVisibility =
//                                   !_model.coPasswordFieldVisibility,
//                             ),
//                             focusNode: FocusNode(skipTraversal: true),
//                             child: Icon(
//                               _model.coPasswordFieldVisibility
//                                   ? Icons.visibility_outlined
//                                   : Icons.visibility_off_outlined,
//                               color: FlutterFlowTheme.of(context).tertiary,
//                               size: 20.0,
//                             ),
//                           ),
//                         ),
//                         style:
//                             FlutterFlowTheme.of(context).labelMedium.override(
//                                   font: GoogleFonts.poppins(
//                                     fontWeight: FlutterFlowTheme.of(context)
//                                         .labelMedium
//                                         .fontWeight,
//                                     fontStyle: FlutterFlowTheme.of(context)
//                                         .labelMedium
//                                         .fontStyle,
//                                   ),
//                                   letterSpacing: 0.0,
//                                   fontWeight: FlutterFlowTheme.of(context)
//                                       .labelMedium
//                                       .fontWeight,
//                                   fontStyle: FlutterFlowTheme.of(context)
//                                       .labelMedium
//                                       .fontStyle,
//                                 ),
//                         cursorColor: FlutterFlowTheme.of(context).primaryText,
//                         validator: _model.coPasswordFieldTextControllerValidator
//                             .asValidator(context),
//                       ),
//                     ),
//                   ),
//                   Expanded(
//                     child: Align(
//                       alignment: const AlignmentDirectional(0.0, 1.0),
//                       child: InkWell(
//                         splashColor: Colors.transparent,
//                         focusColor: Colors.transparent,
//                         hoverColor: Colors.transparent,
//                         highlightColor: Colors.transparent,
//                         onTap: () async {},
//                         child: Container(
//                           decoration: const BoxDecoration(),
//                           child: Padding(
//                             padding: const EdgeInsetsDirectional.fromSTEB(
//                                 0.0, 0.0, 0.0, 40.0),
//                             child: InkWell(
//                               splashColor: Colors.transparent,
//                               focusColor: Colors.transparent,
//                               hoverColor: Colors.transparent,
//                               highlightColor: Colors.transparent,
//                               onTap: () async {
//                                 var shouldSetState = false;
//                                 _model.apiResultm02 =
//                                     await AuthGroup.changePasswordCall.call(
//                                   userId: widget.userId,
//                                   password:
//                                       _model.passwordFieldTextController.text,
//                                   passwordConfirmation:
//                                       _model.coPasswordFieldTextController.text,
//                                 );
//
//                                 shouldSetState = true;
//                                 if ((_model.apiResultm02?.succeeded ?? true)) {
//                                   ScaffoldMessenger.of(context).showSnackBar(
//                                     SnackBar(
//                                       content: Text(
//                                         getJsonField(
//                                           (_model.apiResultm02?.jsonBody ?? ''),
//                                           r'''$.message''',
//                                         ).toString(),
//                                         style: FlutterFlowTheme.of(context)
//                                             .titleMedium
//                                             .override(
//                                               font: GoogleFonts.poppins(
//                                                 fontWeight:
//                                                     FlutterFlowTheme.of(context)
//                                                         .titleMedium
//                                                         .fontWeight,
//                                                 fontStyle:
//                                                     FlutterFlowTheme.of(context)
//                                                         .titleMedium
//                                                         .fontStyle,
//                                               ),
//                                               color: Colors.white,
//                                               letterSpacing: 0.0,
//                                               fontWeight:
//                                                   FlutterFlowTheme.of(context)
//                                                       .titleMedium
//                                                       .fontWeight,
//                                               fontStyle:
//                                                   FlutterFlowTheme.of(context)
//                                                       .titleMedium
//                                                       .fontStyle,
//                                             ),
//                                       ),
//                                       duration: const Duration(milliseconds: 4000),
//                                       backgroundColor: const Color(0xFF030303),
//                                     ),
//                                   );
//
//                                   context.goNamed(LogInWidget.routeName);
//                                 } else {
//                                   ScaffoldMessenger.of(context).showSnackBar(
//                                     SnackBar(
//                                       content: Text(
//                                         getJsonField(
//                                           (_model.apiResultm02?.jsonBody ?? ''),
//                                           r'''$.message''',
//                                         ).toString(),
//                                         style: FlutterFlowTheme.of(context)
//                                             .titleMedium
//                                             .override(
//                                               font: GoogleFonts.poppins(
//                                                 fontWeight:
//                                                     FlutterFlowTheme.of(context)
//                                                         .titleMedium
//                                                         .fontWeight,
//                                                 fontStyle:
//                                                     FlutterFlowTheme.of(context)
//                                                         .titleMedium
//                                                         .fontStyle,
//                                               ),
//                                               color: Colors.white,
//                                               letterSpacing: 0.0,
//                                               fontWeight:
//                                                   FlutterFlowTheme.of(context)
//                                                       .titleMedium
//                                                       .fontWeight,
//                                               fontStyle:
//                                                   FlutterFlowTheme.of(context)
//                                                       .titleMedium
//                                                       .fontStyle,
//                                             ),
//                                       ),
//                                       duration: const Duration(milliseconds: 4000),
//                                       backgroundColor: const Color(0xFF030303),
//                                     ),
//                                   );
//                                   if (shouldSetState) safeSetState(() {});
//                                   return;
//                                 }
//
//                                 safeSetState(() {
//                                   _model.passwordFieldTextController?.clear();
//                                   _model.coPasswordFieldTextController?.clear();
//                                 });
//                                 if (shouldSetState) safeSetState(() {});
//                               },
//                               child: wrapWithModel(
//                                 model: _model.gradientButtonCustomModel,
//                                 updateCallback: () => safeSetState(() {}),
//                                 child: Builder(builder: (_) {
//                                   return DebugFlutterFlowModelContext(
//                                     rootModel: _model.rootModel,
//                                     child: const GradientButtonCustomWidget(
//                                       text: 'Save',
//                                     ),
//                                   );
//                                 }),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }



///2
///
import 'package:flutter/foundation.dart';

import '/backend/api_requests/api_calls.dart';
import '/components/gradient_button_custom/gradient_button_custom_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'change_password_model.dart';
export 'change_password_model.dart';

class ChangePasswordWidget extends StatefulWidget {
  const ChangePasswordWidget({
    super.key,
    required this.userId,
  });

  final int? userId;

  static String routeName = 'changePassword';
  static String routePath = '/changePassword';

  @override
  State<ChangePasswordWidget> createState() => _ChangePasswordWidgetState();
}

class _ChangePasswordWidgetState extends State<ChangePasswordWidget>
    with RouteAware {
  late ChangePasswordModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldMessengerState> _scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChangePasswordModel());

    _model.passwordFieldTextController ??= TextEditingController()
      ..addListener(() {
        debugLogWidgetClass(_model);
      });
    _model.passwordFieldFocusNode ??= FocusNode();

    _model.coPasswordFieldTextController ??= TextEditingController()
      ..addListener(() {
        debugLogWidgetClass(_model);
      });
    _model.coPasswordFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);

    _model.dispose();

    super.dispose();
  }

  @override
  void didUpdateWidget(ChangePasswordWidget oldWidget) {
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

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: ScaffoldMessenger(
        key: _scaffoldMessengerKey,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).oposite,
          body: Stack(
            children: [
              Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: ClipRRect(
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
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 40.0, 16.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        // InkWell(
                        //   splashColor: Colors.transparent,
                        //   focusColor: Colors.transparent,
                        //   hoverColor: Colors.transparent,
                        //   highlightColor: Colors.transparent,
                        //   onTap: () async {
                        //     context.safePop();
                        //   },
                        //   child: Container(
                        //     width: 40.0,
                        //     height: 40.0,
                        //     decoration: BoxDecoration(
                        //       color: FlutterFlowTheme.of(context).oposite,
                        //       boxShadow: [
                        //         BoxShadow(
                        //           blurRadius: 4.0,
                        //           color: (Theme.of(context).brightness ==
                        //               Brightness.dark) ==
                        //               true
                        //               ? const Color(0x00000000)
                        //               : Colors.white,
                        //           offset: const Offset(
                        //             0.0,
                        //             2.0,
                        //           ),
                        //         )
                        //       ],
                        //       borderRadius: BorderRadius.circular(12.0),
                        //       border: Border.all(
                        //         color: (Theme.of(context).brightness ==
                        //             Brightness.dark) ==
                        //             true
                        //             ? Colors.black
                        //             : const Color(0xD5999999),
                        //       ),
                        //     ),
                        //     child: Icon(
                        //       Icons.arrow_back_rounded,
                        //       color: FlutterFlowTheme.of(context).tertiary,
                        //       size: 24.0,
                        //     ),
                        //   ),
                        // ),
                        Expanded(
                          child: Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 24.0, 0.0),
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Create new',
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
                                      'PASSWORD',
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
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                        child: Text(
                          'Please create the new password',
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
                            color: FlutterFlowTheme.of(context).lightWhite,
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
                      const EdgeInsetsDirectional.fromSTEB(0.0, 37.0, 0.0, 0.0),
                      child: SizedBox(
                        width: double.infinity,
                        child: TextFormField(
                          controller: _model.passwordFieldTextController,
                          focusNode: _model.passwordFieldFocusNode,
                          autofocus: false,
                          obscureText: !_model.passwordFieldVisibility,
                          decoration: InputDecoration(
                            isDense: true,
                            labelStyle:
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
                            hintText: 'New Password',
                            hintStyle:
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
                              FFIcons.klock,
                              color: FlutterFlowTheme.of(context).tertiary,
                              size: 24.0,
                            ),
                            suffixIcon: InkWell(
                              onTap: () => safeSetState(
                                    () => _model.passwordFieldVisibility =
                                !_model.passwordFieldVisibility,
                              ),
                              focusNode: FocusNode(skipTraversal: true),
                              child: Icon(
                                _model.passwordFieldVisibility
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined,
                                color: FlutterFlowTheme.of(context).tertiary,
                                size: 20.0,
                              ),
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
                          validator: _model.passwordFieldTextControllerValidator
                              .asValidator(context),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                      child: SizedBox(
                        width: double.infinity,
                        child: TextFormField(
                          controller: _model.coPasswordFieldTextController,
                          focusNode: _model.coPasswordFieldFocusNode,
                          autofocus: false,
                          obscureText: !_model.coPasswordFieldVisibility,
                          decoration: InputDecoration(
                            isDense: true,
                            labelStyle:
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
                            hintText: 'Confirm New Password',
                            hintStyle:
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
                              FFIcons.klock,
                              color: FlutterFlowTheme.of(context).tertiary,
                              size: 24.0,
                            ),
                            suffixIcon: InkWell(
                              onTap: () => safeSetState(
                                    () => _model.coPasswordFieldVisibility =
                                !_model.coPasswordFieldVisibility,
                              ),
                              focusNode: FocusNode(skipTraversal: true),
                              child: Icon(
                                _model.coPasswordFieldVisibility
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined,
                                color: FlutterFlowTheme.of(context).tertiary,
                                size: 20.0,
                              ),
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
                          validator: _model.coPasswordFieldTextControllerValidator
                              .asValidator(context),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: const AlignmentDirectional(0.0, 1.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {},
                          child: Container(
                            decoration: const BoxDecoration(),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 40.0 + MediaQuery.of(context).viewPadding.bottom),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  var shouldSetState = false;



                                  if (kDebugMode){
                                  print('=== API Request Debug ===');
                                  print('Endpoint: Change Password');
                                  print('User ID: ${widget.userId}');
                                  print('Password: ${_model.passwordFieldTextController.text}');
                                  print('Password Confirmation: ${_model.coPasswordFieldTextController.text}');
                                  print('========================');}
                                  _model.apiResultm02 = await AuthGroup.changePasswordCall.call(
                                    userId: widget.userId,
                                    password: _model.passwordFieldTextController.text,
                                    passwordConfirmation: _model.coPasswordFieldTextController.text,
                                  );

                                  shouldSetState = true;


                                  // Print response data
                                  if (kDebugMode){
                                  print('=== API Response Debug ===');
                                  print('Success: ${_model.apiResultm02?.succeeded}');
                                  print('Status Code: ${_model.apiResultm02?.statusCode}');
                                  print('Response Body: ${_model.apiResultm02?.jsonBody}');
                                  print('Headers: ${_model.apiResultm02?.headers}');
                                  print('==========================');}

                                  if ((_model.apiResultm02?.succeeded ?? true)) {
                                    // Use the global key to show SnackBar
                                    _scaffoldMessengerKey.currentState?.showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          getJsonField(
                                            (_model.apiResultm02?.jsonBody ?? ''),
                                            r'''$.message''',
                                          ).toString(),
                                          style: const TextStyle(color: Colors.white),
                                        ),
                                        duration: const Duration(milliseconds: 4000),
                                        backgroundColor: const Color(0xFF030303),
                                      ),
                                    );

                                    // Add delay before navigation
                                    await Future.delayed(const Duration(milliseconds: 1000));

                                    if (mounted) {
                                      context.goNamed(LogInWidget.routeName);
                                    }
                                  } else {
                                    // Use the global key to show error SnackBar
                                    _scaffoldMessengerKey.currentState?.showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          getJsonField(
                                            (_model.apiResultm02?.jsonBody ?? ''),
                                            r'''$.message''',
                                          ).toString(),
                                          style: const TextStyle(color: Colors.white),
                                        ),
                                        duration: const Duration(milliseconds: 4000),
                                        backgroundColor: const Color(0xFF030303),
                                      ),
                                    );
                                    if (shouldSetState) safeSetState(() {});
                                    return;
                                  }

                                  if (mounted) {
                                    safeSetState(() {
                                      _model.passwordFieldTextController?.clear();
                                      _model.coPasswordFieldTextController?.clear();
                                    });
                                  }
                                  if (shouldSetState) safeSetState(() {});
                                },
                                child: wrapWithModel(
                                  model: _model.gradientButtonCustomModel,
                                  updateCallback: () => safeSetState(() {}),
                                  child: Builder(builder: (_) {
                                    return DebugFlutterFlowModelContext(
                                      rootModel: _model.rootModel,
                                      child: const GradientButtonCustomWidget(
                                        text: 'Save',
                                      ),
                                    );
                                  }),
                                ),
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
  }
}