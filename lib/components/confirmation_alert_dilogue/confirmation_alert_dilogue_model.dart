import '/components/confirm_dilogue/confirm_dilogue_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'confirmation_alert_dilogue_widget.dart'
    show ConfirmationAlertDilogueWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class ConfirmationAlertDilogueModel
    extends FlutterFlowModel<ConfirmationAlertDilogueWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for confirmDilogue.
  late ConfirmDilogueModel confirmDilogueModel;

  final Map<String, DebugDataField> debugGeneratorVariables = {};
  final Map<String, DebugDataField> debugBackendQueries = {};
  final Map<String, FlutterFlowModel> widgetBuilderComponents = {};
  @override
  void initState(BuildContext context) {
    confirmDilogueModel = createModel(context, () => ConfirmDilogueModel());
  }

  @override
  void dispose() {
    confirmDilogueModel.dispose();
  }

  @override
  WidgetClassDebugData toWidgetClassDebugData() => WidgetClassDebugData(
        generatorVariables: debugGeneratorVariables,
        backendQueries: debugBackendQueries,
        componentStates: {
          'confirmDilogueModel (confirmDilogue)':
              confirmDilogueModel?.toWidgetClassDebugData(),
          ...widgetBuilderComponents.map(
            (key, value) => MapEntry(
              key,
              value.toWidgetClassDebugData(),
            ),
          ),
        }.withoutNulls,
        link:
            'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r/tab=uiBuilder&page=confirmationAlertDilogue',
        searchReference:
            'reference=Ohhjb25maXJtYXRpb25BbGVydERpbG9ndWVQAFoYY29uZmlybWF0aW9uQWxlcnREaWxvZ3Vl',
        widgetClassName: 'confirmationAlertDilogue',
      );
}
