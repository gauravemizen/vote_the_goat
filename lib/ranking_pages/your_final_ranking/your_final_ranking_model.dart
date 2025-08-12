import '/components/drawer_menu/drawer_menu_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'your_final_ranking_widget.dart' show YourFinalRankingWidget;
import 'package:flutter/material.dart';

class YourFinalRankingModel extends FlutterFlowModel<YourFinalRankingWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for DrawerMenu component.
  late DrawerMenuModel drawerMenuModel;

  @override
  void initState(BuildContext context) {
    drawerMenuModel = createModel(context, () => DrawerMenuModel());
  }

  @override
  void dispose() {
    drawerMenuModel.dispose();
  }
}
