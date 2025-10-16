import '/backend/api_requests/api_calls.dart';
import '/components/drawer_menu/drawer_menu_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/admob_util.dart' as admob;
import '/index.dart';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (getProfile)] action in homePage widget.
  ApiCallResponse? _getProfileRes;
  set getProfileRes(ApiCallResponse? value) {
    _getProfileRes = value;
    debugLogWidgetClass(this);
  }

  ApiCallResponse? get getProfileRes => _getProfileRes;

  // Stores action output result for [AdMob - Show Interstitial Ad] action in homePage widget.
  bool? _interstitialAdSuccess;
  set interstitialAdSuccess(bool? value) {
    _interstitialAdSuccess = value;
    debugLogWidgetClass(this);
  }

  bool? get interstitialAdSuccess => _interstitialAdSuccess;

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
        actionOutputs: {
          'getProfileRes': debugSerializeParam(
            getProfileRes,
            ParamType.ApiResponse,
            link:
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=homePage',
            name: 'ApiCallResponse',
            nullable: true,
          ),
          'interstitialAdSuccess': debugSerializeParam(
            interstitialAdSuccess,
            ParamType.bool,
            link:
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=homePage',
            name: 'bool',
            nullable: true,
          )
        },
        generatorVariables: debugGeneratorVariables,
        backendQueries: debugBackendQueries,
        componentStates: {
          'drawerMenuModel (DrawerMenu)':
              drawerMenuModel?.toWidgetClassDebugData(),
          ...widgetBuilderComponents.map(
            (key, value) => MapEntry(
              key,
              value.toWidgetClassDebugData(),
            ),
          ),
        }.withoutNulls,
        link:
            'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r/tab=uiBuilder&page=homePage',
        searchReference: 'reference=Oghob21lUGFnZVABWghob21lUGFnZQ==',
        widgetClassName: 'homePage',
      );
}
