import '/backend/api_requests/api_calls.dart';
import '/components/drawer_menu/drawer_menu_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'dart:async';
import 'ranking_page_widget.dart' show RankingPageWidget;
import 'package:flutter/material.dart';

class RankingPageModel extends FlutterFlowModel<RankingPageWidget> {
  ///  Local state fields for this page.

  bool _isLoading = true;

  int? selectedPlayerCount;


  set isLoading(bool value) {
    _isLoading = value;
    debugLogWidgetClass(this);
  }

  bool get isLoading => _isLoading;

  late LoggableList<dynamic> _playerList = LoggableList([]);
  set playerList(List<dynamic> value) {
    _playerList = LoggableList(value);
  
    debugLogWidgetClass(this);
  }

  List<dynamic> get playerList =>
      _playerList..logger = () => debugLogWidgetClass(this);
  void addToPlayerList(dynamic item) => playerList.add(item);
  void removeFromPlayerList(dynamic item) => playerList.remove(item);
  void removeAtIndexFromPlayerList(int index) => playerList.removeAt(index);
  void insertAtIndexInPlayerList(int index, dynamic item) =>
      playerList.insert(index, item);
  void updatePlayerListAtIndex(int index, Function(dynamic) updateFn) =>
      playerList[index] = updateFn(playerList[index]);

  ///  State fields for stateful widgets in this page.

  // State field(s) for searchField widget.
  FocusNode? searchFieldFocusNode;
  TextEditingController? searchFieldTextController;
  String? Function(BuildContext, String?)? searchFieldTextControllerValidator;
  // Stores action output result for [Backend Call - API (rankingPost)] action in position widget.
  ApiCallResponse? _apiResult156;
  set apiResult156(ApiCallResponse? value) {
    _apiResult156 = value;
    debugLogWidgetClass(this);
  }

  ApiCallResponse? get apiResult156 => _apiResult156;

  Completer<ApiCallResponse>? apiRequestCompleter;
  // Stores action output result for [Backend Call - API (finalizeRanking)] action in Button widget.
  ApiCallResponse? _apiResultxjo;
  set apiResultxjo(ApiCallResponse? value) {
    _apiResultxjo = value;
    debugLogWidgetClass(this);
  }

  ApiCallResponse? get apiResultxjo => _apiResultxjo;

  // Model for DrawerMenu component.
  late DrawerMenuModel drawerMenuModel;

  final Map<String, DebugDataField> debugGeneratorVariables = {};
  final Map<String, DebugDataField> debugBackendQueries = {};
  final Map<String, FlutterFlowModel> widgetBuilderComponents = {};
  @override
  void initState(BuildContext context) {
    drawerMenuModel = createModel(context, () => DrawerMenuModel());

    debugLogWidgetClass(this);
  }

  @override
  void dispose() {
    searchFieldFocusNode?.dispose();
    searchFieldTextController?.dispose();

    drawerMenuModel.dispose();
  }

  /// Additional helper methods.
  Future waitForApiRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  @override
  WidgetClassDebugData toWidgetClassDebugData() => WidgetClassDebugData(
        localStates: {
          'isLoading': debugSerializeParam(
            isLoading,
            ParamType.bool,
            link:
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=rankingPage',
            searchReference:
                'reference=QiMKEgoJaXNMb2FkaW5nEgV2bHZhdSoHEgVmYWxzZXIECAUgAVABWglpc0xvYWRpbmdiC3JhbmtpbmdQYWdl',
            name: 'bool',
            nullable: false,
          ),
          'playerList': debugSerializeParam(
            playerList,
            ParamType.JSON,
            isList: true,
            link:
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=rankingPage',
            searchReference:
                'reference=QhsKEwoKcGxheWVyTGlzdBIFNHJneXZyBBICCAlQAVoKcGxheWVyTGlzdGILcmFua2luZ1BhZ2U=',
            name: 'dynamic',
            nullable: false,
          )
        },
        widgetStates: {
          'searchFieldText': debugSerializeParam(
            searchFieldTextController?.text,
            ParamType.String,
            link:
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=rankingPage',
            name: 'String',
            nullable: true,
          )
        },
        actionOutputs: {
          'apiResult156': debugSerializeParam(
            apiResult156,
            ParamType.ApiResponse,
            link:
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=rankingPage',
            name: 'ApiCallResponse',
            nullable: true,
          ),
          'apiResultxjo': debugSerializeParam(
            apiResultxjo,
            ParamType.ApiResponse,
            link:
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=rankingPage',
            name: 'ApiCallResponse',
            nullable: true,
          )
        },
        generatorVariables: debugGeneratorVariables,
        backendQueries: debugBackendQueries,
        componentStates: {
          'drawerMenuModel (DrawerMenu)':
              drawerMenuModel.toWidgetClassDebugData(),
          ...widgetBuilderComponents.map(
            (key, value) => MapEntry(
              key,
              value.toWidgetClassDebugData(),
            ),
          ),
        }.withoutNulls,
        link:
            'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r/tab=uiBuilder&page=rankingPage',
        searchReference: 'reference=OgtyYW5raW5nUGFnZVABWgtyYW5raW5nUGFnZQ==',
        widgetClassName: 'rankingPage',
      );
}
