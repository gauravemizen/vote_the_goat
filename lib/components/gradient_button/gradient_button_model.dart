import '/flutter_flow/flutter_flow_util.dart';
import 'gradient_button_widget.dart' show GradientButtonWidget;
import 'package:flutter/material.dart';

class GradientButtonModel extends FlutterFlowModel<GradientButtonWidget> {
  final Map<String, DebugDataField> debugGeneratorVariables = {};
  final Map<String, DebugDataField> debugBackendQueries = {};
  final Map<String, FlutterFlowModel> widgetBuilderComponents = {};
  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  @override
  WidgetClassDebugData toWidgetClassDebugData() => WidgetClassDebugData(
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
            'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r/tab=uiBuilder&page=gradientButton',
        searchReference:
            'reference=Og5ncmFkaWVudEJ1dHRvblAAWg5ncmFkaWVudEJ1dHRvbg==',
        widgetClassName: 'gradientButton',
      );
}
