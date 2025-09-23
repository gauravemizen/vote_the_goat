import '/backend/api_requests/api_calls.dart';
import '/components/gradient_button_custom/gradient_button_custom_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'match_playerss_widget.dart' show MatchPlayerssWidget;
import 'package:flutter/material.dart';

class MatchPlayerssModel extends FlutterFlowModel<MatchPlayerssWidget> {
  ///  Local state fields for this page.

  bool isLoading = false;

  int questionIndex = 0;

  int? questionNo = 1;

  int? selectedIndex = -1;

  int? selectedPlayerId;

  bool isTapped = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (matchPlayers)] action in MatchPlayerss widget.
  ApiCallResponse? matchMinionRes;
  // Model for gradientButtonCustom component.
  late GradientButtonCustomModel gradientButtonCustomModel;
  // Stores action output result for [Backend Call - API (submitMinion)] action in gradientButtonCustom widget.
  ApiCallResponse? apiResultyli;
  // Stores action output result for [Backend Call - API (autoAssociate)] action in Button widget.
  ApiCallResponse? autoAssociateRes;

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
