import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'your_comparisons_widget.dart' show YourComparisonsWidget;
import 'package:flutter/material.dart';

class YourComparisonsModel extends FlutterFlowModel<YourComparisonsWidget> {
  ///  Local state fields for this page.

  bool isLoading = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (comparisonList)] action in YourComparisons widget.
  ApiCallResponse? apiResultpzb;
  // Stores action output result for [Backend Call - API (applyranking)] action in Button widget.
  ApiCallResponse? apiResulthzz;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
