import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'log_in_widget.dart' show LogInWidget;
import 'package:flutter/material.dart';

class LogInModel extends FlutterFlowModel<LogInWidget> {
  ///  Local state fields for this page.

  bool _isLoading = false;
  set isLoading(bool value) {
    _isLoading = value;
    debugLogWidgetClass(this);
  }

  bool get isLoading => _isLoading;

  String _deviceToken = '000';
  set deviceToken(String value) {
    _deviceToken = value;
    debugLogWidgetClass(this);
  }

  String get deviceToken => _deviceToken;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Custom Action - getFcmToken] action in logIn widget.
  String? _fcmToken;
  set fcmToken(String? value) {
    _fcmToken = value;
    debugLogWidgetClass(this);
  }

  String? get fcmToken => _fcmToken;

  // State field(s) for emailField widget.
  FocusNode? emailFieldFocusNode;
  TextEditingController? emailFieldTextController;
  String? Function(BuildContext, String?)? emailFieldTextControllerValidator;
  String? _emailFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Email is required';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Enter  a valid email address';
    }
    return null;
  }

  // State field(s) for passwordFied widget.
  FocusNode? passwordFiedFocusNode;
  TextEditingController? passwordFiedTextController;
  late bool passwordFiedVisibility;
  String? Function(BuildContext, String?)? passwordFiedTextControllerValidator;
  String? _passwordFiedTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Password is required';
    }

    if (!RegExp('^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[\\W_]).{8,}\$')
        .hasMatch(val)) {
      return 'Password must be 8+ chars with uppercase, lowercase, number & symbol';
    }
    return null;
  }

  // State field(s) for Checkbox widget.
  bool? _checkboxValue;
  set checkboxValue(bool? value) {
    _checkboxValue = value;
    debugLogWidgetClass(this);
  }

  bool? get checkboxValue => _checkboxValue;

  // Stores action output result for [Validate Form] action in Button widget.
  bool? _validate;
  set validate(bool? value) {
    _validate = value;
    debugLogWidgetClass(this);
  }

  bool? get validate => _validate;

  // Stores action output result for [Backend Call - API (logIn)] action in Button widget.
  ApiCallResponse? _logInRes;
  set logInRes(ApiCallResponse? value) {
    _logInRes = value;
    debugLogWidgetClass(this);
  }

  ApiCallResponse? get logInRes => _logInRes;

  // Stores action output result for [Backend Call - API (sociallogin)] action in Container widget.
  ApiCallResponse? _appleLogin;
  set appleLogin(ApiCallResponse? value) {
    _appleLogin = value;
    debugLogWidgetClass(this);
  }

  ApiCallResponse? get appleLogin => _appleLogin;

  // Stores action output result for [Backend Call - API (sociallogin)] action in Container widget.
  ApiCallResponse? _socialRes;
  set socialRes(ApiCallResponse? value) {
    _socialRes = value;
    debugLogWidgetClass(this);
  }

  ApiCallResponse? get socialRes => _socialRes;

  // Stores action output result for [Backend Call - API (sociallogin)] action in Container widget.
  ApiCallResponse? _googleLogIn;
  set googleLogIn(ApiCallResponse? value) {
    _googleLogIn = value;
    debugLogWidgetClass(this);
  }

  ApiCallResponse? get googleLogIn => _googleLogIn;

  final Map<String, DebugDataField> debugGeneratorVariables = {};
  final Map<String, DebugDataField> debugBackendQueries = {};
  final Map<String, FlutterFlowModel> widgetBuilderComponents = {};
  @override
  void initState(BuildContext context) {
    emailFieldTextControllerValidator = _emailFieldTextControllerValidator;
    passwordFiedVisibility = false;
    passwordFiedTextControllerValidator = _passwordFiedTextControllerValidator;

    debugLogWidgetClass(this);
  }

  @override
  void dispose() {
    emailFieldFocusNode?.dispose();
    emailFieldTextController?.dispose();

    passwordFiedFocusNode?.dispose();
    passwordFiedTextController?.dispose();
  }

  @override
  WidgetClassDebugData toWidgetClassDebugData() => WidgetClassDebugData(
        localStates: {
          'isLoading': debugSerializeParam(
            isLoading,
            ParamType.bool,
            link:
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=logIn',
            searchReference:
                'reference=QiMKEgoJaXNMb2FkaW5nEgVxaTQ4NyoHEgVmYWxzZXIECAUgAVABWglpc0xvYWRpbmdiBWxvZ0lu',
            name: 'bool',
            nullable: false,
          ),
          'deviceToken': debugSerializeParam(
            deviceToken,
            ParamType.String,
            link:
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=logIn',
            searchReference:
                'reference=QiAKFAoLZGV2aWNlVG9rZW4SBXgxaGxtKgISAHIECAMgAVABWgtkZXZpY2VUb2tlbmIFbG9nSW4=',
            name: 'String',
            nullable: false,
          )
        },
        widgetStates: {
          'emailFieldText': debugSerializeParam(
            emailFieldTextController?.text,
            ParamType.String,
            link:
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=logIn',
            name: 'String',
            nullable: true,
          ),
          'passwordFiedText': debugSerializeParam(
            passwordFiedTextController?.text,
            ParamType.String,
            link:
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=logIn',
            name: 'String',
            nullable: true,
          ),
          'checkboxValue': debugSerializeParam(
            checkboxValue,
            ParamType.bool,
            link:
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=logIn',
            name: 'bool',
            nullable: true,
          )
        },
        actionOutputs: {
          'fcmToken': debugSerializeParam(
            fcmToken,
            ParamType.String,
            link:
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=logIn',
            name: 'String',
            nullable: true,
          ),
          'validate': debugSerializeParam(
            validate,
            ParamType.bool,
            link:
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=logIn',
            name: 'bool',
            nullable: true,
          ),
          'logInRes': debugSerializeParam(
            logInRes,
            ParamType.ApiResponse,
            link:
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=logIn',
            name: 'ApiCallResponse',
            nullable: true,
          ),
          'appleLogin': debugSerializeParam(
            appleLogin,
            ParamType.ApiResponse,
            link:
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=logIn',
            name: 'ApiCallResponse',
            nullable: true,
          ),
          'socialRes': debugSerializeParam(
            socialRes,
            ParamType.ApiResponse,
            link:
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=logIn',
            name: 'ApiCallResponse',
            nullable: true,
          ),
          'googleLogIn': debugSerializeParam(
            googleLogIn,
            ParamType.ApiResponse,
            link:
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=logIn',
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
            'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r/tab=uiBuilder&page=logIn',
        searchReference: 'reference=OgVsb2dJblABWgVsb2dJbg==',
        widgetClassName: 'logIn',
      );
}
