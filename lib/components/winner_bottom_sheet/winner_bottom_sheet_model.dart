import '/components/gradient_button_custom/gradient_button_custom_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'winner_bottom_sheet_widget.dart' show WinnerBottomSheetWidget;
import 'package:flutter/material.dart';

class WinnerBottomSheetModel extends FlutterFlowModel<WinnerBottomSheetWidget> {
  ///  State fields for stateful widgets in this component.

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
