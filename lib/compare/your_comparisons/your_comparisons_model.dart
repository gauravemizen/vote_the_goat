import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'your_comparisons_widget.dart' show YourComparisonsWidget;
import 'package:flutter/material.dart';

class YourComparisonsModel extends FlutterFlowModel<YourComparisonsWidget> {
  ///  Local state fields for this page.

  bool _isLoading = false;
  set isLoading(bool value) {
    _isLoading = value;
    debugLogWidgetClass(this);
  }

  bool get isLoading => _isLoading;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (comparisonList)] action in YourComparisons widget.
  ApiCallResponse? _apiResultpzb;
  set apiResultpzb(ApiCallResponse? value) {
    _apiResultpzb = value;
    debugLogWidgetClass(this);
  }

  ApiCallResponse? get apiResultpzb => _apiResultpzb;

  // Stores action output result for [Backend Call - API (applyranking)] action in Button widget.
  ApiCallResponse? _apiResulthzz;
  set apiResulthzz(ApiCallResponse? value) {
    _apiResulthzz = value;
    debugLogWidgetClass(this);
  }

  ApiCallResponse? get apiResulthzz => _apiResulthzz;

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
        localStates: {
          'isLoading': debugSerializeParam(
            isLoading,
            ParamType.bool,
            link:
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=YourComparisons',
            searchReference:
                'reference=QiMKEgoJaXNMb2FkaW5nEgU1bTdsNyoHEgVmYWxzZXIECAUgAVABWglpc0xvYWRpbmdiD1lvdXJDb21wYXJpc29ucw==',
            name: 'bool',
            nullable: false,
          )
        },
        actionOutputs: {
          'apiResultpzb': debugSerializeParam(
            apiResultpzb,
            ParamType.ApiResponse,
            link:
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=YourComparisons',
            name: 'ApiCallResponse',
            nullable: true,
          ),
          'apiResulthzz': debugSerializeParam(
            apiResulthzz,
            ParamType.ApiResponse,
            link:
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=YourComparisons',
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
            'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r/tab=uiBuilder&page=YourComparisons',
        searchReference:
            'reference=Og9Zb3VyQ29tcGFyaXNvbnNQAVoPWW91ckNvbXBhcmlzb25z',
        widgetClassName: 'YourComparisons',
      );
}
