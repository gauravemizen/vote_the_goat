import '/backend/api_requests/api_calls.dart';
import '/components/gradient_button_custom/gradient_button_custom_widget.dart';
import '/components/winner_bottom_sheet/winner_bottom_sheet_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/index.dart';
import 'match_playerss_widget.dart' show MatchPlayerssWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class MatchPlayerssModel extends FlutterFlowModel<MatchPlayerssWidget> {
  ///  Local state fields for this page.

  bool _isLoading = false;
  set isLoading(bool value) {
    _isLoading = value;
    debugLogWidgetClass(this);
  }

  bool get isLoading => _isLoading;

  int _questionIndex = 0;
  set questionIndex(int value) {
    _questionIndex = value;
    debugLogWidgetClass(this);
  }

  int get questionIndex => _questionIndex;

  int? _questionNo = 1;
  set questionNo(int? value) {
    _questionNo = value;
    debugLogWidgetClass(this);
  }

  int? get questionNo => _questionNo;

  int? _selectedIndex = -1;
  set selectedIndex(int? value) {
    _selectedIndex = value;
    debugLogWidgetClass(this);
  }

  int? get selectedIndex => _selectedIndex;

  int? _selectedPlayerId;
  set selectedPlayerId(int? value) {
    _selectedPlayerId = value;
    debugLogWidgetClass(this);
  }

  int? get selectedPlayerId => _selectedPlayerId;

  bool _isTapped = false;
  set isTapped(bool value) {
    _isTapped = value;
    debugLogWidgetClass(this);
  }

  bool get isTapped => _isTapped;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (matchPlayers)] action in MatchPlayerss widget.
  ApiCallResponse? _matchMinionRes;
  set matchMinionRes(ApiCallResponse? value) {
    _matchMinionRes = value;
    debugLogWidgetClass(this);
  }

  ApiCallResponse? get matchMinionRes => _matchMinionRes;

  // Model for gradientButtonCustom component.
  late GradientButtonCustomModel gradientButtonCustomModel;
  // Stores action output result for [Backend Call - API (submitMinion)] action in gradientButtonCustom widget.
  ApiCallResponse? _apiResultyli;
  set apiResultyli(ApiCallResponse? value) {
    _apiResultyli = value;
    debugLogWidgetClass(this);
  }

  ApiCallResponse? get apiResultyli => _apiResultyli;

  // Stores action output result for [Backend Call - API (autoAssociate)] action in Button widget.
  ApiCallResponse? _autoAssociateRes;
  set autoAssociateRes(ApiCallResponse? value) {
    _autoAssociateRes = value;
    debugLogWidgetClass(this);
  }

  ApiCallResponse? get autoAssociateRes => _autoAssociateRes;

  final Map<String, DebugDataField> debugGeneratorVariables = {};
  final Map<String, DebugDataField> debugBackendQueries = {};
  final Map<String, FlutterFlowModel> widgetBuilderComponents = {};
  @override
  void initState(BuildContext context) {
    gradientButtonCustomModel =
        createModel(context, () => GradientButtonCustomModel());

    debugLogWidgetClass(this);
  }

  @override
  void dispose() {
    gradientButtonCustomModel.dispose();
  }

  @override
  WidgetClassDebugData toWidgetClassDebugData() => WidgetClassDebugData(
        localStates: {
          'isLoading': debugSerializeParam(
            isLoading,
            ParamType.bool,
            link:
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=MatchPlayerss',
            searchReference:
                'reference=QiMKEgoJaXNMb2FkaW5nEgVscXpxaioHEgVmYWxzZXIECAUgAVABWglpc0xvYWRpbmdiDU1hdGNoUGxheWVyc3M=',
            name: 'bool',
            nullable: false,
          ),
          'questionIndex': debugSerializeParam(
            questionIndex,
            ParamType.int,
            link:
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=MatchPlayerss',
            searchReference:
                'reference=Qh4KFgoNcXVlc3Rpb25JbmRleBIFMzVqYjNyBAgBIAFQAVoNcXVlc3Rpb25JbmRleGINTWF0Y2hQbGF5ZXJzcw==',
            name: 'int',
            nullable: false,
          ),
          'questionNo': debugSerializeParam(
            questionNo,
            ParamType.int,
            link:
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=MatchPlayerss',
            searchReference:
                'reference=QhkKEwoKcXVlc3Rpb25ObxIFb3R3M3pyAggBUAFaCnF1ZXN0aW9uTm9iDU1hdGNoUGxheWVyc3M=',
            name: 'int',
            nullable: true,
          ),
          'selectedIndex': debugSerializeParam(
            selectedIndex,
            ParamType.int,
            link:
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=MatchPlayerss',
            searchReference:
                'reference=Qh4KFgoNc2VsZWN0ZWRJbmRleBIFZm8zdG5yBAgBIABQAVoNc2VsZWN0ZWRJbmRleGINTWF0Y2hQbGF5ZXJzcw==',
            name: 'int',
            nullable: true,
          ),
          'selectedPlayerId': debugSerializeParam(
            selectedPlayerId,
            ParamType.int,
            link:
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=MatchPlayerss',
            searchReference:
                'reference=QiEKGQoQc2VsZWN0ZWRQbGF5ZXJJZBIFazF2cDRyBAgBIABQAVoQc2VsZWN0ZWRQbGF5ZXJJZGINTWF0Y2hQbGF5ZXJzcw==',
            name: 'int',
            nullable: true,
          ),
          'isTapped': debugSerializeParam(
            isTapped,
            ParamType.bool,
            link:
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=MatchPlayerss',
            searchReference:
                'reference=QiIKEQoIaXNUYXBwZWQSBTJuNnRjKgcSBWZhbHNlcgQIBSABUAFaCGlzVGFwcGVkYg1NYXRjaFBsYXllcnNz',
            name: 'bool',
            nullable: false,
          )
        },
        actionOutputs: {
          'matchMinionRes': debugSerializeParam(
            matchMinionRes,
            ParamType.ApiResponse,
            link:
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=MatchPlayerss',
            name: 'ApiCallResponse',
            nullable: true,
          ),
          'apiResultyli': debugSerializeParam(
            apiResultyli,
            ParamType.ApiResponse,
            link:
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=MatchPlayerss',
            name: 'ApiCallResponse',
            nullable: true,
          ),
          'autoAssociateRes': debugSerializeParam(
            autoAssociateRes,
            ParamType.ApiResponse,
            link:
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=MatchPlayerss',
            name: 'ApiCallResponse',
            nullable: true,
          )
        },
        generatorVariables: debugGeneratorVariables,
        backendQueries: debugBackendQueries,
        componentStates: {
          'gradientButtonCustomModel (gradientButtonCustom)':
              gradientButtonCustomModel?.toWidgetClassDebugData(),
          ...widgetBuilderComponents.map(
            (key, value) => MapEntry(
              key,
              value.toWidgetClassDebugData(),
            ),
          ),
        }.withoutNulls,
        link:
            'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r/tab=uiBuilder&page=MatchPlayerss',
        searchReference:
            'reference=Og1NYXRjaFBsYXllcnNzUAFaDU1hdGNoUGxheWVyc3M=',
        widgetClassName: 'MatchPlayerss',
      );
}
