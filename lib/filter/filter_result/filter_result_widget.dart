// import '/flutter_flow/flutter_flow_theme.dart';
// import '/flutter_flow/flutter_flow_util.dart';
// import '/flutter_flow/flutter_flow_widgets.dart';
// import '/custom_code/widgets/index.dart' as custom_widgets;
// import 'dart:ui';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:provider/provider.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import '../../backend/api_requests/api_manager.dart';
// import '/backend/api_requests/api_calls.dart';
// import 'package:go_router/go_router.dart';
//
// class FilteredResultsWidget extends StatefulWidget {
//   const FilteredResultsWidget({
//     super.key,
//     this.initialFilteredPlayers,
//     this.filterType,
//   });
//
//   static String routeName = 'FilteredResults';
//   static String routePath = '/filteredResults';
//
//   final List<dynamic>? initialFilteredPlayers;
//   final String? filterType;
//
//   @override
//   State<FilteredResultsWidget> createState() => _FilteredResultsWidgetState();
// }
//
// class _FilteredResultsWidgetState extends State<FilteredResultsWidget> {
//   final scaffoldKey = GlobalKey<ScaffoldState>();
//   bool isLoading = false;
//   List<dynamic> _players = [];
//   String? _filterType;
//   bool _argsParsed = false;
//   Map<String, dynamic>? _filtersPayload; // new
//   bool _triggeredFetch = false; // guard to avoid duplicate fetch
//   String? _selectedFilterText;
//
//
//   @override
//   void initState() {
//     super.initState();
//     _players = widget.initialFilteredPlayers ?? [];
//     _filterType = widget.filterType;
//   }
//
//   // @override
//   // void didChangeDependencies() {
//   //   super.didChangeDependencies();
//   //   if (!_argsParsed) {
//   //     // Try GoRouter extra first (FlutterFlow pushNamed passes extra here)
//   //     try {
//   //       final state = GoRouterState.of(context);
//   //       final extra = state.extra;
//   //       if (extra is Map) {
//   //
//   //
//   //
//   //         if (extra is Map) {
//   //           // ...existing code...
//   //           if (extra['selectedFilterText'] is String) {
//   //             _selectedFilterText = extra['selectedFilterText'] as String;
//   //           }
//   //         }
//   //
//   //         if (extra['filterType'] is String) {
//   //           _filterType = extra['filterType'] as String;
//   //         }
//   //         if (extra['filtersPayload'] is Map) {
//   //           _filtersPayload = Map<String, dynamic>.from(extra['filtersPayload'] as Map);
//   //         }
//   //         if (extra['filteredPlayers'] is List && _players.isEmpty) {
//   //           _players = List<dynamic>.from(extra['filteredPlayers'] as List);
//   //         }
//   //       }
//   //     } catch (_) {
//   //       // ignore – will fallback to ModalRoute / FFAppState
//   //     }
//   //
//   //     if (_filtersPayload == null) {
//   //       // Fallback to ModalRoute arguments (older navigation style)
//   //       final args = ModalRoute.of(context)?.settings.arguments;
//   //       if (args is Map) {
//   //         if (_filterType == null && args['filterType'] is String) {
//   //           _filterType = args['filterType'] as String;
//   //         }
//   //         if (_filtersPayload == null && args['filtersPayload'] is Map) {
//   //           _filtersPayload = Map<String, dynamic>.from(args['filtersPayload'] as Map);
//   //         } else if (args['filteredPlayers'] is List && _players.isEmpty) {
//   //           _players = List<dynamic>.from(args['filteredPlayers']);
//   //         }
//   //       }
//   //     }
//   //
//   //     // Final fallback: parse from global app state if present
//   //     if (_filtersPayload == null && FFAppState().lastFilterPayloadJson.isNotEmpty) {
//   //       try {
//   //         final decoded = json.decode(FFAppState().lastFilterPayloadJson);
//   //         if (decoded is Map<String, dynamic>) {
//   //           _filtersPayload = decoded;
//   //         }
//   //         if (_filterType == null || _filterType!.isEmpty) {
//   //           _filterType = FFAppState().lastFilterType.isNotEmpty ? FFAppState().lastFilterType : null;
//   //         }
//   //       } catch (e) {
//   //         debugPrint('Failed to decode fallback filter payload: $e');
//   //       }
//   //     }
//   //
//   //     _argsParsed = true;
//   //     if (_filtersPayload != null && _players.isEmpty) {
//   //       _fetchFilteredPlayers();
//   //     } else {
//   //       setState(() {});
//   //     }
//   //   }
//   // }
//
//
//
//
//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     if (!_argsParsed) {
//       // Try GoRouter extra first (FlutterFlow pushNamed passes extra here)
//       try {
//         final state = GoRouterState.of(context);
//         final extra = state.extra;
//         if (extra is Map) {
//           if (extra['filterType'] is String) {
//             _filterType = extra['filterType'] as String;
//           }
//           if (extra['filtersPayload'] is Map) {
//             _filtersPayload = Map<String, dynamic>.from(extra['filtersPayload'] as Map);
//             // Extract selected filter text from the payload
//             _extractSelectedFilterText();
//           }
//           if (extra['filteredPlayers'] is List && _players.isEmpty) {
//             _players = List<dynamic>.from(extra['filteredPlayers'] as List);
//           }
//         }
//       } catch (_) {
//         // ignore – will fallback to ModalRoute / FFAppState
//       }
//
//       if (_filtersPayload == null) {
//         // Fallback to ModalRoute arguments (older navigation style)
//         final args = ModalRoute.of(context)?.settings.arguments;
//         if (args is Map) {
//           if (_filterType == null && args['filterType'] is String) {
//             _filterType = args['filterType'] as String;
//           }
//           if (_filtersPayload == null && args['filtersPayload'] is Map) {
//             _filtersPayload = Map<String, dynamic>.from(args['filtersPayload'] as Map);
//             _extractSelectedFilterText();
//           } else if (args['filteredPlayers'] is List && _players.isEmpty) {
//             _players = List<dynamic>.from(args['filteredPlayers']);
//           }
//         }
//       }
//
//       // Final fallback: parse from global app state if present
//       if (_filtersPayload == null && FFAppState().lastFilterPayloadJson.isNotEmpty) {
//         try {
//           final decoded = json.decode(FFAppState().lastFilterPayloadJson);
//           if (decoded is Map<String, dynamic>) {
//             _filtersPayload = decoded;
//             _extractSelectedFilterText();
//           }
//           if (_filterType == null || _filterType!.isEmpty) {
//             _filterType = FFAppState().lastFilterType.isNotEmpty ? FFAppState().lastFilterType : null;
//           }
//         } catch (e) {
//           debugPrint('Failed to decode fallback filter payload: $e');
//         }
//       }
//
//       _argsParsed = true;
//       if (_filtersPayload != null && _players.isEmpty) {
//         _fetchFilteredPlayers();
//       } else {
//         setState(() {});
//       }
//     }
//   }
//
//   void _extractSelectedFilterText() {
//     if (_filtersPayload == null || _filterType == null) return;
//
//     final filters = _filtersPayload!['filters'];
//     if (filters is Map) {
//       switch (_filterType) {
//         case 'stats_categories':
//           final statsCategories = filters['stats_categories'];
//           if (statsCategories is List && statsCategories.isNotEmpty) {
//             final firstStat = statsCategories[0];
//             if (firstStat is Map && firstStat['stat_type'] != null) {
//               _selectedFilterText = firstStat['stat_type'].toString();
//             }
//           }
//           break;
//         case 'titles':
//         case 'achievements':
//         case 'personal_awards':
//         case 'other_greatness_facts':
//         case 'combine_filters':
//           final filterValue = filters[_filterType];
//           if (filterValue is String) {
//             _selectedFilterText = filterValue;
//           }
//           break;
//       }
//     }
//   }
//
//
//
//
//   Future<void> _fetchFilteredPlayers() async {
//     if (_triggeredFetch) return; // prevent double call
//     _triggeredFetch = true;
//     setState(() => isLoading = true);
//     try {
//       final payload = _filtersPayload ?? {};
//       debugPrint('Result screen fetching players with payload: ' + const JsonEncoder.withIndent('  ').convert(payload));
//       final resp = await ApiManager.instance.makeApiCall(
//         callName: 'filterplayersDynamic',
//         apiUrl: 'https://votethegoat.ezxdemo.com/api/filter-players',
//         callType: ApiCallType.POST,
//         headers: {
//           if (FFAppState().authToken.isNotEmpty)
//             'Authorization': 'Bearer ${FFAppState().authToken}'
//         },
//         params: {},
//         body: json.encode(payload),
//         bodyType: BodyType.JSON,
//         returnBody: true,
//       );
//       debugPrint('Results API response success=${resp.succeeded} body=${resp.bodyText}');
//       if (resp.succeeded) {
//         final data = resp.jsonBody['data'];
//         if (data is List) {
//           _players = data;
//         } else {
//           _players = [];
//         }
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('Failed to load filtered players.')),
//         );
//       }
//     } catch (e) {
//       debugPrint('Error fetching filtered players: $e');
//       if (mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('Error: ${e.toString()}')),
//         );
//       }
//     } finally {
//       if (mounted) setState(() => isLoading = false);
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         FocusScope.of(context).unfocus();
//         FocusManager.instance.primaryFocus?.unfocus();
//       },
//       child: Scaffold(
//         key: scaffoldKey,
//         backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
//         body: Stack(
//           children: [
//             ClipRRect(
//               borderRadius: BorderRadius.circular(8.0),
//               child: Image.asset(
//                 Theme.of(context).brightness == Brightness.dark
//                     ? 'assets/images/commonBg.png'
//                     : 'assets/images/plain_whiteBg.png',
//                 width: double.infinity,
//                 height: double.infinity,
//                 fit: BoxFit.fill,
//               ),
//             ),
//             Align(
//               alignment: const AlignmentDirectional(0.0, 0.0),
//               child: Padding(
//                 padding: const EdgeInsetsDirectional.fromSTEB(16.0, 40.0, 16.0, 0.0),
//                 child: Column(
//                   mainAxisSize: MainAxisSize.max,
//                   children: [
//                     Row(
//                       mainAxisSize: MainAxisSize.max,
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         InkWell(
//                           splashColor: Colors.transparent,
//                           focusColor: Colors.transparent,
//                           hoverColor: Colors.transparent,
//                           highlightColor: Colors.transparent,
//                           onTap: () async {
//                             context.safePop();
//                           },
//                           child: Container(
//                             width: 40.0,
//                             height: 40.0,
//                             decoration: BoxDecoration(
//                               color: FlutterFlowTheme.of(context).backBtnClr,
//                               boxShadow: const [
//                                 BoxShadow(
//                                   blurRadius: 4.0,
//                                   color: Color(0x335D4E4E),
//                                   offset: Offset(
//                                     0.0,
//                                     2.0,
//                                   ),
//                                 )
//                               ],
//                               borderRadius: BorderRadius.circular(12.0),
//                               border: Border.all(
//                                 color: (Theme.of(context).brightness ==
//                                     Brightness.dark) ==
//                                     true
//                                     ? Colors.black
//                                     : const Color(0xD5999999),
//                               ),
//                             ),
//                             child: Icon(
//                               Icons.arrow_back_rounded,
//                               color: FlutterFlowTheme.of(context).tertiary,
//                               size: 24.0,
//                             ),
//                           ),
//                         ),
//                         SingleChildScrollView(
//                           child: Column(
//                             mainAxisSize: MainAxisSize.max,
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Container(width: MediaQuery.sizeOf(context).width*0.7, // Spacer to balance the lay
//                                 child: Text
//                                   (maxLines: 3,
//                                   textAlign: TextAlign.center,
//                                   overflow: TextOverflow.ellipsis,
//
//                                                           _filterType!.toUpperCase().replaceAll('_', ' '),
//                                   style: FlutterFlowTheme.of(context)
//                                       .customTextStyle1
//                                       .override(
//                                     fontFamily: 'good times',
//                                     color:
//                                     FlutterFlowTheme.of(context).tertiary,
//                                     fontSize: 24.0,
//                                     letterSpacing: 0.0,
//                                     fontWeight: FontWeight.normal,
//                                   ),
//                                 ),
//                               ),
//                               // Text(
//                               //   'RESULTS',
//                               //   style: FlutterFlowTheme.of(context)
//                               //       .customTextStyle1
//                               //       .override(
//                               //     fontFamily: 'good times',
//                               //     color: Color(0xFFEB6027),
//                               //     fontSize: 24.0,
//                               //     letterSpacing: 0.0,
//                               //     fontWeight: FontWeight.normal,
//                               //   ),
//                               // ),
//                             ],
//                           ),
//                         ),
//                         Container(width: 40.0), // Spacer to balance the layout
//                       ],
//                     ),
//                     if (_filterType != null)
//                       Padding(
//                         padding:
//                         const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 8.0),
//                         child: Text(
//                             //   () {
//                             // final filterType = _filterType!;
//                             // // Remove prefixes like "Title:", "Achievement:", etc.
//                             // if (filterType.contains(':')) {
//                             //   return filterType.split(':').last.trim();
//                             // }
//                             // return filterType;
//                           // }().toUpperCase(),
//                           _selectedFilterText ?? '',
//                           textAlign: TextAlign.center,
//                           style: FlutterFlowTheme.of(context).titleMedium.override(
//                             fontFamily: 'good times',
//                             color: FlutterFlowTheme.of(context).peach,
//                             fontSize: 24.0,
//                             fontWeight: FontWeight.w400,
//                             fontStyle: FontStyle.normal,
//                             // height: 1.25, // 30px / 24px = 1.25
//                             letterSpacing: 0.0,
//                           ),
//                         ),
//                       ),
//                     // Padding(
//                     //   padding:
//                     //       EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
//                     //   child: Text(
//                     //     'Found ${widget.filteredPlayers.length} players',
//                     //     style:
//                     //         FlutterFlowTheme.of(context).titleMedium.override(
//                     //               font: GoogleFonts.poppins(),
//                     //               letterSpacing: 0.0,
//                     //             ),
//                     //   ),
//                     // ),
//                     Padding(
//                       padding:
//                       const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
//                       child: Row(
//                         mainAxisSize: MainAxisSize.max,
//                         children: [
//                           Expanded(
//                             child: Container(
//                               width: double.infinity,
//                               decoration: BoxDecoration(
//                                 color: (Theme.of(context).brightness ==
//                                     Brightness.dark) ==
//                                     true
//                                     ? Colors.white
//                                     : Colors.black,
//                               ),
//                               child: Padding(
//                                 padding: const EdgeInsetsDirectional.fromSTEB(
//                                     10.0, 7.0, 10.0, 7.0),
//                                 child: Row(
//                                   mainAxisSize: MainAxisSize.max,
//                                   mainAxisAlignment:
//                                   MainAxisAlignment.spaceEvenly,
//                                   children: [
//                                     Text(
//                                       'Rank',
//                                       style: FlutterFlowTheme.of(context)
//                                           .bodyMedium
//                                           .override(
//                                         font: GoogleFonts.baloo2(
//                                           fontWeight: FontWeight.w800,
//                                           fontStyle:
//                                           FlutterFlowTheme.of(context)
//                                               .bodyMedium
//                                               .fontStyle,
//                                         ),
//                                         color: FlutterFlowTheme.of(context)
//                                             .oposite,
//                                         fontSize: 16.0,
//                                         letterSpacing: 0.0,
//                                         fontWeight: FontWeight.w800,
//                                         fontStyle:
//                                         FlutterFlowTheme.of(context)
//                                             .bodyMedium
//                                             .fontStyle,
//                                       ),
//                                     ),
//                                     Expanded(
//                                       flex: 3,
//                                       child: Padding(
//                                         padding: const EdgeInsetsDirectional.fromSTEB(
//                                             40.0, 0.0, 0.0, 0.0),
//                                         child: Row(
//                                           mainAxisSize: MainAxisSize.min,
//                                           children: [
//                                             Text(
//                                               'Player',
//                                               style: FlutterFlowTheme.of(context)
//                                                   .bodyMedium
//                                                   .override(
//                                                 font: GoogleFonts.baloo2(
//                                                   fontWeight: FontWeight.w800,
//                                                   fontStyle:
//                                                   FlutterFlowTheme.of(
//                                                       context)
//                                                       .bodyMedium
//                                                       .fontStyle,
//                                                 ),
//                                                 color: FlutterFlowTheme.of(
//                                                     context)
//                                                     .oposite,
//                                                 fontSize: 16.0,
//                                                 letterSpacing: 0.0,
//                                                 fontWeight: FontWeight.w800,
//                                                 fontStyle:
//                                                 FlutterFlowTheme.of(
//                                                     context)
//                                                     .bodyMedium
//                                                     .fontStyle,
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     ),
//                                     Expanded(
//                                       flex: 1,
//                                       child: Row(
//                                         mainAxisSize: MainAxisSize.max,
//                                         mainAxisAlignment: MainAxisAlignment.end,
//                                         children: [
//                                           Text(
//                                             'Value',
//                                             style: FlutterFlowTheme.of(context)
//                                                 .bodyMedium
//                                                 .override(
//                                               font: GoogleFonts.baloo2(
//                                                 fontWeight: FontWeight.w800,
//                                                 fontStyle:
//                                                 FlutterFlowTheme.of(
//                                                     context)
//                                                     .bodyMedium
//                                                     .fontStyle,
//                                               ),
//                                               color: FlutterFlowTheme.of(
//                                                   context)
//                                                   .oposite,
//                                               fontSize: 16.0,
//                                               letterSpacing: 0.0,
//                                               fontWeight: FontWeight.w800,
//                                               fontStyle:
//                                               FlutterFlowTheme.of(
//                                                   context)
//                                                   .bodyMedium
//                                                   .fontStyle,
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     if (_players.isEmpty)
//                       Expanded(
//                         child: Center(
//                           child:
//
//                         isLoading  ?  const SizedBox() :
//                           Text(
//                             'No players found for this filter',
//                             style: FlutterFlowTheme.of(context).titleMedium,
//                           ),
//                         ),
//                       )
//                     else
//                     Container(
//                       width: double.infinity,
//                       height: MediaQuery.sizeOf(context).height * 0.5,
//                       decoration: const BoxDecoration(),
//                       child: ListView.builder(
//                         padding: EdgeInsets.zero,
//                         itemCount: _players.length,
//                         itemBuilder: (context, index) {
//                           final player = _players[index];
//                           final firstName = player['first_name']?.toString() ?? '';
//                           final lastName = player['last_name']?.toString() ?? '';
//                           final imageUrl = player['image']?.toString() ?? '';
//                           final value = player['value']?.toString() ?? '';
//
//                           final isDarkMode = Theme.of(context).brightness == Brightness.dark;
//                           final backgroundColor = isDarkMode
//                               ? (index % 2 == 0 ? const Color(0xFF131313) : const Color(0xFF3D3D3D))
//                               : (index % 2 == 0 ? const Color(0xFFFFFFFF) : const Color(0xFFEAEAEA));
//
//                           return Container(
//                             decoration: BoxDecoration(
//                               color: backgroundColor,
//                               boxShadow: const [
//                                 BoxShadow(
//                                   blurRadius: 1.0,
//                                   color: Color(0x33463838),
//                                   offset: Offset(1.0, 2.0),
//                                   spreadRadius: 1.0,
//                                 )
//                               ],
//                             ),
//                             padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
//                             child: Row(
//                               children: [
//                                 SizedBox(
//                                   width: 30,
//                                   child: Text(
//                                     '${index + 1}',
//                                     style: FlutterFlowTheme.of(context).bodyMedium.copyWith(
//                                       fontWeight: FontWeight.bold
//                                     ),
//                                   ),
//                                 ),
//                                 Container(
//                                   width: 30,
//                                   height: 30,
//                                   margin: const EdgeInsets.only(right: 12),
//                                   decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(25),
//                                     border: Border.all(
//                                       color: FlutterFlowTheme.of(context).primary.withOpacity(0.3),
//                                     ),
//                                   ),
//                                   child: ClipRRect(
//                                     borderRadius: BorderRadius.circular(25),
//                                     child: imageUrl.isNotEmpty
//                                         ? Image.network(
//                                             imageUrl,
//                                             width: 30,
//                                             height: 30 ,
//                                             fit: BoxFit.cover,
//                                             errorBuilder: (context, error, stackTrace) => Icon(
//                                               Icons.person,
//                                               size: 30,
//                                               color: FlutterFlowTheme.of(context).secondaryText,
//                                             ),
//                                           )
//                                         : Icon(
//                                             Icons.person,
//                                             size: 30,
//                                             color: FlutterFlowTheme.of(context).secondaryText,
//                                           ),
//                                   ),
//                                 ),
//                                 Expanded(
//                                   child: Text(
//                                     '$firstName $lastName',
//                                     overflow: TextOverflow.ellipsis,
//                                     style: FlutterFlowTheme.of(context).bodyMedium.override(
//                                       font: GoogleFonts.poppins(),
//                                       fontSize: 16,
//                                     ),
//                                   ),
//                                 ),
//                                 if (value.isNotEmpty)
//                                   Container(
//                                     padding: const EdgeInsets.symmetric(horizontal: 8),
//                                     child: Text(
//                                       value,
//                                       style: FlutterFlowTheme.of(context).bodyMedium.override(
//                                         font: GoogleFonts.poppins(),
//                                         fontWeight: FontWeight.w600,
//                                         color: FlutterFlowTheme.of(context).primary,
//                                       ),
//                                     ),
//                                   ),
//                               ],
//                             ),
//                           );
//                         },
//                       ),
//                     ),
//                     Container(
//                       decoration: const BoxDecoration(),
//                       child: Padding(
//                         padding:
//                         const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
//                         child: Container(
//                           width: double.infinity,
//                           height: 47.0,
//                           decoration: BoxDecoration(
//                             gradient: LinearGradient(
//                               colors: [
//                                 FlutterFlowTheme.of(context).peach,
//                                 const Color(0xFFE09B6E)
//                               ],
//                               stops: const [0.0, 1.0],
//                               begin: const AlignmentDirectional(0.0, -1.0),
//                               end: const AlignmentDirectional(0, 1.0),
//                             ),
//                             borderRadius: BorderRadius.circular(12.0),
//                           ),
//                           child: Padding(
//                             padding: const EdgeInsetsDirectional.fromSTEB(
//                                 0.0, 0.0, 0.0, 4.0),
//                             child: FFButtonWidget(
//                               onPressed: () {
//
//                                 Navigator.pop(context   ) ;
//                                 print('Apply ranking button pressed ...');
//                               },
//                               text: 'Apply Another Filter',
//                               options: FFButtonOptions(
//                                 width: double.infinity,
//                                 height: 47.0,
//                                 padding: const EdgeInsetsDirectional.fromSTEB(
//                                     16.0, 0.0, 16.0, 0.0),
//                                 iconPadding: const EdgeInsetsDirectional.fromSTEB(
//                                     0.0, 0.0, 0.0, 0.0),
//                                 color: const Color(0x00CD4A20),
//                                 textStyle: FlutterFlowTheme.of(context)
//                                     .titleLarge
//                                     .override(
//                                   font: GoogleFonts.poppins(
//                                     fontWeight: FlutterFlowTheme.of(context)
//                                         .titleLarge
//                                         .fontWeight,
//                                     fontStyle: FlutterFlowTheme.of(context)
//                                         .titleLarge
//                                         .fontStyle,
//                                   ),
//                                   color: Colors.white,
//                                   letterSpacing: 0.0,
//                                   fontWeight: FlutterFlowTheme.of(context)
//                                       .titleLarge
//                                       .fontWeight,
//                                   fontStyle: FlutterFlowTheme.of(context)
//                                       .titleLarge
//                                       .fontStyle,
//                                 ),
//                                 elevation: 0.0,
//                                 borderRadius: BorderRadius.circular(8.0),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             if (isLoading)
//               Align(
//                 alignment: const AlignmentDirectional(0.0, 0.0),
//                 child: Container(
//                   width: 40.0,
//                   height: 40.0,
//                   child: const custom_widgets.CubeGridLoader(
//                     width: 40.0,
//                     height: 40.0,
//                     size: 40.0,
//                   ),
//                 ),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }





import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:convert';
import '/backend/api_requests/api_calls.dart';

class FilteredResultsWidget extends StatefulWidget {
  const FilteredResultsWidget({
    super.key,
    this.initialFilteredPlayers,
    this.filterType,
    this.filterDescription,
  });

  static String routeName = 'FilteredResults';
  static String routePath = '/filteredResults';

  final List<dynamic>? initialFilteredPlayers;
  final String? filterType;
  final String? filterDescription;

  @override
  State<FilteredResultsWidget> createState() => _FilteredResultsWidgetState();
}

class _FilteredResultsWidgetState extends State<FilteredResultsWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool isLoading = false;
  List<dynamic> _players = [];
  String? _filterType;
  String? _filterDescription;
  bool _argsParsed = false;
  Map<String, dynamic>? _filtersPayload;
  bool _triggeredFetch = false;
  String? _selectedFilterText;

  @override
  void initState() {
    super.initState();
    _players = widget.initialFilteredPlayers ?? [];
    _filterType = widget.filterType;
    _filterDescription = widget.filterDescription;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_argsParsed) {
      // Try GoRouter extra first (FlutterFlow pushNamed passes extra here)
      try {
        final state = GoRouterState.of(context);
        final extra = state.extra;
        if (extra is Map) {
          if (extra['filterType'] is String) {
            _filterType = extra['filterType'] as String;
          }
          if (extra['filterDescription'] is String) {
            _filterDescription = extra['filterDescription'] as String;
          }
          if (extra['selectedFilterText'] is String) {
            _selectedFilterText = extra['selectedFilterText'] as String;
          }
          if (extra['filtersPayload'] is Map) {
            _filtersPayload = Map<String, dynamic>.from(extra['filtersPayload'] as Map);
            // Only extract if selectedFilterText wasn't provided directly
            if (_selectedFilterText == null) {
              _extractSelectedFilterText();
            }
          }
          if (extra['filteredPlayers'] is List && _players.isEmpty) {
            _players = List<dynamic>.from(extra['filteredPlayers'] as List);
          }
        }
      } catch (_) {
        // ignore – will fallback to ModalRoute / FFAppState
      }

      if (_filtersPayload == null) {
        // Fallback to ModalRoute arguments (older navigation style)
        final args = ModalRoute.of(context)?.settings.arguments;
        if (args is Map) {
          if (_filterType == null && args['filterType'] is String) {
            _filterType = args['filterType'] as String;
          }
          if (_filterDescription == null && args['filterDescription'] is String) {
            _filterDescription = args['filterDescription'] as String;
          }
          if (_selectedFilterText == null && args['selectedFilterText'] is String) {
            _selectedFilterText = args['selectedFilterText'] as String;
          }
          if (_filtersPayload == null && args['filtersPayload'] is Map) {
            _filtersPayload = Map<String, dynamic>.from(args['filtersPayload'] as Map);
            if (_selectedFilterText == null) {
              _extractSelectedFilterText();
            }
          } else if (args['filteredPlayers'] is List && _players.isEmpty) {
            _players = List<dynamic>.from(args['filteredPlayers']);
          }
        }
      }

      // Final fallback: parse from global app state if present
      if (_filtersPayload == null && FFAppState().lastFilterPayloadJson.isNotEmpty) {
        try {
          final decoded = json.decode(FFAppState().lastFilterPayloadJson);
          if (decoded is Map<String, dynamic>) {
            _filtersPayload = decoded;
            if (_selectedFilterText == null) {
              _extractSelectedFilterText();
            }
          }
          if (_filterType == null || _filterType!.isEmpty) {
            _filterType = FFAppState().lastFilterType.isNotEmpty ? FFAppState().lastFilterType : null;
          }
        } catch (e) {
          debugPrint('Failed to decode fallback filter payload: $e');
        }
      }

      _argsParsed = true;
      if (_filtersPayload != null && _players.isEmpty) {
        _fetchFilteredPlayers();
      } else {
        setState(() {});
      }
    }
  }

  void _extractSelectedFilterText() {
    if (_filtersPayload == null || _filterType == null) return;

    final filters = _filtersPayload!['filters'];
    if (filters is Map) {
      switch (_filterType) {
        case 'stats_categories':
          final statsCategories = filters['stats_categories'];
          if (statsCategories is List && statsCategories.isNotEmpty) {
            final firstStat = statsCategories[0];
            if (firstStat is Map && firstStat['stat_type'] != null) {
              _selectedFilterText = firstStat['stat_type'].toString();
            }
          }
          break;
        case 'titles':
        case 'achievements':
        case 'personal_awards':
        case 'other_greatness_facts':
        case 'combine_filters':
          final filterValue = filters[_filterType];
          if (filterValue is String) {
            _selectedFilterText = filterValue;
          }
          break;
      }
    }
  }

  Future<void> _fetchFilteredPlayers() async {
    if (_triggeredFetch) return;
    _triggeredFetch = true;
    setState(() => isLoading = true);
    try {
      final payload = _filtersPayload ?? {};
      debugPrint('Result screen fetching players with payload: ${const JsonEncoder.withIndent('  ').convert(payload)}');
      final resp = await DashboardGroup.filterPlayersDynamicCall.call(
        payload: payload,
        authToken: FFAppState().authToken,
      );
      debugPrint('Results API response success=${resp.succeeded} body=${resp.bodyText}');
      if (resp.succeeded) {
        final data = resp.jsonBody['data'];
        if (data is List) {
          _players = data;
        } else {
          _players = [];
        }
      } else {
        // ScaffoldMessenger.of(context).showSnackBar(
        //   const SnackBar(content: Text('Failed to load filtered players.')),
        // );
      }
    } catch (e) {
      debugPrint('Error fetching filtered players: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: ${e.toString()}')),
        );
      }
    } finally {
      if (mounted) setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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
                fit: BoxFit.fill,
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(0.0, 0.0),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 40.0, 16.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
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
                        Expanded(
                          child: Text(
                            _filterType?.toUpperCase().replaceAll('_', ' ') ?? 'RESULTS',
                            maxLines: 3,
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            style: FlutterFlowTheme.of(context).customTextStyle1.override(
                              fontFamily: 'good times',
                              color: FlutterFlowTheme.of(context).tertiary,
                              fontSize: 24.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                        const SizedBox(width: 40.0),
                      ],
                    ),

                    // Selected filter display section
                    if (_selectedFilterText != null && _selectedFilterText!.isNotEmpty)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Text(
                          //   'Selected Filter:',
                          //   style: FlutterFlowTheme.of(context).labelMedium.override(
                          //     fontFamily: 'Poppins',
                          //     color: FlutterFlowTheme.of(context).tertiary,
                          //     fontWeight: FontWeight.w500,
                          //   ),
                          // ),
                          // const SizedBox(height: 4),
                          const SizedBox(height: 20,),

                          Center(
                            child: Text(
                              textAlign: TextAlign.center,
                              _selectedFilterText!,
                              style: FlutterFlowTheme.of(context).titleMedium.override(
                                fontFamily: 'good times',
                                color: FlutterFlowTheme.of(context).peach,
                                fontSize: 18.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          if (_filterDescription != null && _filterDescription!.isNotEmpty) ...[
                            const SizedBox(height: 10),
                            Text(
                              textAlign: TextAlign.center,

                              _filterDescription!,
                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                fontFamily: 'Poppins',
                                fontSize: 16,
                                color: FlutterFlowTheme.of(context).tertiary.withOpacity(0.8),
                              ),
                            ),
                          ],
                        ],
                      ),

                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: (Theme.of(context).brightness == Brightness.dark)
                                    ? Colors.white
                                    : Colors.black,
                              ),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(10.0, 7.0, 10.0, 7.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      'Rank',
                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                        font: GoogleFonts.baloo2(
                                          fontWeight: FontWeight.w800,
                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                        ),
                                        color: FlutterFlowTheme.of(context).oposite,
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w800,
                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                      ),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(40.0, 0.0, 0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              'Player',
                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                font: GoogleFonts.baloo2(
                                                  fontWeight: FontWeight.w800,
                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                ),
                                                color: FlutterFlowTheme.of(context).oposite,
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w800,
                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            'Value',
                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                              font: GoogleFonts.baloo2(
                                                fontWeight: FontWeight.w800,
                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                              ),
                                              color: FlutterFlowTheme.of(context).oposite,
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w800,
                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
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
                        ],
                      ),
                    ),
                    if (_players.isEmpty)
                      Expanded(
                        child: Center(
                          child: isLoading
                              ? const SizedBox()
                              : Text(
                            'No players found for this filter',
                            style: FlutterFlowTheme.of(context).titleMedium,
                          ),
                        ),
                      )
                    else
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          // height: MediaQuery.sizeOf(context).height * 0.5,
                          decoration: const BoxDecoration(),
                          child: ListView.builder(
                            padding: EdgeInsets.zero,
                            itemCount: _players.length,
                            itemBuilder: (context, index) {
                              final player = _players[index];
                              final firstName = player['first_name']?.toString() ?? '';
                              final lastName = player['last_name']?.toString() ?? '';
                              final imageUrl = player['image']?.toString() ?? '';
                              final value = player['value']?.toString() ?? '';

                              final isDarkMode = Theme.of(context).brightness == Brightness.dark;
                              final backgroundColor = isDarkMode
                                  ? (index % 2 == 0 ? const Color(0xFF131313) : const Color(0xFF3D3D3D))
                                  : (index % 2 == 0 ? const Color(0xFFFFFFFF) : const Color(0xFFEAEAEA));

                              return Container(
                                decoration: BoxDecoration(
                                  color: backgroundColor,
                                  boxShadow: const [
                                    BoxShadow(
                                      blurRadius: 1.0,
                                      color: Color(0x33463838),
                                      offset: Offset(1.0, 2.0),
                                      spreadRadius: 1.0,
                                    )
                                  ],
                                ),
                                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                                child: Row(
                                  children: [
                                    const FaIcon(
                                      FontAwesomeIcons.solidStar,
                                      color: Color(0xFFFFBC06),
                                      size: 16.0,
                                    ),
                                    const SizedBox(width: 4,),
                                    SizedBox(
                                      width: 30,
                                      child: Text(

                                        '${index + 1}',
                                        style: FlutterFlowTheme.of(context).bodyMedium.copyWith(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Container(
                                      width: 30,
                                      height: 30,
                                      margin: const EdgeInsets.only(right: 12),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(25),
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context).primary.withOpacity(0.3),
                                        ),
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(25),
                                        child: imageUrl.isNotEmpty
                                            ? Image.network(
                                          imageUrl,
                                          width: 30,
                                          height: 30,
                                          fit: BoxFit.cover,
                                          errorBuilder: (context, error, stackTrace) => Icon(
                                            Icons.person,
                                            size: 30,
                                            color: FlutterFlowTheme.of(context).secondaryText,
                                          ),
                                        )
                                            : Icon(
                                          Icons.person,
                                          size: 30,
                                          color: FlutterFlowTheme.of(context).secondaryText,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        '$firstName $lastName',
                                        overflow: TextOverflow.ellipsis,
                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                          font: GoogleFonts.poppins(),
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    if (value.isNotEmpty)
                                      Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 8),
                                        child: Text(
                                          value,
                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                            font: GoogleFonts.poppins(),
                                            fontWeight: FontWeight.w600,
                                            color: FlutterFlowTheme.of(context).tertiary,
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ),

                    // const Spacer(),
                    Container(
                      decoration: const BoxDecoration(),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
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
                              begin: const AlignmentDirectional(0.0, -1.0),
                              end: const AlignmentDirectional(0, 1.0),
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
                            child: FFButtonWidget(
                              onPressed: () {
                                Navigator.pop(context);
                                print('Apply ranking button pressed ...');
                              },
                              text: 'Apply Another Filter',
                              options: FFButtonOptions(
                                width: double.infinity,
                                height: 47.0,
                                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                color: const Color(0x00CD4A20),
                                textStyle: FlutterFlowTheme.of(context).titleLarge.override(
                                  font: GoogleFonts.poppins(
                                    fontWeight: FlutterFlowTheme.of(context).titleLarge.fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                                  ),
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context).titleLarge.fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                                ),
                                elevation: 0.0,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30,)
                  ],
                ),
              ),
            ),
            if (isLoading)
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