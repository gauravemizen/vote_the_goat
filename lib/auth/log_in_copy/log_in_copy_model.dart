import '/components/gradient_button_custom/gradient_button_custom_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'log_in_copy_widget.dart' show LogInCopyWidget;
import 'package:flutter/material.dart';

class LogInCopyModel extends FlutterFlowModel<LogInCopyWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for emailField widget.
  FocusNode? emailFieldFocusNode;
  TextEditingController? emailFieldTextController;
  String? Function(BuildContext, String?)? emailFieldTextControllerValidator;
  // State field(s) for passwordFied widget.
  FocusNode? passwordFiedFocusNode;
  TextEditingController? passwordFiedTextController;
  late bool passwordFiedVisibility;
  String? Function(BuildContext, String?)? passwordFiedTextControllerValidator;
  // State field(s) for Checkbox widget.
  bool? checkboxValue;
  // Model for gradientButtonCustom component.
  late GradientButtonCustomModel gradientButtonCustomModel;

  @override
  void initState(BuildContext context) {
    passwordFiedVisibility = false;
    gradientButtonCustomModel =
        createModel(context, () => GradientButtonCustomModel());
  }

  @override
  void dispose() {
    emailFieldFocusNode?.dispose();
    emailFieldTextController?.dispose();

    passwordFiedFocusNode?.dispose();
    passwordFiedTextController?.dispose();

    gradientButtonCustomModel.dispose();
  }
}
