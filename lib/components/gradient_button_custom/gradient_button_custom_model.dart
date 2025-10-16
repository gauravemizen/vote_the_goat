import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'gradient_button_custom_widget.dart' show GradientButtonCustomWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class GradientButtonCustomModel
    extends FlutterFlowModel<GradientButtonCustomWidget> {
  final Map<String, DebugDataField> debugGeneratorVariables = {};
  final Map<String, DebugDataField> debugBackendQueries = {};
  final Map<String, FlutterFlowModel> widgetBuilderComponents = {};
  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  @override
  WidgetClassDebugData toWidgetClassDebugData() => WidgetClassDebugData(
        widgetParameters: {
          'text': debugSerializeParam(
            widget?.text,
            ParamType.String,
            link:
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=gradientButtonCustom',
            searchReference:
                'reference=ShQKDgoEdGV4dBIGZng0MHE3cgIIA1AAWgR0ZXh0',
            name: 'String',
            nullable: true,
          ),
          'navigationType': debugSerializeParam(
            widget?.navigationType,
            ParamType.int,
            link:
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=gradientButtonCustom',
            searchReference:
                'reference=Sk0KGAoObmF2aWdhdGlvblR5cGUSBnkwM2xiNCoDEgExcgQIASAAeiZmb3IgbWFuYWdpbmcgY29uZGl0aW9uIGJhc2UgbmF2aWdhdGlvblAAWg5uYXZpZ2F0aW9uVHlwZQ==',
            name: 'int',
            nullable: false,
          )
        }.withoutNulls,
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
            'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r/tab=uiBuilder&page=gradientButtonCustom',
        searchReference:
            'reference=OhRncmFkaWVudEJ1dHRvbkN1c3RvbVAAWhRncmFkaWVudEJ1dHRvbkN1c3RvbQ==',
        widgetClassName: 'gradientButtonCustom',
      );
}
