import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'my_profile_copy_widget.dart' show MyProfileCopyWidget;
import 'package:flutter/material.dart';

class MyProfileCopyModel extends FlutterFlowModel<MyProfileCopyWidget> {
  ///  Local state fields for this page.

  bool isLoading = false;

  ///  State fields for stateful widgets in this page.

  final formKey2 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - API (getProfile)] action in MyProfileCopy widget.
  ApiCallResponse? getProfileRes;
  // State field(s) for nameField widget.
  FocusNode? nameFieldFocusNode;
  TextEditingController? nameFieldTextController;
  String? Function(BuildContext, String?)? nameFieldTextControllerValidator;
  // State field(s) for emailFIeld widget.
  FocusNode? emailFIeldFocusNode;
  TextEditingController? emailFIeldTextController;
  String? Function(BuildContext, String?)? emailFIeldTextControllerValidator;
  // Stores action output result for [Backend Call - API (updateProfile)] action in Button widget.
  ApiCallResponse? apiResultz40;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    nameFieldFocusNode?.dispose();
    nameFieldTextController?.dispose();

    emailFIeldFocusNode?.dispose();
    emailFIeldTextController?.dispose();
  }
}
