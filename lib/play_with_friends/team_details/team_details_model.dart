import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/backend/schema/structs/index.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/index.dart';
import 'team_details_widget.dart' show TeamDetailsWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TeamDetailsModel extends FlutterFlowModel<TeamDetailsWidget> {
  ///  Local state fields for this page.

  bool _isLoading = false;
  set isLoading(bool value) {
    _isLoading = value;
    debugLogWidgetClass(this);
  }

  bool get isLoading => _isLoading;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (getteamdetail)] action in TeamDetails widget.
  ApiCallResponse? _apiResultr60;
  set apiResultr60(ApiCallResponse? value) {
    _apiResultr60 = value;
    debugLogWidgetClass(this);
  }

  ApiCallResponse? get apiResultr60 => _apiResultr60;

  final Map<String, DebugDataField> debugGeneratorVariables = {};
  final Map<String, DebugDataField> debugBackendQueries = {};
  final Map<String, FlutterFlowModel> widgetBuilderComponents = {};
  @override
  void initState(BuildContext context) {
    debugLogWidgetClass(this);
  }

  @override
  void dispose() {}

  @override
  WidgetClassDebugData toWidgetClassDebugData() => WidgetClassDebugData(
        widgetParameters: {
          'teamIndex': debugSerializeParam(
            widget?.teamIndex,
            ParamType.int,
            link:
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=TeamDetails',
            searchReference:
                'reference=SiAKEwoJdGVhbUluZGV4EgZ3MzRzMGcqAxIBMHIECAEgAVABWgl0ZWFtSW5kZXg=',
            name: 'int',
            nullable: false,
          )
        }.withoutNulls,
        localStates: {
          'isLoading': debugSerializeParam(
            isLoading,
            ParamType.bool,
            link:
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=TeamDetails',
            searchReference:
                'reference=QiMKEgoJaXNMb2FkaW5nEgV3MmdsbSoHEgVmYWxzZXIECAUgAVABWglpc0xvYWRpbmdiC1RlYW1EZXRhaWxz',
            name: 'bool',
            nullable: false,
          )
        },
        actionOutputs: {
          'apiResultr60': debugSerializeParam(
            apiResultr60,
            ParamType.ApiResponse,
            link:
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=TeamDetails',
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
            'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r/tab=uiBuilder&page=TeamDetails',
        searchReference: 'reference=OgtUZWFtRGV0YWlsc1ABWgtUZWFtRGV0YWlscw==',
        widgetClassName: 'TeamDetails',
      );
}
