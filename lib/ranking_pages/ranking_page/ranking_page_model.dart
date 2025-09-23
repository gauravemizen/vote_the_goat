import '/backend/api_requests/api_calls.dart';
import '/components/drawer_menu/drawer_menu_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'dart:async';
import 'ranking_page_widget.dart' show RankingPageWidget;
import 'package:flutter/material.dart';

class RankingPageModel extends FlutterFlowModel<RankingPageWidget> {
  ///  Local state fields for this page.

  bool isLoading = true;

  List<dynamic> playerList = [];
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
  ApiCallResponse? apiResult156;
  Completer<ApiCallResponse>? apiRequestCompleter;
  // Stores action output result for [Backend Call - API (finalizeRanking)] action in Button widget.
  ApiCallResponse? apiResultxjo;
  // Model for DrawerMenu component.
  late DrawerMenuModel drawerMenuModel;

  @override
  void initState(BuildContext context) {
    drawerMenuModel = createModel(context, () => DrawerMenuModel());
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
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
