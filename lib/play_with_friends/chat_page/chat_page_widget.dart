// // import '/auth/firebase_auth/auth_util.dart';
// // import '/backend/api_requests/api_calls.dart';
// // import '/backend/backend.dart';
// // import '/flutter_flow/flutter_flow_theme.dart';
// // import '/flutter_flow/flutter_flow_util.dart';
// // import '/flutter_flow/flutter_flow_widgets.dart';
// // import 'dart:ui';
// // import 'dart:math' as math;
// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter/scheduler.dart';
// // import 'package:flutter_spinkit/flutter_spinkit.dart';
// // import 'package:google_fonts/google_fonts.dart';
// // import 'package:provider/provider.dart';
// // import 'chat_page_model.dart';
// // export 'chat_page_model.dart';
// //
// // class ChatPageWidget extends StatefulWidget {
// //   const ChatPageWidget({
// //     super.key,
// //     this.teamId,
// //   });
// //
// //   final int? teamId;
// //
// //   static String routeName = 'ChatPage';
// //   static String routePath = '/chatPage';
// //
// //   @override
// //   State<ChatPageWidget> createState() => _ChatPageWidgetState();
// // }
// //
// // class _ChatPageWidgetState extends State<ChatPageWidget> with RouteAware {
// //   late ChatPageModel _model;
// //
// //   final scaffoldKey = GlobalKey<ScaffoldState>();
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //     _model = createModel(context, () => ChatPageModel());
// //
// //     // On page load action.
// //     SchedulerBinding.instance.addPostFrameCallback((_) async {
// //       _model.apiResultcv6 = await DashboardGroup.getProfileCall.call(
// //         authToken: FFAppState().authToken,
// //       );
// //
// //       await Future.delayed(
// //         Duration(
// //           milliseconds: 400,
// //         ),
// //       );
// //       safeSetState(() {});
// //     });
// //
// //     _model.textController ??= TextEditingController()
// //       ..addListener(() {
// //         debugLogWidgetClass(_model);
// //       });
// //     _model.textFieldFocusNode ??= FocusNode();
// //   }
// //
// //   @override
// //   void dispose() {
// //     routeObserver.unsubscribe(this);
// //
// //     _model.dispose();
// //
// //     super.dispose();
// //   }
// //
// //   @override
// //   void didUpdateWidget(ChatPageWidget oldWidget) {
// //     super.didUpdateWidget(oldWidget);
// //     _model.widget = widget;
// //   }
// //
// //   @override
// //   void didChangeDependencies() {
// //     super.didChangeDependencies();
// //     final route = DebugModalRoute.of(context);
// //     if (route != null) {
// //       routeObserver.subscribe(this, route);
// //     }
// //     debugLogGlobalProperty(context);
// //   }
// //
// //   @override
// //   void didPopNext() {
// //     if (mounted && DebugFlutterFlowModelContext.maybeOf(context) == null) {
// //       setState(() => _model.isRouteVisible = true);
// //       debugLogWidgetClass(_model);
// //     }
// //   }
// //
// //   @override
// //   void didPush() {
// //     if (mounted && DebugFlutterFlowModelContext.maybeOf(context) == null) {
// //       setState(() => _model.isRouteVisible = true);
// //       debugLogWidgetClass(_model);
// //     }
// //   }
// //
// //   @override
// //   void didPop() {
// //     _model.isRouteVisible = false;
// //   }
// //
// //   @override
// //   void didPushNext() {
// //     _model.isRouteVisible = false;
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     DebugFlutterFlowModelContext.maybeOf(context)
// //         ?.parentModelCallback
// //         ?.call(_model);
// //     context.watch<FFAppState>();
// //
// //     return StreamBuilder<List<TeamsRecord>>(
// //       stream: queryTeamsRecord(
// //         queryBuilder: (teamsRecord) => teamsRecord.where(
// //           'uid',
// //           isEqualTo: widget!.teamId?.toString(),
// //         ),
// //         singleRecord: true,
// //       ),
// //       builder: (context, snapshot) {
// //         // Customize what your widget looks like when it's loading.
// //         if (!snapshot.hasData) {
// //           return Scaffold(
// //             backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
// //             body: Center(
// //               child: SizedBox(
// //                 width: 40.0,
// //                 height: 40.0,
// //                 child: SpinKitCubeGrid(
// //                   color: FlutterFlowTheme.of(context).primary,
// //                   size: 40.0,
// //                 ),
// //               ),
// //             ),
// //           );
// //         }
// //         List<TeamsRecord> chatPageTeamsRecordList = snapshot.data!;
// //         // Return an empty Container when the item does not exist.
// //         if (snapshot.data!.isEmpty) {
// //           return Container();
// //         }
// //         final chatPageTeamsRecord = chatPageTeamsRecordList.isNotEmpty
// //             ? chatPageTeamsRecordList.first
// //             : null;
// //         _model.debugBackendQueries['chatPageTeamsRecord_Scaffold_80t7ok22'] =
// //             debugSerializeParam(
// //           chatPageTeamsRecord,
// //           ParamType.Document,
// //           link:
// //               'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=ChatPage',
// //           name: 'teams',
// //           nullable: false,
// //         );
// //         debugLogWidgetClass(_model);
// //
// //         return GestureDetector(
// //           onTap: () {
// //             FocusScope.of(context).unfocus();
// //             FocusManager.instance.primaryFocus?.unfocus();
// //           },
// //           child: Scaffold(
// //             key: scaffoldKey,
// //             backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
// //             body: Stack(
// //               alignment: AlignmentDirectional(0.0, 1.0),
// //               children: [
// //                 ClipRRect(
// //                   borderRadius: BorderRadius.circular(8.0),
// //                   child: Image.asset(
// //                     Theme.of(context).brightness == Brightness.dark
// //                         ? 'assets/images/commonBg.png'
// //                         : 'assets/images/plain_whiteBg.png',
// //                     width: double.infinity,
// //                     height: double.infinity,
// //                     fit: BoxFit.cover,
// //                   ),
// //                 ),
// //                 Padding(
// //                   padding:
// //                       EdgeInsetsDirectional.fromSTEB(16.0, 40.0, 16.0, 0.0),
// //                   child: Column(
// //                     mainAxisSize: MainAxisSize.max,
// //                     children: [
// //                       Row(
// //                         mainAxisSize: MainAxisSize.max,
// //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                         children: [
// //                           InkWell(
// //                             splashColor: Colors.transparent,
// //                             focusColor: Colors.transparent,
// //                             hoverColor: Colors.transparent,
// //                             highlightColor: Colors.transparent,
// //                             onTap: () async {
// //                               context.safePop();
// //                             },
// //                             child: Container(
// //                               width: 40.0,
// //                               height: 40.0,
// //                               decoration: BoxDecoration(
// //                                 color: FlutterFlowTheme.of(context).backBtnClr,
// //                                 boxShadow: [
// //                                   BoxShadow(
// //                                     blurRadius: 4.0,
// //                                     color: Color(0x335D4E4E),
// //                                     offset: Offset(
// //                                       0.0,
// //                                       2.0,
// //                                     ),
// //                                   )
// //                                 ],
// //                                 borderRadius: BorderRadius.circular(12.0),
// //                                 border: Border.all(
// //                                   color: (Theme.of(context).brightness ==
// //                                               Brightness.dark) ==
// //                                           true
// //                                       ? Colors.black
// //                                       : Color(0xD5999999),
// //                                 ),
// //                               ),
// //                               child: Icon(
// //                                 Icons.arrow_back_rounded,
// //                                 color: FlutterFlowTheme.of(context).tertiary,
// //                                 size: 24.0,
// //                               ),
// //                             ),
// //                           ),
// //                           Text(
// //                             valueOrDefault<String>(
// //                               widget!.teamId?.toString(),
// //                               '0',
// //                             ),
// //                             style: FlutterFlowTheme.of(context)
// //                                 .bodyMedium
// //                                 .override(
// //                                   font: GoogleFonts.bebasNeue(
// //                                     fontWeight: FlutterFlowTheme.of(context)
// //                                         .bodyMedium
// //                                         .fontWeight,
// //                                     fontStyle: FlutterFlowTheme.of(context)
// //                                         .bodyMedium
// //                                         .fontStyle,
// //                                   ),
// //                                   letterSpacing: 0.0,
// //                                   fontWeight: FlutterFlowTheme.of(context)
// //                                       .bodyMedium
// //                                       .fontWeight,
// //                                   fontStyle: FlutterFlowTheme.of(context)
// //                                       .bodyMedium
// //                                       .fontStyle,
// //                                 ),
// //                           ),
// //                         ],
// //                       ),
// //                       Padding(
// //                         padding:
// //                             EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
// //                         child: Row(
// //                           mainAxisSize: MainAxisSize.max,
// //                           crossAxisAlignment: CrossAxisAlignment.start,
// //                           children: [
// //                             Container(
// //                               decoration: BoxDecoration(
// //                                 shape: BoxShape.circle,
// //                                 border: Border.all(
// //                                   color: Colors.white,
// //                                 ),
// //                               ),
// //                               child: Container(
// //                                 width: 70.0,
// //                                 height: 70.0,
// //                                 clipBehavior: Clip.antiAlias,
// //                                 decoration: BoxDecoration(
// //                                   shape: BoxShape.circle,
// //                                 ),
// //                                 child: Image.network(
// //                                   chatPageTeamsRecord!.photoUrl,
// //                                   fit: BoxFit.cover,
// //                                 ),
// //                               ),
// //                             ),
// //                             Padding(
// //                               padding: EdgeInsetsDirectional.fromSTEB(
// //                                   10.0, 0.0, 0.0, 0.0),
// //                               child: Column(
// //                                 mainAxisSize: MainAxisSize.max,
// //                                 crossAxisAlignment: CrossAxisAlignment.start,
// //                                 children: [
// //                                   Padding(
// //                                     padding: EdgeInsetsDirectional.fromSTEB(
// //                                         0.0, 10.0, 0.0, 0.0),
// //                                     child: Text(
// //                                       chatPageTeamsRecord!.name,
// //                                       style: FlutterFlowTheme.of(context)
// //                                           .titleLarge
// //                                           .override(
// //                                             font: GoogleFonts.poppins(
// //                                               fontWeight: FontWeight.w600,
// //                                               fontStyle:
// //                                                   FlutterFlowTheme.of(context)
// //                                                       .titleLarge
// //                                                       .fontStyle,
// //                                             ),
// //                                             fontSize: 16.0,
// //                                             letterSpacing: 0.0,
// //                                             fontWeight: FontWeight.w600,
// //                                             fontStyle:
// //                                                 FlutterFlowTheme.of(context)
// //                                                     .titleLarge
// //                                                     .fontStyle,
// //                                           ),
// //                                     ),
// //                                   ),
// //                                   Row(
// //                                     mainAxisSize: MainAxisSize.min,
// //                                     mainAxisAlignment: MainAxisAlignment.center,
// //                                     children: [
// //                                       Icon(
// //                                         Icons.groups_2,
// //                                         color: Theme.of(context).brightness ==
// //                                                 Brightness.dark
// //                                             ? Color(0xFFC0C0C0)
// //                                             : Color(0xFF4D4D4D),
// //                                         size: 18.0,
// //                                       ),
// //                                       Padding(
// //                                         padding: EdgeInsetsDirectional.fromSTEB(
// //                                             3.0, 0.0, 0.0, 0.0),
// //                                         child: Text(
// //                                           chatPageTeamsRecord!.members.length
// //                                               .toString(),
// //                                           textAlign: TextAlign.start,
// //                                           style: FlutterFlowTheme.of(context)
// //                                               .bodySmall
// //                                               .override(
// //                                                 font: GoogleFonts.poppins(
// //                                                   fontWeight:
// //                                                       FlutterFlowTheme.of(
// //                                                               context)
// //                                                           .bodySmall
// //                                                           .fontWeight,
// //                                                   fontStyle:
// //                                                       FlutterFlowTheme.of(
// //                                                               context)
// //                                                           .bodySmall
// //                                                           .fontStyle,
// //                                                 ),
// //                                                 color:
// //                                                     FlutterFlowTheme.of(context)
// //                                                         .tertiary,
// //                                                 letterSpacing: 0.0,
// //                                                 fontWeight:
// //                                                     FlutterFlowTheme.of(context)
// //                                                         .bodySmall
// //                                                         .fontWeight,
// //                                                 fontStyle:
// //                                                     FlutterFlowTheme.of(context)
// //                                                         .bodySmall
// //                                                         .fontStyle,
// //                                               ),
// //                                         ),
// //                                       ),
// //                                       Padding(
// //                                         padding: EdgeInsetsDirectional.fromSTEB(
// //                                             3.0, 0.0, 0.0, 0.0),
// //                                         child: Text(
// //                                           ' Members',
// //                                           textAlign: TextAlign.start,
// //                                           style: FlutterFlowTheme.of(context)
// //                                               .bodySmall
// //                                               .override(
// //                                                 font: GoogleFonts.poppins(
// //                                                   fontWeight:
// //                                                       FlutterFlowTheme.of(
// //                                                               context)
// //                                                           .bodySmall
// //                                                           .fontWeight,
// //                                                   fontStyle:
// //                                                       FlutterFlowTheme.of(
// //                                                               context)
// //                                                           .bodySmall
// //                                                           .fontStyle,
// //                                                 ),
// //                                                 color:
// //                                                     FlutterFlowTheme.of(context)
// //                                                         .tertiary,
// //                                                 letterSpacing: 0.0,
// //                                                 fontWeight:
// //                                                     FlutterFlowTheme.of(context)
// //                                                         .bodySmall
// //                                                         .fontWeight,
// //                                                 fontStyle:
// //                                                     FlutterFlowTheme.of(context)
// //                                                         .bodySmall
// //                                                         .fontStyle,
// //                                               ),
// //                                         ),
// //                                       ),
// //                                     ],
// //                                   ),
// //                                 ],
// //                               ),
// //                             ),
// //                           ],
// //                         ),
// //                       ),
// //                       Padding(
// //                         padding:
// //                             EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
// //                         child: Container(
// //                           width: double.infinity,
// //                           height: 1.0,
// //                           decoration: BoxDecoration(
// //                             gradient: LinearGradient(
// //                               colors: [
// //                                 Color(0x00FFFFFF),
// //                                 Color(0xFF6B4A4A),
// //                                 Color(0x00FFFFFF),
// //                                 Color(0xFF6B4A4A)
// //                               ],
// //                               stops: [0.0, 0.2, 1.0, 1.0],
// //                               begin: AlignmentDirectional(1.0, 0.0),
// //                               end: AlignmentDirectional(-1.0, 0),
// //                             ),
// //                           ),
// //                         ),
// //                       ),
// //                       Container(
// //                         width: double.infinity,
// //                         height: MediaQuery.sizeOf(context).height * 0.65,
// //                         decoration: BoxDecoration(
// //                           color: Colors.transparent,
// //                         ),
// //                         child: Padding(
// //                           padding: EdgeInsetsDirectional.fromSTEB(
// //                               0.0, 16.0, 0.0, 16.0),
// //                           child: StreamBuilder<List<MessagesRecord>>(
// //                             stream: queryMessagesRecord(
// //                               parent: chatPageTeamsRecord?.reference,
// //                               queryBuilder: (messagesRecord) =>
// //                                   messagesRecord.orderBy('createdAt'),
// //                             ),
// //                             builder: (context, snapshot) {
// //                               // Customize what your widget looks like when it's loading.
// //                               if (!snapshot.hasData) {
// //                                 return Center(
// //                                   child: SizedBox(
// //                                     width: 40.0,
// //                                     height: 40.0,
// //                                     child: SpinKitCubeGrid(
// //                                       color:
// //                                           FlutterFlowTheme.of(context).primary,
// //                                       size: 40.0,
// //                                     ),
// //                                   ),
// //                                 );
// //                               }
// //                               List<MessagesRecord> listViewMessagesRecordList =
// //                                   snapshot.data!;
// //
// //                               _model.debugBackendQueries[
// //                                       'listViewMessagesRecordList_ListView_2zzbe8ae${listViewMessagesRecordList.length > 100 ? ' (first 100)' : ''}'] =
// //                                   debugSerializeParam(
// //                                 listViewMessagesRecordList.take(100),
// //                                 ParamType.Document,
// //                                 isList: true,
// //                                 link:
// //                                     'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=ChatPage',
// //                                 name: 'messages',
// //                                 nullable: false,
// //                               );
// //                               debugLogWidgetClass(_model);
// //
// //                               return ListView.builder(
// //                                 padding: EdgeInsets.zero,
// //                                 shrinkWrap: true,
// //                                 scrollDirection: Axis.vertical,
// //                                 itemCount: listViewMessagesRecordList.length,
// //                                 itemBuilder: (context, listViewIndex) {
// //                                   final listViewMessagesRecord =
// //                                       listViewMessagesRecordList[listViewIndex];
// //                                   return Column(
// //                                     mainAxisSize: MainAxisSize.max,
// //                                     children: [
// //                                       Builder(
// //                                         builder: (context) {
// //                                           if (listViewMessagesRecord.senderId !=
// //                                               getJsonField(
// //                                                 (_model.apiResultcv6
// //                                                         ?.jsonBody ??
// //                                                     ''),
// //                                                 r'''$.data.id''',
// //                                               ).toString()) {
// //                                             return Padding(
// //                                               padding: EdgeInsetsDirectional
// //                                                   .fromSTEB(
// //                                                       0.0, 20.0, 0.0, 0.0),
// //                                               child: Row(
// //                                                 mainAxisSize: MainAxisSize.max,
// //                                                 mainAxisAlignment:
// //                                                     MainAxisAlignment.start,
// //                                                 crossAxisAlignment:
// //                                                     CrossAxisAlignment.start,
// //                                                 children: [
// //                                                   Align(
// //                                                     alignment:
// //                                                         AlignmentDirectional(
// //                                                             -1.0, 0.0),
// //                                                     child: Container(
// //                                                       width: 34.0,
// //                                                       height: 34.0,
// //                                                       clipBehavior:
// //                                                           Clip.antiAlias,
// //                                                       decoration: BoxDecoration(
// //                                                         shape: BoxShape.circle,
// //                                                       ),
// //                                                       child: Image.network(
// //                                                         'https://picsum.photos/seed/962/600',
// //                                                         fit: BoxFit.cover,
// //                                                       ),
// //                                                     ),
// //                                                   ),
// //                                                   Align(
// //                                                     alignment:
// //                                                         AlignmentDirectional(
// //                                                             -1.0, 0.0),
// //                                                     child: Padding(
// //                                                       padding:
// //                                                           EdgeInsetsDirectional
// //                                                               .fromSTEB(
// //                                                                   8.0,
// //                                                                   0.0,
// //                                                                   0.0,
// //                                                                   0.0),
// //                                                       child: Container(
// //                                                         width:
// //                                                             MediaQuery.sizeOf(
// //                                                                         context)
// //                                                                     .width *
// //                                                                 0.6,
// //                                                         decoration:
// //                                                             BoxDecoration(
// //                                                           color: Theme.of(context)
// //                                                                       .brightness ==
// //                                                                   Brightness
// //                                                                       .dark
// //                                                               ? Color(
// //                                                                   0xFF1C1C22)
// //                                                               : Color(
// //                                                                   0xFFEAEAEA),
// //                                                           borderRadius:
// //                                                               BorderRadius.only(
// //                                                             bottomLeft:
// //                                                                 Radius.circular(
// //                                                                     15.0),
// //                                                             bottomRight:
// //                                                                 Radius.circular(
// //                                                                     15.0),
// //                                                             topLeft:
// //                                                                 Radius.circular(
// //                                                                     0.0),
// //                                                             topRight:
// //                                                                 Radius.circular(
// //                                                                     15.0),
// //                                                           ),
// //                                                           border: Border.all(
// //                                                             color: Theme.of(context)
// //                                                                         .brightness ==
// //                                                                     Brightness
// //                                                                         .dark
// //                                                                 ? Color(
// //                                                                     0x34FFFFFF)
// //                                                                 : Color(
// //                                                                     0x00000000),
// //                                                           ),
// //                                                         ),
// //                                                         child: Column(
// //                                                           mainAxisSize:
// //                                                               MainAxisSize.max,
// //                                                           children: [
// //                                                             Align(
// //                                                               alignment:
// //                                                                   AlignmentDirectional(
// //                                                                       -1.0,
// //                                                                       0.0),
// //                                                               child: Padding(
// //                                                                 padding: EdgeInsetsDirectional
// //                                                                     .fromSTEB(
// //                                                                         10.0,
// //                                                                         10.0,
// //                                                                         0.0,
// //                                                                         3.0),
// //                                                                 child: Text(
// //                                                                   listViewMessagesRecord
// //                                                                       .senderName,
// //                                                                   style: FlutterFlowTheme.of(
// //                                                                           context)
// //                                                                       .labelMedium
// //                                                                       .override(
// //                                                                         font: GoogleFonts
// //                                                                             .poppins(
// //                                                                           fontWeight: FlutterFlowTheme.of(context)
// //                                                                               .labelMedium
// //                                                                               .fontWeight,
// //                                                                           fontStyle: FlutterFlowTheme.of(context)
// //                                                                               .labelMedium
// //                                                                               .fontStyle,
// //                                                                         ),
// //                                                                         color: FlutterFlowTheme.of(context)
// //                                                                             .tertiary,
// //                                                                         letterSpacing:
// //                                                                             0.0,
// //                                                                         fontWeight: FlutterFlowTheme.of(context)
// //                                                                             .labelMedium
// //                                                                             .fontWeight,
// //                                                                         fontStyle: FlutterFlowTheme.of(context)
// //                                                                             .labelMedium
// //                                                                             .fontStyle,
// //                                                                       ),
// //                                                                 ),
// //                                                               ),
// //                                                             ),
// //                                                             Align(
// //                                                               alignment:
// //                                                                   AlignmentDirectional(
// //                                                                       -1.0,
// //                                                                       0.0),
// //                                                               child: Padding(
// //                                                                 padding: EdgeInsetsDirectional
// //                                                                     .fromSTEB(
// //                                                                         10.0,
// //                                                                         0.0,
// //                                                                         0.0,
// //                                                                         10.0),
// //                                                                 child: Text(
// //                                                                   listViewMessagesRecord
// //                                                                       .text,
// //                                                                   style: FlutterFlowTheme.of(
// //                                                                           context)
// //                                                                       .labelMedium
// //                                                                       .override(
// //                                                                         font: GoogleFonts
// //                                                                             .poppins(
// //                                                                           fontWeight: FlutterFlowTheme.of(context)
// //                                                                               .labelMedium
// //                                                                               .fontWeight,
// //                                                                           fontStyle: FlutterFlowTheme.of(context)
// //                                                                               .labelMedium
// //                                                                               .fontStyle,
// //                                                                         ),
// //                                                                         color: FlutterFlowTheme.of(context)
// //                                                                             .tertiary,
// //                                                                         fontSize:
// //                                                                             12.0,
// //                                                                         letterSpacing:
// //                                                                             0.0,
// //                                                                         fontWeight: FlutterFlowTheme.of(context)
// //                                                                             .labelMedium
// //                                                                             .fontWeight,
// //                                                                         fontStyle: FlutterFlowTheme.of(context)
// //                                                                             .labelMedium
// //                                                                             .fontStyle,
// //                                                                       ),
// //                                                                 ),
// //                                                               ),
// //                                                             ),
// //                                                           ],
// //                                                         ),
// //                                                       ),
// //                                                     ),
// //                                                   ),
// //                                                 ],
// //                                               ),
// //                                             );
// //                                           } else {
// //                                             return Padding(
// //                                               padding: EdgeInsetsDirectional
// //                                                   .fromSTEB(
// //                                                       0.0, 20.0, 0.0, 0.0),
// //                                               child: Row(
// //                                                 mainAxisSize: MainAxisSize.max,
// //                                                 mainAxisAlignment:
// //                                                     MainAxisAlignment.end,
// //                                                 crossAxisAlignment:
// //                                                     CrossAxisAlignment.start,
// //                                                 children: [
// //                                                   Align(
// //                                                     alignment:
// //                                                         AlignmentDirectional(
// //                                                             -1.0, 0.0),
// //                                                     child: Container(
// //                                                       width: 34.0,
// //                                                       height: 34.0,
// //                                                       clipBehavior:
// //                                                           Clip.antiAlias,
// //                                                       decoration: BoxDecoration(
// //                                                         shape: BoxShape.circle,
// //                                                       ),
// //                                                       child: Image.network(
// //                                                         'https://picsum.photos/seed/962/600',
// //                                                         fit: BoxFit.cover,
// //                                                       ),
// //                                                     ),
// //                                                   ),
// //                                                   Align(
// //                                                     alignment:
// //                                                         AlignmentDirectional(
// //                                                             -1.0, 0.0),
// //                                                     child: Padding(
// //                                                       padding:
// //                                                           EdgeInsetsDirectional
// //                                                               .fromSTEB(
// //                                                                   8.0,
// //                                                                   0.0,
// //                                                                   0.0,
// //                                                                   0.0),
// //                                                       child: Container(
// //                                                         width:
// //                                                             MediaQuery.sizeOf(
// //                                                                         context)
// //                                                                     .width *
// //                                                                 0.6,
// //                                                         decoration:
// //                                                             BoxDecoration(
// //                                                           color: Theme.of(context)
// //                                                                       .brightness ==
// //                                                                   Brightness
// //                                                                       .dark
// //                                                               ? Color(
// //                                                                   0xFFDF7D35)
// //                                                               : Color(
// //                                                                   0xFFDF7D35),
// //                                                           borderRadius:
// //                                                               BorderRadius.only(
// //                                                             bottomLeft:
// //                                                                 Radius.circular(
// //                                                                     15.0),
// //                                                             bottomRight:
// //                                                                 Radius.circular(
// //                                                                     15.0),
// //                                                             topLeft:
// //                                                                 Radius.circular(
// //                                                                     15.0),
// //                                                             topRight:
// //                                                                 Radius.circular(
// //                                                                     0.0),
// //                                                           ),
// //                                                           border: Border.all(
// //                                                             color: Theme.of(context)
// //                                                                         .brightness ==
// //                                                                     Brightness
// //                                                                         .dark
// //                                                                 ? Color(
// //                                                                     0x34FFFFFF)
// //                                                                 : Color(
// //                                                                     0x00000000),
// //                                                           ),
// //                                                         ),
// //                                                         child: Column(
// //                                                           mainAxisSize:
// //                                                               MainAxisSize.max,
// //                                                           children: [
// //                                                             Align(
// //                                                               alignment:
// //                                                                   AlignmentDirectional(
// //                                                                       -1.0,
// //                                                                       0.0),
// //                                                               child: Padding(
// //                                                                 padding: EdgeInsetsDirectional
// //                                                                     .fromSTEB(
// //                                                                         10.0,
// //                                                                         10.0,
// //                                                                         0.0,
// //                                                                         3.0),
// //                                                                 child: Text(
// //                                                                   listViewMessagesRecord
// //                                                                       .senderName,
// //                                                                   style: FlutterFlowTheme.of(
// //                                                                           context)
// //                                                                       .labelMedium
// //                                                                       .override(
// //                                                                         font: GoogleFonts
// //                                                                             .poppins(
// //                                                                           fontWeight: FlutterFlowTheme.of(context)
// //                                                                               .labelMedium
// //                                                                               .fontWeight,
// //                                                                           fontStyle: FlutterFlowTheme.of(context)
// //                                                                               .labelMedium
// //                                                                               .fontStyle,
// //                                                                         ),
// //                                                                         color: Colors
// //                                                                             .white,
// //                                                                         letterSpacing:
// //                                                                             0.0,
// //                                                                         fontWeight: FlutterFlowTheme.of(context)
// //                                                                             .labelMedium
// //                                                                             .fontWeight,
// //                                                                         fontStyle: FlutterFlowTheme.of(context)
// //                                                                             .labelMedium
// //                                                                             .fontStyle,
// //                                                                       ),
// //                                                                 ),
// //                                                               ),
// //                                                             ),
// //                                                             Align(
// //                                                               alignment:
// //                                                                   AlignmentDirectional(
// //                                                                       -1.0,
// //                                                                       0.0),
// //                                                               child: Padding(
// //                                                                 padding: EdgeInsetsDirectional
// //                                                                     .fromSTEB(
// //                                                                         10.0,
// //                                                                         0.0,
// //                                                                         0.0,
// //                                                                         10.0),
// //                                                                 child: Text(
// //                                                                   listViewMessagesRecord
// //                                                                       .text,
// //                                                                   style: FlutterFlowTheme.of(
// //                                                                           context)
// //                                                                       .labelMedium
// //                                                                       .override(
// //                                                                         font: GoogleFonts
// //                                                                             .poppins(
// //                                                                           fontWeight: FlutterFlowTheme.of(context)
// //                                                                               .labelMedium
// //                                                                               .fontWeight,
// //                                                                           fontStyle: FlutterFlowTheme.of(context)
// //                                                                               .labelMedium
// //                                                                               .fontStyle,
// //                                                                         ),
// //                                                                         color: Colors
// //                                                                             .white,
// //                                                                         fontSize:
// //                                                                             12.0,
// //                                                                         letterSpacing:
// //                                                                             0.0,
// //                                                                         fontWeight: FlutterFlowTheme.of(context)
// //                                                                             .labelMedium
// //                                                                             .fontWeight,
// //                                                                         fontStyle: FlutterFlowTheme.of(context)
// //                                                                             .labelMedium
// //                                                                             .fontStyle,
// //                                                                       ),
// //                                                                 ),
// //                                                               ),
// //                                                             ),
// //                                                           ],
// //                                                         ),
// //                                                       ),
// //                                                     ),
// //                                                   ),
// //                                                 ],
// //                                               ),
// //                                             );
// //                                           }
// //                                         },
// //                                       ),
// //                                     ],
// //                                   );
// //                                 },
// //                               );
// //                             },
// //                           ),
// //                         ),
// //                       ),
// //                     ],
// //                   ),
// //                 ),
// //                 Row(
// //                   mainAxisSize: MainAxisSize.max,
// //                   children: [
// //                     Container(
// //                       width: MediaQuery.sizeOf(context).width * 1.0,
// //                       height: 70.0,
// //                       decoration: BoxDecoration(
// //                         color: Theme.of(context).brightness == Brightness.dark
// //                             ? Color(0xFF282828)
// //                             : Color(0xFFE6E6E6),
// //                       ),
// //                       child: Row(
// //                         mainAxisSize: MainAxisSize.max,
// //                         children: [
// //                           Expanded(
// //                             child: Padding(
// //                               padding: EdgeInsetsDirectional.fromSTEB(
// //                                   15.0, 15.0, 10.0, 15.0),
// //                               child: Container(
// //                                 width: 200.0,
// //                                 child: TextFormField(
// //                                   controller: _model.textController,
// //                                   focusNode: _model.textFieldFocusNode,
// //                                   autofocus: false,
// //                                   obscureText: false,
// //                                   decoration: InputDecoration(
// //                                     isDense: true,
// //                                     labelStyle: FlutterFlowTheme.of(context)
// //                                         .labelMedium
// //                                         .override(
// //                                           font: GoogleFonts.poppins(
// //                                             fontWeight:
// //                                                 FlutterFlowTheme.of(context)
// //                                                     .labelMedium
// //                                                     .fontWeight,
// //                                             fontStyle:
// //                                                 FlutterFlowTheme.of(context)
// //                                                     .labelMedium
// //                                                     .fontStyle,
// //                                           ),
// //                                           letterSpacing: 0.0,
// //                                           fontWeight:
// //                                               FlutterFlowTheme.of(context)
// //                                                   .labelMedium
// //                                                   .fontWeight,
// //                                           fontStyle:
// //                                               FlutterFlowTheme.of(context)
// //                                                   .labelMedium
// //                                                   .fontStyle,
// //                                         ),
// //                                     hintText: 'Type here...',
// //                                     hintStyle: FlutterFlowTheme.of(context)
// //                                         .labelMedium
// //                                         .override(
// //                                           font: GoogleFonts.poppins(
// //                                             fontWeight:
// //                                                 FlutterFlowTheme.of(context)
// //                                                     .labelMedium
// //                                                     .fontWeight,
// //                                             fontStyle:
// //                                                 FlutterFlowTheme.of(context)
// //                                                     .labelMedium
// //                                                     .fontStyle,
// //                                           ),
// //                                           color: Color(0xFF9E9E9E),
// //                                           letterSpacing: 0.0,
// //                                           fontWeight:
// //                                               FlutterFlowTheme.of(context)
// //                                                   .labelMedium
// //                                                   .fontWeight,
// //                                           fontStyle:
// //                                               FlutterFlowTheme.of(context)
// //                                                   .labelMedium
// //                                                   .fontStyle,
// //                                         ),
// //                                     enabledBorder: OutlineInputBorder(
// //                                       borderSide: BorderSide(
// //                                         color: Color(0x00000000),
// //                                         width: 1.0,
// //                                       ),
// //                                       borderRadius: BorderRadius.circular(8.0),
// //                                     ),
// //                                     focusedBorder: OutlineInputBorder(
// //                                       borderSide: BorderSide(
// //                                         color: Color(0x00000000),
// //                                         width: 1.0,
// //                                       ),
// //                                       borderRadius: BorderRadius.circular(8.0),
// //                                     ),
// //                                     errorBorder: OutlineInputBorder(
// //                                       borderSide: BorderSide(
// //                                         color:
// //                                             FlutterFlowTheme.of(context).error,
// //                                         width: 1.0,
// //                                       ),
// //                                       borderRadius: BorderRadius.circular(8.0),
// //                                     ),
// //                                     focusedErrorBorder: OutlineInputBorder(
// //                                       borderSide: BorderSide(
// //                                         color:
// //                                             FlutterFlowTheme.of(context).error,
// //                                         width: 1.0,
// //                                       ),
// //                                       borderRadius: BorderRadius.circular(8.0),
// //                                     ),
// //                                     filled: true,
// //                                     fillColor: FlutterFlowTheme.of(context)
// //                                         .secondaryBackground,
// //                                   ),
// //                                   style: FlutterFlowTheme.of(context)
// //                                       .bodyMedium
// //                                       .override(
// //                                         font: GoogleFonts.poppins(
// //                                           fontWeight:
// //                                               FlutterFlowTheme.of(context)
// //                                                   .bodyMedium
// //                                                   .fontWeight,
// //                                           fontStyle:
// //                                               FlutterFlowTheme.of(context)
// //                                                   .bodyMedium
// //                                                   .fontStyle,
// //                                         ),
// //                                         letterSpacing: 0.0,
// //                                         fontWeight: FlutterFlowTheme.of(context)
// //                                             .bodyMedium
// //                                             .fontWeight,
// //                                         fontStyle: FlutterFlowTheme.of(context)
// //                                             .bodyMedium
// //                                             .fontStyle,
// //                                       ),
// //                                   cursorColor:
// //                                       FlutterFlowTheme.of(context).primaryText,
// //                                   enableInteractiveSelection: true,
// //                                   validator: _model.textControllerValidator
// //                                       .asValidator(context),
// //                                 ),
// //                               ),
// //                             ),
// //                           ),
// //                           Padding(
// //                             padding: EdgeInsetsDirectional.fromSTEB(
// //                                 0.0, 0.0, 16.0, 0.0),
// //                             child: InkWell(
// //                               splashColor: Colors.transparent,
// //                               focusColor: Colors.transparent,
// //                               hoverColor: Colors.transparent,
// //                               highlightColor: Colors.transparent,
// //                               onTap: () async {
// //                                 if (_model.textController.text != null &&
// //                                     _model.textController.text != '') {
// //                                   await MessagesRecord.createDoc(
// //                                           chatPageTeamsRecord!.reference)
// //                                       .set({
// //                                     ...createMessagesRecordData(
// //                                       text: _model.textController.text,
// //                                       senderName: FFAppState().userName,
// //                                       senderId: getJsonField(
// //                                         (_model.apiResultcv6?.jsonBody ?? ''),
// //                                         r'''$.data.id''',
// //                                       ).toString(),
// //                                     ),
// //                                     ...mapToFirestore(
// //                                       {
// //                                         'createdAt':
// //                                             FieldValue.serverTimestamp(),
// //                                       },
// //                                     ),
// //                                   });
// //                                   safeSetState(() {
// //                                     _model.textController?.clear();
// //                                   });
// //                                 }
// //                               },
// //                               child: Container(
// //                                 width: 40.0,
// //                                 height: 40.0,
// //                                 decoration: BoxDecoration(
// //                                   color: Color(0xFFEB6027),
// //                                   shape: BoxShape.circle,
// //                                 ),
// //                                 child: Align(
// //                                   alignment: AlignmentDirectional(0.0, 0.0),
// //                                   child: Transform.rotate(
// //                                     angle: 322.0 * (math.pi / 180),
// //                                     child: Icon(
// //                                       Icons.send,
// //                                       color: Colors.white,
// //                                       size: 18.0,
// //                                     ),
// //                                   ),
// //                                 ),
// //                               ),
// //                             ),
// //                           ),
// //                         ],
// //                       ),
// //                     ),
// //                   ],
// //                 ),
// //               ],
// //             ),
// //           ),
// //         );
// //       },
// //     );
// //   }
// // }
//
//
// import '/auth/firebase_auth/auth_util.dart';
// import '/backend/api_requests/api_calls.dart';
// import '/backend/backend.dart';
// import '/flutter_flow/flutter_flow_theme.dart';
// import '/flutter_flow/flutter_flow_util.dart';
// import '/flutter_flow/flutter_flow_widgets.dart';
// import 'dart:ui';
// import 'dart:math' as math;
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/scheduler.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:provider/provider.dart';
// import 'chat_page_model.dart';
// export 'chat_page_model.dart';
//
// class ChatPageWidget extends StatefulWidget {
//   const ChatPageWidget({
//     super.key,
//     this.teamId,
//   });
//
//   final int? teamId;
//
//   static String routeName = 'ChatPage';
//   static String routePath = '/chatPage';
//
//   @override
//   State<ChatPageWidget> createState() => _ChatPageWidgetState();
// }
//
// class _ChatPageWidgetState extends State<ChatPageWidget> with RouteAware {
//   late ChatPageModel _model;
//
//   final scaffoldKey = GlobalKey<ScaffoldState>();
//
//   @override
//   void initState() {
//     super.initState();
//     _model = createModel(context, () => ChatPageModel());
//
//     // On page load action.
//     SchedulerBinding.instance.addPostFrameCallback((_) async {
//       _model.apiResultcv6 = await DashboardGroup.getProfileCall.call(
//         authToken: FFAppState().authToken,
//       );
//
//       if (_model.apiResultcv6?.succeeded ?? false) {
//         FFAppState().userName = getJsonField(
//           (_model.apiResultcv6?.jsonBody ?? ''),
//           r'$.data.name',
//         );
//       }
//
//       await Future.delayed(
//         const Duration(
//           milliseconds: 400,
//         ),
//       );
//       safeSetState(() {});
//     });
//
//     _model.textController ??= TextEditingController()
//       ..addListener(() {
//         debugLogWidgetClass(_model);
//       });
//     _model.textFieldFocusNode ??= FocusNode();
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
//   void didUpdateWidget(ChatPageWidget oldWidget) {
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
//     return StreamBuilder<List<TeamsRecord>>(
//       stream: queryTeamsRecord(
//         queryBuilder: (teamsRecord) => teamsRecord.where(
//           'uid',
//           isEqualTo: widget!.teamId?.toString(),
//         ),
//         singleRecord: true,
//       ),
//       builder: (context, snapshot) {
//         // Customize what your widget looks like when it's loading.
//         if (!snapshot.hasData) {
//           return Scaffold(
//             backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
//             body: Center(
//               child: SizedBox(
//                 width: 40.0,
//                 height: 40.0,
//                 child: SpinKitCubeGrid(
//                   color: FlutterFlowTheme.of(context).primary,
//                   size: 40.0,
//                 ),
//               ),
//             ),
//           );
//         }
//         List<TeamsRecord> chatPageTeamsRecordList = snapshot.data!;
//         // Return an empty Container when the item does not exist.
//         if (snapshot.data!.isEmpty) {
//           return Container();
//         }
//         final chatPageTeamsRecord = chatPageTeamsRecordList.isNotEmpty
//             ? chatPageTeamsRecordList.first
//             : null;
//         _model.debugBackendQueries['chatPageTeamsRecord_Scaffold_80t7ok22'] =
//             debugSerializeParam(
//               chatPageTeamsRecord,
//               ParamType.Document,
//               link:
//               'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=ChatPage',
//               name: 'teams',
//               nullable: false,
//             );
//         debugLogWidgetClass(_model);
//
//         return GestureDetector(
//           onTap: () {
//             FocusScope.of(context).unfocus();
//             FocusManager.instance.primaryFocus?.unfocus();
//           },
//           child: Scaffold(
//             key: scaffoldKey,
//             backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
//             body: Stack(
//               alignment: const AlignmentDirectional(0.0, 1.0),
//               children: [
//                 ClipRRect(
//                   borderRadius: BorderRadius.circular(8.0),
//                   child: Image.asset(
//                     Theme.of(context).brightness == Brightness.dark
//                         ? 'assets/images/commonBg.png'
//                         : 'assets/images/plain_whiteBg.png',
//                     width: double.infinity,
//                     height: double.infinity,
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//                 Padding(
//                   padding:
//                   const EdgeInsetsDirectional.fromSTEB(16.0, 40.0, 16.0, 0.0),
//                   child: Column(
//                     mainAxisSize: MainAxisSize.max,
//                     children: [
//                       Row(
//                         mainAxisSize: MainAxisSize.max,
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           InkWell(
//                             splashColor: Colors.transparent,
//                             focusColor: Colors.transparent,
//                             hoverColor: Colors.transparent,
//                             highlightColor: Colors.transparent,
//                             onTap: () async {
//                               context.safePop();
//                             },
//                             child: Container(
//                               width: 40.0,
//                               height: 40.0,
//                               decoration: BoxDecoration(
//                                 color: FlutterFlowTheme.of(context).backBtnClr,
//                                 boxShadow: [
//                                   const BoxShadow(
//                                     blurRadius: 4.0,
//                                     color: Color(0x335D4E4E),
//                                     offset: Offset(
//                                       0.0,
//                                       2.0,
//                                     ),
//                                   )
//                                 ],
//                                 borderRadius: BorderRadius.circular(12.0),
//                                 border: Border.all(
//                                   color: (Theme.of(context).brightness ==
//                                       Brightness.dark) ==
//                                       true
//                                       ? Colors.black
//                                       : const Color(0xD5999999),
//                                 ),
//                               ),
//                               child: Icon(
//                                 Icons.arrow_back_rounded,
//                                 color: FlutterFlowTheme.of(context).tertiary,
//                                 size: 24.0,
//                               ),
//                             ),
//                           ),
//                           Text(
//                             valueOrDefault<String>(
//                               widget!.teamId?.toString(),
//                               '0',
//                             ),
//                             style: FlutterFlowTheme.of(context)
//                                 .bodyMedium
//                                 .override(
//                               font: GoogleFonts.bebasNeue(
//                                 fontWeight: FlutterFlowTheme.of(context)
//                                     .bodyMedium
//                                     .fontWeight,
//                                 fontStyle: FlutterFlowTheme.of(context)
//                                     .bodyMedium
//                                     .fontStyle,
//                               ),
//                               letterSpacing: 0.0,
//                               fontWeight: FlutterFlowTheme.of(context)
//                                   .bodyMedium
//                                   .fontWeight,
//                               fontStyle: FlutterFlowTheme.of(context)
//                                   .bodyMedium
//                                   .fontStyle,
//                             ),
//                           ),
//                         ],
//                       ),
//                       Padding(
//                         padding:
//                         const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
//                         child: Row(
//                           mainAxisSize: MainAxisSize.max,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Container(
//                               decoration: BoxDecoration(
//                                 shape: BoxShape.circle,
//                                 border: Border.all(
//                                   color: Colors.white,
//                                 ),
//                               ),
//                               child: Container(
//                                 width: 70.0,
//                                 height: 70.0,
//                                 clipBehavior: Clip.antiAlias,
//                                 decoration: const BoxDecoration(
//                                   shape: BoxShape.circle,
//                                 ),
//                                 child: Image.network(
//                                   chatPageTeamsRecord!.photoUrl,
//                                   fit: BoxFit.cover,
//                                 ),
//                               ),
//                             ),
//                             Padding(
//                               padding: const EdgeInsetsDirectional.fromSTEB(
//                                   10.0, 0.0, 0.0, 0.0),
//                               child: Column(
//                                 mainAxisSize: MainAxisSize.max,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Padding(
//                                     padding: const EdgeInsetsDirectional.fromSTEB(
//                                         0.0, 10.0, 0.0, 0.0),
//                                     child: Text(
//                                       chatPageTeamsRecord!.name,
//                                       style: FlutterFlowTheme.of(context)
//                                           .titleLarge
//                                           .override(
//                                         font: GoogleFonts.poppins(
//                                           fontWeight: FontWeight.w600,
//                                           fontStyle:
//                                           FlutterFlowTheme.of(context)
//                                               .titleLarge
//                                               .fontStyle,
//                                         ),
//                                         fontSize: 16.0,
//                                         letterSpacing: 0.0,
//                                         fontWeight: FontWeight.w600,
//                                         fontStyle:
//                                         FlutterFlowTheme.of(context)
//                                             .titleLarge
//                                             .fontStyle,
//                                       ),
//                                     ),
//                                   ),
//                                   Row(
//                                     mainAxisSize: MainAxisSize.min,
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       Icon(
//                                         Icons.groups_2,
//                                         color: Theme.of(context).brightness ==
//                                             Brightness.dark
//                                             ? const Color(0xFFC0C0C0)
//                                             : const Color(0xFF4D4D4D),
//                                         size: 18.0,
//                                       ),
//                                       Padding(
//                                         padding: const EdgeInsetsDirectional.fromSTEB(
//                                             3.0, 0.0, 0.0, 0.0),
//                                         child: Text(
//                                           chatPageTeamsRecord!.members.length
//                                               .toString(),
//                                           textAlign: TextAlign.start,
//                                           style: FlutterFlowTheme.of(context)
//                                               .bodySmall
//                                               .override(
//                                             font: GoogleFonts.poppins(
//                                               fontWeight:
//                                               FlutterFlowTheme.of(
//                                                   context)
//                                                   .bodySmall
//                                                   .fontWeight,
//                                               fontStyle:
//                                               FlutterFlowTheme.of(
//                                                   context)
//                                                   .bodySmall
//                                                   .fontStyle,
//                                             ),
//                                             color:
//                                             FlutterFlowTheme.of(context)
//                                                 .tertiary,
//                                             letterSpacing: 0.0,
//                                             fontWeight:
//                                             FlutterFlowTheme.of(context)
//                                                 .bodySmall
//                                                 .fontWeight,
//                                             fontStyle:
//                                             FlutterFlowTheme.of(context)
//                                                 .bodySmall
//                                                 .fontStyle,
//                                           ),
//                                         ),
//                                       ),
//                                       Padding(
//                                         padding: const EdgeInsetsDirectional.fromSTEB(
//                                             3.0, 0.0, 0.0, 0.0),
//                                         child: Text(
//                                           ' Members',
//                                           textAlign: TextAlign.start,
//                                           style: FlutterFlowTheme.of(context)
//                                               .bodySmall
//                                               .override(
//                                             font: GoogleFonts.poppins(
//                                               fontWeight:
//                                               FlutterFlowTheme.of(
//                                                   context)
//                                                   .bodySmall
//                                                   .fontWeight,
//                                               fontStyle:
//                                               FlutterFlowTheme.of(
//                                                   context)
//                                                   .bodySmall
//                                                   .fontStyle,
//                                             ),
//                                             color:
//                                             FlutterFlowTheme.of(context)
//                                                 .tertiary,
//                                             letterSpacing: 0.0,
//                                             fontWeight:
//                                             FlutterFlowTheme.of(context)
//                                                 .bodySmall
//                                                 .fontWeight,
//                                             fontStyle:
//                                             FlutterFlowTheme.of(context)
//                                                 .bodySmall
//                                                 .fontStyle,
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Padding(
//                         padding:
//                         const EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
//                         child: Container(
//                           width: double.infinity,
//                           height: 1.0,
//                           decoration: const BoxDecoration(
//                             gradient: LinearGradient(
//                               colors: [
//                                 Color(0x00FFFFFF),
//                                 Color(0xFF6B4A4A),
//                                 Color(0x00FFFFFF),
//                                 Color(0xFF6B4A4A)
//                               ],
//                               stops: [0.0, 0.2, 1.0, 1.0],
//                               begin: AlignmentDirectional(1.0, 0.0),
//                               end: AlignmentDirectional(-1.0, 0),
//                             ),
//                           ),
//                         ),
//                       ),
//                       Container(
//                         width: double.infinity,
//                         height: MediaQuery.sizeOf(context).height * 0.65,
//                         decoration: const BoxDecoration(
//                           color: Colors.transparent,
//                         ),
//                         child: Padding(
//                           padding: const EdgeInsetsDirectional.fromSTEB(
//                               0.0, 16.0, 0.0, 16.0),
//                           child: StreamBuilder<List<MessagesRecord>>(
//                             stream: queryMessagesRecord(
//                               parent: chatPageTeamsRecord?.reference,
//                               queryBuilder: (messagesRecord) =>
//                                   messagesRecord.orderBy('createdAt'),
//                             ),
//                             builder: (context, snapshot) {
//                               // Customize what your widget looks like when it's loading.
//                               if (!snapshot.hasData) {
//                                 return Center(
//                                   child: SizedBox(
//                                     width: 40.0,
//                                     height: 40.0,
//                                     child: SpinKitCubeGrid(
//                                       color:
//                                       FlutterFlowTheme.of(context).primary,
//                                       size: 40.0,
//                                     ),
//                                   ),
//                                 );
//                               }
//                               List<MessagesRecord> listViewMessagesRecordList =
//                               snapshot.data!;
//
//                               _model.debugBackendQueries[
//                               'listViewMessagesRecordList_ListView_2zzbe8ae${listViewMessagesRecordList.length > 100 ? ' (first 100)' : ''}'] =
//                                   debugSerializeParam(
//                                     listViewMessagesRecordList.take(100),
//                                     ParamType.Document,
//                                     isList: true,
//                                     link:
//                                     'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=ChatPage',
//                                     name: 'messages',
//                                     nullable: false,
//                                   );
//                               debugLogWidgetClass(_model);
//
//                               return ListView.builder(
//                                 padding: EdgeInsets.zero,
//                                 shrinkWrap: true,
//                                 scrollDirection: Axis.vertical,
//                                 itemCount: listViewMessagesRecordList.length,
//                                 itemBuilder: (context, listViewIndex) {
//                                   final listViewMessagesRecord =
//                                   listViewMessagesRecordList[listViewIndex];
//                                   return Column(
//                                     mainAxisSize: MainAxisSize.max,
//                                     children: [
//                                       Builder(
//                                         builder: (context) {
//                                           if (listViewMessagesRecord.senderId !=
//                                               getJsonField(
//                                                 (_model.apiResultcv6
//                                                     ?.jsonBody ??
//                                                     ''),
//                                                 r'''$.data.id''',
//                                               ).toString()) {
//                                             return Padding(
//                                               padding: const EdgeInsetsDirectional
//                                                   .fromSTEB(
//                                                   0.0, 20.0, 0.0, 0.0),
//                                               child: Row(
//                                                 mainAxisSize: MainAxisSize.max,
//                                                 mainAxisAlignment:
//                                                 MainAxisAlignment.start,
//                                                 crossAxisAlignment:
//                                                 CrossAxisAlignment.start,
//                                                 children: [
//                                                   Container(
//                                                     width: 34.0,
//                                                     height: 34.0,
//                                                     clipBehavior:
//                                                     Clip.antiAlias,
//                                                     decoration: const BoxDecoration(
//                                                       shape: BoxShape.circle,
//                                                     ),
//                                                     child: Image.network(
//                                                       'https://picsum.photos/seed/962/600',
//                                                       fit: BoxFit.cover,
//                                                     ),
//                                                   ),
//                                                   Padding(
//                                                     padding:
//                                                     const EdgeInsetsDirectional
//                                                         .fromSTEB(
//                                                         8.0,
//                                                         0.0,
//                                                         0.0,
//                                                         0.0),
//                                                     child: Container(
//                                                       width:
//                                                       MediaQuery.sizeOf(
//                                                           context)
//                                                           .width *
//                                                           0.6,
//                                                       decoration:
//                                                       BoxDecoration(
//                                                         color: Theme.of(context)
//                                                             .brightness ==
//                                                             Brightness
//                                                                 .dark
//                                                             ? const Color(
//                                                             0xFF1C1C22)
//                                                             : const Color(
//                                                             0xFFEAEAEA),
//                                                         borderRadius:
//                                                         const BorderRadius.only(
//                                                           bottomLeft:
//                                                           Radius.circular(
//                                                               15.0),
//                                                           bottomRight:
//                                                           Radius.circular(
//                                                               15.0),
//                                                           topLeft:
//                                                           Radius.circular(
//                                                               0.0),
//                                                           topRight:
//                                                           Radius.circular(
//                                                               15.0),
//                                                         ),
//                                                         border: Border.all(
//                                                           color: Theme.of(context)
//                                                               .brightness ==
//                                                               Brightness
//                                                                   .dark
//                                                               ? const Color(
//                                                               0x34FFFFFF)
//                                                               : const Color(
//                                                               0x00000000),
//                                                         ),
//                                                       ),
//                                                       child: Column(
//                                                         mainAxisSize:
//                                                         MainAxisSize.max,
//                                                         children: [
//                                                           Align(
//                                                             alignment:
//                                                             const AlignmentDirectional(
//                                                                 -1.0,
//                                                                 0.0),
//                                                             child: Padding(
//                                                               padding: const EdgeInsetsDirectional
//                                                                   .fromSTEB(
//                                                                   10.0,
//                                                                   10.0,
//                                                                   0.0,
//                                                                   3.0),
//                                                               child: Text(
//                                                                 valueOrDefault<String>(
//                                                                   listViewMessagesRecord
//                                                                       .senderName ??
//                                                                       'Unknown',
//                                                                   'Unknown',
//                                                                 ),
//                                                                 style: FlutterFlowTheme.of(
//                                                                     context)
//                                                                     .labelMedium
//                                                                     .override(
//                                                                   font: GoogleFonts
//                                                                       .poppins(
//                                                                     fontWeight: FlutterFlowTheme.of(context)
//                                                                         .labelMedium
//                                                                         .fontWeight,
//                                                                     fontStyle: FlutterFlowTheme.of(context)
//                                                                         .labelMedium
//                                                                         .fontStyle,
//                                                                   ),
//                                                                   color: FlutterFlowTheme.of(context)
//                                                                       .tertiary,
//                                                                   letterSpacing:
//                                                                   0.0,
//                                                                   fontWeight: FlutterFlowTheme.of(context)
//                                                                       .labelMedium
//                                                                       .fontWeight,
//                                                                   fontStyle: FlutterFlowTheme.of(context)
//                                                                       .labelMedium
//                                                                       .fontStyle,
//                                                                 ),
//                                                               ),
//                                                             ),
//                                                           ),
//                                                           Align(
//                                                             alignment:
//                                                             const AlignmentDirectional(
//                                                                 -1.0,
//                                                                 0.0),
//                                                             child: Padding(
//                                                               padding: const EdgeInsetsDirectional
//                                                                   .fromSTEB(
//                                                                   10.0,
//                                                                   0.0,
//                                                                   0.0,
//                                                                   10.0),
//                                                               child: Text(
//                                                                 listViewMessagesRecord
//                                                                     .text,
//                                                                 style: FlutterFlowTheme.of(
//                                                                     context)
//                                                                     .labelMedium
//                                                                     .override(
//                                                                   font: GoogleFonts
//                                                                       .poppins(
//                                                                     fontWeight: FlutterFlowTheme.of(context)
//                                                                         .labelMedium
//                                                                         .fontWeight,
//                                                                     fontStyle: FlutterFlowTheme.of(context)
//                                                                         .labelMedium
//                                                                         .fontStyle,
//                                                                   ),
//                                                                   color: FlutterFlowTheme.of(context)
//                                                                       .tertiary,
//                                                                   fontSize:
//                                                                   12.0,
//                                                                   letterSpacing:
//                                                                   0.0,
//                                                                   fontWeight: FlutterFlowTheme.of(context)
//                                                                       .labelMedium
//                                                                       .fontWeight,
//                                                                   fontStyle: FlutterFlowTheme.of(context)
//                                                                       .labelMedium
//                                                                       .fontStyle,
//                                                                 ),
//                                                               ),
//                                                             ),
//                                                           ),
//                                                         ],
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 ],
//                                               ),
//                                             );
//                                           } else {
//                                             return Padding(
//                                               padding: const EdgeInsetsDirectional
//                                                   .fromSTEB(
//                                                   0.0, 20.0, 0.0, 0.0),
//                                               child: Row(
//                                                 mainAxisSize: MainAxisSize.max,
//                                                 mainAxisAlignment:
//                                                 MainAxisAlignment.end,
//                                                 crossAxisAlignment:
//                                                 CrossAxisAlignment.start,
//                                                 children: [
//                                                   Container(
//                                                     width:
//                                                     MediaQuery.sizeOf(
//                                                         context)
//                                                         .width *
//                                                         0.6,
//                                                     decoration:
//                                                     BoxDecoration(
//                                                       color: Theme.of(context)
//                                                           .brightness ==
//                                                           Brightness.dark
//                                                           ? const Color(
//                                                           0xFFDF7D35)
//                                                           : const Color(
//                                                           0xFFDF7D35),
//                                                       borderRadius:
//                                                       const BorderRadius.only(
//                                                         bottomLeft:
//                                                         Radius.circular(
//                                                             15.0),
//                                                         bottomRight:
//                                                         Radius.circular(
//                                                             15.0),
//                                                         topLeft:
//                                                         Radius.circular(
//                                                             15.0),
//                                                         topRight:
//                                                         Radius.circular(
//                                                             0.0),
//                                                       ),
//                                                       border: Border.all(
//                                                         color: Theme.of(context)
//                                                             .brightness ==
//                                                             Brightness
//                                                                 .dark
//                                                             ? const Color(
//                                                             0x34FFFFFF)
//                                                             : const Color(
//                                                             0x00000000),
//                                                       ),
//                                                     ),
//                                                     child: Column(
//                                                       mainAxisSize:
//                                                       MainAxisSize.max,
//                                                       children: [
//                                                         Align(
//                                                           alignment:
//                                                           const AlignmentDirectional(
//                                                               -1.0,
//                                                               0.0),
//                                                           child: Padding(
//                                                             padding: const EdgeInsetsDirectional
//                                                                 .fromSTEB(
//                                                                 10.0,
//                                                                 10.0,
//                                                                 0.0,
//                                                                 3.0),
//                                                             child: Text(
//                                                               valueOrDefault<String>(
//                                                                 listViewMessagesRecord
//                                                                     .senderName ??
//                                                                     'Unknown',
//                                                                 'Unknown',
//                                                               ),
//                                                               style: FlutterFlowTheme.of(
//                                                                   context)
//                                                                   .labelMedium
//                                                                   .override(
//                                                                 font: GoogleFonts
//                                                                     .poppins(
//                                                                   fontWeight: FlutterFlowTheme.of(context)
//                                                                       .labelMedium
//                                                                       .fontWeight,
//                                                                   fontStyle: FlutterFlowTheme.of(context)
//                                                                       .labelMedium
//                                                                       .fontStyle,
//                                                                 ),
//                                                                 color: Colors
//                                                                     .white,
//                                                                 letterSpacing:
//                                                                 0.0,
//                                                                 fontWeight: FlutterFlowTheme.of(context)
//                                                                     .labelMedium
//                                                                     .fontWeight,
//                                                                 fontStyle: FlutterFlowTheme.of(context)
//                                                                     .labelMedium
//                                                                     .fontStyle,
//                                                               ),
//                                                             ),
//                                                           ),
//                                                         ),
//                                                         Align(
//                                                           alignment:
//                                                           const AlignmentDirectional(
//                                                               -1.0,
//                                                               0.0),
//                                                           child: Padding(
//                                                             padding: const EdgeInsetsDirectional
//                                                                 .fromSTEB(
//                                                                 10.0,
//                                                                 0.0,
//                                                                 0.0,
//                                                                 10.0),
//                                                             child: Text(
//                                                               listViewMessagesRecord
//                                                                   .text,
//                                                               style: FlutterFlowTheme.of(
//                                                                   context)
//                                                                   .labelMedium
//                                                                   .override(
//                                                                 font: GoogleFonts
//                                                                     .poppins(
//                                                                   fontWeight: FlutterFlowTheme.of(context)
//                                                                       .labelMedium
//                                                                       .fontWeight,
//                                                                   fontStyle: FlutterFlowTheme.of(context)
//                                                                       .labelMedium
//                                                                       .fontStyle,
//                                                                 ),
//                                                                 color: Colors
//                                                                     .white,
//                                                                 fontSize:
//                                                                 12.0,
//                                                                 letterSpacing:
//                                                                 0.0,
//                                                                 fontWeight: FlutterFlowTheme.of(context)
//                                                                     .labelMedium
//                                                                     .fontWeight,
//                                                                 fontStyle: FlutterFlowTheme.of(context)
//                                                                     .labelMedium
//                                                                     .fontStyle,
//                                                               ),
//                                                             ),
//                                                           ),
//                                                         ),
//                                                       ],
//                                                     ),
//                                                   ),
//                                                   Padding(
//                                                     padding: const EdgeInsetsDirectional
//                                                         .fromSTEB(
//                                                         8.0, 0.0, 0.0, 0.0),
//                                                     child: Container(
//                                                       width: 34.0,
//                                                       height: 34.0,
//                                                       clipBehavior:
//                                                       Clip.antiAlias,
//                                                       decoration: const BoxDecoration(
//                                                         shape: BoxShape.circle,
//                                                       ),
//                                                       child: Image.network(
//                                                         'https://picsum.photos/seed/962/600',
//                                                         fit: BoxFit.cover,
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 ],
//                                               ),
//                                             );
//                                           }
//                                         },
//                                       ),
//                                     ],
//                                   );
//                                 },
//                               );
//                             },
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Row(
//                   mainAxisSize: MainAxisSize.max,
//                   children: [
//                     Container(
//                       width: MediaQuery.sizeOf(context).width * 1.0,
//                       height: 70.0,
//                       decoration: BoxDecoration(
//                         color: Theme.of(context).brightness == Brightness.dark
//                             ? const Color(0xFF282828)
//                             : const Color(0xFFE6E6E6),
//                       ),
//                       child: Row(
//                         mainAxisSize: MainAxisSize.max,
//                         children: [
//                           Expanded(
//                             child: Padding(
//                               padding: const EdgeInsetsDirectional.fromSTEB(
//                                   15.0, 15.0, 10.0, 15.0),
//                               child: Container(
//                                 width: 200.0,
//                                 child: TextFormField(
//                                   controller: _model.textController,
//                                   focusNode: _model.textFieldFocusNode,
//                                   autofocus: false,
//                                   obscureText: false,
//                                   decoration: InputDecoration(
//                                     isDense: true,
//                                     labelStyle: FlutterFlowTheme.of(context)
//                                         .labelMedium
//                                         .override(
//                                       font: GoogleFonts.poppins(
//                                         fontWeight:
//                                         FlutterFlowTheme.of(context)
//                                             .labelMedium
//                                             .fontWeight,
//                                         fontStyle:
//                                         FlutterFlowTheme.of(context)
//                                             .labelMedium
//                                             .fontStyle,
//                                       ),
//                                       letterSpacing: 0.0,
//                                       fontWeight:
//                                       FlutterFlowTheme.of(context)
//                                           .labelMedium
//                                           .fontWeight,
//                                       fontStyle:
//                                       FlutterFlowTheme.of(context)
//                                           .labelMedium
//                                           .fontStyle,
//                                     ),
//                                     hintText: 'Type here...',
//                                     hintStyle: FlutterFlowTheme.of(context)
//                                         .labelMedium
//                                         .override(
//                                       font: GoogleFonts.poppins(
//                                         fontWeight:
//                                         FlutterFlowTheme.of(context)
//                                             .labelMedium
//                                             .fontWeight,
//                                         fontStyle:
//                                         FlutterFlowTheme.of(context)
//                                             .labelMedium
//                                             .fontStyle,
//                                       ),
//                                       color: const Color(0xFF9E9E9E),
//                                       letterSpacing: 0.0,
//                                       fontWeight:
//                                       FlutterFlowTheme.of(context)
//                                           .labelMedium
//                                           .fontWeight,
//                                       fontStyle:
//                                       FlutterFlowTheme.of(context)
//                                           .labelMedium
//                                           .fontStyle,
//                                     ),
//                                     enabledBorder: OutlineInputBorder(
//                                       borderSide: const BorderSide(
//                                         color: Color(0x00000000),
//                                         width: 1.0,
//                                       ),
//                                       borderRadius: BorderRadius.circular(8.0),
//                                     ),
//                                     focusedBorder: OutlineInputBorder(
//                                       borderSide: const BorderSide(
//                                         color: Color(0x00000000),
//                                         width: 1.0,
//                                       ),
//                                       borderRadius: BorderRadius.circular(8.0),
//                                     ),
//                                     errorBorder: OutlineInputBorder(
//                                       borderSide: BorderSide(
//                                         color:
//                                         FlutterFlowTheme.of(context).error,
//                                         width: 1.0,
//                                       ),
//                                       borderRadius: BorderRadius.circular(8.0),
//                                     ),
//                                     focusedErrorBorder: OutlineInputBorder(
//                                       borderSide: BorderSide(
//                                         color:
//                                         FlutterFlowTheme.of(context).error,
//                                         width: 1.0,
//                                       ),
//                                       borderRadius: BorderRadius.circular(8.0),
//                                     ),
//                                     filled: true,
//                                     fillColor: FlutterFlowTheme.of(context)
//                                         .secondaryBackground,
//                                   ),
//                                   style: FlutterFlowTheme.of(context)
//                                       .bodyMedium
//                                       .override(
//                                     font: GoogleFonts.poppins(
//                                       fontWeight:
//                                       FlutterFlowTheme.of(context)
//                                           .bodyMedium
//                                           .fontWeight,
//                                       fontStyle:
//                                       FlutterFlowTheme.of(context)
//                                           .bodyMedium
//                                           .fontStyle,
//                                     ),
//                                     letterSpacing: 0.0,
//                                     fontWeight: FlutterFlowTheme.of(context)
//                                         .bodyMedium
//                                         .fontWeight,
//                                     fontStyle: FlutterFlowTheme.of(context)
//                                         .bodyMedium
//                                         .fontStyle,
//                                   ),
//                                   cursorColor:
//                                   FlutterFlowTheme.of(context).primaryText,
//                                   enableInteractiveSelection: true,
//                                   validator: _model.textControllerValidator
//                                       .asValidator(context),
//                                 ),
//                               ),
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsetsDirectional.fromSTEB(
//                                 0.0, 0.0, 16.0, 0.0),
//                             child: InkWell(
//                               splashColor: Colors.transparent,
//                               focusColor: Colors.transparent,
//                               hoverColor: Colors.transparent,
//                               highlightColor: Colors.transparent,
//                              ///1
//                              //  onTap: () async {
//                              //    if (_model.textController.text.isNotEmpty) {
//                              //      final senderId = getJsonField(
//                              //        (_model.apiResultcv6?.jsonBody ?? ''),
//                              //        r'$.data.id',
//                              //      ).toString();
//                              //      final senderName =
//                              //          FFAppState().userName ?? 'Unknown';
//                              //
//                              //      debugPrint(
//                              //          'Sending message: text="${_model.textController.text}", senderName="$senderName", senderId="$senderId" , teamId="${widget.teamId}"');
//                              //
//                              //      await MessagesRecord.createDoc(
//                              //          chatPageTeamsRecord!.reference)
//                              //          .set({
//                              //        ...createMessagesRecordData(
//                              //          text: _model.textController.text,
//                              //          senderName: senderName,
//                              //          senderId: senderId,
//                              //        ),
//                              //        ...mapToFirestore(
//                              //          {
//                              //            'createdAt':
//                              //            FieldValue.serverTimestamp(),
//                              //          },
//                              //        ),
//                              //      });
//                              //
//                              //
//                              //      // Call the TeamMemberforChatCall API
//                              //      await TeamMemberChatNotificationCall().call(
//                              //
//                              //
//                              //        teamId: widget.teamId!,
//                              //        senderId: int.parse(senderId),
//                              //        authToken: FFAppState().authToken,
//                              //      );
//                              //      final response = await TeamMemberChatNotificationCall().call(
//                              //        teamId: widget.teamId!,
//                              //        senderId: int.parse(senderId),
//                              //        authToken: FFAppState().authToken,
//                              //      );
//                              //
//                              //      if (response.succeeded) {
//                              //        print('TeamMemberChatNotificationCall succeeded: ${response.statusCode}');
//                              //      } else {
//                              //        print('TeamMemberChatNotificationCall failed: ${response.statusCode}');
//                              //      }
//                              //
//                              //
//                              //
//                              //
//                              //
//                              //
//                              //      safeSetState(() {
//                              //        _model.textController?.clear();
//                              //      });
//                              //    }
//                              //  },
//                               ///2
//         onTap: () async {
//         final messageText = _model.textController.text.trim();
//         if (messageText.isNotEmpty) {
//         final senderId = getJsonField(
//         (_model.apiResultcv6?.jsonBody ?? ''),
//         r'$.data.id',
//         ).toString();
//         final senderName = FFAppState().userName ?? 'Unknown';
//
//         // Clear input immediately
//         safeSetState(() {
//         _model.textController?.clear();
//         });
//
//         // Send message
//         await MessagesRecord.createDoc(chatPageTeamsRecord!.reference).set({
//         ...createMessagesRecordData(
//         text: messageText,
//         senderName: senderName,
//         senderId: senderId,
//         ),
//         ...mapToFirestore({
//         'createdAt': FieldValue.serverTimestamp(),
//         }),
//         });
//
//         // Send notification
//         final response = await TeamMemberChatNotificationCall().call(
//         teamId: widget.teamId!,
//         senderId: int.parse(senderId),
//         authToken: FFAppState().authToken,
//         );
//
//         if (response.succeeded) {
//         print('TeamMemberChatNotificationCall succeeded: ${response.statusCode}');
//         } else {
//         print('TeamMemberChatNotificationCall failed: ${response.statusCode}');
//         }
//         }
//         },
//
//
//                               child: Container(
//                                 width: 40.0,
//                                 height: 40.0,
//                                 decoration: const BoxDecoration(
//                                   color: Color(0xFFEB6027),
//                                   shape: BoxShape.circle,
//                                 ),
//                                 child: Align(
//                                   alignment: const AlignmentDirectional(0.0, 0.0),
//                                   child: Transform.rotate(
//                                     angle: 322.0 * (math.pi / 180),
//                                     child: const Icon(
//                                       Icons.send,
//                                       color: Colors.white,
//                                       size: 18.0,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
//
//
//
//
//


///2  refined working code
///
// import '/auth/firebase_auth/auth_util.dart';
// import '/backend/api_requests/api_calls.dart';
// import '/backend/backend.dart';
// import '/flutter_flow/flutter_flow_theme.dart';
// import '/flutter_flow/flutter_flow_util.dart';
// import '/flutter_flow/flutter_flow_widgets.dart';
// import 'dart:ui';
// import 'dart:math' as math;
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/scheduler.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:provider/provider.dart';
// import 'chat_page_model.dart';
// export 'chat_page_model.dart';
//
// class ChatPageWidget extends StatefulWidget {
//   const ChatPageWidget({
//     super.key,
//     this.teamId,
//   });
//
//   final int? teamId;
//
//   static String routeName = 'ChatPage';
//   static String routePath = '/chatPage';
//
//   @override
//   State<ChatPageWidget> createState() => _ChatPageWidgetState();
// }
//
// class _ChatPageWidgetState extends State<ChatPageWidget> with RouteAware {
//   late ChatPageModel _model;
//   final scaffoldKey = GlobalKey<ScaffoldState>();
//
//   @override
//   void initState() {
//     super.initState();
//     _model = createModel(context, () => ChatPageModel());
//
//     SchedulerBinding.instance.addPostFrameCallback((_) async {
//       _model.apiResultcv6 = await DashboardGroup.getProfileCall.call(
//         authToken: FFAppState().authToken,
//       );
//
//       if (_model.apiResultcv6?.succeeded ?? false) {
//         FFAppState().userName = getJsonField(
//           (_model.apiResultcv6?.jsonBody ?? ''),
//           r'$.data.name',
//         );
//       }
//
//       await Future.delayed(const Duration(milliseconds: 400));
//       safeSetState(() {});
//     });
//
//     _model.textController ??= TextEditingController()
//       ..addListener(() {
//         debugLogWidgetClass(_model);
//       });
//     _model.textFieldFocusNode ??= FocusNode();
//   }
//
//   @override
//   void dispose() {
//     routeObserver.unsubscribe(this);
//     _model.dispose();
//     super.dispose();
//   }
//
//   @override
//   void didUpdateWidget(ChatPageWidget oldWidget) {
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
//   Widget _buildUserAvatar(String? photoUrl) {
//     if (photoUrl == null || photoUrl.isEmpty || photoUrl == 'null') {
//       return Container(
//         width: 34.0,
//         height: 34.0,
//         decoration: BoxDecoration(
//           shape: BoxShape.circle,
//           color: FlutterFlowTheme.of(context).primary,
//         ),
//         child: Icon(
//           Icons.person,
//           color: Colors.white,
//           size: 20.0,
//         ),
//       );
//     }
//
//     return Container(
//       width: 34.0,
//       height: 34.0,
//       clipBehavior: Clip.antiAlias,
//       decoration: const BoxDecoration(
//         shape: BoxShape.circle,
//       ),
//       child: Image.network(
//         photoUrl,
//         fit: BoxFit.cover,
//         errorBuilder: (context, error, stackTrace) {
//           return Container(
//             decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               color: FlutterFlowTheme.of(context).primary,
//             ),
//             child: Icon(
//               Icons.person,
//               color: Colors.white,
//               size: 20.0,
//             ),
//           );
//         },
//       ),
//     );
//   }
//
//   Widget _buildTeamAvatar(String? photoUrl) {
//     if (photoUrl == null || photoUrl.isEmpty || photoUrl == 'null') {
//       return Container(
//         width: 70.0,
//         height: 70.0,
//         decoration: BoxDecoration(
//           shape: BoxShape.circle,
//           color: FlutterFlowTheme.of(context).primary,
//           border: Border.all(color: Colors.white),
//         ),
//         child: Icon(
//           Icons.group,
//           color: Colors.white,
//           size: 35.0,
//         ),
//       );
//     }
//
//     return Container(
//       decoration: BoxDecoration(
//         shape: BoxShape.circle,
//         border: Border.all(color: Colors.white),
//       ),
//       child: Container(
//         width: 70.0,
//         height: 70.0,
//         clipBehavior: Clip.antiAlias,
//         decoration: const BoxDecoration(
//           shape: BoxShape.circle,
//         ),
//         child: Image.network(
//           photoUrl,
//           fit: BoxFit.cover,
//           errorBuilder: (context, error, stackTrace) {
//             return Container(
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 color: FlutterFlowTheme.of(context).primary,
//               ),
//               child: Icon(
//                 Icons.group,
//                 color: Colors.white,
//                 size: 35.0,
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     DebugFlutterFlowModelContext.maybeOf(context)?.parentModelCallback?.call(_model);
//     context.watch<FFAppState>();
//
//     return StreamBuilder<List<TeamsRecord>>(
//       stream: queryTeamsRecord(
//         queryBuilder: (teamsRecord) => teamsRecord.where(
//           'uid',
//           isEqualTo: widget.teamId?.toString(),
//         ),
//         singleRecord: true,
//       ),
//       builder: (context, snapshot) {
//         if (!snapshot.hasData) {
//           return Scaffold(
//             backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
//             body: Center(
//               child: SizedBox(
//                 width: 40.0,
//                 height: 40.0,
//                 child: SpinKitCubeGrid(
//                   color: FlutterFlowTheme.of(context).primary,
//                   size: 40.0,
//                 ),
//               ),
//             ),
//           );
//         }
//
//         List<TeamsRecord> chatPageTeamsRecordList = snapshot.data!;
//         if (snapshot.data!.isEmpty) {
//           return Container();
//         }
//
//         final chatPageTeamsRecord = chatPageTeamsRecordList.isNotEmpty
//             ? chatPageTeamsRecordList.first
//             : null;
//
//         _model.debugBackendQueries['chatPageTeamsRecord_Scaffold_80t7ok22'] =
//             debugSerializeParam(
//               chatPageTeamsRecord,
//               ParamType.Document,
//               link: 'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=ChatPage',
//               name: 'teams',
//               nullable: false,
//             );
//         debugLogWidgetClass(_model);
//
//         return GestureDetector(
//           onTap: () {
//             FocusScope.of(context).unfocus();
//             FocusManager.instance.primaryFocus?.unfocus();
//           },
//           child: Scaffold(
//             key: scaffoldKey,
//             backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
//             body: SafeArea(
//               child: Column(
//                 children: [
//                   // Background
//                   Expanded(
//                     child: Stack(
//                       children: [
//                         // Background Image
//                         Positioned.fill(
//                           child: ClipRRect(
//                             borderRadius: BorderRadius.circular(8.0),
//                             child: Image.asset(
//                               Theme.of(context).brightness == Brightness.dark
//                                   ? 'assets/images/commonBg.png'
//                                   : 'assets/images/plain_whiteBg.png',
//                               width: double.infinity,
//                               height: double.infinity,
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                         ),
//                         // Content
//                         Column(
//                           children: [
//                             // Header
//                             Padding(
//                               padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
//                               child: Column(
//                                 children: [
//                                   Row(
//                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       InkWell(
//                                         splashColor: Colors.transparent,
//                                         focusColor: Colors.transparent,
//                                         hoverColor: Colors.transparent,
//                                         highlightColor: Colors.transparent,
//                                         onTap: () async {
//                                           context.safePop();
//                                         },
//                                         child: Container(
//                                           width: 40.0,
//                                           height: 40.0,
//                                           decoration: BoxDecoration(
//                                             color: FlutterFlowTheme.of(context).backBtnClr,
//                                             boxShadow: const [
//                                               BoxShadow(
//                                                 blurRadius: 4.0,
//                                                 color: Color(0x335D4E4E),
//                                                 offset: Offset(0.0, 2.0),
//                                               )
//                                             ],
//                                             borderRadius: BorderRadius.circular(12.0),
//                                             border: Border.all(
//                                               color: (Theme.of(context).brightness == Brightness.dark)
//                                                   ? Colors.black
//                                                   : const Color(0xD5999999),
//                                             ),
//                                           ),
//                                           child: Icon(
//                                             Icons.arrow_back_rounded,
//                                             color: FlutterFlowTheme.of(context).tertiary,
//                                             size: 24.0,
//                                           ),
//                                         ),
//                                       ),
//                                       Text(
//                                         valueOrDefault<String>(
//                                           widget.teamId?.toString(),
//                                           '0',
//                                         ),
//                                         style: FlutterFlowTheme.of(context).bodyMedium.override(
//                                           font: GoogleFonts.bebasNeue(),
//                                           letterSpacing: 0.0,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                   const SizedBox(height: 20.0),
//                                   Row(
//                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                     children: [
//                                       _buildTeamAvatar(chatPageTeamsRecord?.photoUrl),
//                                       const SizedBox(width: 10.0),
//                                       Expanded(
//                                         child: Column(
//                                           crossAxisAlignment: CrossAxisAlignment.start,
//                                           children: [
//                                             const SizedBox(height: 10.0),
//                                             Text(
//                                               chatPageTeamsRecord?.name ?? '',
//                                               style: FlutterFlowTheme.of(context).titleLarge.override(
//                                                 font: GoogleFonts.poppins(fontWeight: FontWeight.w600),
//                                                 fontSize: 16.0,
//                                                 letterSpacing: 0.0,
//                                               ),
//                                             ),
//                                             Row(
//                                               mainAxisSize: MainAxisSize.min,
//                                               children: [
//                                                 Icon(
//                                                   Icons.groups_2,
//                                                   color: Theme.of(context).brightness == Brightness.dark
//                                                       ? const Color(0xFFC0C0C0)
//                                                       : const Color(0xFF4D4D4D),
//                                                   size: 18.0,
//                                                 ),
//                                                 const SizedBox(width: 3.0),
//                                                 Text(
//                                                   chatPageTeamsRecord?.members.length.toString() ?? '0',
//                                                   style: FlutterFlowTheme.of(context).bodySmall.override(
//                                                     font: GoogleFonts.poppins(),
//                                                     color: FlutterFlowTheme.of(context).tertiary,
//                                                     letterSpacing: 0.0,
//                                                   ),
//                                                 ),
//                                                 const SizedBox(width: 3.0),
//                                                 Text(
//                                                   ' Members',
//                                                   style: FlutterFlowTheme.of(context).bodySmall.override(
//                                                     font: GoogleFonts.poppins(),
//                                                     color: FlutterFlowTheme.of(context).tertiary,
//                                                     letterSpacing: 0.0,
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                   const SizedBox(height: 30.0),
//                                   Container(
//                                     width: double.infinity,
//                                     height: 1.0,
//                                     decoration: const BoxDecoration(
//                                       gradient: LinearGradient(
//                                         colors: [
//                                           Color(0x00FFFFFF),
//                                           Color(0xFF6B4A4A),
//                                           Color(0x00FFFFFF),
//                                           Color(0xFF6B4A4A)
//                                         ],
//                                         stops: [0.0, 0.2, 1.0, 1.0],
//                                         begin: AlignmentDirectional(1.0, 0.0),
//                                         end: AlignmentDirectional(-1.0, 0),
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             // Messages
//                             Expanded(
//                               child: Padding(
//                                 padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
//                                 child: StreamBuilder<List<MessagesRecord>>(
//                                   stream: queryMessagesRecord(
//                                     parent: chatPageTeamsRecord?.reference,
//                                     queryBuilder: (messagesRecord) =>
//                                         messagesRecord.orderBy('createdAt', descending: true),
//                                   ),
//                                   builder: (context, snapshot) {
//                                     if (!snapshot.hasData) {
//                                       return Center(
//                                         child: SizedBox(
//                                           width: 40.0,
//                                           height: 40.0,
//                                           child: SpinKitCubeGrid(
//                                             color: FlutterFlowTheme.of(context).primary,
//                                             size: 40.0,
//                                           ),
//                                         ),
//                                       );
//                                     }
//
//                                     List<MessagesRecord> listViewMessagesRecordList = snapshot.data!;
//
//                                     _model.debugBackendQueries[
//                                     'listViewMessagesRecordList_ListView_2zzbe8ae${listViewMessagesRecordList.length > 100 ? ' (first 100)' : ''}'] =
//                                         debugSerializeParam(
//                                           listViewMessagesRecordList.take(100),
//                                           ParamType.Document,
//                                           isList: true,
//                                           link: 'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=ChatPage',
//                                           name: 'messages',
//                                           nullable: false,
//                                         );
//                                     debugLogWidgetClass(_model);
//
//                                     return ListView.builder(
//                                       reverse: true,
//                                       padding: EdgeInsets.zero,
//                                       itemCount: listViewMessagesRecordList.length,
//                                       itemBuilder: (context, listViewIndex) {
//                                         final listViewMessagesRecord = listViewMessagesRecordList[listViewIndex];
//                                         final isCurrentUser = listViewMessagesRecord.senderId ==
//                                             getJsonField(
//                                               (_model.apiResultcv6?.jsonBody ?? ''),
//                                               r'$.data.id',
//                                             ).toString();
//
//                                         return Padding(
//                                           padding: const EdgeInsets.only(bottom: 20.0),
//                                           child: Row(
//                                             mainAxisAlignment: isCurrentUser
//                                                 ? MainAxisAlignment.end
//                                                 : MainAxisAlignment.start,
//                                             crossAxisAlignment: CrossAxisAlignment.start,
//                                             children: [
//                                               if (!isCurrentUser) ...[
//                                                 _buildUserAvatar(null),
//                                                 const SizedBox(width: 8.0),
//                                               ],
//                                               Flexible(
//                                                 child: Container(
//                                                   constraints: BoxConstraints(
//                                                     maxWidth: MediaQuery.of(context).size.width * 0.7,
//                                                   ),
//                                                   decoration: BoxDecoration(
//                                                     color: isCurrentUser
//                                                         ? const Color(0xFFDF7D35)
//                                                         : (Theme.of(context).brightness == Brightness.dark
//                                                         ? const Color(0xFF1C1C22)
//                                                         : const Color(0xFFEAEAEA)),
//                                                     borderRadius: BorderRadius.only(
//                                                       bottomLeft: const Radius.circular(15.0),
//                                                       bottomRight: const Radius.circular(15.0),
//                                                       topLeft: Radius.circular(isCurrentUser ? 15.0 : 0.0),
//                                                       topRight: Radius.circular(isCurrentUser ? 0.0 : 15.0),
//                                                     ),
//                                                     border: Border.all(
//                                                       color: Theme.of(context).brightness == Brightness.dark
//                                                           ? const Color(0x34FFFFFF)
//                                                           : const Color(0x00000000),
//                                                     ),
//                                                   ),
//                                                   child: Padding(
//                                                     padding: const EdgeInsets.all(10.0),
//                                                     child: Column(
//                                                       crossAxisAlignment: CrossAxisAlignment.start,
//                                                       children: [
//                                                         Text(
//                                                           listViewMessagesRecord.senderName,
//                                                           style: FlutterFlowTheme.of(context).labelMedium.override(
//                                                             font: GoogleFonts.poppins(),
//                                                             color: isCurrentUser
//                                                                 ? Colors.white
//                                                                 : FlutterFlowTheme.of(context).tertiary,
//                                                             letterSpacing: 0.0,
//                                                           ),
//                                                         ),
//                                                         const SizedBox(height: 3.0),
//                                                         Text(
//                                                           listViewMessagesRecord.text,
//                                                           style: FlutterFlowTheme.of(context).labelMedium.override(
//                                                             font: GoogleFonts.poppins(),
//                                                             color: isCurrentUser
//                                                                 ? Colors.white
//                                                                 : FlutterFlowTheme.of(context).tertiary,
//                                                             fontSize: 12.0,
//                                                             letterSpacing: 0.0,
//                                                           ),
//                                                         ),
//                                                       ],
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ),
//                                               if (isCurrentUser) ...[
//                                                 const SizedBox(width: 8.0),
//                                                 _buildUserAvatar(null),
//                                               ],
//                                             ],
//                                           ),
//                                         );
//                                       },
//                                     );
//                                   },
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                   // Input Bar
//                   Container(
//                     width: double.infinity,
//                     padding: EdgeInsets.only(
//                       left: 15.0,
//                       right: 16.0,
//                       top: 8.0,
//                       bottom: MediaQuery.of(context).viewInsets.bottom + 8.0,
//                     ),
//                     decoration: BoxDecoration(
//                       color: Theme.of(context).brightness == Brightness.dark
//                           ? const Color(0xFF282828)
//                           : const Color(0xFFE6E6E6),
//                     ),
//                     child: Row(
//                       children: [
//                         Expanded(
//                           child: TextFormField(
//                             controller: _model.textController,
//                             focusNode: _model.textFieldFocusNode,
//                             autofocus: false,
//                             obscureText: false,
//                             decoration: InputDecoration(
//                               isDense: true,
//                               hintText: 'Type here...',
//                               hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
//                                 font: GoogleFonts.poppins(),
//                                 color: const Color(0xFF9E9E9E),
//                                 letterSpacing: 0.0,
//                               ),
//                               enabledBorder: OutlineInputBorder(
//                                 borderSide: const BorderSide(
//                                   color: Color(0x00000000),
//                                   width: 1.0,
//                                 ),
//                                 borderRadius: BorderRadius.circular(8.0),
//                               ),
//                               focusedBorder: OutlineInputBorder(
//                                 borderSide: const BorderSide(
//                                   color: Color(0x00000000),
//                                   width: 1.0,
//                                 ),
//                                 borderRadius: BorderRadius.circular(8.0),
//                               ),
//                               errorBorder: OutlineInputBorder(
//                                 borderSide: BorderSide(
//                                   color: FlutterFlowTheme.of(context).error,
//                                   width: 1.0,
//                                 ),
//                                 borderRadius: BorderRadius.circular(8.0),
//                               ),
//                               focusedErrorBorder: OutlineInputBorder(
//                                 borderSide: BorderSide(
//                                   color: FlutterFlowTheme.of(context).error,
//                                   width: 1.0,
//                                 ),
//                                 borderRadius: BorderRadius.circular(8.0),
//                               ),
//                               filled: true,
//                               fillColor: FlutterFlowTheme.of(context).secondaryBackground,
//                             ),
//                             style: FlutterFlowTheme.of(context).bodyMedium.override(
//                               font: GoogleFonts.poppins(),
//                               letterSpacing: 0.0,
//                             ),
//                             cursorColor: FlutterFlowTheme.of(context).primaryText,
//                             validator: _model.textControllerValidator.asValidator(context),
//                           ),
//                         ),
//                         const SizedBox(width: 8.0),
//                         InkWell(
//                           splashColor: Colors.transparent,
//                           focusColor: Colors.transparent,
//                           hoverColor: Colors.transparent,
//                           highlightColor: Colors.transparent,
//                           onTap: () async {
//                             final messageText = _model.textController.text.trim();
//                             if (messageText.isNotEmpty) {
//                               final senderId = getJsonField(
//                                 (_model.apiResultcv6?.jsonBody ?? ''),
//                                 r'$.data.id',
//                               ).toString();
//                               final senderName = FFAppState().userName ?? 'Unknown';
//
//                               // Clear input immediately
//                               safeSetState(() {
//                                 _model.textController?.clear();
//                               });
//
//                               // Send message
//                               await MessagesRecord.createDoc(chatPageTeamsRecord!.reference).set({
//                                 ...createMessagesRecordData(
//                                   text: messageText,
//                                   senderName: senderName,
//                                   senderId: senderId,
//                                 ),
//                                 ...mapToFirestore({
//                                   'createdAt': FieldValue.serverTimestamp(),
//                                 }),
//                               });
//
//                               // Send notification
//                               final response = await TeamMemberChatNotificationCall().call(
//                                 teamId: widget.teamId!,
//                                 senderId: int.parse(senderId),
//                                 authToken: FFAppState().authToken,
//                               );
//
//                               if (response.succeeded) {
//                                 print('TeamMemberChatNotificationCall succeeded: ${response.statusCode}');
//                               } else {
//                                 print('TeamMemberChatNotificationCall failed: ${response.statusCode}');
//                               }
//                             }
//                           },
//                           child: Container(
//                             width: 40.0,
//                             height: 40.0,
//                             decoration: const BoxDecoration(
//                               color: Color(0xFFEB6027),
//                               shape: BoxShape.circle,
//                             ),
//                             child: Transform.rotate(
//                               angle: 322.0 * (math.pi / 180),
//                               child: const Icon(
//                                 Icons.send,
//                                 color: Colors.white,
//                                 size: 18.0,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }




///4  perfect version
///
///
///
/// 1
library;

import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'chat_page_model.dart';
export 'chat_page_model.dart';

class ChatPageWidget extends StatefulWidget {
  const ChatPageWidget({
    super.key,
    this.teamId,
  });

  final int? teamId;

  static String routeName = 'ChatPage';
  static String routePath = '/chatPage';

  @override
  State<ChatPageWidget> createState() => _ChatPageWidgetState();
}

class _ChatPageWidgetState extends State<ChatPageWidget> with RouteAware {
  late ChatPageModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatPageModel());

    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.apiResultcv6 = await DashboardGroup.getProfileCall.call(
        authToken: FFAppState().authToken,
      );

      if (_model.apiResultcv6?.succeeded ?? false) {
        FFAppState().userName = getJsonField(
          (_model.apiResultcv6?.jsonBody ?? ''),
          r'$.data.name',
        );
      }

      await Future.delayed(const Duration(milliseconds: 400));
      safeSetState(() {});
    });

  //   _model.textController ??= TextEditController()
  //     ..addListener(() {
  //       debugLogWidgetClass(_model);
  //     });
  //   _model.textFieldFocusNode ??= FocusNode();
  // }


    _model.textController ??= TextEditingController()
      ..addListener(() {
        debugLogWidgetClass(_model);
      });
    _model.textFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    _model.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(ChatPageWidget oldWidget) {
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

  Widget _buildUserAvatar(String? photoUrl) {
    if (photoUrl == null || photoUrl.isEmpty || photoUrl == 'null') {
      return Container(
        width: 34.0,
        height: 34.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: FlutterFlowTheme.of(context).primary,
        ),
        child: const Icon(
          Icons.person,
          color: Colors.white,
          size: 20.0,
        ),
      );
    }

    return Container(
      width: 34.0,
      height: 34.0,
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: Image.network(
        photoUrl,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: FlutterFlowTheme.of(context).primary,
            ),
            child: const Icon(
              Icons.person,
              color: Colors.white,
              size: 20.0,
            ),
          );
        },
      ),
    );
  }

  Widget _buildTeamAvatar(String? photoUrl) {
    if (photoUrl == null || photoUrl.isEmpty || photoUrl == 'null') {
      return Container(
        width: 70.0,
        height: 70.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: FlutterFlowTheme.of(context).primary,
          border: Border.all(color: Colors.white),
        ),
        child: const Icon(
          Icons.group,
          color: Colors.white,
          size: 35.0,
        ),
      );
    }

    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white),
      ),
      child: Container(
        width: 70.0,
        height: 70.0,
        clipBehavior: Clip.antiAlias,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: Image.network(
          photoUrl,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: FlutterFlowTheme.of(context).primary,
              ),
              child: const Icon(
                Icons.group,
                color: Colors.white,
                size: 35.0,
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    DebugFlutterFlowModelContext.maybeOf(context)?.parentModelCallback?.call(_model);
    context.watch<FFAppState>();

    return StreamBuilder<List<TeamsRecord>>(
      stream: queryTeamsRecord(
        queryBuilder: (teams) => teams
            .where('uid', isEqualTo: widget.teamId.toString()),
        singleRecord: true,
      ),

        builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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

        List<TeamsRecord> chatPageTeamsRecordList = snapshot.data!;
        if (snapshot.data!.isEmpty) {
          return Container();
        }

        final chatPageTeamsRecord = chatPageTeamsRecordList.isNotEmpty
            ? chatPageTeamsRecordList.first
            : null;

        _model.debugBackendQueries['chatPageTeamsRecord_Scaffold_80t7ok22'] =
            debugSerializeParam(
              chatPageTeamsRecord,
              ParamType.Document,
              link: 'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=ChatPage',
              name: 'teams',
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
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: SafeArea(
              child: Column(
                children: [
                  Expanded(
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: ClipRRect(
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
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                            color: FlutterFlowTheme.of(context).backBtnClr,
                                            boxShadow: const [
                                              BoxShadow(
                                                blurRadius: 4.0,
                                                color: Color(0x335D4E4E),
                                                offset: Offset(0.0, 2.0),
                                              )
                                            ],
                                            borderRadius: BorderRadius.circular(12.0),
                                            border: Border.all(
                                              color: (Theme.of(context).brightness == Brightness.dark)
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
                                      // Text(
                                      //   valueOrDefault<String>(
                                      //     widget.teamId?.toString(),
                                      //     '0',
                                      //   ),
                                      //   style: FlutterFlowTheme.of(context).bodyMedium.override(
                                      //     font: GoogleFonts.bebasNeue(),
                                      //     letterSpacing: 0.0,
                                      //   ),
                                      // ),
                                    ],
                                  ),
                                  const SizedBox(height: 20.0),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      _buildTeamAvatar(chatPageTeamsRecord?.photoUrl),
                                      const SizedBox(width: 10.0),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            const SizedBox(height: 10.0),
                                            Text(
                                              chatPageTeamsRecord?.name ?? '',
                                              style: FlutterFlowTheme.of(context).titleLarge.override(
                                                font: GoogleFonts.poppins(fontWeight: FontWeight.w600),
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                              ),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Icon(
                                                  Icons.groups_2,
                                                  color: Theme.of(context).brightness == Brightness.dark
                                                      ? const Color(0xFFC0C0C0)
                                                      : const Color(0xFF4D4D4D),
                                                  size: 18.0,
                                                ),
                                                const SizedBox(width: 3.0),
                                                Text(
                                                  chatPageTeamsRecord?.members.length.toString() ?? '0',
                                                  style: FlutterFlowTheme.of(context).bodySmall.override(
                                                    font: GoogleFonts.poppins(),
                                                    color: FlutterFlowTheme.of(context).tertiary,
                                                    letterSpacing: 0.0,
                                                  ),
                                                ),
                                                const SizedBox(width: 3.0),
                                                Text(
                                                  ' Members',
                                                  style: FlutterFlowTheme.of(context).bodySmall.override(
                                                    font: GoogleFonts.poppins(),
                                                    color: FlutterFlowTheme.of(context).tertiary,
                                                    letterSpacing: 0.0,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 20.0),
                                  Container(
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
                                        stops: [0.0, 0.2, 1.0, 1.0],
                                        begin: AlignmentDirectional(1.0, 0.0),
                                        end: AlignmentDirectional(-1.0, 0),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: StreamBuilder<List<MessagesRecord>>(
                                  stream: queryMessagesRecord(
                                    parent: chatPageTeamsRecord?.reference,
                                    queryBuilder: (messagesRecord) =>
                                        messagesRecord.orderBy('createdAt', descending: true),
                                  ),
                                  builder: (context, snapshot) {
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

                                    List<MessagesRecord> listViewMessagesRecordList = snapshot.data!;

                                    _model.debugBackendQueries[
                                    'listViewMessagesRecordList_ListView_2zzbe8ae${listViewMessagesRecordList.length > 100 ? ' (first 100)' : ''}'] =
                                        debugSerializeParam(
                                          listViewMessagesRecordList.take(100),
                                          ParamType.Document,
                                          isList: true,
                                          link: 'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=ChatPage',
                                          name: 'messages',
                                          nullable: false,
                                        );
                                    debugLogWidgetClass(_model);

                                    return ListView.builder(
                                      reverse: true,
                                      padding: EdgeInsets.zero,
                                      itemCount: listViewMessagesRecordList.length,
                                      itemBuilder: (context, listViewIndex) {
                                        final listViewMessagesRecord = listViewMessagesRecordList[listViewIndex];
                                        final isCurrentUser = listViewMessagesRecord.senderId ==
                                            getJsonField(
                                              (_model.apiResultcv6?.jsonBody ?? ''),
                                              r'$.data.id',
                                            ).toString();

                                        return Padding(
                                          padding: const EdgeInsets.only(bottom: 16.0),
                                          child: Row(
                                            mainAxisAlignment: isCurrentUser
                                                ? MainAxisAlignment.end
                                                : MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              if (!isCurrentUser) ...[
                                                _buildUserAvatar(listViewMessagesRecord.photoUrl),
                                                const SizedBox(width: 8.0),
                                              ],
                                              Flexible(
                                                child: Container(
                                                  constraints: BoxConstraints(
                                                    maxWidth: MediaQuery.of(context).size.width * 0.7,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color: isCurrentUser
                                                        ? const Color(0xFFDF7D35)
                                                        : (Theme.of(context).brightness == Brightness.dark
                                                        ? const Color(0xFF1C1C22)
                                                        : const Color(0xFFEAEAEA)),
                                                    borderRadius: BorderRadius.only(
                                                      bottomLeft: const Radius.circular(15.0),
                                                      bottomRight: const Radius.circular(15.0),
                                                      topLeft: Radius.circular(isCurrentUser ? 15.0 : 0.0),
                                                      topRight: Radius.circular(isCurrentUser ? 0.0 : 15.0),
                                                    ),
                                                    border: Border.all(
                                                      color: Theme.of(context).brightness == Brightness.dark
                                                          ? const Color(0x34FFFFFF)
                                                          : const Color(0x00000000),
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(10.0),
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisSize: MainAxisSize.min,
                                                      children: [
                                                        Text(
                                                          listViewMessagesRecord.senderName,
                                                          style: FlutterFlowTheme.of(context).labelMedium.override(
                                                            font: GoogleFonts.poppins(),
                                                            color: isCurrentUser
                                                                ? Colors.white
                                                                : FlutterFlowTheme.of(context).tertiary,
                                                            letterSpacing: 0.0,
                                                          ),
                                                        ),
                                                        const SizedBox(height: 3.0),
                                                        Text(
                                                          listViewMessagesRecord.text,
                                                          style: FlutterFlowTheme.of(context).labelMedium.override(
                                                            font: GoogleFonts.poppins(),
                                                            color: isCurrentUser
                                                                ? Colors.white
                                                                : FlutterFlowTheme.of(context).tertiary,
                                                            fontSize: 12.0,
                                                            letterSpacing: 0.0,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              if (isCurrentUser) ...[
                                                const SizedBox(width: 8.0),
                                                _buildUserAvatar(listViewMessagesRecord.photoUrl),
                                              ],
                                            ],
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
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 80,

                    decoration: BoxDecoration(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? const Color(0xFF282828)
                          : const Color(0xFFE6E6E6),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: _model.textController,
                              focusNode: _model.textFieldFocusNode,
                              autofocus: false,
                              obscureText: false,
                              decoration: InputDecoration(
                                isDense: true,
                                contentPadding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
                                hintText: 'Type here...',
                                hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                  font: GoogleFonts.poppins(),
                                  color: const Color(0xFF9E9E9E),
                                  letterSpacing: 0.0,
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
                                fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                              ),
                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                font: GoogleFonts.poppins(),
                                letterSpacing: 0.0,
                              ),
                              maxLines: null,
                              cursorColor: FlutterFlowTheme.of(context).primaryText,
                              validator: _model.textControllerValidator.asValidator(context),
                            ),
                          ),
                          const SizedBox(width: 8.0),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              final messageText = _model.textController.text.trim();
                              if (messageText.isNotEmpty) {
                                final senderId = getJsonField(
                                  (_model.apiResultcv6?.jsonBody ?? ''),
                                  r'$.data.id',
                                ).toString();
                                final senderName = FFAppState().userName ?? 'Unknown';
                                final senderPhoto = getJsonField(
                                  (_model.apiResultcv6?.jsonBody ?? ''),
                                  r'$.data.image',
                                )?.toString();

                                safeSetState(() {
                                  _model.textController?.clear();
                                });

                                await MessagesRecord.createDoc(chatPageTeamsRecord!.reference).set({
                                  ...createMessagesRecordData(
                                    text: messageText,
                                    senderName: senderName,
                                    senderId: senderId,
                                    photoUrl: senderPhoto,
                                  ),
                                  ...mapToFirestore({
                                    'createdAt': FieldValue.serverTimestamp(),
                                  }),
                                });

                                final response = await TeamMemberChatNotificationCall().call(
                                  teamId: widget.teamId!,
                                  senderId: int.parse(senderId),
                                  authToken: FFAppState().authToken,
                                );

                                print('Notification sent: ${response.statusCode}');
                              }
                            },
                            child: Container(
                              width: 40.0,
                              height: 40.0,
                              decoration: const BoxDecoration(
                                color: Color(0xFFEB6027),
                                shape: BoxShape.circle,
                              ),
                              child: Transform.rotate(
                                angle: 322.0 * (math.pi / 180),
                                child: const Icon(
                                  Icons.send,
                                  color: Colors.white,
                                  size: 18.0,
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
  }
}





///2