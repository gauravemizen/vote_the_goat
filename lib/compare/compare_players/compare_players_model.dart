import '/components/drawer_menu/drawer_menu_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'compare_players_widget.dart' show ComparePlayersWidget;
import 'package:flutter/material.dart';

class ComparePlayersModel extends FlutterFlowModel<ComparePlayersWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

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
