import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'active_contast_details_widget.dart' show ActiveContastDetailsWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ActiveContastDetailsModel
    extends FlutterFlowModel<ActiveContastDetailsWidget> {
  ///  State fields for stateful widgets in this page.



  bool isLoading = true; // Add this line

  // Stores action output result for [Backend Call - API (contestDetails)] action in ActiveContastDetails widget.
  ApiCallResponse? _apiResult9k2;
  set apiResult9k2(ApiCallResponse? value) {
    _apiResult9k2 = value;
    debugLogWidgetClass(this);
  }

  ApiCallResponse? get apiResult9k2 => _apiResult9k2;

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
          'contestId': debugSerializeParam(
            widget?.contestId,
            ParamType.int,
            link:
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=ActiveContastDetails',
            searchReference:
                'reference=ShsKEwoJY29udGVzdElkEgZ4azFyZjNyBAgBIAFQAVoJY29udGVzdElk',
            name: 'int',
            nullable: true,
          )
        }.withoutNulls,
        actionOutputs: {
          'apiResult9k2': debugSerializeParam(
            apiResult9k2,
            ParamType.ApiResponse,
            link:
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=ActiveContastDetails',
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
            'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r/tab=uiBuilder&page=ActiveContastDetails',
        searchReference:
            'reference=OhRBY3RpdmVDb250YXN0RGV0YWlsc1ABWhRBY3RpdmVDb250YXN0RGV0YWlscw==',
        widgetClassName: 'ActiveContastDetails',
      );
}
