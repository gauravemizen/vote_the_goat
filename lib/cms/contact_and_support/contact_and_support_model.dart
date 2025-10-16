import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'contact_and_support_widget.dart' show ContactAndSupportWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ContactAndSupportModel extends FlutterFlowModel<ContactAndSupportWidget> {
  ///  Local state fields for this page.

  bool _isLoading = false;
  set isLoading(bool value) {
    _isLoading = value;
    debugLogWidgetClass(this);
  }

  bool get isLoading => _isLoading;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (contactSupport)] action in ContactAndSupport widget.
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
  void initState(BuildContext context) {
    debugLogWidgetClass(this);
  }

  @override
  void dispose() {}

  @override
  WidgetClassDebugData toWidgetClassDebugData() => WidgetClassDebugData(
        localStates: {
          'isLoading': debugSerializeParam(
            isLoading,
            ParamType.bool,
            link:
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=ContactAndSupport',
            searchReference:
                'reference=QiMKEgoJaXNMb2FkaW5nEgVyM3p2dioHEgVmYWxzZXIECAUgAVABWglpc0xvYWRpbmdiEUNvbnRhY3RBbmRTdXBwb3J0',
            name: 'bool',
            nullable: false,
          )
        },
        actionOutputs: {
          'cmsRes': debugSerializeParam(
            cmsRes,
            ParamType.ApiResponse,
            link:
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=ContactAndSupport',
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
            'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r/tab=uiBuilder&page=ContactAndSupport',
        searchReference:
            'reference=OhFDb250YWN0QW5kU3VwcG9ydFABWhFDb250YWN0QW5kU3VwcG9ydA==',
        widgetClassName: 'ContactAndSupport',
      );
}
