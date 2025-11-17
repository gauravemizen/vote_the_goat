import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'log_out_widget.dart' show LogOutWidget;
import 'package:flutter/material.dart';

class LogOutModel extends FlutterFlowModel<LogOutWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (logout)] action in Button widget.
  ApiCallResponse? _apiResult93l;
  set apiResult93l(ApiCallResponse? value) {
    _apiResult93l = value;
    debugLogWidgetClass(this);
  }

  ApiCallResponse? get apiResult93l => _apiResult93l;

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
          'apiResult93l': debugSerializeParam(
            apiResult93l,
            ParamType.ApiResponse,
            link:
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=logOut',
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
            'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r/tab=uiBuilder&page=logOut',
        searchReference: 'reference=OgZsb2dPdXRQAFoGbG9nT3V0',
        widgetClassName: 'logOut',
      );
}
