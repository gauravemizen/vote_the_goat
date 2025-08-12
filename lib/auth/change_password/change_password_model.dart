import '/backend/api_requests/api_calls.dart';
import '/components/gradient_button_custom/gradient_button_custom_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'change_password_widget.dart' show ChangePasswordWidget;
import 'package:flutter/material.dart';

class ChangePasswordModel extends FlutterFlowModel<ChangePasswordWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for passwordField widget.
  FocusNode? passwordFieldFocusNode;
  TextEditingController? passwordFieldTextController;
  late bool passwordFieldVisibility;
  String? Function(BuildContext, String?)? passwordFieldTextControllerValidator;
  // State field(s) for coPasswordField widget.
  FocusNode? coPasswordFieldFocusNode;
  TextEditingController? coPasswordFieldTextController;
  late bool coPasswordFieldVisibility;
  String? Function(BuildContext, String?)?
      coPasswordFieldTextControllerValidator;
  // Model for gradientButtonCustom component.
  late GradientButtonCustomModel gradientButtonCustomModel;
  // Stores action output result for [Backend Call - API (changePassword)] action in gradientButtonCustom widget.
  ApiCallResponse? apiResultm02;

  @override
  void initState(BuildContext context) {
    passwordFieldVisibility = false;
    coPasswordFieldVisibility = false;
    gradientButtonCustomModel =
        createModel(context, () => GradientButtonCustomModel());
  }

  @override
  void dispose() {
    passwordFieldFocusNode?.dispose();
    passwordFieldTextController?.dispose();

    coPasswordFieldFocusNode?.dispose();
    coPasswordFieldTextController?.dispose();

    gradientButtonCustomModel.dispose();
  }
}
