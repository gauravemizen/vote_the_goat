// import '/flutter_flow/flutter_flow_util.dart';
// import '/components/button_small/button_small_widget.dart';
// import 'resume_to_match_players_widget.dart' show ResumeToMatchPlayersWidget;
// import 'package:flutter/material.dart';
//
// class ResumeToMatchPlayersModel extends FlutterFlowModel<ResumeToMatchPlayersWidget> {
//   ///  Local state fields for this page.
//
//   bool isRouteVisible = false;
//
//   ///  State fields for stateful widgets in this page.
//
//   // Model for buttonSmall component.
//   late ButtonSmallModel buttonSmallModel;
//
//   @override
//   void initState(BuildContext context) {
//     buttonSmallModel = createModel(context, () => ButtonSmallModel());
//   }
//
//   @override
//   void dispose() {
//     buttonSmallModel.dispose();
//   }
// }


import '/flutter_flow/flutter_flow_util.dart';
import '/components/button_small/button_small_widget.dart';
import 'resume_to_match_players_widget.dart' show ResumeToMatchPlayersWidget;
import 'package:flutter/material.dart';

class ResumeToMatchPlayersModel extends FlutterFlowModel<ResumeToMatchPlayersWidget> {
  ///  Local state fields for this page.

  final bool _isRouteVisible = false;

  @override
  bool get isRouteVisible => _isRouteVisible;

  @override
  // set isRouteVisible(bool value) => _isRouteVisible = value;


  ///  State fields for stateful widgets in this page.

  // Model for buttonSmall component.
  late ButtonSmallModel buttonSmallModel;

  @override
  void initState(BuildContext context) {
    buttonSmallModel = createModel(context, () => ButtonSmallModel());
  }

  @override
  void dispose() {
    buttonSmallModel.dispose();
  }
}
