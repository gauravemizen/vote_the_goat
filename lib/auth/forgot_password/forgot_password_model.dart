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
  bool? _validate;
  set validate(bool? value) {
    _validate = value;
    debugLogWidgetClass(this);
  }

  bool? get validate => _validate;

  // Stores action output result for [Backend Call - API (forgotPassword)] action in Button widget.
  ApiCallResponse? _forgotmailResponse;
  set forgotmailResponse(ApiCallResponse? value) {
    _forgotmailResponse = value;
    debugLogWidgetClass(this);
  }

  ApiCallResponse? get forgotmailResponse => _forgotmailResponse;

  final Map<String, DebugDataField> debugGeneratorVariables = {};
  final Map<String, DebugDataField> debugBackendQueries = {};
  final Map<String, FlutterFlowModel> widgetBuilderComponents = {};
  @override
  void initState(BuildContext context) {
    mailTextControllerValidator = _mailTextControllerValidator;

    debugLogWidgetClass(this);
  }

  @override
  void dispose() {
    mailFocusNode?.dispose();
    mailTextController?.dispose();
  }

  @override
  WidgetClassDebugData toWidgetClassDebugData() => WidgetClassDebugData(
        widgetStates: {
          'mailText': debugSerializeParam(
            mailTextController?.text,
            ParamType.String,
            link:
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=forgotPassword',
            name: 'String',
            nullable: true,
          )
        },
        actionOutputs: {
          'validate': debugSerializeParam(
            validate,
            ParamType.bool,
            link:
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=forgotPassword',
            name: 'bool',
            nullable: true,
          ),
          'forgotmailResponse': debugSerializeParam(
            forgotmailResponse,
            ParamType.ApiResponse,
            link:
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=forgotPassword',
            name: 'ApiCallResponse',
            nullable: true,
          )
        },
        generatorVariables: debugGeneratorVariables,
        backendQueries: debugBackendQueries,
        componentStates: {
          ...widgetBuilderComponents.map(
            (key, value) => MapEntry(
              key,
              value.toWidgetClassDebugData(),
            ),
          ),
        }.withoutNulls,
        link:
            'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r/tab=uiBuilder&page=forgotPassword',
        searchReference:
            'reference=Og5mb3Jnb3RQYXNzd29yZFABWg5mb3Jnb3RQYXNzd29yZA==',
        widgetClassName: 'forgotPassword',
      );
}
