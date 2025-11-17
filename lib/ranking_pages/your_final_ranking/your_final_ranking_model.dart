import '/components/drawer_menu/drawer_menu_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'your_final_ranking_widget.dart' show YourFinalRankingWidget;
import 'package:flutter/material.dart';

class YourFinalRankingModel extends FlutterFlowModel<YourFinalRankingWidget> {
  ///  State fields for stateful widgets in this page.

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
    drawerMenuModel.dispose();
  }

  @override
  WidgetClassDebugData toWidgetClassDebugData() => WidgetClassDebugData(
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
            'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r/tab=uiBuilder&page=YourFinalRanking',
        searchReference:
            'reference=OhBZb3VyRmluYWxSYW5raW5nUAFaEFlvdXJGaW5hbFJhbmtpbmc=',
        widgetClassName: 'YourFinalRanking',
      );
}
