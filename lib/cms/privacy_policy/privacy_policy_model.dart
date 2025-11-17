import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'privacy_policy_widget.dart' show PrivacyPolicyWidget;
import 'package:flutter/material.dart';

class PrivacyPolicyModel extends FlutterFlowModel<PrivacyPolicyWidget> {
  ///  Local state fields for this page.

  bool _isLoading = false;
  set isLoading(bool value) {
    _isLoading = value;
    debugLogWidgetClass(this);
  }

  bool get isLoading => _isLoading;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (privacypolicy)] action in privacyPolicy widget.
  ApiCallResponse? _apiResult48w;
  set apiResult48w(ApiCallResponse? value) {
    _apiResult48w = value;
    debugLogWidgetClass(this);
  }

  ApiCallResponse? get apiResult48w => _apiResult48w;

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
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=privacyPolicy',
            searchReference:
                'reference=QiMKEgoJaXNMb2FkaW5nEgVydmxiOCoHEgVmYWxzZXIECAUgAVABWglpc0xvYWRpbmdiDXByaXZhY3lQb2xpY3k=',
            name: 'bool',
            nullable: false,
          )
        },
        actionOutputs: {
          'apiResult48w': debugSerializeParam(
            apiResult48w,
            ParamType.ApiResponse,
            link:
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=privacyPolicy',
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
            'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r/tab=uiBuilder&page=privacyPolicy',
        searchReference:
            'reference=Og1wcml2YWN5UG9saWN5UAFaDXByaXZhY3lQb2xpY3k=',
        widgetClassName: 'privacyPolicy',
      );
}
