import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'forgot_password_widget.dart' show ForgotPasswordWidget;
import 'package:flutter/material.dart';

class ForgotPasswordModel extends FlutterFlowModel<ForgotPasswordWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for mail widget.
  FocusNode? mailFocusNode;
  TextEditingController? mailTextController;
  String? Function(BuildContext, String?)? mailTextControllerValidator;
  String? _mailTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Email field is required';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Has to be a valid email address.';
    }
    return null;
  }

  // Stores action output result for [Validate Form] action in Button widget.
  bool? validate;
  // Stores action output result for [Backend Call - API (forgotPassword)] action in Button widget.
  ApiCallResponse? forgotmailResponse;

  @override
  void initState(BuildContext context) {
    mailTextControllerValidator = _mailTextControllerValidator;
  }

  @override
  void dispose() {
    mailFocusNode?.dispose();
    mailTextController?.dispose();
  }
}
