import '/components/gradient_button_custom/gradient_button_custom_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'my_profile_widget.dart' show MyProfileWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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

  final Map<String, DebugDataField> debugGeneratorVariables = {};
  final Map<String, DebugDataField> debugBackendQueries = {};
  final Map<String, FlutterFlowModel> widgetBuilderComponents = {};
  @override
  void initState(BuildContext context) {
    passwordFieldVisibility = false;
    gradientButtonCustomModel =
        createModel(context, () => GradientButtonCustomModel());

    debugLogWidgetClass(this);
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

  @override
  WidgetClassDebugData toWidgetClassDebugData() => WidgetClassDebugData(
        widgetStates: {
          'emailFIeldText1': debugSerializeParam(
            emailFIeldTextController1?.text,
            ParamType.String,
            link:
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=MyProfile',
            name: 'String',
            nullable: true,
          ),
          'emailFIeldText2': debugSerializeParam(
            emailFIeldTextController2?.text,
            ParamType.String,
            link:
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=MyProfile',
            name: 'String',
            nullable: true,
          ),
          'passwordFieldText': debugSerializeParam(
            passwordFieldTextController?.text,
            ParamType.String,
            link:
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=MyProfile',
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
            'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r/tab=uiBuilder&page=MyProfile',
        searchReference: 'reference=OglNeVByb2ZpbGVQAVoJTXlQcm9maWxl',
        widgetClassName: 'MyProfile',
      );
}
