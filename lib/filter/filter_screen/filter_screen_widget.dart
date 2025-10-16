// import '../../backend/api_requests/api_manager.dart';
// import '/backend/api_requests/api_calls.dart'; // removed hide since ApiCallType not exported here
// import '/flutter_flow/flutter_flow_theme.dart';
// import '/flutter_flow/flutter_flow_util.dart';
//
// // removed unused flutter_flow_widgets import
// import 'dart:ui';
// import '/custom_code/widgets/index.dart' as custom_widgets;
// import 'package:flutter/material.dart';
// import 'package:flutter/scheduler.dart';
//
// // removed unused spinkit import
// import 'package:google_fonts/google_fonts.dart';
// import 'package:provider/provider.dart';
// import 'filter_screen_model.dart';
// export 'filter_screen_model.dart';
// import 'dart:convert';
// import '../../filter/filter_result/filter_result_widget.dart';
//
// class FilterScreenWidget extends StatefulWidget {
//   const FilterScreenWidget({super.key});
//
//   static String routeName = 'filterScreen';
//   static String routePath = '/filterScreen';
//
//   @override
//   State<FilterScreenWidget> createState() => _FilterScreenWidgetState();
// }
//
// class _FilterScreenWidgetState extends State<FilterScreenWidget>
//     with RouteAware {
//   late FilterScreenModel _model;
//   final scaffoldKey = GlobalKey<ScaffoldState>();
//
//   int? selectedSubcategoryIndex;
//   String? _selectedFilterKey; // maps to API field key
//   Map<String, dynamic>? _selectedFilterItem; // full selected item
//   String? _selectedSeasonType; // Add this for stats dropdown
//
//   final List<String> _seasonTypes = ['Regular Season', 'Playoffs', 'Finals'];
//
//   // Helper to derive API key from filter group name
//   String _deriveFilterKey(String name) {
//     final lower = name.toLowerCase();
//     if (lower.contains('title')) return 'titles';
//     if (lower.contains('achievement')) return 'achievements';
//     if (lower.contains('personal')) return 'personal_awards';
//     if (lower.contains('greatness')) return 'other_greatness_facts';
//     if (lower.contains('combine')) return 'combine_filters';
//     if (lower.contains('stat')) return 'stats_categories';
//     // fallback treat as titles
//     return 'titles';
//   }
//
//   Future<void> _submitSelectedFilter() async {
//     if (_selectedFilterKey == null || _selectedFilterItem == null) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Please select a filter value first.')),
//       );
//       return;
//     }
//     if (_selectedFilterKey == 'stats_categories' && _selectedSeasonType == null) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Please select a season type for stats.')),
//       );
//       return;
//     }
//
//     // Build payload only; API call will be done on results screen now.
//     final filters = <String, dynamic>{};
//     if (_selectedFilterKey == 'stats_categories') {
//       final fullStat = Map<String, dynamic>.from(_selectedFilterItem!);
//       fullStat['season_type'] = _selectedSeasonType;
//       fullStat.remove('synthetic');
//       if (!fullStat.containsKey('value') && fullStat.containsKey('name')) {
//         fullStat['value'] = fullStat['name'];
//       }
//       filters['stats_categories'] = [fullStat];
//     } else {
//       filters[_selectedFilterKey!] = _selectedFilterItem?['name'] ?? _selectedFilterItem?['value'] ?? '';
//     }
//     final payload = {'filters': filters};
//     debugPrint('Navigating to results with filters payload: ' + const JsonEncoder.withIndent('  ').convert(payload));
//     FFAppState().lastFilterPayloadJson = json.encode(payload);
//     FFAppState().lastFilterType = _selectedFilterKey ?? '';
//     context.pushNamed(
//       FilteredResultsWidget.routeName,
//       extra: {
//         'filtersPayload': payload,
//         'filterType': _selectedFilterKey,
//       },
//     );
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     _model = createModel(context, () => FilterScreenModel());
//
//     // On page load action.
//     SchedulerBinding.instance.addPostFrameCallback((_) async {
//       _model.isLoading = false;
//       safeSetState(() {});
//       _model.apiResult993 = await DashboardGroup.filterListCall.call(
//         authToken: FFAppState().authToken,
//       );
//
//       if ((_model.apiResult993?.succeeded ?? true)) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text(
//               getJsonField(
//                 (_model.apiResult993?.jsonBody ?? ''),
//                 r'''$.message''',
//               ).toString(),
//               style: TextStyle(
//                 color: Colors.white,
//               ),
//             ),
//             duration: Duration(milliseconds: 1500),
//             backgroundColor: Colors.black,
//           ),
//         );
//         _model.isLoading = false;
//         _model.filterData =
//             (_model.apiResult993?.jsonBody ?? '').toList().cast<dynamic>();
//         safeSetState(() {});
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text(
//               getJsonField(
//                 (_model.apiResult993?.jsonBody ?? ''),
//                 r'''$.message''',
//               ).toString(),
//               style: TextStyle(
//                 color: Colors.white,
//               ),
//             ),
//             duration: Duration(milliseconds: 1500),
//             backgroundColor: Colors.black,
//           ),
//         );
//         _model.isLoading = false;
//         safeSetState(() {});
//       }
//     });
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
//   void didUpdateWidget(FilterScreenWidget oldWidget) {
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
//   // Add this helper method to determine if it's a stats category
//   bool get _isStatsCategory {
//     if (_model.filterIndex == null) return false;
//     final groupName = getJsonField(
//       DashboardGroup.filterListCall
//           .filter((_model.apiResult993?.jsonBody ?? ''))
//           ?.elementAtOrNull(_model.filterIndex ?? 0),
//       r'$.name',
//     )?.toString().toLowerCase() ?? '';
//     return groupName.contains('stat');
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     DebugFlutterFlowModelContext.maybeOf(context)
//         ?.parentModelCallback
//         ?.call(_model);
//     context.watch<FFAppState>();
//
//     return GestureDetector(
//       onTap: () {
//         FocusScope.of(context).unfocus();
//         FocusManager.instance.primaryFocus?.unfocus();
//       },
//       child: Scaffold(
//         key: scaffoldKey,
//         backgroundColor: FlutterFlowTheme.of(context).oposite,
//         body: Column(
//           children: [
//             // Header section
//             Padding(
//               padding: EdgeInsetsDirectional.fromSTEB(16.0, 40.0, 16.0, 0.0),
//               child: Row(
//                 mainAxisSize: MainAxisSize.max,
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   // Back button
//                   InkWell(
//                     splashColor: Colors.transparent,
//                     focusColor: Colors.transparent,
//                     hoverColor: Colors.transparent,
//                     highlightColor: Colors.transparent,
//                     onTap: () async {
//                       context.safePop();
//                     },
//                     child: Container(
//                       width: 40.0,
//                       height: 40.0,
//                       decoration: BoxDecoration(
//                         color: FlutterFlowTheme.of(context).backBtnClr,
//                         borderRadius: BorderRadius.circular(12.0),
//                         border: Border.all(
//                           color: (Theme.of(context).brightness == Brightness.dark)
//                               ? Color(0x00000000)
//                               : Color(0xFF999999),
//                         ),
//                       ),
//                       child: Icon(
//                         Icons.arrow_back_rounded,
//                         color: FlutterFlowTheme.of(context).tertiary,
//                         size: 24.0,
//                       ),
//                     ),
//                   ),
//                   // Title
//                   Row(
//                     mainAxisSize: MainAxisSize.max,
//                     children: [
//                       Text(
//                         'fil',
//                         style: FlutterFlowTheme.of(context).customTextStyle1.override(
//                               fontFamily: 'good times',
//                               color: FlutterFlowTheme.of(context).tertiary,
//                               fontSize: 28.0,
//                               letterSpacing: 0.0,
//                               fontWeight: FontWeight.normal,
//                             ),
//                       ),
//                       Text(
//                         't',
//                         style: FlutterFlowTheme.of(context).customTextStyle1.override(
//                               fontFamily: 'good times',
//                               color: Color(0xFFEB6027),
//                               fontSize: 28.0,
//                               letterSpacing: 0.0,
//                               fontWeight: FontWeight.normal,
//                             ),
//                       ),
//                       Text(
//                         'ers',
//                         style: FlutterFlowTheme.of(context).customTextStyle1.override(
//                               fontFamily: 'good times',
//                               color: FlutterFlowTheme.of(context).tertiary,
//                               fontSize: 28.0,
//                               letterSpacing: 0.0,
//                               fontWeight: FontWeight.normal,
//                             ),
//                       ),
//                     ],
//                   ),
//                   // Clear All button
//                   TextButton(
//                     onPressed: () {
//                       setState(() {
//                         _selectedFilterKey = null;
//                         _selectedFilterItem = null;
//                         selectedSubcategoryIndex = null;
//                         _model.valueIndex = null;
//                         _model.selectedTitle = null;
//                       });
//                       debugPrint('Filter selections cleared');
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         const SnackBar(content: Text('All selections cleared.')),
//                       );
//                     },
//                     style: TextButton.styleFrom(
//                       padding: EdgeInsets.zero,
//                       minimumSize: Size(50, 30),
//                       tapTargetSize: MaterialTapTargetSize.shrinkWrap,
//                     ),
//                     child: Text(
//                       'Clear All',
//                       style: FlutterFlowTheme.of(context).titleLarge.override(
//                             font: GoogleFonts.poppins(
//                               fontWeight: FontWeight.normal,
//                             ),
//                             color: FlutterFlowTheme.of(context).peach,
//                           ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             // Description text
//             if (_model.filterIndex != null)
//               Padding(
//                 padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
//                 child: Text(
//                   getJsonField(
//                     DashboardGroup.filterListCall
//                         .filter((_model.apiResult993?.jsonBody ?? ''))
//                         ?.elementAtOrNull(_model.filterIndex ?? 0),
//                     r'''$.description''',
//                   )?.toString() ?? '',
//                   textAlign: TextAlign.center,
//                   style: FlutterFlowTheme.of(context).titleMedium,
//                 ),
//               ),
//             // Main content area
//             if (!_model.isLoading)
//               Expanded(
//                 child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     // Left side - Filter categories
//                     Container(
//                       width: MediaQuery.sizeOf(context).width * 0.38,
//                       decoration: BoxDecoration(
//                         color: Theme.of(context).brightness == Brightness.dark
//                             ? FlutterFlowTheme.of(context).secondaryBackground
//                             : Color(0xFFF2F2F2),
//                       ),
//                       child: Builder(
//                         builder: (context) {
//                           final filterTitle = DashboardGroup.filterListCall
//                                   .filter((_model.apiResult993?.jsonBody ?? ''))
//                                   ?.toList() ??
//                               [];
//                           return ListView.separated(
//                             padding: EdgeInsets.symmetric(vertical: 8),
//                             itemCount: filterTitle.length,
//                             separatorBuilder: (_, __) => SizedBox(height: 1),
//                             itemBuilder: (context, filterTitleIndex) {
//                               final filterTitleItem = filterTitle[filterTitleIndex];
//                               final isSelected = _model.filterIndex == filterTitleIndex;
//                               return InkWell(
//                                 onTap: () => setState(() {
//                                   _model.filterIndex = filterTitleIndex;
//                                   _model.valueIndex = null;
//                                   _selectedFilterKey = null;
//                                   _selectedFilterItem = null;
//                                 }),
//                                 child: Container(
//                                   padding: EdgeInsets.symmetric(
//                                     horizontal: 16.0,
//                                     vertical: 12.0,
//                                   ),
//                                   decoration: BoxDecoration(
//                                     color: isSelected
//                                         ? FlutterFlowTheme.of(context).lightPeach
//                                         : Colors.transparent,
//                                   ),
//                                   child: Text(
//                                     getJsonField(filterTitleItem, r'''$.name''').toString(),
//                                     style: FlutterFlowTheme.of(context).titleMedium.override(
//                                           font: GoogleFonts.poppins(),
//                                           color: FlutterFlowTheme.of(context).tertiary,
//                                         ),
//                                   ),
//                                 ),
//                               );
//                             },
//                           );
//                         },
//                       ),
//                     ),
//                     // Right side - Values or Subcategories
//                     Expanded(
//                       child: Container(
//                         padding: EdgeInsets.only(left: 10),
//                         child: Builder(
//                           builder: (context) {
//                             if (_isStatsCategory) {
//                               // Build mutable list of category maps
//                               final categoryData = (getJsonField(
//                                 DashboardGroup.filterListCall
//                                     .filter((_model.apiResult993?.jsonBody ?? ''))
//                                     ?.elementAtOrNull(_model.filterIndex ?? 0),
//                                 r'''$.player_category_filters''',
//                               ) as List? ?? [])
//                                   .map((e) => Map<String, dynamic>.from(e as Map))
//                                   .toList();
//
//                               // Find base stats (first category with non-empty stats_categories)
//                               final baseStats = categoryData
//                                   .firstWhere(
//                                     (c) => (c['stats_categories'] is List) && (c['stats_categories'] as List).isNotEmpty,
//                                     orElse: () => {},
//                                   )
//                                   .cast<String, dynamic>()["stats_categories"] as List?;
//
//                               // Clone stats into empty categories so each dropdown has items
//                               if (baseStats != null && baseStats.isNotEmpty) {
//                                 for (final cat in categoryData) {
//                                   final stats = cat['stats_categories'];
//                                   if (stats is List && stats.isEmpty) {
//                                     cat['stats_categories'] = baseStats
//                                         .map((s) => {
//                                               ...Map<String, dynamic>.from(s as Map),
//                                               'synthetic': true,
//                                             })
//                                         .toList();
//                                   }
//                                 }
//                               }
//
//                               return ListView.builder(
//                                 padding: EdgeInsets.symmetric(vertical: 8),
//                                 itemCount: categoryData.length,
//                                 itemBuilder: (context, index) {
//                                   final category = categoryData[index];
//                                   final stats = (category['stats_categories'] as List? ?? [])
//                                       .map((s) => Map<String, dynamic>.from(s as Map))
//                                       .toList();
//                                   return _buildStatsCategoryDropdown(
//                                     context: context,
//                                     index: index,
//                                     title: category['name']?.toString() ?? 'Category',
//                                     stats: stats,
//                                     category: category,
//                                   );
//                                 },
//                               );
//                             }
//
//                             // For non-stats categories, show the regular filter values list
//                             final valueItems = getJsonField(
//                               DashboardGroup.filterListCall
//                                   .filter((_model.apiResult993?.jsonBody ?? ''))
//                                   ?.elementAtOrNull(_model.filterIndex ?? 0),
//                               r'''$.player_category_filters''',
//                             )?.toList() ?? [];
//
//                             return ListView.builder(
//                               padding: EdgeInsets.symmetric(vertical: 8),
//                               itemCount: valueItems.length,
//                               itemBuilder: (context, index) {
//                                 final item = valueItems[index];
//                                 final isSelected = _model.valueIndex == index;
//                                 return InkWell(
//                                   onTap: () {
//                                     setState(() {
//                                       _model.valueIndex = index;
//                                       final groupName = getJsonField(
//                                         DashboardGroup.filterListCall
//                                             .filter((_model.apiResult993?.jsonBody ?? ''))!
//                                             .elementAt(_model.filterIndex ?? 0),
//                                         r'$.name',
//                                       ).toString();
//                                       _selectedFilterKey = _deriveFilterKey(groupName);
//                                       _selectedFilterItem =
//                                           Map<String, dynamic>.from(item is Map ? item : {});
//                                       _model.selectedTitle = getJsonField(item, r'$.name');
//                                     });
//                                   },
//                                   child: Container(
//                                     padding: EdgeInsets.all(12),
//                                     decoration: BoxDecoration(
//                                       color: FlutterFlowTheme.of(context).secondaryBackground,
//                                       border: Border.all(
//                                         color: Theme.of(context).brightness == Brightness.light
//                                             ? Color(0x1E000000)
//                                             : Color(0x1EFFFFFF),
//                                       ),
//                                     ),
//                                     child: Row(
//                                       children: [
//                                         Container(
//                                           width: 20,
//                                           height: 20,
//                                           decoration: BoxDecoration(
//                                             shape: BoxShape.circle,
//                                             border: Border.all(
//                                               color: FlutterFlowTheme.of(context).tertiary,
//                                             ),
//                                           ),
//                                           child: isSelected
//                                               ? Center(
//                                                   child: Container(
//                                                     width: 12,
//                                                     height: 12,
//                                                     decoration: BoxDecoration(
//                                                       shape: BoxShape.circle,
//                                                       color: FlutterFlowTheme.of(context).primary,
//                                                     ),
//                                                   ),
//                                                 )
//                                               : null,
//                                         ),
//                                         SizedBox(width: 12),
//                                         Expanded(
//                                           child: Text(
//                                             getJsonField(item, r'''$.name''').toString(),
//                                             style: FlutterFlowTheme.of(context).labelMedium,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 );
//                               },
//                             );
//                           },
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             // Apply Filter button
//             Container(
//               width: double.infinity,
//               height: 60.0,
//               decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                   colors: [
//                     _selectedFilterKey != null &&
//                             (!_isStatsCategory || _selectedSeasonType != null)
//                         ? FlutterFlowTheme.of(context).peach
//                         : FlutterFlowTheme.of(context).peach.withOpacity(0.5),
//                     _selectedFilterKey != null &&
//                             (!_isStatsCategory || _selectedSeasonType != null)
//                         ? Color(0xFFE09B6E)
//                         : Color(0xFFE09B6E).withOpacity(0.5),
//                   ],
//                   stops: [0.0, 1.0],
//                   begin: AlignmentDirectional(0.0, -1.0),
//                   end: AlignmentDirectional(0, 1.0),
//                 ),
//               ),
//               child: Material(
//                 color: Colors.transparent,
//                 child: InkWell(
//                   onTap: (_selectedFilterKey != null &&
//                           (!_isStatsCategory || _selectedSeasonType != null))
//                       ? _submitSelectedFilter
//                       : null,
//                   child: Container(
//                     width: double.infinity,
//                     height: double.infinity,
//                     alignment: Alignment.center,
//                     child: Column(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         Text(
//                           'Apply Filter',
//                           style: FlutterFlowTheme.of(context).titleSmall.override(
//                                 font: GoogleFonts.poppins(
//                                   fontWeight: FontWeight.w500,
//                                 ),
//                                 color: Colors.white.withOpacity(
//                                   (_selectedFilterKey != null &&
//                                           (!_isStatsCategory ||
//                                               _selectedSeasonType != null))
//                                       ? 1.0
//                                       : 0.7,
//                                 ),
//                               ),
//                         ),
//                         if (_selectedFilterKey != null && _selectedFilterItem != null)
//                           Padding(
//                             padding: const EdgeInsets.only(top: 4.0),
//                             child: Text(
//                               _isStatsCategory && _selectedSeasonType != null
//                                   ? '${_selectedFilterItem?['name'] ?? _selectedFilterItem?['value']} - $_selectedSeasonType'
//                                   : _selectedFilterItem?['name'] ?? _selectedFilterItem?['value'] ?? '',
//                               style: FlutterFlowTheme.of(context).labelSmall.override(
//                                     font: GoogleFonts.poppins(),
//                                     color: Colors.white70,
//                                   ),
//                               overflow: TextOverflow.ellipsis,
//                             ),
//                           ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   // Helper method to build expandable stats section
//   Widget _buildExpandableStatsSection(
//     BuildContext context,
//     String title,
//     List<dynamic> stats,
//     int sectionIndex,
//   ) {
//     if (stats.isEmpty) return SizedBox.shrink();
//
//     final isExpanded = _model.expandedIndex == sectionIndex;
//
//     return Column(
//       children: [
//         InkWell(
//           onTap: () {
//             setState(() {
//               _model.expandedIndex = isExpanded ? null : sectionIndex;
//             });
//           },
//           child: Container(
//             margin: EdgeInsets.only(bottom: isExpanded ? 0 : 8),
//             padding: EdgeInsets.all(12),
//             decoration: BoxDecoration(
//               color: FlutterFlowTheme.of(context).secondaryBackground,
//               borderRadius: BorderRadius.vertical(
//                 top: Radius.circular(8),
//                 bottom: Radius.circular(isExpanded ? 0 : 8),
//               ),
//               border: Border.all(
//                 color: FlutterFlowTheme.of(context).primary.withOpacity(0.3),
//               ),
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   title,
//                   style: FlutterFlowTheme.of(context).titleSmall.override(
//                     fontFamily: 'Poppins',
//                     color: FlutterFlowTheme.of(context).primary,
//                   ),
//                 ),
//                 Icon(
//                   isExpanded
//                       ? Icons.keyboard_arrow_up_rounded
//                       : Icons.keyboard_arrow_down_rounded,
//                   color: FlutterFlowTheme.of(context).primary,
//                 ),
//               ],
//             ),
//           ),
//         ),
//         if (isExpanded)
//           Container(
//             decoration: BoxDecoration(
//               border: Border.all(
//                 color: FlutterFlowTheme.of(context).primary.withOpacity(0.3),
//               ),
//               borderRadius: BorderRadius.vertical(
//                 bottom: Radius.circular(8),
//               ),
//             ),
//             margin: EdgeInsets.only(bottom: 8),
//             child: Column(
//               children: stats.map<Widget>((statItem) {
//                 final isSelected = _selectedFilterKey == 'stats_categories' &&
//                     _selectedFilterItem?['id'] == statItem['id'] &&
//                     _selectedSeasonType == title;
//
//                 return InkWell(
//                   onTap: () {
//                     setState(() {
//                       _selectedFilterKey = 'stats_categories';
//                       _selectedSeasonType = title;
//                       _selectedFilterItem = Map<String, dynamic>.from({
//                         ...statItem,
//                         'season_type': title,
//                       });
//                     });
//                   },
//                   child: Container(
//                     padding: EdgeInsets.all(12),
//                     decoration: BoxDecoration(
//                       color: isSelected
//                           ? FlutterFlowTheme.of(context).primary.withOpacity(0.1)
//                           : FlutterFlowTheme.of(context).secondaryBackground,
//                       border: Border(
//                         bottom: BorderSide(
//                           color: FlutterFlowTheme.of(context).primary.withOpacity(0.1),
//                         ),
//                       ),
//                     ),
//                     child: Row(
//                       children: [
//                         Container(
//                           width: 20,
//                           height: 20,
//                           decoration: BoxDecoration(
//                             shape: BoxShape.circle,
//                             border: Border.all(
//                               color: isSelected
//                                   ? FlutterFlowTheme.of(context).primary
//                                   : FlutterFlowTheme.of(context).tertiary,
//                             ),
//                           ),
//                           child: isSelected
//                               ? Center(
//                                   child: Container(
//                                     width: 12,
//                                     height: 12,
//                                     decoration: BoxDecoration(
//                                       shape: BoxShape.circle,
//                                       color: FlutterFlowTheme.of(context).primary,
//                                     ),
//                                   ),
//                                 )
//                               : null,
//                         ),
//                         SizedBox(width: 12),
//                         Expanded(
//                           child: Text(
//                             statItem['value']?.toString() ?? '',
//                             style: FlutterFlowTheme.of(context).bodyMedium.override(
//                               fontFamily: 'Poppins',
//                               color: isSelected
//                                   ? FlutterFlowTheme.of(context).primary
//                                   : FlutterFlowTheme.of(context).tertiary,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ));
//               }).toList(),
//             ),
//           ),
//       ],
//     );
//   }
//
//   Widget _buildStatsCategoryDropdown({
//     required BuildContext context,
//     required int index,
//     required String title,
//     required List<Map<String, dynamic>> stats,
//     required Map<String, dynamic> category,
//   }) {
//     final isExpanded = _model.expandedIndex == index;
//     final hasStats = stats.isNotEmpty;
//
//     return Container(
//       margin: EdgeInsets.only(bottom: 10),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(10),
//         border: Border.all(
//           color: FlutterFlowTheme.of(context).primary.withOpacity(0.25),
//         ),
//       ),
//       child: Column(
//         children: [
//           InkWell(
//             onTap: () {
//               setState(() => _model.expandedIndex = isExpanded ? null : index);
//             },
//             child: Container(
//               padding: EdgeInsets.symmetric(horizontal: 14, vertical: 14),
//               decoration: BoxDecoration(
//                 color: FlutterFlowTheme.of(context).secondaryBackground,
//                 borderRadius: BorderRadius.vertical(
//                   top: Radius.circular(10),
//                   bottom: Radius.circular(isExpanded ? 0 : 10),
//                 ),
//               ),
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: Text(
//                       title,
//                       style: FlutterFlowTheme.of(context).titleSmall.override(
//                             fontFamily: 'Poppins',
//                             // changed color from primary (orange) to tertiary to better match UI
//                             color: FlutterFlowTheme.of(context).tertiary,
//                             fontWeight: FontWeight.w600,
//                           ),
//                     ),
//                   ),
//                   // Removed stats length Text widget
//                   AnimatedRotation(
//                     turns: isExpanded ? 0.5 : 0,
//                     duration: Duration(milliseconds: 200),
//                     child: Icon(
//                       Icons.keyboard_arrow_down_rounded,
//                       // changed icon color to tertiary as well
//                       color: FlutterFlowTheme.of(context).tertiary,
//                       size: 24,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           if (isExpanded && hasStats)
//             Container(
//               width: double.infinity,
//               decoration: BoxDecoration(
//                 color: FlutterFlowTheme.of(context).secondaryBackground,
//                 borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
//               ),
//               padding: EdgeInsets.fromLTRB(10, 10, 10, 14),
//               child: _buildStatsGrid(context, stats, title),
//             ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildStatsGrid(BuildContext context, List<Map<String, dynamic>> stats, String seasonTitle) {
//     return LayoutBuilder(
//       builder: (context, constraints) {
//         final itemWidth = (constraints.maxWidth - 10) / 2; // spacing of 10 total
//         return Wrap(
//           spacing: 10,
//           runSpacing: 10,
//           children: stats.map((stat) {
//             final isSelected = _selectedFilterKey == 'stats_categories' &&
//                 _selectedFilterItem?['id'] == stat['id'] &&
//                 _selectedSeasonType == seasonTitle;
//             return SizedBox(
//               width: itemWidth,
//               child: InkWell(
//                 onTap: () {
//                   setState(() {
//                     _selectedFilterKey = 'stats_categories';
//                     _selectedSeasonType = seasonTitle;
//                     _selectedFilterItem = Map<String, dynamic>.from({
//                       ...stat,
//                       'season_type': seasonTitle,
//                     });
//                   });
//                 },
//                 borderRadius: BorderRadius.circular(8),
//                 child: AnimatedContainer(
//                   duration: Duration(milliseconds: 180),
//                   padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(8),
//                     color: isSelected
//                         ? FlutterFlowTheme.of(context).primary.withOpacity(0.12)
//                         : FlutterFlowTheme.of(context).secondaryBackground,
//                     border: Border.all(
//                       color: isSelected
//                           ? FlutterFlowTheme.of(context).primary
//                           : FlutterFlowTheme.of(context).primary.withOpacity(0.15),
//                     ),
//                   ),
//                   child: Row(
//                     children: [
//                       Container(
//                         width: 18,
//                         height: 18,
//                         decoration: BoxDecoration(
//                           shape: BoxShape.circle,
//                           border: Border.all(
//                             color: isSelected
//                                 ? FlutterFlowTheme.of(context).primary
//                                 : FlutterFlowTheme.of(context).tertiary,
//                           ),
//                         ),
//                         child: isSelected
//                             ? Center(
//                                 child: Container(
//                                   width: 10,
//                                   height: 10,
//                                   decoration: BoxDecoration(
//                                     shape: BoxShape.circle,
//                                     color: FlutterFlowTheme.of(context).primary,
//                                   ),
//                                 ),
//                               )
//                             : null,
//                       ),
//                       SizedBox(width: 8),
//                       Expanded(
//                         child: Text(
//                           stat['value']?.toString() ?? stat['name']?.toString() ?? '',
//                           maxLines: 1,
//                           overflow: TextOverflow.ellipsis,
//                           style: FlutterFlowTheme.of(context).bodyMedium.override(
//                                 fontFamily: 'Poppins',
//                                 color: isSelected
//                                     ? FlutterFlowTheme.of(context).primary
//                                     : FlutterFlowTheme.of(context).tertiary,
//                                 fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
//                               ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ));
//           }).toList(),
//         );
//       },
//     );
//   }
// }



//
// import '../../backend/api_requests/api_manager.dart';
// import '/backend/api_requests/api_calls.dart'; // removed hide since ApiCallType not exported here
// import '/flutter_flow/flutter_flow_theme.dart';
// import '/flutter_flow/flutter_flow_util.dart';
//
// // removed unused flutter_flow_widgets import
// import 'dart:ui';
// import '/custom_code/widgets/index.dart' as custom_widgets;
// import 'package:flutter/material.dart';
// import 'package:flutter/scheduler.dart';
//
// // removed unused spinkit import
// import 'package:google_fonts/google_fonts.dart';
// import 'package:provider/provider.dart';
// import 'filter_screen_model.dart';
// export 'filter_screen_model.dart';
// import 'dart:convert';
// import '../../filter/filter_result/filter_result_widget.dart';
//
// class FilterScreenWidget extends StatefulWidget {
//   const FilterScreenWidget({super.key});
//
//   static String routeName = 'filterScreen';
//   static String routePath = '/filterScreen';
//
//   @override
//   State<FilterScreenWidget> createState() => _FilterScreenWidgetState();
// }
//
// class _FilterScreenWidgetState extends State<FilterScreenWidget>
//     with RouteAware {
//   late FilterScreenModel _model;
//   final scaffoldKey = GlobalKey<ScaffoldState>();
//
//   int? selectedSubcategoryIndex;
//   String? _selectedFilterKey; // maps to API field key
//   Map<String, dynamic>? _selectedFilterItem; // full selected item
//   String? _selectedSeasonType; // Add this for stats dropdown
//
//   final List<String> _seasonTypes = ['Regular Season', 'Playoffs', 'Finals'];
//
//   // Helper to derive API key from filter group name
//   String _deriveFilterKey(String name) {
//     final lower = name.toLowerCase();
//     if (lower.contains('title')) return 'titles';
//     if (lower.contains('achievement')) return 'achievements';
//     if (lower.contains('personal')) return 'personal_awards';
//     if (lower.contains('greatness')) return 'other_greatness_facts';
//     if (lower.contains('combine')) return 'combine_filters';
//     if (lower.contains('stat')) return 'stats_categories';
//     // fallback treat as titles
//     return 'titles';
//   }
//
//   Future<void> _submitSelectedFilter() async {
//     if (_selectedFilterKey == null || _selectedFilterItem == null) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Please select a filter value first.')),
//       );
//       return;
//     }
//     if (_selectedFilterKey == 'stats_categories' && _selectedSeasonType == null) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Please select a season type for stats.')),
//       );
//       return;
//     }
//
//     // Build payload only; API call will be done on results screen now.
//     final filters = <String, dynamic>{};
//     if (_selectedFilterKey == 'stats_categories') {
//       final fullStat = Map<String, dynamic>.from(_selectedFilterItem!);
//       fullStat['season_type'] = _selectedSeasonType;
//       fullStat.remove('synthetic');
//       if (!fullStat.containsKey('value') && fullStat.containsKey('name')) {
//         fullStat['value'] = fullStat['name'];
//       }
//       filters['stats_categories'] = [fullStat];
//     } else {
//       filters[_selectedFilterKey!] = _selectedFilterItem?['name'] ?? _selectedFilterItem?['value'] ?? '';
//     }
//     final payload = {'filters': filters};
//     debugPrint('Navigating to results with filters payload: ' + const JsonEncoder.withIndent('  ').convert(payload));
//     FFAppState().lastFilterPayloadJson = json.encode(payload);
//     FFAppState().lastFilterType = _selectedFilterKey ?? '';
//     context.pushNamed(
//       FilteredResultsWidget.routeName,
//       extra: {
//         'filtersPayload': payload,
//         'filterType': _selectedFilterKey,
//       },
//     );
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     _model = createModel(context, () => FilterScreenModel());
//
//     // On page load action.
//     SchedulerBinding.instance.addPostFrameCallback((_) async {
//       _model.isLoading = true;
//       safeSetState(() {});
//
//       _model.apiResult993 = await DashboardGroup.filterListCall.call(
//         authToken: FFAppState().authToken,
//       );
//
//       if ((_model.apiResult993?.succeeded ?? true)) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text(
//               getJsonField(
//                 (_model.apiResult993?.jsonBody ?? ''),
//                 r'''$.message''',
//               ).toString(),
//               style: TextStyle(
//                 color: Colors.white,
//               ),
//             ),
//             duration: Duration(milliseconds: 1500),
//             backgroundColor: Colors.black,
//           ),
//         );
//
//         final jsonBody = _model.apiResult993?.jsonBody ?? '';
//
//         // Pre-select first category if data exists.
//         final tempFilterTitle = DashboardGroup.filterListCall.filter(jsonBody)?.toList() ?? [];
//         if (tempFilterTitle.isNotEmpty) {
//           _model.filterIndex = 0;
//         }
//
//         _model.isLoading = false;
//         safeSetState(() {});
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text(
//               getJsonField(
//                 (_model.apiResult993?.jsonBody ?? ''),
//                 r'''$.message''',
//               ).toString(),
//               style: TextStyle(
//                 color: Colors.white,
//               ),
//             ),
//             duration: Duration(milliseconds: 1500),
//             backgroundColor: Colors.black,
//           ),
//         );
//         _model.isLoading = false;
//         safeSetState(() {});
//       }
//     });
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
//   void didUpdateWidget(FilterScreenWidget oldWidget) {
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
//   // Add this helper method to determine if it's a stats category
//   bool get _isStatsCategory {
//     if (_model.filterIndex == null) return false;
//     final groupName = getJsonField(
//       DashboardGroup.filterListCall
//           .filter((_model.apiResult993?.jsonBody ?? ''))
//           ?.elementAtOrNull(_model.filterIndex ?? 0),
//       r'$.name',
//     )?.toString().toLowerCase() ?? '';
//     return groupName.contains('stat');
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     DebugFlutterFlowModelContext.maybeOf(context)
//         ?.parentModelCallback
//         ?.call(_model);
//     context.watch<FFAppState>();
//
//     return GestureDetector(
//       onTap: () {
//         FocusScope.of(context).unfocus();
//         FocusManager.instance.primaryFocus?.unfocus();
//       },
//       child: Scaffold(
//         key: scaffoldKey,
//         backgroundColor: FlutterFlowTheme.of(context).oposite,
//         body: Column(
//           children: [
//             // Header section
//             Padding(
//               padding: EdgeInsetsDirectional.fromSTEB(16.0, 40.0, 16.0, 0.0),
//               child: Row(
//                 mainAxisSize: MainAxisSize.max,
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   // Back button
//                   InkWell(
//                     splashColor: Colors.transparent,
//                     focusColor: Colors.transparent,
//                     hoverColor: Colors.transparent,
//                     highlightColor: Colors.transparent,
//                     onTap: () async {
//                       context.safePop();
//                     },
//                     child: Container(
//                       width: 40.0,
//                       height: 40.0,
//                       decoration: BoxDecoration(
//                         color: FlutterFlowTheme.of(context).backBtnClr,
//                         borderRadius: BorderRadius.circular(12.0),
//                         border: Border.all(
//                           color: (Theme.of(context).brightness == Brightness.dark)
//                               ? Color(0x00000000)
//                               : Color(0xFF999999),
//                         ),
//                       ),
//                       child: Icon(
//                         Icons.arrow_back_rounded,
//                         color: FlutterFlowTheme.of(context).tertiary,
//                         size: 24.0,
//                       ),
//                     ),
//                   ),
//                   // Title
//                   Row(
//                     mainAxisSize: MainAxisSize.max,
//                     children: [
//                       Text(
//                         'fil',
//                         style: FlutterFlowTheme.of(context).customTextStyle1.override(
//                           fontFamily: 'good times',
//                           color: FlutterFlowTheme.of(context).tertiary,
//                           fontSize: 28.0,
//                           letterSpacing: 0.0,
//                           fontWeight: FontWeight.normal,
//                         ),
//                       ),
//                       Text(
//                         't',
//                         style: FlutterFlowTheme.of(context).customTextStyle1.override(
//                           fontFamily: 'good times',
//                           color: Color(0xFFEB6027),
//                           fontSize: 28.0,
//                           letterSpacing: 0.0,
//                           fontWeight: FontWeight.normal,
//                         ),
//                       ),
//                       Text(
//                         'ers',
//                         style: FlutterFlowTheme.of(context).customTextStyle1.override(
//                           fontFamily: 'good times',
//                           color: FlutterFlowTheme.of(context).tertiary,
//                           fontSize: 28.0,
//                           letterSpacing: 0.0,
//                           fontWeight: FontWeight.normal,
//                         ),
//                       ),
//                     ],
//                   ),
//                   // Clear All button
//                   TextButton(
//                     onPressed: () {
//                       setState(() {
//                         _selectedFilterKey = null;
//                         _selectedFilterItem = null;
//                         selectedSubcategoryIndex = null;
//                         _model.valueIndex = null;
//                         _model.selectedTitle = null;
//                       });
//                       debugPrint('Filter selections cleared');
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         const SnackBar(content: Text('All selections cleared.')),
//                       );
//                     },
//                     style: TextButton.styleFrom(
//                       padding: EdgeInsets.zero,
//                       minimumSize: Size(50, 30),
//                       tapTargetSize: MaterialTapTargetSize.shrinkWrap,
//                     ),
//                     child: Text(
//                       'Clear All',
//                       style: FlutterFlowTheme.of(context).titleLarge.override(
//                         font: GoogleFonts.poppins(
//                           fontWeight: FontWeight.normal,
//                         ),
//                         color: FlutterFlowTheme.of(context).peach,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             // Description text
//             if (_model.filterIndex != null)
//               Padding(
//                 padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
//                 child: Text(
//                   getJsonField(
//                     DashboardGroup.filterListCall
//                         .filter((_model.apiResult993?.jsonBody ?? ''))
//                         ?.elementAtOrNull(_model.filterIndex ?? 0),
//                     r'''$.description''',
//                   )?.toString() ?? '',
//                   textAlign: TextAlign.center,
//                   style: FlutterFlowTheme.of(context).titleMedium,
//                 ),
//               ),
//             // Main content area
//             if (!_model.isLoading)
//               Expanded(
//                 child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     // Left side - Filter categories
//                     Container(
//                       width: MediaQuery.sizeOf(context).width * 0.38,
//                       decoration: BoxDecoration(
//                         color: Theme.of(context).brightness == Brightness.dark
//                             ? FlutterFlowTheme.of(context).secondaryBackground
//                             : Color(0xFFF2F2F2),
//                       ),
//                       child: Builder(
//                         builder: (context) {
//                           final filterTitle = DashboardGroup.filterListCall
//                               .filter((_model.apiResult993?.jsonBody ?? ''))
//                               ?.toList() ??
//                               [];
//                           return ListView.separated(
//                             padding: EdgeInsets.symmetric(vertical: 8),
//                             itemCount: filterTitle.length,
//                             separatorBuilder: (_, __) => SizedBox(height: 1),
//                             itemBuilder: (context, filterTitleIndex) {
//                               final filterTitleItem = filterTitle[filterTitleIndex];
//                               final isSelected = _model.filterIndex == filterTitleIndex;
//                               return InkWell(
//                                 onTap: () => setState(() {
//                                   _model.filterIndex = filterTitleIndex;
//                                   _model.valueIndex = null;
//                                   _selectedFilterKey = null;
//                                   _selectedFilterItem = null;
//                                 }),
//                                 child: Container(
//                                   padding: EdgeInsets.symmetric(
//                                     horizontal: 16.0,
//                                     vertical: 12.0,
//                                   ),
//                                   decoration: BoxDecoration(
//                                     color: isSelected
//                                         ? FlutterFlowTheme.of(context).lightPeach
//                                         : Colors.transparent,
//                                   ),
//                                   child: Text(
//                                     getJsonField(filterTitleItem, r'''$.name''').toString(),
//                                     style: FlutterFlowTheme.of(context).titleMedium.override(
//                                       font: GoogleFonts.poppins(),
//                                       color: FlutterFlowTheme.of(context).tertiary,
//                                     ),
//                                   ),
//                                 ),
//                               );
//                             },
//                           );
//                         },
//                       ),
//                     ),
//                     // Right side - Values or Subcategories
//                     Expanded(
//                       child: Container(
//                         padding: EdgeInsets.only(left: 10),
//                         child: Builder(
//                           builder: (context) {
//                             if (_model.filterIndex == null) {
//                               return Center(
//                                 child: Text(
//                                   'Tap a category on the left to view options',
//                                   style: FlutterFlowTheme.of(context).bodyMedium,
//                                   textAlign: TextAlign.center,
//                                 ),
//                               );
//                             }
//
//                             if (_isStatsCategory) {
//                               // Build mutable list of category maps
//                               final categoryData = (getJsonField(
//                                 DashboardGroup.filterListCall
//                                     .filter((_model.apiResult993?.jsonBody ?? ''))
//                                     ?.elementAtOrNull(_model.filterIndex ?? 0),
//                                 r'''$.player_category_filters''',
//                               ) as List? ?? [])
//                                   .map((e) => Map<String, dynamic>.from(e as Map))
//                                   .toList();
//
//                               // Find base stats (first category with non-empty stats_categories)
//                               final baseStats = categoryData
//                                   .firstWhere(
//                                     (c) => (c['stats_categories'] is List) && (c['stats_categories'] as List).isNotEmpty,
//                                 orElse: () => {},
//                               )
//                                   .cast<String, dynamic>()["stats_categories"] as List?;
//
//                               // Clone stats into empty categories so each dropdown has items
//                               if (baseStats != null && baseStats.isNotEmpty) {
//                                 for (final cat in categoryData) {
//                                   final stats = cat['stats_categories'];
//                                   if (stats is List && stats.isEmpty) {
//                                     cat['stats_categories'] = baseStats
//                                         .map((s) => {
//                                       ...Map<String, dynamic>.from(s as Map),
//                                       'synthetic': true,
//                                     })
//                                         .toList();
//                                   }
//                                 }
//                               }
//
//                               return ListView.builder(
//                                 padding: EdgeInsets.symmetric(vertical: 8),
//                                 itemCount: categoryData.length,
//                                 itemBuilder: (context, index) {
//                                   final category = categoryData[index];
//                                   final stats = (category['stats_categories'] as List? ?? [])
//                                       .map((s) => Map<String, dynamic>.from(s as Map))
//                                       .toList();
//                                   return _buildStatsCategoryDropdown(
//                                     context: context,
//                                     index: index,
//                                     title: category['name']?.toString() ?? 'Category',
//                                     stats: stats,
//                                     category: category,
//                                   );
//                                 },
//                               );
//                             }
//
//                             // For non-stats categories, show the regular filter values list
//                             final valueItems = getJsonField(
//                               DashboardGroup.filterListCall
//                                   .filter((_model.apiResult993?.jsonBody ?? ''))
//                                   ?.elementAtOrNull(_model.filterIndex ?? 0),
//                               r'''$.player_category_filters''',
//                             )?.toList() ?? [];
//
//                             return ListView.builder(
//                               padding: EdgeInsets.symmetric(vertical: 8),
//                               itemCount: valueItems.length,
//                               itemBuilder: (context, index) {
//                                 final item = valueItems[index];
//                                 final isSelected = _model.valueIndex == index;
//                                 return InkWell(
//                                   onTap: () {
//                                     setState(() {
//                                       _model.valueIndex = index;
//                                       final groupName = getJsonField(
//                                         DashboardGroup.filterListCall
//                                             .filter((_model.apiResult993?.jsonBody ?? ''))!
//                                             .elementAt(_model.filterIndex ?? 0),
//                                         r'$.name',
//                                       ).toString();
//                                       _selectedFilterKey = _deriveFilterKey(groupName);
//                                       _selectedFilterItem =
//                                       Map<String, dynamic>.from(item is Map ? item : {});
//                                       _model.selectedTitle = getJsonField(item, r'$.name');
//                                     });
//                                   },
//                                   child: Container(
//                                     padding: EdgeInsets.all(12),
//                                     decoration: BoxDecoration(
//                                       color: FlutterFlowTheme.of(context).secondaryBackground,
//                                       border: Border.all(
//                                         color: Theme.of(context).brightness == Brightness.light
//                                             ? Color(0x1E000000)
//                                             : Color(0x1EFFFFFF),
//                                       ),
//                                     ),
//                                     child: Row(
//                                       children: [
//                                         Container(
//                                           width: 20,
//                                           height: 20,
//                                           decoration: BoxDecoration(
//                                             shape: BoxShape.circle,
//                                             border: Border.all(
//                                               color: FlutterFlowTheme.of(context).tertiary,
//                                             ),
//                                           ),
//                                           child: isSelected
//                                               ? Center(
//                                             child: Container(
//                                               width: 12,
//                                               height: 12,
//                                               decoration: BoxDecoration(
//                                                 shape: BoxShape.circle,
//                                                 color: FlutterFlowTheme.of(context).primary,
//                                               ),
//                                             ),
//                                           )
//                                               : null,
//                                         ),
//                                         SizedBox(width: 12),
//                                         Expanded(
//                                           child: Text(
//                                             getJsonField(item, r'''$.name''').toString(),
//                                             style: FlutterFlowTheme.of(context).labelMedium,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 );
//                               },
//                             );
//                           },
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             // Apply Filter button
//             Container(
//               width: double.infinity,
//               height: 60.0,
//               decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                   colors: [
//                     _selectedFilterKey != null &&
//                         (!_isStatsCategory || _selectedSeasonType != null)
//                         ? FlutterFlowTheme.of(context).peach
//                         : FlutterFlowTheme.of(context).peach.withOpacity(0.5),
//                     _selectedFilterKey != null &&
//                         (!_isStatsCategory || _selectedSeasonType != null)
//                         ? Color(0xFFE09B6E)
//                         : Color(0xFFE09B6E).withOpacity(0.5),
//                   ],
//                   stops: [0.0, 1.0],
//                   begin: AlignmentDirectional(0.0, -1.0),
//                   end: AlignmentDirectional(0, 1.0),
//                 ),
//               ),
//               child: Material(
//                 color: Colors.transparent,
//                 child: InkWell(
//                   onTap: (_selectedFilterKey != null &&
//                       (!_isStatsCategory || _selectedSeasonType != null))
//                       ? _submitSelectedFilter
//                       : null,
//                   child: Container(
//                     width: double.infinity,
//                     height: double.infinity,
//                     alignment: Alignment.center,
//                     child: Column(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         Text(
//                           'Apply Filter',
//                           style: FlutterFlowTheme.of(context).titleSmall.override(
//                             font: GoogleFonts.poppins(
//                               fontWeight: FontWeight.w500,
//                             ),
//                             color: Colors.white.withOpacity(
//                               (_selectedFilterKey != null &&
//                                   (!_isStatsCategory ||
//                                       _selectedSeasonType != null))
//                                   ? 1.0
//                                   : 0.7,
//                             ),
//                           ),
//                         ),
//                         if (_selectedFilterKey != null && _selectedFilterItem != null)
//                           Padding(
//                             padding: const EdgeInsets.only(top: 4.0),
//                             child: Text(
//                               _isStatsCategory && _selectedSeasonType != null
//                                   ? '${_selectedFilterItem?['name'] ?? _selectedFilterItem?['value']} - $_selectedSeasonType'
//                                   : _selectedFilterItem?['name'] ?? _selectedFilterItem?['value'] ?? '',
//                               style: FlutterFlowTheme.of(context).labelSmall.override(
//                                 font: GoogleFonts.poppins(),
//                                 color: Colors.white70,
//                               ),
//                               overflow: TextOverflow.ellipsis,
//                             ),
//                           ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   // Helper method to build expandable stats section
//   Widget _buildExpandableStatsSection(
//       BuildContext context,
//       String title,
//       List<dynamic> stats,
//       int sectionIndex,
//       ) {
//     if (stats.isEmpty) return SizedBox.shrink();
//
//     final isExpanded = _model.expandedIndex == sectionIndex;
//
//     return Column(
//       children: [
//         InkWell(
//           onTap: () {
//             setState(() {
//               _model.expandedIndex = isExpanded ? null : sectionIndex;
//             });
//           },
//           child: Container(
//             margin: EdgeInsets.only(bottom: isExpanded ? 0 : 8),
//             padding: EdgeInsets.all(12),
//             decoration: BoxDecoration(
//               color: FlutterFlowTheme.of(context).secondaryBackground,
//               borderRadius: BorderRadius.vertical(
//                 top: Radius.circular(8),
//                 bottom: Radius.circular(isExpanded ? 0 : 8),
//               ),
//               border: Border.all(
//                 color: FlutterFlowTheme.of(context).primary.withOpacity(0.3),
//               ),
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   title,
//                   style: FlutterFlowTheme.of(context).titleSmall.override(
//                     fontFamily: 'Poppins',
//                     color: FlutterFlowTheme.of(context).primary,
//                   ),
//                 ),
//                 Icon(
//                   isExpanded
//                       ? Icons.keyboard_arrow_up_rounded
//                       : Icons.keyboard_arrow_down_rounded,
//                   color: FlutterFlowTheme.of(context).primary,
//                 ),
//               ],
//             ),
//           ),
//         ),
//         if (isExpanded)
//           Container(
//             decoration: BoxDecoration(
//               border: Border.all(
//                 color: FlutterFlowTheme.of(context).primary.withOpacity(0.3),
//               ),
//               borderRadius: BorderRadius.vertical(
//                 bottom: Radius.circular(8),
//               ),
//             ),
//             margin: EdgeInsets.only(bottom: 8),
//             child: Column(
//               children: stats.map<Widget>((statItem) {
//                 final isSelected = _selectedFilterKey == 'stats_categories' &&
//                     _selectedFilterItem?['id'] == statItem['id'] &&
//                     _selectedSeasonType == title;
//
//                 return InkWell(
//                     onTap: () {
//                       setState(() {
//                         _selectedFilterKey = 'stats_categories';
//                         _selectedSeasonType = title;
//                         _selectedFilterItem = Map<String, dynamic>.from({
//                           ...statItem,
//                           'season_type': title,
//                         });
//                       });
//                     },
//                     child: Container(
//                       padding: EdgeInsets.all(12),
//                       decoration: BoxDecoration(
//                         color: isSelected
//                             ? FlutterFlowTheme.of(context).primary.withOpacity(0.1)
//                             : FlutterFlowTheme.of(context).secondaryBackground,
//                         border: Border(
//                           bottom: BorderSide(
//                             color: FlutterFlowTheme.of(context).primary.withOpacity(0.1),
//                           ),
//                         ),
//                       ),
//                       child: Row(
//                         children: [
//                           Container(
//                             width: 20,
//                             height: 20,
//                             decoration: BoxDecoration(
//                               shape: BoxShape.circle,
//                               border: Border.all(
//                                 color: isSelected
//                                     ? FlutterFlowTheme.of(context).primary
//                                     : FlutterFlowTheme.of(context).tertiary,
//                               ),
//                             ),
//                             child: isSelected
//                                 ? Center(
//                               child: Container(
//                                 width: 12,
//                                 height: 12,
//                                 decoration: BoxDecoration(
//                                   shape: BoxShape.circle,
//                                   color: FlutterFlowTheme.of(context).primary,
//                                 ),
//                               ),
//                             )
//                                 : null,
//                           ),
//                           SizedBox(width: 12),
//                           Expanded(
//                             child: Text(
//                               statItem['value']?.toString() ?? '',
//                               style: FlutterFlowTheme.of(context).bodyMedium.override(
//                                 fontFamily: 'Poppins',
//                                 color: isSelected
//                                     ? FlutterFlowTheme.of(context).primary
//                                     : FlutterFlowTheme.of(context).tertiary,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ));
//               }).toList(),
//             ),
//           ),
//       ],
//     );
//   }
//
//   Widget _buildStatsCategoryDropdown({
//     required BuildContext context,
//     required int index,
//     required String title,
//     required List<Map<String, dynamic>> stats,
//     required Map<String, dynamic> category,
//   }) {
//     final isExpanded = _model.expandedIndex == index;
//     final hasStats = stats.isNotEmpty;
//
//     return Container(
//       margin: EdgeInsets.only(bottom: 10),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(10),
//         border: Border.all(
//           color: FlutterFlowTheme.of(context).primary.withOpacity(0.25),
//         ),
//       ),
//       child: Column(
//         children: [
//           InkWell(
//             onTap: () {
//               setState(() => _model.expandedIndex = isExpanded ? null : index);
//             },
//             child: Container(
//               padding: EdgeInsets.symmetric(horizontal: 14, vertical: 14),
//               decoration: BoxDecoration(
//                 color: FlutterFlowTheme.of(context).secondaryBackground,
//                 borderRadius: BorderRadius.vertical(
//                   top: Radius.circular(10),
//                   bottom: Radius.circular(isExpanded ? 0 : 10),
//                 ),
//               ),
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: Text(
//                       title,
//                       style: FlutterFlowTheme.of(context).titleSmall.override(
//                         fontFamily: 'Poppins',
//                         // changed color from primary (orange) to tertiary to better match UI
//                         color: FlutterFlowTheme.of(context).tertiary,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                   ),
//                   // Removed stats length Text widget
//                   AnimatedRotation(
//                     turns: isExpanded ? 0.5 : 0,
//                     duration: Duration(milliseconds: 200),
//                     child: Icon(
//                       Icons.keyboard_arrow_down_rounded,
//                       // changed icon color to tertiary as well
//                       color: FlutterFlowTheme.of(context).tertiary,
//                       size: 24,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           if (isExpanded && hasStats)
//             Container(
//               width: double.infinity,
//               decoration: BoxDecoration(
//                 color: FlutterFlowTheme.of(context).secondaryBackground,
//                 borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
//               ),
//               padding: EdgeInsets.fromLTRB(10, 10, 10, 14),
//               child: _buildStatsGrid(context, stats, title),
//             ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildStatsGrid(BuildContext context, List<Map<String, dynamic>> stats, String seasonTitle) {
//     return LayoutBuilder(
//       builder: (context, constraints) {
//         final itemWidth = (constraints.maxWidth - 10) / 2; // spacing of 10 total
//         return Wrap(
//           spacing: 10,
//           runSpacing: 10,
//           children: stats.map((stat) {
//             final isSelected = _selectedFilterKey == 'stats_categories' &&
//                 _selectedFilterItem?['id'] == stat['id'] &&
//                 _selectedSeasonType == seasonTitle;
//             return SizedBox(
//                 width: itemWidth,
//                 child: InkWell(
//                   onTap: () {
//                     setState(() {
//                       _selectedFilterKey = 'stats_categories';
//                       _selectedSeasonType = seasonTitle;
//                       _selectedFilterItem = Map<String, dynamic>.from({
//                         ...stat,
//                         'season_type': seasonTitle,
//                       });
//                     });
//                   },
//                   borderRadius: BorderRadius.circular(8),
//                   child: AnimatedContainer(
//                     duration: Duration(milliseconds: 180),
//                     padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(8),
//                       color: isSelected
//                           ? FlutterFlowTheme.of(context).primary.withOpacity(0.12)
//                           : FlutterFlowTheme.of(context).secondaryBackground,
//                       border: Border.all(
//                         color: isSelected
//                             ? FlutterFlowTheme.of(context).primary
//                             : FlutterFlowTheme.of(context).primary.withOpacity(0.15),
//                       ),
//                     ),
//                     child: Row(
//                       children: [
//                         Container(
//                           width: 18,
//                           height: 18,
//                           decoration: BoxDecoration(
//                             shape: BoxShape.circle,
//                             border: Border.all(
//                               color: isSelected
//                                   ? FlutterFlowTheme.of(context).primary
//                                   : FlutterFlowTheme.of(context).tertiary,
//                             ),
//                           ),
//                           child: isSelected
//                               ? Center(
//                             child: Container(
//                               width: 10,
//                               height: 10,
//                               decoration: BoxDecoration(
//                                 shape: BoxShape.circle,
//                                 color: FlutterFlowTheme.of(context).primary,
//                               ),
//                             ),
//                           )
//                               : null,
//                         ),
//                         SizedBox(width: 8),
//                         Expanded(
//                           child: Text(
//                             stat['value']?.toString() ?? stat['name']?.toString() ?? '',
//                             maxLines: 1,
//                             overflow: TextOverflow.ellipsis,
//                             style: FlutterFlowTheme.of(context).bodyMedium.override(
//                               fontFamily: 'Poppins',
//                               color: isSelected
//                                   ? FlutterFlowTheme.of(context).primary
//                                   : FlutterFlowTheme.of(context).tertiary,
//                               fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ));
//           }).toList(),
//         );
//       },
//     );
//   }
// }







import '../../backend/api_requests/api_manager.dart';
import '/backend/api_requests/api_calls.dart'; // removed hide since ApiCallType not exported here
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';

// removed unused flutter_flow_widgets import
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'filter_screen_model.dart';
export 'filter_screen_model.dart';
import 'dart:convert';
import '../../filter/filter_result/filter_result_widget.dart';

class FilterScreenWidget extends StatefulWidget {
  const FilterScreenWidget({super.key});

  static String routeName = 'filterScreen';
  static String routePath = '/filterScreen';

  @override
  State<FilterScreenWidget> createState() => _FilterScreenWidgetState();
}

class _FilterScreenWidgetState extends State<FilterScreenWidget>
    with RouteAware {
  late FilterScreenModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  int? selectedSubcategoryIndex;
  String? _selectedFilterKey; // maps to API field key
  Map<String, dynamic>? _selectedFilterItem; // full selected item
  String? _selectedSeasonType; // Add this for stats dropdown

  final List<String> _seasonTypes = ['Regular Season', 'Playoffs', 'Finals'];

  // Helper to derive API key from filter group name
  String _deriveFilterKey(String name) {
    final lower = name.toLowerCase();
    if (lower.contains('title')) return 'titles';
    if (lower.contains('achievement')) return 'achievements';
    if (lower.contains('personal')) return 'personal_awards';
    if (lower.contains('greatness')) return 'other_greatness_facts';
    if (lower.contains('combine')) return 'combine_filters';
    if (lower.contains('stat')) return 'stats_categories';
    // fallback treat as titles
    return 'titles';
  }

  // Future<void> _submitSelectedFilter() async {
  //
  //   final selectedFilterText = _isStatsCategory && _selectedSeasonType != null
  //       ? '${_selectedFilterItem?['name'] ?? _selectedFilterItem?['value']} - $_selectedSeasonType'
  //       : _selectedFilterItem?['name'] ?? _selectedFilterItem?['value'] ?? '';
  //
  //
  //
  //   if (_selectedFilterKey == null || _selectedFilterItem == null) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(content: Text('Please select a filter value first.')),
  //     );
  //     return;
  //   }
  //   if (_selectedFilterKey == 'stats_categories' && _selectedSeasonType == null) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(content: Text('Please select a season type for stats.')),
  //     );
  //     return;
  //   }
  //
  //   // Build payload only; API call will be done on results screen now.
  //   final filters = <String, dynamic>{};
  //   if (_selectedFilterKey == 'stats_categories') {
  //     final fullStat = Map<String, dynamic>.from(_selectedFilterItem!);
  //     fullStat['season_type'] = _selectedSeasonType;
  //     fullStat.remove('synthetic');
  //     if (!fullStat.containsKey('value') && fullStat.containsKey('name')) {
  //       fullStat['value'] = fullStat['name'];
  //     }
  //     filters['stats_categories'] = [fullStat];
  //   } else {
  //     filters[_selectedFilterKey!] = _selectedFilterItem?['name'] ?? _selectedFilterItem?['value'] ?? '';
  //   }
  //   final payload = {'filters': filters};
  //   debugPrint('Navigating to results with filters payload: ' + const JsonEncoder.withIndent('  ').convert(payload));
  //   FFAppState().lastFilterPayloadJson = json.encode(payload);
  //   FFAppState().lastFilterType = _selectedFilterKey ?? '';
  //   context.pushNamed(
  //     FilteredResultsWidget.routeName,
  //     extra: {
  //       'filtersPayload': payload,
  //       'filterType': _selectedFilterKey,
  //       'selectedFilterText': selectedFilterText, // <-- add this line
  //
  //     },
  //   );
  // }



  ///2


  // Future<void> _submitSelectedFilter() async {
  //   if (_selectedFilterKey == null || _selectedFilterItem == null) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(content: Text('Please select a filter value first.')),
  //     );
  //     return;
  //   }
  //   if (_selectedFilterKey == 'stats_categories' && _selectedSeasonType == null) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(content: Text('Please select a season type for stats.')),
  //     );
  //     return;
  //   }
  //
  //   // Build payload only; API call will be done on results screen now.
  //   final filters = <String, dynamic>{};
  //   if (_selectedFilterKey == 'stats_categories') {
  //     // Create a simplified version of the stat with correct field names
  //     final statMap = {
  //       'stat_context_id': _selectedFilterItem?['id'] ?? 1,
  //       'stat_type': _selectedFilterItem?['value'] ?? _selectedFilterItem?['name'] ?? '',
  //     };
  //
  //     filters['stats_categories'] = [statMap];
  //   } else {
  //     filters[_selectedFilterKey!] = _selectedFilterItem?['name'] ?? _selectedFilterItem?['value'] ?? '';
  //   }
  //
  //   final payload = {'filters': filters};
  //   debugPrint('Navigating to results with filters payload: ' + const JsonEncoder.withIndent('  ').convert(payload));
  //   FFAppState().lastFilterPayloadJson = json.encode(payload);
  //   FFAppState().lastFilterType = _selectedFilterKey ?? '';
  //   context.pushNamed(
  //     FilteredResultsWidget.routeName,
  //     extra: {
  //       'filtersPayload': payload,
  //       'filterType': _selectedFilterKey,
  //     },
  //   );
  // }


  ///3
  // Future<void> _submitSelectedFilter() async {
  //   if (_selectedFilterKey == null || _selectedFilterItem == null) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(content: Text('Please select a filter value first.')),
  //     );
  //     return;
  //   }
  //   if (_selectedFilterKey == 'stats_categories' && _selectedSeasonType == null) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(content: Text('Please select a season type for stats.')),
  //     );
  //     return;
  //   }
  //
  //   // Get the description from the selected filter category
  //   final selectedFilterDescription = getJsonField(
  //     DashboardGroup.filterListCall
  //         .filter((_model.apiResult993?.jsonBody ?? ''))
  //         ?.elementAtOrNull(_model.filterIndex ?? 0),
  //     r'''$.description''',
  //   )?.toString() ?? '';
  //
  //   // Build selected filter text for display
  //   String selectedFilterText = '';
  //   if (_selectedFilterKey == 'stats_categories' && _selectedSeasonType != null) {
  //     selectedFilterText = '${_selectedFilterItem?['name'] ?? _selectedFilterItem?['value']} - $_selectedSeasonType';
  //   } else {
  //     selectedFilterText = _selectedFilterItem?['name'] ?? _selectedFilterItem?['value'] ?? '';
  //   }
  //
  //   // Build payload
  //   final filters = <String, dynamic>{};
  //   if (_selectedFilterKey == 'stats_categories') {
  //     final fullStat = Map<String, dynamic>.from(_selectedFilterItem!);
  //     fullStat['season_type'] = _selectedSeasonType;
  //     fullStat.remove('synthetic');
  //     if (!fullStat.containsKey('value') && fullStat.containsKey('name')) {
  //       fullStat['value'] = fullStat['name'];
  //     }
  //     filters['stats_categories'] = [fullStat];
  //   } else {
  //     filters[_selectedFilterKey!] = _selectedFilterItem?['name'] ?? _selectedFilterItem?['value'] ?? '';
  //   }
  //
  //   final payload = {'filters': filters};
  //   debugPrint('Navigating to results with filters payload: ' + const JsonEncoder.withIndent('  ').convert(payload));
  //
  //   FFAppState().lastFilterPayloadJson = json.encode(payload);
  //   FFAppState().lastFilterType = _selectedFilterKey ?? '';
  //
  //   context.pushNamed(
  //     FilteredResultsWidget.routeName,
  //     extra: {
  //       'filtersPayload': payload,
  //       'filterType': _selectedFilterKey,
  //       'selectedFilterText': selectedFilterText,
  //       'filterDescription': selectedFilterDescription, // Add this line
  //     },
  //   );
  // }




///4

  // Future<void> _submitSelectedFilter() async {
  //   if (_selectedFilterKey == null || _selectedFilterItem == null) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(content: Text('Please select a filter value first.')),
  //     );
  //     return;
  //   }
  //   if (_selectedFilterKey == 'stats_categories' && _selectedSeasonType == null) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(content: Text('Please select a season type for stats.')),
  //     );
  //     return;
  //   }
  //
  //   // Get the description from the selected filter category
  //   final selectedFilterDescription = getJsonField(
  //     DashboardGroup.filterListCall
  //         .filter((_model.apiResult993?.jsonBody ?? ''))
  //         ?.elementAtOrNull(_model.filterIndex ?? 0),
  //     r'''$.description''',
  //   )?.toString() ?? '';
  //
  //   // Build selected filter text for display
  //   String selectedFilterText = '';
  //   if (_selectedFilterKey == 'stats_categories' && _selectedSeasonType != null) {
  //     selectedFilterText = '${_selectedFilterItem?['name'] ?? _selectedFilterItem?['value']} - $_selectedSeasonType';
  //   } else {
  //     selectedFilterText = _selectedFilterItem?['name'] ?? _selectedFilterItem?['value'] ?? '';
  //   }
  //
  //   // Build payload
  //   final filters = <String, dynamic>{};
  //   if (_selectedFilterKey == 'stats_categories') {
  //     final fullStat = Map<String, dynamic>.from(_selectedFilterItem!);
  //     fullStat['season_type'] = _selectedSeasonType;
  //     fullStat.remove('synthetic');
  //     if (!fullStat.containsKey('value') && fullStat.containsKey('name')) {
  //       fullStat['value'] = fullStat['name'];
  //     }
  //     filters['stats_categories'] = [fullStat];
  //   } else {
  //     filters[_selectedFilterKey!] = _selectedFilterItem?['name'] ?? _selectedFilterItem?['value'] ?? '';
  //   }
  //
  //   final payload = {'filters': filters};
  //   print('Navigating to results with filters payload: ' + const JsonEncoder.withIndent('  ').convert(payload));
  //
  //   FFAppState().lastFilterPayloadJson = json.encode(payload);
  //   FFAppState().lastFilterType = _selectedFilterKey ?? '';
  //
  //   context.pushNamed(
  //     FilteredResultsWidget.routeName,
  //     extra: {
  //       'filtersPayload': payload,
  //       'filterType': _selectedFilterKey,
  //       'selectedFilterText': selectedFilterText,
  //       'filterDescription': selectedFilterDescription,
  //     },
  //   );
  // }


  ///5
  // Future<void> _submitSelectedFilter() async {
  //   if (_selectedFilterKey == null || _selectedFilterItem == null) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(content: Text('Please select a filter value first.')),
  //     );
  //     return;
  //   }
  //   if (_selectedFilterKey == 'stats_categories' && _selectedSeasonType == null) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(content: Text('Please select a season type for stats.')),
  //     );
  //     return;
  //   }
  //
  //   final selectedFilterDescription = getJsonField(
  //     DashboardGroup.filterListCall
  //         .filter((_model.apiResult993?.jsonBody ?? ''))
  //         ?.elementAtOrNull(_model.filterIndex ?? 0),
  //     r'''$.description''',
  //   )?.toString() ?? '';
  //
  //   String selectedFilterText = '';
  //   if (_selectedFilterKey == 'stats_categories' && _selectedSeasonType != null) {
  //     selectedFilterText = '${_selectedFilterItem?['name'] ?? _selectedFilterItem?['value']} - $_selectedSeasonType';
  //   } else {
  //     selectedFilterText = _selectedFilterItem?['name'] ?? _selectedFilterItem?['value'] ?? '';
  //   }
  //
  //   final filters = <String, dynamic>{};
  //   if (_selectedFilterKey == 'stats_categories') {
  //     filters['stats_categories'] = [
  //       {
  //         'stat_context_id': _selectedFilterItem?['id'],
  //         'stat_type': _selectedFilterItem?['value'],
  //       }
  //     ];
  //   } else {
  //     filters[_selectedFilterKey!] = _selectedFilterItem?['name'] ?? _selectedFilterItem?['value'] ?? '';
  //   }
  //
  //   final payload = {'filters': filters};
  //   print('Navigating to results with filters payload: ' + const JsonEncoder.withIndent('  ').convert(payload));
  //
  //   FFAppState().lastFilterPayloadJson = json.encode(payload);
  //   FFAppState().lastFilterType = _selectedFilterKey ?? '';
  //
  //   context.pushNamed(
  //     FilteredResultsWidget.routeName,
  //     extra: {
  //       'filtersPayload': payload,
  //       'filterType': _selectedFilterKey,
  //       'selectedFilterText': selectedFilterText,
  //       'filterDescription': selectedFilterDescription,
  //     },
  //   );
  // }

  ///
  int _seasonTypeToContextId(String? seasonType) {
    switch (seasonType) {
      case 'Regular Season':
        return 1;
      case 'Playoffs':
        return 2;
      case 'NBA Finals':
        return 3;
      default:
        return 0;
    }
  }

  Future<void> _submitSelectedFilter() async {
    if (_selectedFilterKey == null || _selectedFilterItem == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select a filter value first.')),
      );
      return;
    }
    if (_selectedFilterKey == 'stats_categories' && _selectedSeasonType == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select a season type for stats.')),
      );
      return;
    }

    final filters = <String, dynamic>{};
    if (_selectedFilterKey == 'stats_categories') {
      final statType = _selectedFilterItem?['value'] ?? _selectedFilterItem?['name'];
      final statContextId = _seasonTypeToContextId(_selectedSeasonType);
      filters['stats_categories'] = [
        {
          'stat_type': statType,
          'stat_context_id': statContextId,
        }
      ];
    } else {
      filters[_selectedFilterKey!] = _selectedFilterItem?['name'] ?? _selectedFilterItem?['value'] ?? '';
    }
    final payload = {'filters': filters};
    print('Navigating to results with filters payload: ' + const JsonEncoder.withIndent('  ').convert(payload));
    FFAppState().lastFilterPayloadJson = json.encode(payload);
    FFAppState().lastFilterType = _selectedFilterKey ?? '';
    context.pushNamed(
      FilteredResultsWidget.routeName,
      extra: {
        'filtersPayload': payload,
        'filterType': _selectedFilterKey,
      },
    );
  }

  ///

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FilterScreenModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.isLoading = true;
      safeSetState(() {});

      _model.apiResult993 = await DashboardGroup.filterListCall.call(
        authToken: FFAppState().authToken,
      );

      if ((_model.apiResult993?.succeeded ?? true)) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              getJsonField(
                (_model.apiResult993?.jsonBody ?? ''),
                r'''$.message''',
              ).toString(),
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            duration: Duration(milliseconds: 1500),
            backgroundColor: Colors.black,
          ),
        );

        final jsonBody = _model.apiResult993?.jsonBody ?? '';

        // Pre-select first category if data exists.
        final tempFilterTitle = DashboardGroup.filterListCall.filter(jsonBody)?.toList() ?? [];
        if (tempFilterTitle.isNotEmpty) {
          _model.filterIndex = 0;
        }

        _model.isLoading = false;
        safeSetState(() {});
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              getJsonField(
                (_model.apiResult993?.jsonBody ?? ''),
                r'''$.message''',
              ).toString(),
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            duration: Duration(milliseconds: 1500),
            backgroundColor: Colors.black,
          ),
        );
        _model.isLoading = false;
        safeSetState(() {});
      }
    });
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);

    _model.dispose();

    super.dispose();
  }

  @override
  void didUpdateWidget(FilterScreenWidget oldWidget) {
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

  // Add this helper method to determine if it's a stats category
  bool get _isStatsCategory {
    if (_model.filterIndex == null) return false;
    final groupName = getJsonField(
      DashboardGroup.filterListCall
          .filter((_model.apiResult993?.jsonBody ?? ''))
          ?.elementAtOrNull(_model.filterIndex ?? 0),
      r'$.name',
    )?.toString().toLowerCase() ?? '';
    return groupName.contains('stat');
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
        body: Column(
          children: [
            // Header section
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 40.0, 16.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Back button
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
                        borderRadius: BorderRadius.circular(12.0),
                        border: Border.all(
                          color: (Theme.of(context).brightness == Brightness.dark)
                              ? Color(0x00000000)
                              : Color(0xFF999999),
                        ),
                      ),
                      child: Icon(
                        Icons.arrow_back_rounded,
                        color: FlutterFlowTheme.of(context).tertiary,
                        size: 24.0,
                      ),
                    ),
                  ),
                  // Title
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'fil',
                        style: FlutterFlowTheme.of(context).customTextStyle1.override(
                          fontFamily: 'good times',
                          color: FlutterFlowTheme.of(context).tertiary,
                          fontSize: 28.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Text(
                        't',
                        style: FlutterFlowTheme.of(context).customTextStyle1.override(
                          fontFamily: 'good times',
                          color: Color(0xFFEB6027),
                          fontSize: 28.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Text(
                        'ers',
                        style: FlutterFlowTheme.of(context).customTextStyle1.override(
                          fontFamily: 'good times',
                          color: FlutterFlowTheme.of(context).tertiary,
                          fontSize: 28.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                  // Clear All button
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _selectedFilterKey = null;
                        _selectedFilterItem = null;
                        selectedSubcategoryIndex = null;
                        _model.valueIndex = null;
                        _model.selectedTitle = null;
                      });
                      debugPrint('Filter selections cleared');
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('All selections cleared.')),
                      );
                    },
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: Size(50, 30),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: Text(
                      'Clear All',
                      style: FlutterFlowTheme.of(context).titleLarge.override(
                        font: GoogleFonts.poppins(
                          fontWeight: FontWeight.normal,
                        ),
                        color: FlutterFlowTheme.of(context).peach,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Description text
            if (_model.filterIndex != null)
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
                child: Text(
                  getJsonField(
                    DashboardGroup.filterListCall
                        .filter((_model.apiResult993?.jsonBody ?? ''))
                        ?.elementAtOrNull(_model.filterIndex ?? 0),
                    r'''$.description''',
                  )?.toString() ?? '',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).titleMedium,
                ),
              ),
            // Main content area
            if (_model.isLoading)
              Expanded(
                child: Center(
                  child: SpinKitCubeGrid(
                    color: FlutterFlowTheme.of(context).primary,
                    size: 40.0,
                  ),
                ),
              )
            else
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Left side - Filter categories
                    Container(
                      width: MediaQuery.sizeOf(context).width * 0.38,
                      decoration: BoxDecoration(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? FlutterFlowTheme.of(context).secondaryBackground
                            : Color(0xFFF2F2F2),
                      ),
                      child: Builder(
                        builder: (context) {
                          final filterTitle = DashboardGroup.filterListCall
                              .filter((_model.apiResult993?.jsonBody ?? ''))
                              ?.toList() ??
                              [];
                          return ListView.separated(
                            padding: EdgeInsets.symmetric(vertical: 8),
                            itemCount: filterTitle.length,
                            separatorBuilder: (_, __) => SizedBox(height: 1),
                            itemBuilder: (context, filterTitleIndex) {
                              final filterTitleItem = filterTitle[filterTitleIndex];
                              final isSelected = _model.filterIndex == filterTitleIndex;
                              return InkWell(
                                onTap: () => setState(() {
                                  _model.filterIndex = filterTitleIndex;
                                  _model.valueIndex = null;
                                  _selectedFilterKey = null;
                                  _selectedFilterItem = null;
                                }),
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 16.0,
                                    vertical: 12.0,
                                  ),
                                  decoration: BoxDecoration(
                                    color: isSelected
                                        ? FlutterFlowTheme.of(context).lightPeach
                                        : Colors.transparent,
                                  ),
                                  child: Text(
                                    getJsonField(filterTitleItem, r'''$.name''').toString(),
                                    style: FlutterFlowTheme.of(context).titleMedium.override(
                                      font: GoogleFonts.poppins(),
                                      color: FlutterFlowTheme.of(context).tertiary,
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                    // Right side - Values or Subcategories
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(left: 10),
                        child: Builder(
                          builder: (context) {
                            if (_model.filterIndex == null) {
                              return Center(
                                child: Text(
                                  'Tap a category on the left to view options',
                                  style: FlutterFlowTheme.of(context).bodyMedium,
                                  textAlign: TextAlign.center,
                                ),
                              );
                            }

                            if (_isStatsCategory) {
                              // Build mutable list of category maps
                              final categoryData = (getJsonField(
                                DashboardGroup.filterListCall
                                    .filter((_model.apiResult993?.jsonBody ?? ''))
                                    ?.elementAtOrNull(_model.filterIndex ?? 0),
                                r'''$.player_category_filters''',
                              ) as List? ?? [])
                                  .map((e) => Map<String, dynamic>.from(e as Map))
                                  .toList();

                              // Find base stats (first category with non-empty stats_categories)
                              final baseStats = categoryData
                                  .firstWhere(
                                    (c) => (c['stats_categories'] is List) && (c['stats_categories'] as List).isNotEmpty,
                                orElse: () => {},
                              )
                                  .cast<String, dynamic>()["stats_categories"] as List?;

                              // Clone stats into empty categories so each dropdown has items
                              if (baseStats != null && baseStats.isNotEmpty) {
                                for (final cat in categoryData) {
                                  final stats = cat['stats_categories'];
                                  if (stats is List && stats.isEmpty) {
                                    cat['stats_categories'] = baseStats
                                        .map((s) => {
                                      ...Map<String, dynamic>.from(s as Map),
                                      'synthetic': true,
                                    })
                                        .toList();
                                  }
                                }
                              }

                              return ListView.builder(
                                padding: EdgeInsets.symmetric(vertical: 8),
                                itemCount: categoryData.length,
                                itemBuilder: (context, index) {
                                  final category = categoryData[index];
                                  final stats = (category['stats_categories'] as List? ?? [])
                                      .map((s) => Map<String, dynamic>.from(s as Map))
                                      .toList();
                                  return _buildStatsCategoryDropdown(
                                    context: context,
                                    index: index,
                                    title: category['name']?.toString() ?? 'Category',
                                    stats: stats,
                                    category: category,
                                  );
                                },
                              );
                            }

                            // For non-stats categories, show the regular filter values list
                            final valueItems = getJsonField(
                              DashboardGroup.filterListCall
                                  .filter((_model.apiResult993?.jsonBody ?? ''))
                                  ?.elementAtOrNull(_model.filterIndex ?? 0),
                              r'''$.player_category_filters''',
                            )?.toList() ?? [];

                            return ListView.builder(
                              padding: EdgeInsets.symmetric(vertical: 8),
                              itemCount: valueItems.length,
                              itemBuilder: (context, index) {
                                final item = valueItems[index];
                                final isSelected = _model.valueIndex == index;
                                return InkWell(
                                  onTap: () {
                                    setState(() {
                                      _model.valueIndex = index;
                                      final groupName = getJsonField(
                                        DashboardGroup.filterListCall
                                            .filter((_model.apiResult993?.jsonBody ?? ''))!
                                            .elementAt(_model.filterIndex ?? 0),
                                        r'$.name',
                                      ).toString();
                                      _selectedFilterKey = _deriveFilterKey(groupName);
                                      _selectedFilterItem =
                                      Map<String, dynamic>.from(item is Map ? item : {});
                                      _model.selectedTitle = getJsonField(item, r'$.name');
                                    });
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                      border: Border.all(
                                        color: Theme.of(context).brightness == Brightness.light
                                            ? Color(0x1E000000)
                                            : Color(0x1EFFFFFF),
                                      ),
                                    ),
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 20,
                                          height: 20,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: FlutterFlowTheme.of(context).tertiary,
                                            ),
                                          ),
                                          child: isSelected
                                              ? Center(
                                            child: Container(
                                              width: 12,
                                              height: 12,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: FlutterFlowTheme.of(context).primary,
                                              ),
                                            ),
                                          )
                                              : null,
                                        ),
                                        SizedBox(width: 12),
                                        Expanded(
                                          child: Text(
                                            getJsonField(item, r'''$.name''').toString(),
                                            style: FlutterFlowTheme.of(context).labelMedium,
                                          ),
                                        ),
                                      ],
                                    ),
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
              ),
            // Apply Filter button
            Container(
              width: double.infinity,
              height: 60.0,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    _selectedFilterKey != null &&
                        (!_isStatsCategory || _selectedSeasonType != null)
                        ? FlutterFlowTheme.of(context).peach
                        : FlutterFlowTheme.of(context).peach.withOpacity(0.5),
                    _selectedFilterKey != null &&
                        (!_isStatsCategory || _selectedSeasonType != null)
                        ? Color(0xFFE09B6E)
                        : Color(0xFFE09B6E).withOpacity(0.5),
                  ],
                  stops: [0.0, 1.0],
                  begin: AlignmentDirectional(0.0, -1.0),
                  end: AlignmentDirectional(0, 1.0),
                ),
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: (_selectedFilterKey != null &&
                      (!_isStatsCategory || _selectedSeasonType != null))
                      ? _submitSelectedFilter
                      : null,
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Apply Filter',
                          style: FlutterFlowTheme.of(context).titleSmall.override(
                            font: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                            ),
                            color: Colors.white.withOpacity(
                              (_selectedFilterKey != null &&
                                  (!_isStatsCategory ||
                                      _selectedSeasonType != null))
                                  ? 1.0
                                  : 0.7,
                            ),
                          ),
                        ),
                        // if (_selectedFilterKey != null && _selectedFilterItem != null)
                          // Padding(
                          //   padding: const EdgeInsets.only(top: 4.0),
                          //   child: Text(
                          //     _isStatsCategory && _selectedSeasonType != null
                          //         ? '${_selectedFilterItem?['name'] ?? _selectedFilterItem?['value']} - $_selectedSeasonType'
                          //         : _selectedFilterItem?['name'] ?? _selectedFilterItem?['value'] ?? '',
                          //     style: FlutterFlowTheme.of(context).labelSmall.override(
                          //       font: GoogleFonts.poppins(),
                          //       color: Colors.white70,
                          //     ),
                          //     overflow: TextOverflow.ellipsis,
                          //   ),
                          // ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to build expandable stats section
  Widget _buildExpandableStatsSection(
      BuildContext context,
      String title,
      List<dynamic> stats,
      int sectionIndex,
      ) {
    if (stats.isEmpty) return SizedBox.shrink();

    final isExpanded = _model.expandedIndex == sectionIndex;

    return Column(
      children: [
        InkWell(
          onTap: () {
            setState(() {
              _model.expandedIndex = isExpanded ? null : sectionIndex;
            });
          },
          child: Container(
            margin: EdgeInsets.only(bottom: isExpanded ? 0 : 8),
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(8),
                bottom: Radius.circular(isExpanded ? 0 : 8),
              ),
              border: Border.all(
                color: FlutterFlowTheme.of(context).primary.withOpacity(0.3),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: FlutterFlowTheme.of(context).titleSmall.override(
                    fontFamily: 'Poppins',
                    color: FlutterFlowTheme.of(context).primary,
                  ),
                ),
                Icon(
                  isExpanded
                      ? Icons.keyboard_arrow_up_rounded
                      : Icons.keyboard_arrow_down_rounded,
                  color: FlutterFlowTheme.of(context).primary,
                ),
              ],
            ),
          ),
        ),
        if (isExpanded)
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: FlutterFlowTheme.of(context).primary.withOpacity(0.3),
              ),
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(8),
              ),
            ),
            margin: EdgeInsets.only(bottom: 8),
            child: Column(
              children: stats.map<Widget>((statItem) {
                final isSelected = _selectedFilterKey == 'stats_categories' &&
                    _selectedFilterItem?['id'] == statItem['id'] &&
                    _selectedSeasonType == title;

                return InkWell(
                    onTap: () {
                      setState(() {
                        _selectedFilterKey = 'stats_categories';
                        _selectedSeasonType = title;
                        _selectedFilterItem = Map<String, dynamic>.from({
                          ...statItem,
                          'season_type': title,
                        });
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? FlutterFlowTheme.of(context).primary.withOpacity(0.1)
                            : FlutterFlowTheme.of(context).secondaryBackground,
                        border: Border(
                          bottom: BorderSide(
                            color: FlutterFlowTheme.of(context).primary.withOpacity(0.1),
                          ),
                        ),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: isSelected
                                    ? FlutterFlowTheme.of(context).primary
                                    : FlutterFlowTheme.of(context).tertiary,
                              ),
                            ),
                            child: isSelected
                                ? Center(
                              child: Container(
                                width: 12,
                                height: 12,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                            )
                                : null,
                          ),
                          SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              statItem['value']?.toString() ?? '',
                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                fontFamily: 'Poppins',
                                color: isSelected
                                    ? FlutterFlowTheme.of(context).primary
                                    : FlutterFlowTheme.of(context).tertiary,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ));
              }).toList(),
            ),
          ),
      ],
    );
  }

  Widget _buildStatsCategoryDropdown({
    required BuildContext context,
    required int index,
    required String title,
    required List<Map<String, dynamic>> stats,
    required Map<String, dynamic> category,
  }) {
    final isExpanded = _model.expandedIndex == index;
    final hasStats = stats.isNotEmpty;

    return Container(
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: FlutterFlowTheme.of(context).primary.withOpacity(0.25),
        ),
      ),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              setState(() => _model.expandedIndex = isExpanded ? null : index);
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 14, vertical: 14),
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(10),
                  bottom: Radius.circular(isExpanded ? 0 : 10),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      title,
                      style: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Poppins',
                        // changed color from primary (orange) to tertiary to better match UI
                        color: FlutterFlowTheme.of(context).tertiary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  // Removed stats length Text widget
                  AnimatedRotation(
                    turns: isExpanded ? 0.5 : 0,
                    duration: Duration(milliseconds: 200),
                    child: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      // changed icon color to tertiary as well
                      color: FlutterFlowTheme.of(context).tertiary,
                      size: 24,
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (isExpanded && hasStats)
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
              ),
              padding: EdgeInsets.fromLTRB(10, 10, 10, 14),
              child: _buildStatsGrid(context, stats, title),
            ),
        ],
      ),
    );
  }

  Widget _buildStatsGrid(BuildContext context, List<Map<String, dynamic>> stats, String seasonTitle) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final itemWidth = (constraints.maxWidth - 10) / 2; // spacing of 10 total
        return Wrap(
          spacing: 10,
          runSpacing: 10,
          children: stats.map((stat) {
            final isSelected = _selectedFilterKey == 'stats_categories' &&
                _selectedFilterItem?['id'] == stat['id'] &&
                _selectedSeasonType == seasonTitle;
            return SizedBox(
                width: itemWidth,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      _selectedFilterKey = 'stats_categories';
                      _selectedSeasonType = seasonTitle;
                      _selectedFilterItem = Map<String, dynamic>.from({
                        ...stat,
                        'season_type': seasonTitle,
                      });
                    });
                  },
                  borderRadius: BorderRadius.circular(8),
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 180),
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: isSelected
                          ? FlutterFlowTheme.of(context).primary.withOpacity(0.12)
                          : FlutterFlowTheme.of(context).secondaryBackground,
                      border: Border.all(
                        color: isSelected
                            ? FlutterFlowTheme.of(context).primary
                            : FlutterFlowTheme.of(context).primary.withOpacity(0.15),
                      ),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 18,
                          height: 18,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: isSelected
                                  ? FlutterFlowTheme.of(context).primary
                                  : FlutterFlowTheme.of(context).tertiary,
                            ),
                          ),
                          child: isSelected
                              ? Center(
                            child: Container(
                              width: 10,
                              height: 10,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: FlutterFlowTheme.of(context).primary,
                              ),
                            ),
                          )
                              : null,
                        ),
                        SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            stat['value']?.toString() ?? stat['name']?.toString() ?? '',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Poppins',
                              color: isSelected
                                  ? FlutterFlowTheme.of(context).primary
                                  : FlutterFlowTheme.of(context).tertiary,
                              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ));
          }).toList(),
        );
      },
    );
  }
}