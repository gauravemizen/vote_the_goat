import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'my_profile_copy_widget.dart' show MyProfileCopyWidget;
import 'package:flutter/material.dart';

class MyProfileCopyModel extends FlutterFlowModel<MyProfileCopyWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey3 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - API (getProfile)] action in MyProfileCopy widget.
  ApiCallResponse? getProfileRes;
  // State field(s) for emailFIeld widget.
  FocusNode? emailFIeldFocusNode1;
  TextEditingController? emailFIeldTextController1;
  String? Function(BuildContext, String?)? emailFIeldTextController1Validator;
  // State field(s) for emailFIeld widget.
  FocusNode? emailFIeldFocusNode2;
  TextEditingController? emailFIeldTextController2;
  String? Function(BuildContext, String?)? emailFIeldTextController2Validator;
  // State field(s) for passwordField widget.
  FocusNode? passwordFieldFocusNode;
  TextEditingController? passwordFieldTextController;
  String? Function(BuildContext, String?)? passwordFieldTextControllerValidator;
  // Stores action output result for [Backend Call - API (updateProfile)] action in Button widget.
  ApiCallResponse? apiResultz40;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    emailFIeldFocusNode1?.dispose();
    emailFIeldTextController1?.dispose();

    emailFIeldFocusNode2?.dispose();
    emailFIeldTextController2?.dispose();

    passwordFieldFocusNode?.dispose();
    passwordFieldTextController?.dispose();
  }
}
