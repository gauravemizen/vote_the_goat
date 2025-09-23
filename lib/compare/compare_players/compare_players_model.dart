import '/backend/api_requests/api_calls.dart';
import '/components/drawer_menu/drawer_menu_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'compare_players_widget.dart' show ComparePlayersWidget;
import 'package:flutter/material.dart';

class ComparePlayersModel extends FlutterFlowModel<ComparePlayersWidget> {
  ///  Local state fields for this page.

  bool viewAlert = false;

  int winPlayer = 0;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (compareplayers)] action in ComparePlayers widget.
  ApiCallResponse? apiResultnyq;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Stores action output result for [Backend Call - API (comparison)] action in Button widget.
  ApiCallResponse? apiResult4bh1;
  // Stores action output result for [Backend Call - API (comparison)] action in Button widget.
  ApiCallResponse? apiResult4bh;
  // Model for DrawerMenu component.
  late DrawerMenuModel drawerMenuModel;

  @override
  void initState(BuildContext context) {
    drawerMenuModel = createModel(context, () => DrawerMenuModel());
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    drawerMenuModel.dispose();
  }
}
