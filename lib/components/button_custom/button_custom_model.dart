import '/flutter_flow/flutter_flow_util.dart';
import 'button_custom_widget.dart' show ButtonCustomWidget;
import 'package:flutter/material.dart';

class ButtonCustomModel extends FlutterFlowModel<ButtonCustomWidget> {
  final Map<String, DebugDataField> debugGeneratorVariables = {};
  final Map<String, DebugDataField> debugBackendQueries = {};
  final Map<String, FlutterFlowModel> widgetBuilderComponents = {};
  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  @override
  WidgetClassDebugData toWidgetClassDebugData() => WidgetClassDebugData(
        widgetParameters: {
          'text': debugSerializeParam(
            widget?.text,
            ParamType.String,
            link:
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=buttonCustom',
            searchReference:
                'reference=ShYKDgoEdGV4dBIGeHBsemtrcgQIAyABUABaBHRleHQ=',
            name: 'String',
            nullable: true,
          )
        }.withoutNulls,
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
            'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r/tab=uiBuilder&page=buttonCustom',
        searchReference: 'reference=OgxidXR0b25DdXN0b21QAFoMYnV0dG9uQ3VzdG9t',
        widgetClassName: 'buttonCustom',
      );
}
