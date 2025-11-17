import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'contest_details_widget.dart' show ContestDetailsWidget;
import 'package:flutter/material.dart';

class ContestDetailsModel extends FlutterFlowModel<ContestDetailsWidget> {
  ///  Local state fields for this page.

  bool _isLoading = false;
  set isLoading(bool value) {
    _isLoading = value;
    debugLogWidgetClass(this);
  }

  bool get isLoading => _isLoading;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (comlpleteContestDetails)] action in ContestDetails widget.
  ApiCallResponse? _apiResult5ic;
  set apiResult5ic(ApiCallResponse? value) {
    _apiResult5ic = value;
    debugLogWidgetClass(this);
  }

  ApiCallResponse? get apiResult5ic => _apiResult5ic;

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
        widgetParameters: {
          'contestId': debugSerializeParam(
            widget?.contestId,
            ParamType.int,
            link:
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=ContestDetails',
            searchReference:
                'reference=ShsKEwoJY29udGVzdElkEgZjOWw1ZjByBAgBIAFQAVoJY29udGVzdElk',
            name: 'int',
            nullable: true,
          )
        }.withoutNulls,
        localStates: {
          'isLoading': debugSerializeParam(
            isLoading,
            ParamType.bool,
            link:
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=ContestDetails',
            searchReference:
                'reference=QiMKEgoJaXNMb2FkaW5nEgU1dGRzcyoHEgVmYWxzZXIECAUgAVABWglpc0xvYWRpbmdiDkNvbnRlc3REZXRhaWxz',
            name: 'bool',
            nullable: false,
          )
        },
        actionOutputs: {
          'apiResult5ic': debugSerializeParam(
            apiResult5ic,
            ParamType.ApiResponse,
            link:
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=ContestDetails',
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
            'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r/tab=uiBuilder&page=ContestDetails',
        searchReference:
            'reference=Og5Db250ZXN0RGV0YWlsc1ABWg5Db250ZXN0RGV0YWlscw==',
        widgetClassName: 'ContestDetails',
      );
}
