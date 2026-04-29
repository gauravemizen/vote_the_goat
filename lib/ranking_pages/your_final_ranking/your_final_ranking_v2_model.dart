// lib/ranking_pages/your_final_ranking/your_final_ranking_v2_model.dart
import '/components/drawer_menu/drawer_menu_model.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'your_final_ranking_v2_widget.dart' show YourFinalRankingV2Widget;
import 'package:flutter/material.dart';

class YourFinalRankingV2Model
    extends FlutterFlowModel<YourFinalRankingV2Widget> {
  /// State fields for stateful widgets in this page.
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
