// import '/flutter_flow/flutter_flow_theme.dart';
// import '/flutter_flow/flutter_flow_util.dart';
// import '/flutter_flow/flutter_flow_widgets.dart';
// import 'dart:ui';
// import '/index.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:provider/provider.dart';
// import 'package:http/http.dart' as http;
// import 'delete_account_model.dart';
// export 'delete_account_model.dart';
//
// class DeleteAccountWidget extends StatefulWidget {
//   const DeleteAccountWidget({super.key});
//
//   @override
//   State<DeleteAccountWidget> createState() => _DeleteAccountWidgetState();
// }
//
// class _DeleteAccountWidgetState extends State<DeleteAccountWidget> with RouteAware {
//   late DeleteAccountModel _model;
//
//   @override
//   void setState(VoidCallback callback) {
//     super.setState(callback);
//     _model.onUpdate();
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     _model = createModel(context, () => DeleteAccountModel());
//   }
//
//   @override
//   void dispose() {
//     routeObserver.unsubscribe(this);
//     _model.maybeDispose();
//     super.dispose();
//   }
//
//   @override
//   void didUpdateWidget(DeleteAccountWidget oldWidget) {
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
//     context.watch<FFAppState>();
//
//     return Align(
//       alignment: AlignmentDirectional(0.0, 0.0),
//       child: Padding(
//         padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 12.0),
//         child: Container(
//           height: MediaQuery.sizeOf(context).height * 0.9,
//           width: double.infinity,
//           constraints: BoxConstraints(
//
//             maxWidth: MediaQuery.sizeOf(context).height * 0.9,
//
//
//
//           ),
//           decoration: BoxDecoration(
//             color: Colors.white,
//             boxShadow: [
//               BoxShadow(
//                 blurRadius: 3.0,
//                 color: Color(0x33000000),
//                 offset: Offset(
//                   0.0,
//                   1.0,
//                 ),
//               )
//             ],
//             borderRadius: BorderRadius.circular(24.0),
//             border: Border.all(
//               color: FlutterFlowTheme.of(context).primaryBackground,
//               width: 1.0,
//             ),
//           ),
//           child: Padding(
//             padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
//             child: Column(
//               mainAxisSize: MainAxisSize.max,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Padding(
//                   padding:
//                       EdgeInsetsDirectional.fromSTEB(24.0, 16.0, 24.0, 16.0),
//                   child: Column(
//                     mainAxisSize: MainAxisSize.max,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Align(
//                         alignment: AlignmentDirectional(0.0, 0.0),
//                         child: Padding(
//                           padding: EdgeInsetsDirectional.fromSTEB(
//                               0.0, 0.0, 0.0, 12.0),
//                           child: Icon(
//                             Icons.delete_outline,
//                             color: Colors.red,
//                             size: 44.0,
//                           ),
//                         ),
//                       ),
//                       Align(
//                         alignment: AlignmentDirectional(0.0, 0.0),
//                         child: Text(
//                           'Delete Account',
//                           textAlign: TextAlign.center,
//                           style: FlutterFlowTheme.of(context)
//                               .headlineMedium
//                               .override(
//                                 font: GoogleFonts.poppins(
//                                   fontWeight: FontWeight.w500,
//                                   fontStyle: FlutterFlowTheme.of(context)
//                                       .headlineMedium
//                                       .fontStyle,
//                                 ),
//                                 color: Colors.black,
//                                 fontSize: 20.0,
//                                 letterSpacing: 0.0,
//                                 fontWeight: FontWeight.w500,
//                                 fontStyle: FlutterFlowTheme.of(context)
//                                     .headlineMedium
//                                     .fontStyle,
//                               ),
//                         ),
//                       ),
//                       Align(
//                         alignment: AlignmentDirectional(0.0, 0.0),
//                         child: Padding(
//                           padding: EdgeInsetsDirectional.fromSTEB(
//                               0.0, 12.0, 0.0, 0.0),
//                           child: Text(
//                             'Are you sure you want to permanently delete your account? This action cannot be undone.',
//                             textAlign: TextAlign.center,
//                             style: FlutterFlowTheme.of(context)
//                                 .headlineLarge
//                                 .override(
//                                   font: GoogleFonts.poppins(
//                                     fontWeight: FontWeight.normal,
//                                     fontStyle: FlutterFlowTheme.of(context)
//                                         .headlineLarge
//                                         .fontStyle,
//                                   ),
//                                   color: Colors.black,
//                                   fontSize: 16.0,
//                                   letterSpacing: 0.0,
//                                   fontWeight: FontWeight.normal,
//                                   fontStyle: FlutterFlowTheme.of(context)
//                                       .headlineLarge
//                                       .fontStyle,
//                                 ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding:
//                       EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 10.0),
//                   child: Row(
//                     mainAxisSize: MainAxisSize.max,
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                       Padding(
//                         padding:
//                             EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
//                         child: FFButtonWidget(
//                           onPressed: () async {
//                             Navigator.pop(context);
//                           },
//                           text: 'Cancel',
//                           options: FFButtonOptions(
//                             height: 40.0,
//                             padding: EdgeInsetsDirectional.fromSTEB(
//                                 20.0, 0.0, 20.0, 0.0),
//                             iconPadding: EdgeInsetsDirectional.fromSTEB(
//                                 0.0, 0.0, 0.0, 0.0),
//                             color: Colors.white,
//                             textStyle: FlutterFlowTheme.of(context)
//                                 .headlineLarge
//                                 .override(
//                                   font: GoogleFonts.poppins(
//                                     fontWeight: FlutterFlowTheme.of(context)
//                                         .headlineLarge
//                                         .fontWeight,
//                                     fontStyle: FlutterFlowTheme.of(context)
//                                         .headlineLarge
//                                         .fontStyle,
//                                   ),
//                                   color: Colors.black,
//                                   fontSize: 16.0,
//                                   letterSpacing: 0.0,
//                                   fontWeight: FlutterFlowTheme.of(context)
//                                       .headlineLarge
//                                       .fontWeight,
//                                   fontStyle: FlutterFlowTheme.of(context)
//                                       .headlineLarge
//                                       .fontStyle,
//                                 ),
//                             elevation: 0.0,
//                             borderRadius: BorderRadius.circular(40.0),
//                           ),
//                         ),
//                       ),
//                       FFButtonWidget(
//                         onPressed: () async {
//                           try {
//                             // Call delete account API
//                             final response = await http.delete(
//                               Uri.parse('https://votethegoat.ezxdemo.com/api/delete-user'),
//                               headers: {
//                                 'Content-Type': 'application/json',
//                                 'Authorization': 'Bearer ${FFAppState().authToken}',
//                               },
//                             );
//
//                             print('🗑️ Delete Account Response: ${response.body}');
//                             print('Status Code: ${response.statusCode}');
//
//                             if (response.statusCode == 200) {
//                               // Show success message
//                               ScaffoldMessenger.of(context).showSnackBar(
//                                 const SnackBar(
//                                   content: Text(
//                                     'Account deleted successfully.',
//                                     style: TextStyle(color: Colors.white),
//                                   ),
//                                   duration: Duration(milliseconds: 1700),
//                                   backgroundColor: Colors.black,
//                                 ),
//                               );
//
//                               // Wait for SnackBar to show
//                               await Future.delayed(Duration(milliseconds: 1800));
//
//                               // Clear auth state
//                               FFAppState().deleteAuthToken();
//                               FFAppState().authToken = '';
//                               FFAppState().navigationType = 1;
//
//                               // Navigate to Login
//                               context.goNamed(LogInWidget.routeName);
//                             } else {
//                               // Show error message
//                               ScaffoldMessenger.of(context).showSnackBar(
//                                 const SnackBar(
//                                   content: Text('Failed to delete account.'),
//                                   backgroundColor: Colors.red,
//                                 ),
//                               );
//                               Navigator.pop(context);
//                             }
//                           } catch (e) {
//                             print('⚠️ Error deleting account: $e');
//                             ScaffoldMessenger.of(context).showSnackBar(
//                               SnackBar(
//                                 content: Text('Error deleting account: $e'),
//                                 backgroundColor: Colors.red,
//                               ),
//                             );
//                             Navigator.pop(context);
//                           }
//                         },
//                         text: 'Delete',
//                         options: FFButtonOptions(
//                           height: 40.0,
//                           padding: EdgeInsets.symmetric(horizontal: 20.0),
//                           color: Colors.red,
//                           textStyle: FlutterFlowTheme.of(context).headlineLarge.override(
//                             fontFamily: 'Poppins',
//                             fontSize: 16.0,
//                             color: Colors.white,
//                           ),
//                           elevation: 0.0,
//                           borderSide: BorderSide(color: Colors.transparent),
//                           borderRadius: BorderRadius.circular(40.0),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//


///2
// library;
//
// import '/flutter_flow/flutter_flow_theme.dart';
// import '/flutter_flow/flutter_flow_util.dart';
// import '/flutter_flow/flutter_flow_widgets.dart';
// import '/index.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:provider/provider.dart';
// import 'package:http/http.dart' as http;
// import 'delete_account_model.dart';
// export 'delete_account_model.dart';
//
// class DeleteAccountWidget extends StatefulWidget {
//   const DeleteAccountWidget({super.key});
//
//   @override
//   State<DeleteAccountWidget> createState() => _DeleteAccountWidgetState();
// }
//
// class _DeleteAccountWidgetState extends State<DeleteAccountWidget> with RouteAware {
//   late DeleteAccountModel _model;
//
//   @override
//   void setState(VoidCallback callback) {
//     super.setState(callback);
//     _model.onUpdate();
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     _model = createModel(context, () => DeleteAccountModel());
//   }
//
//   @override
//   void dispose() {
//     routeObserver.unsubscribe(this);
//     _model.maybeDispose();
//     super.dispose();
//   }
//
//   @override
//   void didUpdateWidget(DeleteAccountWidget oldWidget) {
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
//     context.watch<FFAppState>();
//
//     return Align(
//       alignment: const AlignmentDirectional(0.0, 0.0),
//       child: Padding(
//         padding: const EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 12.0),
//         child: Container(
//           width: double.infinity,
//           constraints: BoxConstraints(
//             maxWidth: 400.0,
//             maxHeight: MediaQuery.sizeOf(context).height * 0.8,
//           ),
//           decoration: BoxDecoration(
//             color: Colors.white,
//             boxShadow: const [
//               BoxShadow(
//                 blurRadius: 3.0,
//                 color: Color(0x33000000),
//                 offset: Offset(0.0, 1.0),
//               )
//             ],
//             borderRadius: BorderRadius.circular(24.0),
//             border: Border.all(
//               color: FlutterFlowTheme.of(context).primaryBackground,
//               width: 1.0,
//             ),
//           ),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Flexible(
//                 child: SingleChildScrollView(
//                   child: Padding(
//                     padding: const EdgeInsetsDirectional.fromSTEB(24.0, 16.0, 24.0, 16.0),
//                     child: Column(
//                       mainAxisSize: MainAxisSize.min,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         const Icon(
//                           Icons.delete_outline,
//                           color: Colors.red,
//                           size: 44.0,
//                         ),
//                         const SizedBox(height: 12.0),
//                         Text(
//                           'Delete Account',
//                           textAlign: TextAlign.center,
//                           style: FlutterFlowTheme.of(context).headlineMedium.override(
//                             font: GoogleFonts.poppins(
//                               fontWeight: FontWeight.w500,
//                             ),
//                             color: Colors.black,
//                             fontSize: 20.0,
//                             letterSpacing: 0.0,
//                           ),
//                         ),
//                         const SizedBox(height: 12.0),
//                         Text(
//                           'Are you sure you want to permanently delete your account? This action cannot be undone.',
//                           textAlign: TextAlign.center,
//                           style: FlutterFlowTheme.of(context).bodyMedium.override(
//                             font: GoogleFonts.poppins(),
//                             color: Colors.black,
//                             fontSize: 14.0,
//                             letterSpacing: 0.0,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 16.0),
//                 child: Row(
//                   mainAxisSize: MainAxisSize.max,
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     Expanded(
//                       child: Padding(
//                         padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
//                         child: FFButtonWidget(
//                           onPressed: () async {
//                             Navigator.pop(context);
//                           },
//                           text: 'Cancel',
//                           options: FFButtonOptions(
//                             height: 44.0,
//                             padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
//                             color: Colors.white,
//                             textStyle: FlutterFlowTheme.of(context).bodyLarge.override(
//                               font: GoogleFonts.poppins(),
//                               color: Colors.black,
//                               fontSize: 16.0,
//                               letterSpacing: 0.0,
//                             ),
//                             elevation: 0.0,
//                             borderSide: BorderSide(
//                               color: FlutterFlowTheme.of(context).alternate,
//                               width: 1.0,
//                             ),
//                             borderRadius: BorderRadius.circular(40.0),
//                           ),
//                         ),
//                       ),
//                     ),
//                     Expanded(
//                       child: FFButtonWidget(
//                         onPressed: () async {
//                           try {
//                             final response = await http.delete(
//                               Uri.parse('https://votethegoat.ezxdemo.com/api/delete-user'),
//                               headers: {
//                                 'Content-Type': 'application/json',
//                                 'Authorization': 'Bearer ${FFAppState().authToken}',
//                               },
//                             );
//
//                             print('🗑️ Delete Account Response: ${response.body}');
//                             print('Status Code: ${response.statusCode}');
//
//                             if (response.statusCode == 200) {
//                               ScaffoldMessenger.of(context).showSnackBar(
//                                 const SnackBar(
//                                   content: Text(
//                                     'Account deleted successfully.',
//                                     style: TextStyle(color: Colors.white),
//                                   ),
//                                   duration: Duration(milliseconds: 1700),
//                                   backgroundColor: Colors.black,
//                                 ),
//                               );
//
//                               await Future.delayed(const Duration(milliseconds: 1800));
//
//                               FFAppState().deleteAuthToken();
//                               FFAppState().authToken = '';
//                               FFAppState().navigationType = 1;
//
//                               context.goNamed(LogInWidget.routeName);
//                             } else {
//                               ScaffoldMessenger.of(context).showSnackBar(
//                                 const SnackBar(
//                                   content: Text('Failed to delete account.'),
//                                   backgroundColor: Colors.red,
//                                 ),
//                               );
//                               Navigator.pop(context);
//                             }
//                           } catch (e) {
//                             print('⚠️ Error deleting account: $e');
//                             ScaffoldMessenger.of(context).showSnackBar(
//                               SnackBar(
//                                 content: Text('Error deleting account: $e'),
//                                 backgroundColor: Colors.red,
//                               ),
//                             );
//                             Navigator.pop(context);
//                           }
//                         },
//                         text: 'Delete',
//                         options: FFButtonOptions(
//                           height: 44.0,
//                           padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
//                           color: Colors.red,
//                           textStyle: FlutterFlowTheme.of(context).bodyLarge.override(
//                             font: GoogleFonts.poppins(),
//                             color: Colors.white,
//                             fontSize: 16.0,
//                             letterSpacing: 0.0,
//                           ),
//                           elevation: 0.0,
//                           borderRadius: BorderRadius.circular(40.0),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

///3
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'delete_account_model.dart';
export 'delete_account_model.dart';

class DeleteAccountWidget extends StatefulWidget {
  const DeleteAccountWidget({super.key});

  @override
  State<DeleteAccountWidget> createState() => _DeleteAccountWidgetState();
}

class _DeleteAccountWidgetState extends State<DeleteAccountWidget> with RouteAware {
  late DeleteAccountModel _model;
  bool _isChecked = false;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DeleteAccountModel());
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    _model.maybeDispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(DeleteAccountWidget oldWidget) {
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

    return Align(
      alignment: const AlignmentDirectional(0.0, 0.0),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 12.0),
        child: Container(
          width: double.infinity,
          constraints: const BoxConstraints(
            maxWidth: 400.0,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                blurRadius: 3.0,
                color: Color(0x33000000),
                offset: Offset(0.0, 1.0),
              )
            ],
            borderRadius: BorderRadius.circular(24.0),
            border: Border.all(
              color: FlutterFlowTheme.of(context).primaryBackground,
              width: 1.0,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Header with icon and title
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.delete_outline,
                      color: Colors.red,
                      size: 48.0,
                    ),
                    const SizedBox(height: 16.0),
                    Text(
                      'Delete Account',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).headlineMedium.override(
                        font: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                        ),
                        color: Colors.black,
                        fontSize: 20.0,
                        letterSpacing: 0.0,
                      ),
                    ),
                    const SizedBox(height: 12.0),
                    Text(
                      'Are you sure you want to permanently delete your account? This action cannot be undone.',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.poppins(),
                        color: const Color(0xFF000000),
                        fontSize: 14.0,
                        letterSpacing: 0.0,
                      ),
                    ),
                  ],
                ),
              ),

              // Learn more button
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 16.0),
                child: InkWell(
                  onTap: () {
                    context.pushNamed(PrivacyPolicyWidget.routeName);

                    // Add navigation to deletion info page
                  },
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    decoration: BoxDecoration(
                      // color: const Color(0xFFF5F5F5),
                      color:  Colors.grey,
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    child: Text(
                      'Learn more about Deletion',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.poppins(),
                        // color: const Color(0xFF666666),
                        color:  Color(0xff000000),
                        fontSize: 14.0,
                        letterSpacing: 0.0,
                      ),
                    ),
                  ),
                ),
              ),

              // Checkbox with confirmation text
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 24.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Checkbox(

                      value: _isChecked,
                      onChanged: (value) {
                        setState(() {
                          _isChecked = value ?? false;
                        });
                      },
                      activeColor: Colors.red,
                      side: MaterialStateBorderSide.resolveWith(
                            (states) => const BorderSide(
                          color: Colors.grey,
                          width: 1.5,
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(8.0, 12.0, 0.0, 0.0),
                        child: Text(
                          'By checking this box, I confirm that I have read and understood the account deletion terms and acknowledge the consequences of this action.',
                          style: FlutterFlowTheme.of(context).bodySmall.override(
                            font: GoogleFonts.poppins(),
                            color: const Color(0xFF000000),
                            fontSize: 12.0,
                            letterSpacing: 0.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Action buttons
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 24.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            Navigator.pop(context);
                          },
                          text: 'Cancel',
                          options: FFButtonOptions(
                            height: 48.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                            color: Colors.white,
                            textStyle: FlutterFlowTheme.of(context).bodyLarge.override(
                              font: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                              ),
                              color: Colors.black,
                              fontSize: 16.0,
                              letterSpacing: 0.0,
                            ),
                            elevation: 0.0,
                            borderSide: const BorderSide(
                              color: Color(0xFFE0E0E0),
                              width: 1.5,
                            ),
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: FFButtonWidget(
                        onPressed: !_isChecked ? null : () async {
                          try {
                            final response = await http.delete(
                              // Uri.parse('https://votethegoat.ezxdemo.com/api/delete-user'),
                              Uri.parse('https://admin.votethegoat.app/api/delete-user'),
                              headers: {
                                'Content-Type': 'application/json',
                                'Authorization': 'Bearer ${FFAppState().authToken}',
                              },
                            );

                            print('🗑️ Delete Account Response: ${response.body}');
                            print('Status Code: ${response.statusCode}');

                            if (response.statusCode == 200) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    'Account deleted successfully.',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  duration: Duration(milliseconds: 1700),
                                  backgroundColor: Colors.black,
                                ),
                              );

                              await Future.delayed(const Duration(milliseconds: 1800));

                              FFAppState().deleteAuthToken();
                              FFAppState().authToken = '';
                              FFAppState().navigationType = 1;

                              context.goNamed(LogInWidget.routeName);
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Failed to delete account.'),
                                  backgroundColor: Colors.red,
                                ),
                              );
                              Navigator.pop(context);
                            }
                          } catch (e) {
                            print('⚠️ Error deleting account: $e');
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Error deleting account: $e'),
                                backgroundColor: Colors.red,
                              ),
                            );
                            Navigator.pop(context);
                          }
                        },
                        text: 'Delete',
                        options: FFButtonOptions(
                          height: 48.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                          color: _isChecked ? Colors.red : Colors.red.withOpacity(0.5),
                          textStyle: FlutterFlowTheme.of(context).bodyLarge.override(
                            font: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                            ),
                            color: Colors.white,
                            fontSize: 16.0,
                            letterSpacing: 0.0,
                          ),
                          elevation: 0.0,
                          borderRadius: BorderRadius.circular(25.0),
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