import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'player_bio_widget.dart' show PlayerBioWidget;
import 'package:flutter/material.dart';

class PlayerBioModel extends FlutterFlowModel<PlayerBioWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (playertBio)] action in playerBio widget.
  ApiCallResponse? apiResultwyv;
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
    tabBarController?.dispose();
  }
}
