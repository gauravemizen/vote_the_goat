import '/backend/api_requests/api_calls.dart';
import '/components/drawer_menu/drawer_menu_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'dart:async';
import 'eligible_player_widget.dart' show EligiblePlayerWidget;
import 'package:flutter/material.dart';

class EligiblePlayerModel extends FlutterFlowModel<EligiblePlayerWidget> {
  ///  Local state fields for this page.

  late LoggableList<int> _selectedItems = LoggableList([]);
  set selectedItems(List<int> value) {
    _selectedItems = LoggableList(value);
  
    debugLogWidgetClass(this);
  }

  List<int> get selectedItems =>
      _selectedItems..logger = () => debugLogWidgetClass(this);
  void addToSelectedItems(int item) => selectedItems.add(item);
  void removeFromSelectedItems(int item) => selectedItems.remove(item);
  void removeAtIndexFromSelectedItems(int index) =>
      selectedItems.removeAt(index);
  void insertAtIndexInSelectedItems(int index, int item) =>
      selectedItems.insert(index, item);
  void updateSelectedItemsAtIndex(int index, Function(int) updateFn) =>
      selectedItems[index] = updateFn(selectedItems[index]);

  bool _isLoading = false;
  set isLoading(bool value) {
    _isLoading = value;
    debugLogWidgetClass(this);
  }

  bool get isLoading => _isLoading;

  String? _searchValue;
  set searchValue(String? value) {
    _searchValue = value;
    debugLogWidgetClass(this);
  }

  String? get searchValue => _searchValue;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (eligblePlayers)] action in eligible_player widget.
  ApiCallResponse? _apiResultlrq;
  set apiResultlrq(ApiCallResponse? value) {
    _apiResultlrq = value;
    debugLogWidgetClass(this);
  }

  ApiCallResponse? get apiResultlrq => _apiResultlrq;

  // State field(s) for searchField widget.
  FocusNode? searchFieldFocusNode;
  TextEditingController? searchFieldTextController;
  String? Function(BuildContext, String?)? searchFieldTextControllerValidator;
  Completer<ApiCallResponse>? apiRequestCompleter;
  // Model for DrawerMenu component.
  late DrawerMenuModel drawerMenuModel;

  final Map<String, DebugDataField> debugGeneratorVariables = {};
  final Map<String, DebugDataField> debugBackendQueries = {};
  final Map<String, FlutterFlowModel> widgetBuilderComponents = {};
  @override
  void initState(BuildContext context) {
    drawerMenuModel = createModel(context, () => DrawerMenuModel());

    debugLogWidgetClass(this);
  }

  @override
  void dispose() {
    searchFieldFocusNode?.dispose();
    searchFieldTextController?.dispose();

    drawerMenuModel.dispose();
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
          'selectedItems': debugSerializeParam(
            selectedItems,
            ParamType.int,
            isList: true,
            link:
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=eligible_player',
            searchReference:
                'reference=Qh4KFgoNc2VsZWN0ZWRJdGVtcxIFbGFkZWtyBBICCAFQAVoNc2VsZWN0ZWRJdGVtc2IPZWxpZ2libGVfcGxheWVy',
            name: 'int',
            nullable: false,
          ),
          'isLoading': debugSerializeParam(
            isLoading,
            ParamType.bool,
            link:
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=eligible_player',
            searchReference:
                'reference=QiMKEgoJaXNMb2FkaW5nEgVpY25xeioHEgVmYWxzZXIECAUgAVABWglpc0xvYWRpbmdiD2VsaWdpYmxlX3BsYXllcg==',
            name: 'bool',
            nullable: false,
          ),
          'searchValue': debugSerializeParam(
            searchValue,
            ParamType.String,
            link:
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=eligible_player',
            searchReference:
                'reference=QiAKFAoLc2VhcmNoVmFsdWUSBWlqOXMyKgISAHIECAMgAFABWgtzZWFyY2hWYWx1ZWIPZWxpZ2libGVfcGxheWVy',
            name: 'String',
            nullable: true,
          )
        },
        widgetStates: {
          'searchFieldText': debugSerializeParam(
            searchFieldTextController?.text,
            ParamType.String,
            link:
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=eligible_player',
            name: 'String',
            nullable: true,
          )
        },
        actionOutputs: {
          'apiResultlrq': debugSerializeParam(
            apiResultlrq,
            ParamType.ApiResponse,
            link:
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=eligible_player',
            name: 'ApiCallResponse',
            nullable: true,
          )
        },
        generatorVariables: debugGeneratorVariables,
        backendQueries: debugBackendQueries,
        componentStates: {
          'drawerMenuModel (DrawerMenu)':
              drawerMenuModel.toWidgetClassDebugData(),
          ...widgetBuilderComponents.map(
            (key, value) => MapEntry(
              key,
              value.toWidgetClassDebugData(),
            ),
          ),
        }.withoutNulls,
        link:
            'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r/tab=uiBuilder&page=eligible_player',
        searchReference:
            'reference=Og9lbGlnaWJsZV9wbGF5ZXJQAVoPZWxpZ2libGVfcGxheWVy',
        widgetClassName: 'eligible_player',
      );
}
