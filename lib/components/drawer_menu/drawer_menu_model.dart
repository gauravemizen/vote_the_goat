import '/backend/api_requests/api_calls.dart';
import '/components/log_out/log_out_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'dart:math' as math;
import 'drawer_menu_widget.dart' show DrawerMenuWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class DrawerMenuModel extends FlutterFlowModel<DrawerMenuWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (getProfile)] action in DrawerMenu widget.
  ApiCallResponse? _getProfileRes;
  set getProfileRes(ApiCallResponse? value) {
    _getProfileRes = value;
    debugLogWidgetClass(this);
  }

  ApiCallResponse? get getProfileRes => _getProfileRes;

  // State field(s) for Switch widget.
  bool? _switchValue1;
  set switchValue1(bool? value) {
    _switchValue1 = value;
    debugLogWidgetClass(this);
  }

  bool? get switchValue1 => _switchValue1;

  // State field(s) for Switch widget.
  bool? _switchValue2;
  set switchValue2(bool? value) {
    _switchValue2 = value;
    debugLogWidgetClass(this);
  }

  bool? get switchValue2 => _switchValue2;

  // Stores action output result for [Backend Call - API (contactSupport)] action in Row widget.
  ApiCallResponse? _cmsRes;
  set cmsRes(ApiCallResponse? value) {
    _cmsRes = value;
    debugLogWidgetClass(this);
  }

  ApiCallResponse? get cmsRes => _cmsRes;

  final Map<String, DebugDataField> debugGeneratorVariables = {};
  final Map<String, DebugDataField> debugBackendQueries = {};
  final Map<String, FlutterFlowModel> widgetBuilderComponents = {};
  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  @override
  WidgetClassDebugData toWidgetClassDebugData() => WidgetClassDebugData(
        widgetStates: {
          'switchValue1': debugSerializeParam(
            switchValue1,
            ParamType.bool,
            link:
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=DrawerMenu',
            name: 'bool',
            nullable: true,
          ),
          'switchValue2': debugSerializeParam(
            switchValue2,
            ParamType.bool,
            link:
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=DrawerMenu',
            name: 'bool',
            nullable: true,
          )
        },
        actionOutputs: {
          'getProfileRes': debugSerializeParam(
            getProfileRes,
            ParamType.ApiResponse,
            link:
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=DrawerMenu',
            name: 'ApiCallResponse',
            nullable: true,
          ),
          'cmsRes': debugSerializeParam(
            cmsRes,
            ParamType.ApiResponse,
            link:
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=DrawerMenu',
            name: 'ApiCallResponse',
            nullable: true,
          )
        },
        generatorVariables: debugGeneratorVariables,
        backendQueries: debugBackendQueries,
        componentStates: {
          ...widgetBuilderComponents.map(
            (key, value) => MapEntry(
              key,
              value.toWidgetClassDebugData(),
            ),
          ),
        }.withoutNulls,
        link:
            'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r/tab=uiBuilder&page=DrawerMenu',
        searchReference: 'reference=OgpEcmF3ZXJNZW51UABaCkRyYXdlck1lbnU=',
        widgetClassName: 'DrawerMenu',
      );
}
