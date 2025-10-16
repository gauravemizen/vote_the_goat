import '/components/gradient_button_custom/gradient_button_custom_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'new_password_widget.dart' show NewPasswordWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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

  final Map<String, DebugDataField> debugGeneratorVariables = {};
  final Map<String, DebugDataField> debugBackendQueries = {};
  final Map<String, FlutterFlowModel> widgetBuilderComponents = {};
  @override
  void initState(BuildContext context) {
    passwordFieldVisibility1 = false;
    passwordFieldVisibility2 = false;
    passwordFieldVisibility3 = false;
    gradientButtonCustomModel =
        createModel(context, () => GradientButtonCustomModel());

    debugLogWidgetClass(this);
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

  @override
  WidgetClassDebugData toWidgetClassDebugData() => WidgetClassDebugData(
        widgetStates: {
          'passwordFieldText1': debugSerializeParam(
            passwordFieldTextController1?.text,
            ParamType.String,
            link:
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=newPassword',
            name: 'String',
            nullable: true,
          ),
          'passwordFieldText2': debugSerializeParam(
            passwordFieldTextController2?.text,
            ParamType.String,
            link:
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=newPassword',
            name: 'String',
            nullable: true,
          ),
          'passwordFieldText3': debugSerializeParam(
            passwordFieldTextController3?.text,
            ParamType.String,
            link:
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=newPassword',
            name: 'String',
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
            'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r/tab=uiBuilder&page=newPassword',
        searchReference: 'reference=OgtuZXdQYXNzd29yZFABWgtuZXdQYXNzd29yZA==',
        widgetClassName: 'newPassword',
      );
}
