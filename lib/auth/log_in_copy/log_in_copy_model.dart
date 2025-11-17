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
  bool? _checkboxValue;
  set checkboxValue(bool? value) {
    _checkboxValue = value;
    debugLogWidgetClass(this);
  }

  bool? get checkboxValue => _checkboxValue;

  // Model for gradientButtonCustom component.
  late GradientButtonCustomModel gradientButtonCustomModel;

  final Map<String, DebugDataField> debugGeneratorVariables = {};
  final Map<String, DebugDataField> debugBackendQueries = {};
  final Map<String, FlutterFlowModel> widgetBuilderComponents = {};
  @override
  void initState(BuildContext context) {
    passwordFiedVisibility = false;
    gradientButtonCustomModel =
        createModel(context, () => GradientButtonCustomModel());

    debugLogWidgetClass(this);
  }

  @override
  void dispose() {
    emailFieldFocusNode?.dispose();
    emailFieldTextController?.dispose();

    passwordFiedFocusNode?.dispose();
    passwordFiedTextController?.dispose();

    gradientButtonCustomModel.dispose();
  }

  @override
  WidgetClassDebugData toWidgetClassDebugData() => WidgetClassDebugData(
        widgetStates: {
          'emailFieldText': debugSerializeParam(
            emailFieldTextController?.text,
            ParamType.String,
            link:
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=logInCopy',
            name: 'String',
            nullable: true,
          ),
          'passwordFiedText': debugSerializeParam(
            passwordFiedTextController?.text,
            ParamType.String,
            link:
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=logInCopy',
            name: 'String',
            nullable: true,
          ),
          'checkboxValue': debugSerializeParam(
            checkboxValue,
            ParamType.bool,
            link:
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=logInCopy',
            name: 'bool',
            nullable: true,
          )
        },
        generatorVariables: debugGeneratorVariables,
        backendQueries: debugBackendQueries,
        componentStates: {
          'gradientButtonCustomModel (gradientButtonCustom)':
              gradientButtonCustomModel.toWidgetClassDebugData(),
          ...widgetBuilderComponents.map(
            (key, value) => MapEntry(
              key,
              value.toWidgetClassDebugData(),
            ),
          ),
        }.withoutNulls,
        link:
            'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r/tab=uiBuilder&page=logInCopy',
        searchReference: 'reference=Oglsb2dJbkNvcHlQAVoJbG9nSW5Db3B5',
        widgetClassName: 'logInCopy',
      );
}
