// import '/backend/api_requests/api_calls.dart';
// import '/components/gradient_button_custom/gradient_button_custom_widget.dart';
// import '/flutter_flow/flutter_flow_theme.dart';
// import '/flutter_flow/flutter_flow_util.dart';
// import '/flutter_flow/flutter_flow_widgets.dart';
// import 'dart:ui';
// import '/index.dart';
// import 'winner_bottom_sheet_widget.dart' show WinnerBottomSheetWidget;
// import 'package:flutter/material.dart';
// import 'package:flutter/scheduler.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:provider/provider.dart';
//
// class WinnerBottomSheetModel extends FlutterFlowModel<WinnerBottomSheetWidget> {
//   ///  State fields for stateful widgets in this component.
//
//   // Stores action output result for [Backend Call - API (minionPlayerScore)] action in WinnerBottomSheet widget.
//   ApiCallResponse? _apiResult2kw;
//   set apiResult2kw(ApiCallResponse? value) {
//     _apiResult2kw = value;
//     debugLogWidgetClass(this);
//   }
//
//   ApiCallResponse? get apiResult2kw => _apiResult2kw;
//
//   // Model for gradientButtonCustom component.
//   late GradientButtonCustomModel gradientButtonCustomModel;
//
//   final Map<String, DebugDataField> debugGeneratorVariables = {};
//   final Map<String, DebugDataField> debugBackendQueries = {};
//   final Map<String, FlutterFlowModel> widgetBuilderComponents = {};
//   @override
//   void initState(BuildContext context) {
//     gradientButtonCustomModel =
//         createModel(context, () => GradientButtonCustomModel());
//   }
//
//   @override
//   void dispose() {
//     gradientButtonCustomModel.dispose();
//   }
//
//   @override
//   WidgetClassDebugData toWidgetClassDebugData() => WidgetClassDebugData(
//         widgetParameters: {
//           'onContinuePress': debugSerializeParam(
//             widget?.onContinuePress,
//             ParamType.Action,
//             link:
//                 'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=WinnerBottomSheet',
//             searchReference:
//                 'reference=SiEKGQoPb25Db250aW51ZVByZXNzEgZ0dWs5Z3NyBAgVIAFQAFoPb25Db250aW51ZVByZXNz',
//             name: 'Future Function()',
//             nullable: true,
//           )
//         }.withoutNulls,
//         actionOutputs: {
//           'apiResult2kw': debugSerializeParam(
//             apiResult2kw,
//             ParamType.ApiResponse,
//             link:
//                 'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=WinnerBottomSheet',
//             name: 'ApiCallResponse',
//             nullable: true,
//           )
//         },
//         generatorVariables: debugGeneratorVariables,
//         backendQueries: debugBackendQueries,
//         componentStates: {
//           'gradientButtonCustomModel (gradientButtonCustom)':
//               gradientButtonCustomModel?.toWidgetClassDebugData(),
//           ...widgetBuilderComponents.map(
//             (key, value) => MapEntry(
//               key,
//               value.toWidgetClassDebugData(),
//             ),
//           ),
//         }.withoutNulls,
//         link:
//             'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r/tab=uiBuilder&page=WinnerBottomSheet',
//         searchReference:
//             'reference=OhFXaW5uZXJCb3R0b21TaGVldFAAWhFXaW5uZXJCb3R0b21TaGVldA==',
//         widgetClassName: 'WinnerBottomSheet',
//       );
// }



import '/backend/api_requests/api_calls.dart';
import '/components/gradient_button_custom/gradient_button_custom_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'winner_bottom_sheet_widget.dart' show WinnerBottomSheetWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class WinnerBottomSheetModel extends FlutterFlowModel<WinnerBottomSheetWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (minionPlayerScore)] action in WinnerBottomSheet widget.
  ApiCallResponse? _apiResult2kw;
  set apiResult2kw(ApiCallResponse? value) {
    _apiResult2kw = value;
    debugLogWidgetClass(this);
  }

  ApiCallResponse? get apiResult2kw => _apiResult2kw;

  // Model for gradientButtonCustom component.
  late GradientButtonCustomModel gradientButtonCustomModel;

  // New properties for API data
  int rightAnswersCount = 0;
  int totalQuestions = 0;
  List<Map<String, dynamic>> playerResults = [];

  final Map<String, DebugDataField> debugGeneratorVariables = {};
  final Map<String, DebugDataField> debugBackendQueries = {};
  final Map<String, FlutterFlowModel> widgetBuilderComponents = {};

  @override
  void initState(BuildContext context) {
    gradientButtonCustomModel =
        createModel(context, () => GradientButtonCustomModel());
  }

  @override
  void dispose() {
    gradientButtonCustomModel.dispose();
  }

  @override
  WidgetClassDebugData toWidgetClassDebugData() => WidgetClassDebugData(
        widgetParameters: {
          'onContinuePress': debugSerializeParam(
            widget?.onContinuePress,
            ParamType.Action,
            link:
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=WinnerBottomSheet',
            searchReference:
                'reference=SiEKGQoPb25Db250aW51ZVByZXNzEgZ0dWs5Z3NyBAgVIAFQAFoPb25Db250aW51ZVByZXNz',
            name: 'Future Function()',
            nullable: true,
          )
        }.withoutNulls,
        actionOutputs: {
          'apiResult2kw': debugSerializeParam(
            apiResult2kw,
            ParamType.ApiResponse,
            link:
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=WinnerBottomSheet',
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
            'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r/tab=uiBuilder&page=WinnerBottomSheet',
        searchReference:
            'reference=OhFXaW5uZXJCb3R0b21TaGVldFAAWhFXaW5uZXJCb3R0b21TaGVldA==',
        widgetClassName: 'WinnerBottomSheet',
      );
}