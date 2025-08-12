import '/backend/api_requests/api_calls.dart';
import '/components/drawer_menu/drawer_menu_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'eligible_player_widget.dart' show EligiblePlayerWidget;
import 'package:flutter/material.dart';

class EligiblePlayerModel extends FlutterFlowModel<EligiblePlayerWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (eligblePlayers)] action in eligible_player widget.
  ApiCallResponse? apiResultlrq;
  // State field(s) for searchField widget.
  FocusNode? searchFieldFocusNode;
  TextEditingController? searchFieldTextController;
  String? Function(BuildContext, String?)? searchFieldTextControllerValidator;
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
}
