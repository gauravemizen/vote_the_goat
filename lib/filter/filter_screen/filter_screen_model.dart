import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'filter_screen_widget.dart' show FilterScreenWidget;
import 'package:flutter/material.dart';

class FilterScreenModel extends FlutterFlowModel<FilterScreenWidget> {
  ///  Local state fields for this page.

  bool isLoading = false;

  int? filterIndex = 0;

  int? valueIndex;

  List<dynamic> filterData = [];
  void addToFilterData(dynamic item) => filterData.add(item);
  void removeFromFilterData(dynamic item) => filterData.remove(item);
  void removeAtIndexFromFilterData(int index) => filterData.removeAt(index);
  void insertAtIndexInFilterData(int index, dynamic item) =>
      filterData.insert(index, item);
  void updateFilterDataAtIndex(int index, Function(dynamic) updateFn) =>
      filterData[index] = updateFn(filterData[index]);

  String? selectedTitle;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (filterList)] action in filterScreen widget.
  ApiCallResponse? apiResult993;
  // Stores action output result for [Backend Call - API (filterplayers)] action in applyFilterBtn widget.
  ApiCallResponse? filterResult;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
