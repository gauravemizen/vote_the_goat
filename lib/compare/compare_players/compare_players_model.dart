import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'compare_players_widget.dart' show ComparePlayersWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class ComparePlayersModel extends FlutterFlowModel<ComparePlayersWidget> {
  ///  Local state fields for this page.

  bool viewAlert = false;

  int winPlayer = 0;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (compareplayers)] action in ComparePlayers widget.
  ApiCallResponse? apiResultnyq;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // Stores action output result for [Backend Call - API (comparisonList)] action in Button widget.
  ApiCallResponse? apiResult3as;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController1;

  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController2;

  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController3;

  // Stores action output result for [Backend Call - API (comparison)] action in Button widget.
  ApiCallResponse? apiResult4bh1;
  // Stores action output result for [Backend Call - API (comparison)] action in Button widget.
  ApiCallResponse? apiResult4bh;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
    expandableExpandableController1.dispose();
    expandableExpandableController2.dispose();
    expandableExpandableController3.dispose();
  }
}
