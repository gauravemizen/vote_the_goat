import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'contest_page_widget.dart' show ContestPageWidget;
import 'dart:async';
import 'package:flutter/material.dart';

class ContestPageModel extends FlutterFlowModel<ContestPageWidget> {
  ///  Local state fields for this page.

  bool _isLoading = false;
  set isLoading(bool value) {
    _isLoading = value;
    debugLogWidgetClass(this);
  }

  bool get isLoading => _isLoading;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (completedContest)] action in ContestPage widget.
  ApiCallResponse? _completedContestRes;
  set completedContestRes(ApiCallResponse? value) {
    _completedContestRes = value;
    debugLogWidgetClass(this);
  }

  ApiCallResponse? get completedContestRes => _completedContestRes;

  // State field(s) for searchContest widget.
  FocusNode? searchContestFocusNode;
  TextEditingController? searchContestTextController;
  String? Function(BuildContext, String?)? searchContestTextControllerValidator;
  Completer<ApiCallResponse>? apiRequestCompleter;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  final Map<String, DebugDataField> debugGeneratorVariables = {};
  final Map<String, DebugDataField> debugBackendQueries = {};
  final Map<String, FlutterFlowModel> widgetBuilderComponents = {};
  @override
  void initState(BuildContext context) {
    debugLogWidgetClass(this);
  }

  @override
  void dispose() {
    searchContestFocusNode?.dispose();
    searchContestTextController?.dispose();

    tabBarController?.dispose();
  }

  /// Additional helper methods.
  Future waitForApiRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  @override
  WidgetClassDebugData toWidgetClassDebugData() => WidgetClassDebugData(
        localStates: {
          'isLoading': debugSerializeParam(
            isLoading,
            ParamType.bool,
            link:
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=ContestPage',
            searchReference:
                'reference=QiMKEgoJaXNMb2FkaW5nEgV2MGk3eioHEgVmYWxzZXIECAUgAVABWglpc0xvYWRpbmdiC0NvbnRlc3RQYWdl',
            name: 'bool',
            nullable: false,
          )
        },
        widgetStates: {
          'searchContestText': debugSerializeParam(
            searchContestTextController?.text,
            ParamType.String,
            link:
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=ContestPage',
            name: 'String',
            nullable: true,
          ),
          'tabBarCurrentIndex': debugSerializeParam(
            tabBarCurrentIndex,
            ParamType.int,
            link:
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=ContestPage',
            name: 'int',
            nullable: true,
          ),
          'tabBarPreviousIndex': debugSerializeParam(
            tabBarPreviousIndex,
            ParamType.int,
            link:
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=ContestPage',
            name: 'int',
            nullable: true,
          )
        },
        actionOutputs: {
          'completedContestRes': debugSerializeParam(
            completedContestRes,
            ParamType.ApiResponse,
            link:
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=ContestPage',
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
            'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r/tab=uiBuilder&page=ContestPage',
        searchReference: 'reference=OgtDb250ZXN0UGFnZVABWgtDb250ZXN0UGFnZQ==',
        widgetClassName: 'ContestPage',
      );
}
