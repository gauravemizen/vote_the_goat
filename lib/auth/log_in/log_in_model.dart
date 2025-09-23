import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'log_in_widget.dart' show LogInWidget;
import 'package:flutter/material.dart';

class LogInModel extends FlutterFlowModel<LogInWidget> {
  ///  Local state fields for this page.

  bool isLoading = false;

  String deviceToken = '000';

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Custom Action - getFcmToken] action in logIn widget.
  String? fcmToken;
  // State field(s) for emailField widget.
  FocusNode? emailFieldFocusNode;
  TextEditingController? emailFieldTextController;
  String? Function(BuildContext, String?)? emailFieldTextControllerValidator;
  String? _emailFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Email is required';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Enter  a valid email address';
    }
    return null;
  }

  // State field(s) for passwordFied widget.
  FocusNode? passwordFiedFocusNode;
  TextEditingController? passwordFiedTextController;
  late bool passwordFiedVisibility;
  String? Function(BuildContext, String?)? passwordFiedTextControllerValidator;
  String? _passwordFiedTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Password is required';
    }

    if (!RegExp('^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[\\W_]).{8,}\$')
        .hasMatch(val)) {
      return 'Password must be 8+ chars with uppercase, lowercase, number & symbol';
    }
    return null;
  }

  // State field(s) for Checkbox widget.
  bool? checkboxValue;
  // Stores action output result for [Validate Form] action in Button widget.
  bool? validate;
  // Stores action output result for [Backend Call - API (logIn)] action in Button widget.
  ApiCallResponse? logInRes;
  // Stores action output result for [Backend Call - API (sociallogin)] action in Container widget.
  ApiCallResponse? appleLogin;
  // Stores action output result for [Backend Call - API (sociallogin)] action in Container widget.
  ApiCallResponse? socialRes;
  // Stores action output result for [Backend Call - API (sociallogin)] action in Container widget.
  ApiCallResponse? googleLogIn;

  @override
  void initState(BuildContext context) {
    emailFieldTextControllerValidator = _emailFieldTextControllerValidator;
    passwordFiedVisibility = false;
    passwordFiedTextControllerValidator = _passwordFiedTextControllerValidator;
  }

  @override
  void dispose() {
    emailFieldFocusNode?.dispose();
    emailFieldTextController?.dispose();

    passwordFiedFocusNode?.dispose();
    passwordFiedTextController?.dispose();
  }
}
