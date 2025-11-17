import '/flutter_flow/flutter_flow_util.dart';
import 'nav_widget.dart' show NavWidget;
import 'package:flutter/material.dart';

class NavModel extends FlutterFlowModel<NavWidget> {
  final Map<String, DebugDataField> debugGeneratorVariables = {};
  final Map<String, DebugDataField> debugBackendQueries = {};
  final Map<String, FlutterFlowModel> widgetBuilderComponents = {};
  @override
  void initState(BuildContext context) {
    debugLogWidgetClass(this);
  }

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
            'https://app.flutterflow.io/project/vote-the-goat-custom-code-fw3c0e/tab=uiBuilder&page=nav',
        searchReference: 'reference=OgNuYXZQAVoDbmF2',
        widgetClassName: 'nav',
      );
}
