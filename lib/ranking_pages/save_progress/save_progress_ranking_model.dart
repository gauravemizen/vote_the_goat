import '/components/drawer_menu/drawer_menu_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'save_progress_ranking_widget.dart' show SaveProgressRankingWidget;
import 'package:flutter/material.dart';

class SaveProgressRankingModel extends FlutterFlowModel<SaveProgressRankingWidget> {
  /// State fields for stateful widgets in this page.

  // Model for drawer_menu component.
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
