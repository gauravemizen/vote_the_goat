import '/flutter_flow/flutter_flow_util.dart';
import 'conectivilty_widget.dart' show ConectiviltyWidget;
import 'package:flutter/material.dart';

class ConectiviltyModel extends FlutterFlowModel<ConectiviltyWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Custom Action - connect] action in Button widget.
  bool? _isConnected;
  set isConnected(bool? value) {
    _isConnected = value;
    debugLogWidgetClass(this);
  }

  bool? get isConnected => _isConnected;

  final Map<String, DebugDataField> debugGeneratorVariables = {};
  final Map<String, DebugDataField> debugBackendQueries = {};
  final Map<String, FlutterFlowModel> widgetBuilderComponents = {};
  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  @override
  WidgetClassDebugData toWidgetClassDebugData() => WidgetClassDebugData(
        actionOutputs: {
          'isConnected': debugSerializeParam(
            isConnected,
            ParamType.bool,
            link:
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=conectivilty',
            name: 'bool',
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
            'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r/tab=uiBuilder&page=conectivilty',
        searchReference: 'reference=Ogxjb25lY3RpdmlsdHlQAFoMY29uZWN0aXZpbHR5',
        widgetClassName: 'conectivilty',
      );
}
