import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'contest_page_widget.dart' show ContestPageWidget;
import 'dart:async';
import 'package:flutter/material.dart';

class ContestPageModel extends FlutterFlowModel<ContestPageWidget> {
  ///  Local state fields for this page.

  bool isLoading = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (completedContest)] action in ContestPage widget.
  ApiCallResponse? completedContestRes;
  // State field(s) for searchContest widget.
  FocusNode? searchContestFocusNode;
  TextEditingController? searchContestTextController;
  String? Function(BuildContext, String?)? searchContestTextControllerValidator;
  Completer<ApiCallResponse>? apiRequestCompleter;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    searchContestFocusNode?.dispose();
    searchContestTextController?.dispose();

    tabBarController?.dispose();
  }

  /// Additional helper methods.
  Future waitForApiRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
