import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'compare_players_widget.dart' show ComparePlayersWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class ComparePlayersModel extends FlutterFlowModel<ComparePlayersWidget> {
  ///  Local state fields for this page.

  bool _viewAlert = false;
  set viewAlert(bool value) {
    _viewAlert = value;
    debugLogWidgetClass(this);
  }



  bool isLoading = false;


  bool get viewAlert => _viewAlert;

  int _winPlayer = 0;
  set winPlayer(int value) {
    _winPlayer = value;
    debugLogWidgetClass(this);
  }

  int get winPlayer => _winPlayer;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (compareplayers)] action in ComparePlayers widget.
  ApiCallResponse? _apiResultnyq;
  set apiResultnyq(ApiCallResponse? value) {
    _apiResultnyq = value;
    debugLogWidgetClass(this);
  }

  ApiCallResponse? get apiResultnyq => _apiResultnyq;

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // Stores action output result for [Backend Call - API (comparisonList)] action in Button widget.
  ApiCallResponse? _apiResult3as;
  set apiResult3as(ApiCallResponse? value) {
    _apiResult3as = value;
    debugLogWidgetClass(this);
  }

  ApiCallResponse? get apiResult3as => _apiResult3as;

  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController1;

  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController2;

  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController3;

  // Stores action output result for [Backend Call - API (comparison)] action in Button widget.
  ApiCallResponse? _apiResult4bh1;
  set apiResult4bh1(ApiCallResponse? value) {
    _apiResult4bh1 = value;
    debugLogWidgetClass(this);
  }

  ApiCallResponse? get apiResult4bh1 => _apiResult4bh1;

  // Stores action output result for [Backend Call - API (comparison)] action in Button widget.
  ApiCallResponse? _apiResult4bh;
  set apiResult4bh(ApiCallResponse? value) {
    _apiResult4bh = value;
    debugLogWidgetClass(this);
  }

  ApiCallResponse? get apiResult4bh => _apiResult4bh;

  final Map<String, DebugDataField> debugGeneratorVariables = {};
  final Map<String, DebugDataField> debugBackendQueries = {};
  final Map<String, FlutterFlowModel> widgetBuilderComponents = {};
  @override
  void initState(BuildContext context) {
    debugLogWidgetClass(this);
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    expandableExpandableController1.dispose();
    expandableExpandableController2.dispose();
    expandableExpandableController3.dispose();
  }

  @override
  WidgetClassDebugData toWidgetClassDebugData() => WidgetClassDebugData(
        widgetParameters: {
          'player1Id': debugSerializeParam(
            widget?.player1Id,
            ParamType.int,
            link:
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=ComparePlayers',
            searchReference:
                'reference=ShsKEwoJcGxheWVyMUlkEgZrZ25yNTFyBAgBIAFQAVoJcGxheWVyMUlk',
            name: 'int',
            nullable: true,
          ),
          'player2Id': debugSerializeParam(
            widget?.player2Id,
            ParamType.int,
            link:
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=ComparePlayers',
            searchReference:
                'reference=ShsKEwoJcGxheWVyMklkEgZnMWdoeG9yBAgBIAFQAVoJcGxheWVyMklk',
            name: 'int',
            nullable: true,
          )
        }.withoutNulls,
        localStates: {
          'viewAlert': debugSerializeParam(
            viewAlert,
            ParamType.bool,
            link:
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=ComparePlayers',
            searchReference:
                'reference=QhoKEgoJdmlld0FsZXJ0EgU4NzN1bnIECAUgAVABWgl2aWV3QWxlcnRiDkNvbXBhcmVQbGF5ZXJz',
            name: 'bool',
            nullable: false,
          ),
          'winPlayer': debugSerializeParam(
            winPlayer,
            ParamType.int,
            link:
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=ComparePlayers',
            searchReference:
                'reference=QhoKEgoJd2luUGxheWVyEgU1ZXNhN3IECAEgAVABWgl3aW5QbGF5ZXJiDkNvbXBhcmVQbGF5ZXJz',
            name: 'int',
            nullable: false,
          )
        },
        widgetStates: {
          'tabBarCurrentIndex': debugSerializeParam(
            tabBarCurrentIndex,
            ParamType.int,
            link:
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=ComparePlayers',
            name: 'int',
            nullable: true,
          ),
          'tabBarPreviousIndex': debugSerializeParam(
            tabBarPreviousIndex,
            ParamType.int,
            link:
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=ComparePlayers',
            name: 'int',
            nullable: true,
          )
        },
        actionOutputs: {
          'apiResultnyq': debugSerializeParam(
            apiResultnyq,
            ParamType.ApiResponse,
            link:
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=ComparePlayers',
            name: 'ApiCallResponse',
            nullable: true,
          ),
          'apiResult3as': debugSerializeParam(
            apiResult3as,
            ParamType.ApiResponse,
            link:
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=ComparePlayers',
            name: 'ApiCallResponse',
            nullable: true,
          ),
          'apiResult4bh1': debugSerializeParam(
            apiResult4bh1,
            ParamType.ApiResponse,
            link:
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=ComparePlayers',
            name: 'ApiCallResponse',
            nullable: true,
          ),
          'apiResult4bh': debugSerializeParam(
            apiResult4bh,
            ParamType.ApiResponse,
            link:
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=ComparePlayers',
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
            'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r/tab=uiBuilder&page=ComparePlayers',
        searchReference:
            'reference=Og5Db21wYXJlUGxheWVyc1ABWg5Db21wYXJlUGxheWVycw==',
        widgetClassName: 'ComparePlayers',
      );
}
