library;

import '../../subscription/ad_service.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '../../subscription/smart_interstitial_manager.dart';

import '/flutter_flow/flutter_flow_util.dart';
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
  String? _selectedFilterKey;
  Map<String, dynamic>? _selectedFilterItem;
  String? _selectedSeasonType;

  // Multiple selection tracking for combine filters
  final Set<int> _selectedCombineIndices = {};
  final List<Map<String, dynamic>> _selectedCombineItems = [];

  // Helper to check if current category is combine filter
  bool _isCombineCategory() {
    if (_model.filterIndex == null) return false;
    final groupName = getJsonField(
          DashboardGroup.filterListCall
              .filter((_model.apiResult993?.jsonBody ?? ''))
              ?.elementAtOrNull(_model.filterIndex ?? 0),
          r'$.name',
        )?.toString().toLowerCase() ??
        '';
    return groupName.contains('combine');
  }

  String _deriveFilterKey(String name) {
    final lower = name.toLowerCase();
    if (lower.contains('title')) return 'titles';
    if (lower.contains('achievement')) return 'achievements';
    if (lower.contains('personal')) return 'personal_awards';
    if (lower.contains('greatness')) return 'other_greatness_facts';
    if (lower.contains('combine')) return 'combine_filters';
    if (lower.contains('stat')) return 'stats_categories';
    return 'titles';
  }

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
    // Check for combine filters
    if (_isCombineCategory()) {
      if (_selectedCombineItems.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('Please select at least one combine filter.')),
        );
        return;
      }
    } else {
      if (_selectedFilterKey == null || _selectedFilterItem == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please select a filter value first.')),
        );
        return;
      }
      if (_selectedFilterKey == 'stats_categories' &&
          _selectedSeasonType == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('Please select a season type for stats.')),
        );
        return;
      }
    }

    final selectedFilterDescription = getJsonField(
          DashboardGroup.filterListCall
              .filter((_model.apiResult993?.jsonBody ?? ''))
              ?.elementAtOrNull(_model.filterIndex ?? 0),
          r'''$.description''',
        )?.toString() ??
        '';

    final filters = <String, dynamic>{};

    if (_isCombineCategory()) {
      // Handle multiple combine selections - join with commas
      final combineValues = _selectedCombineItems
          .map((item) =>
              item['name']?.toString() ?? item['value']?.toString() ?? '')
          .where((value) => value.isNotEmpty)
          .join(', ');
      filters[_selectedFilterKey!] = combineValues;
    } else if (_selectedFilterKey == 'stats_categories') {
      final statType =
          _selectedFilterItem?['value'] ?? _selectedFilterItem?['name'];
      final statContextId = _seasonTypeToContextId(_selectedSeasonType);
      filters['stats_categories'] = [
        {
          'stat_type': statType,
          'stat_context_id': statContextId,
        }
      ];
    } else {
      filters[_selectedFilterKey!] =
          _selectedFilterItem?['name'] ?? _selectedFilterItem?['value'] ?? '';
    }

    final payload = {'filters': filters};
    print(
        'Navigating to results with filters payload: ${const JsonEncoder.withIndent('  ').convert(payload)}');

    FFAppState().lastFilterPayloadJson = json.encode(payload);
    FFAppState().lastFilterType = _selectedFilterKey ?? '';

    context.pushNamed(
      FilteredResultsWidget.routeName,
      extra: {
        'filtersPayload': payload,
        'filterType': _selectedFilterKey,
        'filterDescription': selectedFilterDescription,
      },
    );

    // selectedFilterKey = null;
    _selectedFilterItem = null;
    selectedSubcategoryIndex = null;
    _model.valueIndex = null;
    _model.selectedTitle = null;
    _selectedCombineIndices.clear();
    _selectedCombineItems.clear();
    _selectedSeasonType = null;
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FilterScreenModel());

    SchedulerBinding.instance.addPostFrameCallback((_) async {
      AdService().startPageTimer('eligiblePlayers');

      // Preload interstitial ad (will check subscription status internally)
      await SmartInterstitialManager().preloadInterstitial();

      // Only show ad if still mounted and ads are enabled
      if (mounted && FFAppState().advertisementStatus != 0) {
        await SmartInterstitialManager().showInterstitialIfAllowed();
      }

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
              style: const TextStyle(color: Colors.white),
            ),
            duration: const Duration(milliseconds: 1500),
            backgroundColor: Colors.black,
          ),
        );

        final jsonBody = _model.apiResult993?.jsonBody ?? '';
        final tempFilterTitle =
            DashboardGroup.filterListCall.filter(jsonBody)?.toList() ?? [];
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
              style: const TextStyle(color: Colors.white),
            ),
            duration: const Duration(milliseconds: 1500),
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
    AdService().stopInterstitialTimer();

    routeObserver.unsubscribe(this);
    _model.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(FilterScreenWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    _model.widget = widget;
    // Restart timer when widget updates
    AdService().startPageTimer('filterScreen');
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

// Start timer when page is pushed
      AdService().startPageTimer('filterScreen');
      debugLogWidgetClass(_model);
    }
  }

  @override
  void didPush() {
    if (mounted && DebugFlutterFlowModelContext.maybeOf(context) == null) {
      setState(() => _model.isRouteVisible = true);

      AdService().startPageTimer('filterScreen');

      debugLogWidgetClass(_model);
    }
  }

  @override
  void didPop() {
    _model.isRouteVisible = false;

    AdService().stopInterstitialTimer();

  }

  @override
  void didPushNext() {

    AdService().stopInterstitialTimer();

    _model.isRouteVisible = false;
  }

  bool get _isStatsCategory {
    if (_model.filterIndex == null) return false;
    final groupName = getJsonField(
          DashboardGroup.filterListCall
              .filter((_model.apiResult993?.jsonBody ?? ''))
              ?.elementAtOrNull(_model.filterIndex ?? 0),
          r'$.name',
        )?.toString().toLowerCase() ??
        '';
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
        body: SafeArea(top: false,
          bottom: true,
          child: Column(
            children: [
              // Header section
              Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(16.0, 40.0, 16.0, 0.0),
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
                            color:
                                (Theme.of(context).brightness == Brightness.dark)
                                    ? const Color(0x00000000)
                                    : const Color(0xFF999999),
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
                          style: FlutterFlowTheme.of(context)
                              .customTextStyle1
                              .override(
                                fontFamily: 'good times',
                                color: FlutterFlowTheme.of(context).tertiary,
                                fontSize: 28.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.normal,
                              ),
                        ),
                        Text(
                          't',
                          style: FlutterFlowTheme.of(context)
                              .customTextStyle1
                              .override(
                                fontFamily: 'good times',
                                color: const Color(0xFFEB6027),
                                fontSize: 28.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.normal,
                              ),
                        ),
                        Text(
                          'ers',
                          style: FlutterFlowTheme.of(context)
                              .customTextStyle1
                              .override(
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
                          _selectedCombineIndices.clear();
                          _selectedCombineItems.clear();
                          _selectedSeasonType = null;
                        });
                        debugPrint('Filter selections cleared');
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('All selections cleared.')),
                        );
                      },
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: const Size(50, 30),
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
                  padding: const EdgeInsetsDirectional.fromSTEB(
                      16.0, 16.0, 16.0, 16.0),
                  child: Text(
                    getJsonField(
                          DashboardGroup.filterListCall
                              .filter((_model.apiResult993?.jsonBody ?? ''))
                              ?.elementAtOrNull(_model.filterIndex ?? 0),
                          r'''$.description''',
                        )?.toString() ??
                        '',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).titleMedium,
                  ),
                ),
              // Main content area with LOADER
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
                              : const Color(0xFFF2F2F2),
                        ),
                        child: Builder(
                          builder: (context) {
                            final filterTitle = DashboardGroup.filterListCall
                                    .filter((_model.apiResult993?.jsonBody ?? ''))
                                    ?.toList() ??
                                [];
                            return ListView.separated(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              itemCount: filterTitle.length,
                              separatorBuilder: (_, __) =>
                                  const SizedBox(height: 1),
                              itemBuilder: (context, filterTitleIndex) {
                                final filterTitleItem =
                                    filterTitle[filterTitleIndex];
                                final isSelected =
                                    _model.filterIndex == filterTitleIndex;
                                return InkWell(
                                  // onTap: () => setState(() {
                                  //   _model.filterIndex = filterTitleIndex;
                                  //   _model.valueIndex = null;
                                  //   _selectedFilterKey = null;
                                  //   _selectedFilterItem = null;
                                  //   _selectedCombineIndices.clear();
                                  //   _selectedCombineItems.clear();
                                  //   _selectedSeasonType = null;
                                  // }),
                                  ///2
                                  onTap: () => setState(() {
                                    if (_model.filterIndex != filterTitleIndex) {
                                      // Only clear selections when switching to a different category
                                      _model.filterIndex = filterTitleIndex;
                                      _model.valueIndex = null;
                                      _selectedFilterKey = null;
                                      _selectedFilterItem = null;
                                      // _selectedCombineFilters.clear();
                                      _selectedCombineItems.clear();
                                    }
                                    // If same category, do nothing (preserve selections)
                                  }),
          
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0,
                                      vertical: 12.0,
                                    ),
                                    decoration: BoxDecoration(
                                      color: isSelected
                                          ? FlutterFlowTheme.of(context)
                                              .lightPeach
                                          : Colors.transparent,
                                    ),
                                    child: Text(
                                      getJsonField(filterTitleItem, r'''$.name''')
                                          .toString(),
                                      style: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .override(
                                            font: GoogleFonts.poppins(),
                                            color: FlutterFlowTheme.of(context)
                                                .tertiary,
                                          ),
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                      // Right side - Values
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.only(left: 10),
                          child: Builder(
                            builder: (context) {
                              if (_model.filterIndex == null) {
                                return Center(
                                  child: Text(
                                    'Tap a category on the left to view options',
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                    textAlign: TextAlign.center,
                                  ),
                                );
                              }
          
                              if (_isStatsCategory) {
                                // Stats category handling
                                final categoryData = (getJsonField(
                                          DashboardGroup.filterListCall
                                              .filter((_model
                                                      .apiResult993?.jsonBody ??
                                                  ''))
                                              ?.elementAtOrNull(
                                                  _model.filterIndex ?? 0),
                                          r'''$.player_category_filters''',
                                        ) as List? ??
                                        [])
                                    .map((e) =>
                                        Map<String, dynamic>.from(e as Map))
                                    .toList();
          
                                final baseStats = categoryData
                                        .firstWhere(
                                          (c) =>
                                              (c['stats_categories'] is List) &&
                                              (c['stats_categories'] as List)
                                                  .isNotEmpty,
                                          orElse: () => {},
                                        )
                                        .cast<String, dynamic>()[
                                    "stats_categories"] as List?;
          
                                if (baseStats != null && baseStats.isNotEmpty) {
                                  for (final cat in categoryData) {
                                    final stats = cat['stats_categories'];
                                    if (stats is List && stats.isEmpty) {
                                      cat['stats_categories'] = baseStats
                                          .map((s) => {
                                                ...Map<String, dynamic>.from(
                                                    s as Map),
                                                'synthetic': true,
                                              })
                                          .toList();
                                    }
                                  }
                                }
          
                                return ListView.builder(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8),
                                  itemCount: categoryData.length,
                                  itemBuilder: (context, index) {
                                    final category = categoryData[index];
                                    final stats = (category['stats_categories']
                                                as List? ??
                                            [])
                                        .map((s) =>
                                            Map<String, dynamic>.from(s as Map))
                                        .toList();
                                    return _buildStatsCategoryDropdown(
                                      context: context,
                                      index: index,
                                      title: category['name']?.toString() ??
                                          'Category',
                                      stats: stats,
                                      category: category,
                                    );
                                  },
                                );
                              }
          
                              // Regular filter values list
                              final valueItems = getJsonField(
                                    DashboardGroup.filterListCall
                                        .filter(
                                            (_model.apiResult993?.jsonBody ?? ''))
                                        ?.elementAtOrNull(
                                            _model.filterIndex ?? 0),
                                    r'''$.player_category_filters''',
                                  )?.toList() ??
                                  [];
          
                              final isCombine = _isCombineCategory();
          
                              return ListView.builder(
                                padding: const EdgeInsets.symmetric(vertical: 8),
                                itemCount: valueItems.length,
                                itemBuilder: (context, index) {
                                  final item = valueItems[index];
                                  final isSelected = isCombine
                                      ? _selectedCombineIndices.contains(index)
                                      : _model.valueIndex == index;
          
                                  return InkWell(
                                    onTap: () {
                                      setState(() {
                                        final groupName = getJsonField(
                                          DashboardGroup.filterListCall
                                              .filter((_model
                                                      .apiResult993?.jsonBody ??
                                                  ''))!
                                              .elementAt(_model.filterIndex ?? 0),
                                          r'$.name',
                                        ).toString();
                                        _selectedFilterKey =
                                            _deriveFilterKey(groupName);
          
                                        if (isCombine) {
                                          // Handle multiple selection for combine filters
                                          final itemMap =
                                              Map<String, dynamic>.from(
                                                  item is Map ? item : {});
          
                                          if (_selectedCombineIndices
                                              .contains(index)) {
                                            _selectedCombineIndices.remove(index);
                                            _selectedCombineItems.removeWhere(
                                                (selectedItem) =>
                                                    selectedItem['name'] ==
                                                        itemMap['name'] ||
                                                    selectedItem['value'] ==
                                                        itemMap['value']);
                                          } else {
                                            _selectedCombineIndices.add(index);
                                            _selectedCombineItems.add(itemMap);
                                          }
                                        } else {
                                          // Handle single selection for other filters
                                          _model.valueIndex = index;
                                          _selectedFilterItem =
                                              Map<String, dynamic>.from(
                                                  item is Map ? item : {});
                                          _model.selectedTitle =
                                              getJsonField(item, r'$.name');
                                        }
                                      });
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(12),
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        border: Border.all(
                                          color: Theme.of(context).brightness ==
                                                  Brightness.light
                                              ? const Color(0x1E000000)
                                              : const Color(0x1EFFFFFF),
                                        ),
                                      ),
                                      child: Row(
                                        children: [
                                          Container(
                                            width: 20,
                                            height: 20,
                                            decoration: BoxDecoration(
                                              shape: isCombine
                                                  ? BoxShape.rectangle
                                                  : BoxShape.circle,
                                              borderRadius: isCombine
                                                  ? BorderRadius.circular(4)
                                                  : null,
                                              border: Border.all(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .tertiary,
                                              ),
                                            ),
                                            child: isSelected
                                                ? Center(
                                                    child: isCombine
                                                        ? Icon(
                                                            Icons.check,
                                                            size: 14,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                          )
                                                        : Container(
                                                            width: 12,
                                                            height: 12,
                                                            decoration:
                                                                BoxDecoration(
                                                              shape:
                                                                  BoxShape.circle,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                            ),
                                                          ),
                                                  )
                                                : null,
                                          ),
                                          const SizedBox(width: 12),
                                          Expanded(
                                            child: Text(
                                              getJsonField(item, r'''$.name''')
                                                  .toString(),
                                              style: FlutterFlowTheme.of(context)
                                                  .labelMedium,
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
                      (_selectedFilterKey != null &&
                              ((!_isStatsCategory && !_isCombineCategory()) ||
                                  (_isStatsCategory &&
                                      _selectedSeasonType != null) ||
                                  (_isCombineCategory() &&
                                      _selectedCombineItems.isNotEmpty)))
                          ? FlutterFlowTheme.of(context).peach
                          : FlutterFlowTheme.of(context).peach.withOpacity(0.5),
                      (_selectedFilterKey != null &&
                              ((!_isStatsCategory && !_isCombineCategory()) ||
                                  (_isStatsCategory &&
                                      _selectedSeasonType != null) ||
                                  (_isCombineCategory() &&
                                      _selectedCombineItems.isNotEmpty)))
                          ? const Color(0xFFE09B6E)
                          : const Color(0xFFE09B6E).withOpacity(0.5),
                    ],
                    stops: const [0.0, 1.0],
                    begin: const AlignmentDirectional(0.0, -1.0),
                    end: const AlignmentDirectional(0, 1.0),
                  ),
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: (_selectedFilterKey != null &&
                            ((!_isStatsCategory && !_isCombineCategory()) ||
                                (_isStatsCategory &&
                                    _selectedSeasonType != null) ||
                                (_isCombineCategory() &&
                                    _selectedCombineItems.isNotEmpty)))
                        ? _submitSelectedFilter
                        : null,
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 6.0),
                            child: Text(
                              'Apply Filter',
                              style: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    font: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                    ),
                                    color: Colors.white.withOpacity(
                                      (_selectedFilterKey != null &&
                                              ((!_isStatsCategory &&
                                                      !_isCombineCategory()) ||
                                                  (_isStatsCategory &&
                                                      _selectedSeasonType !=
                                                          null) ||
                                                  (_isCombineCategory() &&
                                                      _selectedCombineItems
                                                          .isNotEmpty)))
                                          ? 1.0
                                          : 0.7,
                                    ),
                                  ),
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
        ),
      ),
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
      margin: const EdgeInsets.only(bottom: 10),
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
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                borderRadius: BorderRadius.vertical(
                  top: const Radius.circular(10),
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
                            color: FlutterFlowTheme.of(context).tertiary,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
                  AnimatedRotation(
                    turns: isExpanded ? 0.5 : 0,
                    duration: const Duration(milliseconds: 200),
                    child: Icon(
                      Icons.keyboard_arrow_down_rounded,
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
                borderRadius:
                    const BorderRadius.vertical(bottom: Radius.circular(10)),
              ),
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 14),
              child: _buildStatsGrid(context, stats, title),
            ),
        ],
      ),
    );
  }

  Widget _buildStatsGrid(BuildContext context, List<Map<String, dynamic>> stats,
      String seasonTitle) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // final itemWidth = (constraints.maxWidth - 10) / 2;
        final itemWidth = (constraints.maxWidth - 10) / 1;
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
                    duration: const Duration(milliseconds: 180),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: isSelected
                          ? FlutterFlowTheme.of(context)
                              .primary
                              .withOpacity(0.12)
                          : FlutterFlowTheme.of(context).secondaryBackground,
                      border: Border.all(
                        color: isSelected
                            ? FlutterFlowTheme.of(context).primary
                            : FlutterFlowTheme.of(context)
                                .primary
                                .withOpacity(0.15),
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
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                    ),
                                  ),
                                )
                              : null,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            stat['value']?.toString() ??
                                stat['name']?.toString() ??
                                '',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Poppins',
                                  color: isSelected
                                      ? FlutterFlowTheme.of(context).primary
                                      : FlutterFlowTheme.of(context).tertiary,
                                  fontWeight: isSelected
                                      ? FontWeight.w600
                                      : FontWeight.w400,
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
