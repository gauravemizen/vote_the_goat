import '/components/gradient_button_custom/gradient_button_custom_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'my_profile_widget.dart' show MyProfileWidget;
import 'package:flutter/material.dart';

class MyProfileModel extends FlutterFlowModel<MyProfileWidget> {
  ///  State fields for stateful widgets in this page.

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
  late bool passwordFieldVisibility;
  String? Function(BuildContext, String?)? passwordFieldTextControllerValidator;
  // Model for gradientButtonCustom component.
  late GradientButtonCustomModel gradientButtonCustomModel;

  @override
  void initState(BuildContext context) {
    passwordFieldVisibility = false;
    gradientButtonCustomModel =
        createModel(context, () => GradientButtonCustomModel());
  }

  @override
  void dispose() {
    emailFIeldFocusNode1?.dispose();
    emailFIeldTextController1?.dispose();

    emailFIeldFocusNode2?.dispose();
    emailFIeldTextController2?.dispose();

    passwordFieldFocusNode?.dispose();
    passwordFieldTextController?.dispose();

    gradientButtonCustomModel.dispose();
  }
}
