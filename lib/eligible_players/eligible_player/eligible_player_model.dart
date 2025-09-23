import '/backend/api_requests/api_calls.dart';
import '/components/drawer_menu/drawer_menu_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'dart:async';
import 'eligible_player_widget.dart' show EligiblePlayerWidget;
import 'package:flutter/material.dart';

class EligiblePlayerModel extends FlutterFlowModel<EligiblePlayerWidget> {
  ///  Local state fields for this page.

  List<int> selectedItems = [];
  void addToSelectedItems(int item) => selectedItems.add(item);
  void removeFromSelectedItems(int item) => selectedItems.remove(item);
  void removeAtIndexFromSelectedItems(int index) =>
      selectedItems.removeAt(index);
  void insertAtIndexInSelectedItems(int index, int item) =>
      selectedItems.insert(index, item);
  void updateSelectedItemsAtIndex(int index, Function(int) updateFn) =>
      selectedItems[index] = updateFn(selectedItems[index]);

  bool isLoading = false;

  String? searchValue;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (eligblePlayers)] action in eligible_player widget.
  ApiCallResponse? apiResultlrq;
  // State field(s) for searchField widget.
  FocusNode? searchFieldFocusNode;
  TextEditingController? searchFieldTextController;
  String? Function(BuildContext, String?)? searchFieldTextControllerValidator;
  Completer<ApiCallResponse>? apiRequestCompleter;
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
