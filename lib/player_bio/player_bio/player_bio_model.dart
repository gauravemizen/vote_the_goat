import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/index.dart';
import 'player_bio_widget.dart' show PlayerBioWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PlayerBioModel extends FlutterFlowModel<PlayerBioWidget> {
  ///  Local state fields for this page.

  bool _isLoading = false;
  set isLoading(bool value) {
    _isLoading = value;
    debugLogWidgetClass(this);
  }

  bool get isLoading => _isLoading;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (playertBio)] action in playerBio widget.
  ApiCallResponse? _apiResultwyv;
  set apiResultwyv(ApiCallResponse? value) {
    _apiResultwyv = value;
    debugLogWidgetClass(this);
  }

  ApiCallResponse? get apiResultwyv => _apiResultwyv;

  // Stores action output result for [Backend Call - API (playerBioStats)] action in playerBio widget.
  ApiCallResponse? _playerStats;
  set playerStats(ApiCallResponse? value) {
    _playerStats = value;
    debugLogWidgetClass(this);
  }

  ApiCallResponse? get playerStats => _playerStats;

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController1;

  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController2;

  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController3;

  final Map<String, DebugDataField> debugGeneratorVariables = {};
  final Map<String, DebugDataField> debugBackendQueries = {};
  final Map<String, FlutterFlowModel> widgetBuilderComponents = {};
  @override
  void initState(BuildContext context) {
    debugLogWidgetClass(this);
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    expandableExpandableController1.dispose();
    expandableExpandableController2.dispose();
    expandableExpandableController3.dispose();
  }

  @override
  WidgetClassDebugData toWidgetClassDebugData() => WidgetClassDebugData(
        widgetParameters: {
          'playerId': debugSerializeParam(
            widget?.playerId,
            ParamType.int,
            link:
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=playerBio',
            searchReference:
                'reference=ShoKEgoIcGxheWVySWQSBms0aWI0dnIECAEgAFABWghwbGF5ZXJJZA==',
            name: 'int',
            nullable: true,
          )
        }.withoutNulls,
        localStates: {
          'isLoading': debugSerializeParam(
            isLoading,
            ParamType.bool,
            link:
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=playerBio',
            searchReference:
                'reference=QiMKEgoJaXNMb2FkaW5nEgV4ZW4wYyoHEgVmYWxzZXIECAUgAVABWglpc0xvYWRpbmdiCXBsYXllckJpbw==',
            name: 'bool',
            nullable: false,
          )
        },
        widgetStates: {
          'tabBarCurrentIndex': debugSerializeParam(
            tabBarCurrentIndex,
            ParamType.int,
            link:
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=playerBio',
            name: 'int',
            nullable: true,
          ),
          'tabBarPreviousIndex': debugSerializeParam(
            tabBarPreviousIndex,
            ParamType.int,
            link:
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=playerBio',
            name: 'int',
            nullable: true,
          )
        },
        actionOutputs: {
          'apiResultwyv': debugSerializeParam(
            apiResultwyv,
            ParamType.ApiResponse,
            link:
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=playerBio',
            name: 'ApiCallResponse',
            nullable: true,
          ),
          'playerStats': debugSerializeParam(
            playerStats,
            ParamType.ApiResponse,
            link:
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=playerBio',
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
            'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r/tab=uiBuilder&page=playerBio',
        searchReference: 'reference=OglwbGF5ZXJCaW9QAVoJcGxheWVyQmlv',
        widgetClassName: 'playerBio',
      );
}
