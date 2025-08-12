import '/backend/api_requests/api_calls.dart';
import '/components/gradient_button_custom/gradient_button_custom_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'reset_password_widget.dart' show ResetPasswordWidget;
import 'package:flutter/material.dart';

class ResetPasswordModel extends FlutterFlowModel<ResetPasswordWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for oldPassword widget.
  FocusNode? oldPasswordFocusNode;
  TextEditingController? oldPasswordTextController;
  late bool oldPasswordVisibility;
  String? Function(BuildContext, String?)? oldPasswordTextControllerValidator;
  String? _oldPasswordTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Current Password is required';
    }

    if (!RegExp('^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[\\W_]).{8,}\$')
        .hasMatch(val)) {
      return 'Password must be 8+ chars with uppercase, lowercase, number & symbol';
    }
    return null;
  }

  // State field(s) for newPass widget.
  FocusNode? newPassFocusNode;
  TextEditingController? newPassTextController;
  late bool newPassVisibility;
  String? Function(BuildContext, String?)? newPassTextControllerValidator;
  String? _newPassTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'New Password is required';
    }

    if (!RegExp('^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[\\W_]).{8,}\$')
        .hasMatch(val)) {
      return 'Password must be 8+ chars with uppercase, lowercase, number & symbol';
    }
    return null;
  }

  // State field(s) for coPasswordField widget.
  FocusNode? coPasswordFieldFocusNode;
  TextEditingController? coPasswordFieldTextController;
  late bool coPasswordFieldVisibility;
  String? Function(BuildContext, String?)?
      coPasswordFieldTextControllerValidator;
  String? _coPasswordFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Confirm New Password is required';
    }

    if (!RegExp('^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[\\W_]).{8,}\$')
        .hasMatch(val)) {
      return 'Password must be 8+ chars with uppercase, lowercase, number & symbol';
    }
    return null;
  }

  // Model for gradientButtonCustom component.
  late GradientButtonCustomModel gradientButtonCustomModel;
  // Stores action output result for [Validate Form] action in gradientButtonCustom widget.
  bool? validate;
  // Stores action output result for [Backend Call - API (resetPass)] action in gradientButtonCustom widget.
  ApiCallResponse? apiResultb20;

  @override
  void initState(BuildContext context) {
    oldPasswordVisibility = false;
    oldPasswordTextControllerValidator = _oldPasswordTextControllerValidator;
    newPassVisibility = false;
    newPassTextControllerValidator = _newPassTextControllerValidator;
    coPasswordFieldVisibility = false;
    coPasswordFieldTextControllerValidator =
        _coPasswordFieldTextControllerValidator;
    gradientButtonCustomModel =
        createModel(context, () => GradientButtonCustomModel());
  }

  @override
  void dispose() {
    oldPasswordFocusNode?.dispose();
    oldPasswordTextController?.dispose();

    newPassFocusNode?.dispose();
    newPassTextController?.dispose();

    coPasswordFieldFocusNode?.dispose();
    coPasswordFieldTextController?.dispose();

    gradientButtonCustomModel.dispose();
  }
}
