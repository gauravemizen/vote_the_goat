import '/components/gradient_button_custom/gradient_button_custom_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'match_playerss_widget.dart' show MatchPlayerssWidget;
import 'package:flutter/material.dart';

class MatchPlayerssModel extends FlutterFlowModel<MatchPlayerssWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for gradientButtonCustom component.
  late GradientButtonCustomModel gradientButtonCustomModel;

  @override
  void initState(BuildContext context) {
    gradientButtonCustomModel =
        createModel(context, () => GradientButtonCustomModel());
  }

  @override
  void dispose() {
    gradientButtonCustomModel.dispose();
  }
}
