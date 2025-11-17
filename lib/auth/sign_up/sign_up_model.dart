import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'sign_up_widget.dart' show SignUpWidget;
import 'package:flutter/material.dart';

class SignUpModel extends FlutterFlowModel<SignUpWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for nameField widget.
  FocusNode? nameFieldFocusNode;
  TextEditingController? nameFieldTextController;
  String? Function(BuildContext, String?)? nameFieldTextControllerValidator;
  String? _nameFieldTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Name field is required';
    }

    if (!RegExp('^[a-zA-ZÀ-ÖØ-öø-ÿĀ-žŻ-ż\\s\'-]{2,50}\$').hasMatch(val)) {
      return 'Invalid text';
    }
    return null;
  }

  // State field(s) for emailField widget.
  FocusNode? emailFieldFocusNode;
  TextEditingController? emailFieldTextController;
  String? Function(BuildContext, String?)? emailFieldTextControllerValidator;
  String? _emailFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Email field is required';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Please enter the valid email address';
    }
    return null;
  }

  // State field(s) for passwordField widget.
  FocusNode? passwordFieldFocusNode;
  TextEditingController? passwordFieldTextController;
  late bool passwordFieldVisibility;
  String? Function(BuildContext, String?)? passwordFieldTextControllerValidator;
  String? _passwordFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Password field is required';
    }

    if (!RegExp('^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[\\W_]).{8,}\$')
        .hasMatch(val)) {
      return 'Password must be 8+ chars with uppercase, lowercase, number & symbol';
    }
    return null;
  }

  // State field(s) for copasswordField widget.
  FocusNode? copasswordFieldFocusNode;
  TextEditingController? copasswordFieldTextController;
  late bool copasswordFieldVisibility;
  String? Function(BuildContext, String?)?
      copasswordFieldTextControllerValidator;
  String? _copasswordFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Confirm Password  is required';
    }

    if (!RegExp('^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[\\W_]).{8,}\$')
        .hasMatch(val)) {
      return 'Password must be 8+ chars with uppercase, lowercase, number & symbol';
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

  // Stores action output result for [Backend Call - API (signUp)] action in Button widget.
  ApiCallResponse? _signUpRes;
  set signUpRes(ApiCallResponse? value) {
    _signUpRes = value;
    debugLogWidgetClass(this);
  }

  ApiCallResponse? get signUpRes => _signUpRes;

  final Map<String, DebugDataField> debugGeneratorVariables = {};
  final Map<String, DebugDataField> debugBackendQueries = {};
  final Map<String, FlutterFlowModel> widgetBuilderComponents = {};
  @override
  void initState(BuildContext context) {
    nameFieldTextControllerValidator = _nameFieldTextControllerValidator;
    emailFieldTextControllerValidator = _emailFieldTextControllerValidator;
    passwordFieldVisibility = false;
    passwordFieldTextControllerValidator =
        _passwordFieldTextControllerValidator;
    copasswordFieldVisibility = false;
    copasswordFieldTextControllerValidator =
        _copasswordFieldTextControllerValidator;

    debugLogWidgetClass(this);
  }

  @override
  void dispose() {
    nameFieldFocusNode?.dispose();
    nameFieldTextController?.dispose();

    emailFieldFocusNode?.dispose();
    emailFieldTextController?.dispose();

    passwordFieldFocusNode?.dispose();
    passwordFieldTextController?.dispose();

    copasswordFieldFocusNode?.dispose();
    copasswordFieldTextController?.dispose();
  }

  @override
  WidgetClassDebugData toWidgetClassDebugData() => WidgetClassDebugData(
        widgetStates: {
          'nameFieldText': debugSerializeParam(
            nameFieldTextController?.text,
            ParamType.String,
            link:
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=signUp',
            name: 'String',
            nullable: true,
          ),
          'emailFieldText': debugSerializeParam(
            emailFieldTextController?.text,
            ParamType.String,
            link:
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=signUp',
            name: 'String',
            nullable: true,
          ),
          'passwordFieldText': debugSerializeParam(
            passwordFieldTextController?.text,
            ParamType.String,
            link:
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=signUp',
            name: 'String',
            nullable: true,
          ),
          'copasswordFieldText': debugSerializeParam(
            copasswordFieldTextController?.text,
            ParamType.String,
            link:
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=signUp',
            name: 'String',
            nullable: true,
          )
        },
        actionOutputs: {
          'validate': debugSerializeParam(
            validate,
            ParamType.bool,
            link:
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=signUp',
            name: 'bool',
            nullable: true,
          ),
          'signUpRes': debugSerializeParam(
            signUpRes,
            ParamType.ApiResponse,
            link:
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=signUp',
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
            'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r/tab=uiBuilder&page=signUp',
        searchReference: 'reference=OgZzaWduVXBQAVoGc2lnblVw',
        widgetClassName: 'signUp',
      );
}
