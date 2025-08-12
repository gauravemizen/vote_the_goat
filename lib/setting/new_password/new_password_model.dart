import '/components/gradient_button_custom/gradient_button_custom_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'new_password_widget.dart' show NewPasswordWidget;
import 'package:flutter/material.dart';

class NewPasswordModel extends FlutterFlowModel<NewPasswordWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for passwordField widget.
  FocusNode? passwordFieldFocusNode1;
  TextEditingController? passwordFieldTextController1;
  late bool passwordFieldVisibility1;
  String? Function(BuildContext, String?)?
      passwordFieldTextController1Validator;
  // State field(s) for passwordField widget.
  FocusNode? passwordFieldFocusNode2;
  TextEditingController? passwordFieldTextController2;
  late bool passwordFieldVisibility2;
  String? Function(BuildContext, String?)?
      passwordFieldTextController2Validator;
  // State field(s) for passwordField widget.
  FocusNode? passwordFieldFocusNode3;
  TextEditingController? passwordFieldTextController3;
  late bool passwordFieldVisibility3;
  String? Function(BuildContext, String?)?
      passwordFieldTextController3Validator;
  // Model for gradientButtonCustom component.
  late GradientButtonCustomModel gradientButtonCustomModel;

  @override
  void initState(BuildContext context) {
    passwordFieldVisibility1 = false;
    passwordFieldVisibility2 = false;
    passwordFieldVisibility3 = false;
    gradientButtonCustomModel =
        createModel(context, () => GradientButtonCustomModel());
  }

  @override
  void dispose() {
    passwordFieldFocusNode1?.dispose();
    passwordFieldTextController1?.dispose();

    passwordFieldFocusNode2?.dispose();
    passwordFieldTextController2?.dispose();

    passwordFieldFocusNode3?.dispose();
    passwordFieldTextController3?.dispose();

    gradientButtonCustomModel.dispose();
  }
}
