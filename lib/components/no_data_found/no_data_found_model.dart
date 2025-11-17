import '/flutter_flow/flutter_flow_util.dart';
import 'no_data_found_widget.dart' show NoDataFoundWidget;
import 'package:flutter/material.dart';

class NoDataFoundModel extends FlutterFlowModel<NoDataFoundWidget> {
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
            'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r/tab=uiBuilder&page=noDataFound',
        searchReference: 'reference=Ogtub0RhdGFGb3VuZFAAWgtub0RhdGFGb3VuZA==',
        widgetClassName: 'noDataFound',
      );
}
