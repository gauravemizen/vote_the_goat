import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'contest_page_widget.dart' show ContestPageWidget;
import 'package:flutter/material.dart';

class ContestPageModel extends FlutterFlowModel<ContestPageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for searchContest widget.
  FocusNode? searchContestFocusNode;
  TextEditingController? searchContestTextController;
  String? Function(BuildContext, String?)? searchContestTextControllerValidator;
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
}
