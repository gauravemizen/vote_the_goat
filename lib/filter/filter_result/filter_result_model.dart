import '/flutter_flow/flutter_flow_util.dart';
import 'filter_result_widget.dart' show FilterResultWidget, FilteredResultsWidget;
import 'package:flutter/material.dart';

class FilterResultModel extends FlutterFlowModel<FilteredResultsWidget> {
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
            'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r/tab=uiBuilder&page=FilterResult',
        searchReference: 'reference=OgxGaWx0ZXJSZXN1bHRQAVoMRmlsdGVyUmVzdWx0',
        widgetClassName: 'FilterResult',
      );
}
