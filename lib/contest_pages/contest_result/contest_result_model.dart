import '/backend/api_requests/api_calls.dart';
import '/components/gradient_button_custom/gradient_button_custom_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'contest_result_widget.dart' show ContestResultWidget;
import 'package:flutter/material.dart';

class ContestResultModel extends FlutterFlowModel<ContestResultWidget> {
  ///  Local state fields for this page.

  bool _isLoading = true;
  set isLoading(bool value) {
    _isLoading = value;
    debugLogWidgetClass(this);
  }

  bool get isLoading => _isLoading;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (contestfinaldetails)] action in ContestResult widget.
  ApiCallResponse? _contestRes;
  set contestRes(ApiCallResponse? value) {
    _contestRes = value;
    debugLogWidgetClass(this);
  }

  ApiCallResponse? get contestRes => _contestRes;

  // Model for gradientButtonCustom component.
  late GradientButtonCustomModel gradientButtonCustomModel;

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
        widgetParameters: {
          'contestId': debugSerializeParam(
            widget?.contestId,
            ParamType.int,
            link:
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=ContestResult',
            searchReference:
                'reference=ShsKEwoJY29udGVzdElkEgZ1d2ltN3RyBAgBIAFQAVoJY29udGVzdElk',
            name: 'int',
            nullable: true,
          )
        }.withoutNulls,
        localStates: {
          'isLoading': debugSerializeParam(
            isLoading,
            ParamType.bool,
            link:
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=ContestResult',
            searchReference:
                'reference=QiMKEgoJaXNMb2FkaW5nEgU0eDkwNCoHEgVmYWxzZXIECAUgAVABWglpc0xvYWRpbmdiDUNvbnRlc3RSZXN1bHQ=',
            name: 'bool',
            nullable: false,
          )
        },
        actionOutputs: {
          'contestRes': debugSerializeParam(
            contestRes,
            ParamType.ApiResponse,
            link:
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=ContestResult',
            name: 'ApiCallResponse',
            nullable: true,
          )
        },
        generatorVariables: debugGeneratorVariables,
        backendQueries: debugBackendQueries,
        componentStates: {
          'gradientButtonCustomModel (gradientButtonCustom)':
              gradientButtonCustomModel.toWidgetClassDebugData(),
          ...widgetBuilderComponents.map(
            (key, value) => MapEntry(
              key,
              value.toWidgetClassDebugData(),
            ),
          ),
        }.withoutNulls,
        link:
            'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r/tab=uiBuilder&page=ContestResult',
        searchReference:
            'reference=Og1Db250ZXN0UmVzdWx0UAFaDUNvbnRlc3RSZXN1bHQ=',
        widgetClassName: 'ContestResult',
      );
}
