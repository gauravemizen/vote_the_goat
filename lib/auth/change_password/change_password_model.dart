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
  ApiCallResponse? _apiResultm02;
  set apiResultm02(ApiCallResponse? value) {
    _apiResultm02 = value;
    debugLogWidgetClass(this);
  }

  ApiCallResponse? get apiResultm02 => _apiResultm02;

  final Map<String, DebugDataField> debugGeneratorVariables = {};
  final Map<String, DebugDataField> debugBackendQueries = {};
  final Map<String, FlutterFlowModel> widgetBuilderComponents = {};
  @override
  void initState(BuildContext context) {
    passwordFieldVisibility = false;
    coPasswordFieldVisibility = false;
    gradientButtonCustomModel =
        createModel(context, () => GradientButtonCustomModel());

    debugLogWidgetClass(this);
  }

  @override
  void dispose() {
    passwordFieldFocusNode?.dispose();
    passwordFieldTextController?.dispose();

    coPasswordFieldFocusNode?.dispose();
    coPasswordFieldTextController?.dispose();

    gradientButtonCustomModel.dispose();
  }

  @override
  WidgetClassDebugData toWidgetClassDebugData() => WidgetClassDebugData(
        widgetParameters: {
          'userId': debugSerializeParam(
            widget?.userId,
            ParamType.int,
            link:
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=changePassword',
            searchReference:
                'reference=ShgKEAoGdXNlcklkEgZhbGxycnlyBAgBIAFQAVoGdXNlcklk',
            name: 'int',
            nullable: true,
          )
        }.withoutNulls,
        widgetStates: {
          'passwordFieldText': debugSerializeParam(
            passwordFieldTextController?.text,
            ParamType.String,
            link:
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=changePassword',
            name: 'String',
            nullable: true,
          ),
          'coPasswordFieldText': debugSerializeParam(
            coPasswordFieldTextController?.text,
            ParamType.String,
            link:
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=changePassword',
            name: 'String',
            nullable: true,
          )
        },
        actionOutputs: {
          'apiResultm02': debugSerializeParam(
            apiResultm02,
            ParamType.ApiResponse,
            link:
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=changePassword',
            name: 'ApiCallResponse',
            nullable: true,
          )
        },
        generatorVariables: debugGeneratorVariables,
        backendQueries: debugBackendQueries,
        componentStates: {
          'gradientButtonCustomModel (gradientButtonCustom)':
              gradientButtonCustomModel?.toWidgetClassDebugData(),
          ...widgetBuilderComponents.map(
            (key, value) => MapEntry(
              key,
              value.toWidgetClassDebugData(),
            ),
          ),
        }.withoutNulls,
        link:
            'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r/tab=uiBuilder&page=changePassword',
        searchReference:
            'reference=Og5jaGFuZ2VQYXNzd29yZFABWg5jaGFuZ2VQYXNzd29yZA==',
        widgetClassName: 'changePassword',
      );
}
