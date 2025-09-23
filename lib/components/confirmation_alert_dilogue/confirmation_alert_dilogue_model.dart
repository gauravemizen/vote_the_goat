import '/components/confirm_dilogue/confirm_dilogue_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'confirmation_alert_dilogue_widget.dart'
    show ConfirmationAlertDilogueWidget;
import 'package:flutter/material.dart';

class ConfirmationAlertDilogueModel
    extends FlutterFlowModel<ConfirmationAlertDilogueWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for confirmDilogue.
  late ConfirmDilogueModel confirmDilogueModel;

  @override
  void initState(BuildContext context) {
    confirmDilogueModel = createModel(context, () => ConfirmDilogueModel());
  }

  @override
  void dispose() {
    confirmDilogueModel.dispose();
  }
}
