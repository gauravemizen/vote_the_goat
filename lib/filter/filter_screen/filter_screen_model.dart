import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'filter_screen_widget.dart' show FilterScreenWidget;
import 'package:flutter/material.dart';

class FilterScreenModel extends FlutterFlowModel<FilterScreenWidget> {
  ///  Local state fields for this page.

  bool isLoading = false;

  int? filterIndex = 0;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (filterList)] action in filterScreen widget.
  ApiCallResponse? apiResult993;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
