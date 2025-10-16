import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'filter_screen_widget.dart' show FilterScreenWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FilterScreenModel extends FlutterFlowModel<FilterScreenWidget> {
  ///  Local state fields for this page.

  bool _isLoading = false;
  set isLoading(bool value) {
    _isLoading = value;
    debugLogWidgetClass(this);
  }

  bool get isLoading => _isLoading;

  int? _filterIndex = 0;
  set filterIndex(int? value) {
    _filterIndex = value;
    debugLogWidgetClass(this);
  }

  int? get filterIndex => _filterIndex;

  int? _expandedIndex;
  set expandedIndex(int? value) {
    _expandedIndex = value;
    debugLogWidgetClass(this);
  }

  int? get expandedIndex => _expandedIndex;

  int? _valueIndex;
  set valueIndex(int? value) {
    _valueIndex = value;
    debugLogWidgetClass(this);
  }

  int? get valueIndex => _valueIndex;

  late LoggableList<dynamic> _filterData = LoggableList([]);
  set filterData(List<dynamic> value) {
    if (value != null) {
      _filterData = LoggableList(value);
    }

    debugLogWidgetClass(this);
  }

  List<dynamic> get filterData =>
      _filterData?..logger = () => debugLogWidgetClass(this);
  void addToFilterData(dynamic item) => filterData.add(item);
  void removeFromFilterData(dynamic item) => filterData.remove(item);
  void removeAtIndexFromFilterData(int index) => filterData.removeAt(index);
  void insertAtIndexInFilterData(int index, dynamic item) =>
      filterData.insert(index, item);
  void updateFilterDataAtIndex(int index, Function(dynamic) updateFn) =>
      filterData[index] = updateFn(filterData[index]);

  String? _selectedTitle;
  set selectedTitle(String? value) {
    _selectedTitle = value;
    debugLogWidgetClass(this);
  }

  String? get selectedTitle => _selectedTitle;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (filterList)] action in filterScreen widget.
  ApiCallResponse? _apiResult993;
  set apiResult993(ApiCallResponse? value) {
    _apiResult993 = value;
    debugLogWidgetClass(this);
  }

  ApiCallResponse? get apiResult993 => _apiResult993;

  // Stores action output result for [Backend Call - API (filterplayers)] action in applyFilterBtn widget.
  ApiCallResponse? _filterResult;
  set filterResult(ApiCallResponse? value) {
    _filterResult = value;
    debugLogWidgetClass(this);
  }

  ApiCallResponse? get filterResult => _filterResult;

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
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=filterScreen',
            searchReference:
                'reference=QiMKEgoJaXNMb2FkaW5nEgV4YjZtdSoHEgVmYWxzZXIECAUgAVABWglpc0xvYWRpbmdiDGZpbHRlclNjcmVlbg==',
            name: 'bool',
            nullable: false,
          ),
          'filterIndex': debugSerializeParam(
            filterIndex,
            ParamType.int,
            link:
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=filterScreen',
            searchReference:
                'reference=QhoKFAoLZmlsdGVySW5kZXgSBXhwczd4cgIIAVABWgtmaWx0ZXJJbmRleGIMZmlsdGVyU2NyZWVu',
            name: 'int',
            nullable: true,
          ),
          'valueIndex': debugSerializeParam(
            valueIndex,
            ParamType.int,
            link:
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=filterScreen',
            searchReference:
                'reference=QhkKEwoKdmFsdWVJbmRleBIFdXVhM3dyAggBUAFaCnZhbHVlSW5kZXhiDGZpbHRlclNjcmVlbg==',
            name: 'int',
            nullable: true,
          ),
          'filterData': debugSerializeParam(
            filterData,
            ParamType.JSON,
            isList: true,
            link:
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=filterScreen',
            searchReference:
                'reference=QhsKEwoKZmlsdGVyRGF0YRIFYng3cXJyBBICCAlQAVoKZmlsdGVyRGF0YWIMZmlsdGVyU2NyZWVu',
            name: 'dynamic',
            nullable: false,
          ),
          'selectedTitle': debugSerializeParam(
            selectedTitle,
            ParamType.String,
            link:
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=filterScreen',
            searchReference:
                'reference=QiIKFgoNc2VsZWN0ZWRUaXRsZRIFb3gyNTkqAhIAcgQIAyAAUAFaDXNlbGVjdGVkVGl0bGViDGZpbHRlclNjcmVlbg==',
            name: 'String',
            nullable: true,
          )
        },
        actionOutputs: {
          'apiResult993': debugSerializeParam(
            apiResult993,
            ParamType.ApiResponse,
            link:
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=filterScreen',
            name: 'ApiCallResponse',
            nullable: true,
          ),
          'filterResult': debugSerializeParam(
            filterResult,
            ParamType.ApiResponse,
            link:
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=filterScreen',
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
            'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r/tab=uiBuilder&page=filterScreen',
        searchReference: 'reference=OgxmaWx0ZXJTY3JlZW5QAVoMZmlsdGVyU2NyZWVu',
        widgetClassName: 'filterScreen',
      );
}
