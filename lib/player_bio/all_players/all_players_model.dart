import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'all_players_widget.dart' show AllPlayersWidget;
import 'package:flutter/material.dart';

class AllPlayersModel extends FlutterFlowModel<AllPlayersWidget> {
  ///  Local state fields for this page.

  bool _isLoading = false;
  set isLoading(bool value) {
    _isLoading = value;
    debugLogWidgetClass(this);
  }

  bool get isLoading => _isLoading;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (getAllPlayers)] action in AllPlayers widget.
  ApiCallResponse? _getAllPlayerRes;
  set getAllPlayerRes(ApiCallResponse? value) {
    _getAllPlayerRes = value;
    debugLogWidgetClass(this);
  }

  ApiCallResponse? get getAllPlayerRes => _getAllPlayerRes;

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
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=AllPlayers',
            searchReference:
                'reference=QiMKEgoJaXNMb2FkaW5nEgVmMmZicioHEgVmYWxzZXIECAUgAVABWglpc0xvYWRpbmdiCkFsbFBsYXllcnM=',
            name: 'bool',
            nullable: false,
          )
        },
        actionOutputs: {
          'getAllPlayerRes': debugSerializeParam(
            getAllPlayerRes,
            ParamType.ApiResponse,
            link:
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=AllPlayers',
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
            'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r/tab=uiBuilder&page=AllPlayers',
        searchReference: 'reference=OgpBbGxQbGF5ZXJzUAFaCkFsbFBsYXllcnM=',
        widgetClassName: 'AllPlayers',
      );
}
