import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'play_with_friend_ranking_widget.dart' show PlayWithFriendRankingWidget;
import 'package:flutter/material.dart';

class PlayWithFriendRankingModel
    extends FlutterFlowModel<PlayWithFriendRankingWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (teamRankingDetails)] action in PlayWithFriendRanking widget.
  ApiCallResponse? _apiResultk4i;
  set apiResultk4i(ApiCallResponse? value) {
    _apiResultk4i = value;
    debugLogWidgetClass(this);
  }

  ApiCallResponse? get apiResultk4i => _apiResultk4i;

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
          'teamId': debugSerializeParam(
            widget?.teamId,
            ParamType.int,
            link:
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=PlayWithFriendRanking',
            searchReference:
                'reference=Sh0KEAoGdGVhbUlkEgZydDlsajEqAxIBMHIECAEgAFABWgZ0ZWFtSWQ=',
            name: 'int',
            nullable: false,
          )
        }.withoutNulls,
        actionOutputs: {
          'apiResultk4i': debugSerializeParam(
            apiResultk4i,
            ParamType.ApiResponse,
            link:
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=PlayWithFriendRanking',
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
            'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r/tab=uiBuilder&page=PlayWithFriendRanking',
        searchReference:
            'reference=OhVQbGF5V2l0aEZyaWVuZFJhbmtpbmdQAVoVUGxheVdpdGhGcmllbmRSYW5raW5n',
        widgetClassName: 'PlayWithFriendRanking',
      );
}
