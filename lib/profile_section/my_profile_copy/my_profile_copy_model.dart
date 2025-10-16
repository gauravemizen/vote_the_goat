import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/index.dart';
import 'my_profile_copy_widget.dart' show MyProfileCopyWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MyProfileCopyModel extends FlutterFlowModel<MyProfileCopyWidget> {
  ///  Local state fields for this page.

  bool _isLoading = false;
  set isLoading(bool value) {
    _isLoading = value;
    debugLogWidgetClass(this);
  }

  bool get isLoading => _isLoading;

  ///  State fields for stateful widgets in this page.

  final formKey2 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - API (getProfile)] action in MyProfileCopy widget.
  ApiCallResponse? _getProfileRes;
  set getProfileRes(ApiCallResponse? value) {
    _getProfileRes = value;
    debugLogWidgetClass(this);
  }

  ApiCallResponse? get getProfileRes => _getProfileRes;

  bool isDataUploading_image = false;
  FFUploadedFile uploadedLocalFile_image =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // State field(s) for nameField widget.
  FocusNode? nameFieldFocusNode;
  TextEditingController? nameFieldTextController;
  String? Function(BuildContext, String?)? nameFieldTextControllerValidator;
  // State field(s) for emailFIeld widget.
  FocusNode? emailFIeldFocusNode;
  TextEditingController? emailFIeldTextController;
  String? Function(BuildContext, String?)? emailFIeldTextControllerValidator;
  // Stores action output result for [Backend Call - API (updateProfile)] action in Button widget.
  ApiCallResponse? _apiResultz40;
  set apiResultz40(ApiCallResponse? value) {
    _apiResultz40 = value;
    debugLogWidgetClass(this);
  }

  ApiCallResponse? get apiResultz40 => _apiResultz40;

  final Map<String, DebugDataField> debugGeneratorVariables = {};
  final Map<String, DebugDataField> debugBackendQueries = {};
  final Map<String, FlutterFlowModel> widgetBuilderComponents = {};
  @override
  void initState(BuildContext context) {
    debugLogWidgetClass(this);
  }

  @override
  void dispose() {
    nameFieldFocusNode?.dispose();
    nameFieldTextController?.dispose();

    emailFIeldFocusNode?.dispose();
    emailFIeldTextController?.dispose();
  }

  @override
  WidgetClassDebugData toWidgetClassDebugData() => WidgetClassDebugData(
        localStates: {
          'isLoading': debugSerializeParam(
            isLoading,
            ParamType.bool,
            link:
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=MyProfileCopy',
            searchReference:
                'reference=QiMKEgoJaXNMb2FkaW5nEgU3MTdzZyoHEgVmYWxzZXIECAUgAVABWglpc0xvYWRpbmdiDU15UHJvZmlsZUNvcHk=',
            name: 'bool',
            nullable: false,
          )
        },
        widgetStates: {
          'nameFieldText': debugSerializeParam(
            nameFieldTextController?.text,
            ParamType.String,
            link:
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=MyProfileCopy',
            name: 'String',
            nullable: true,
          ),
          'emailFIeldText': debugSerializeParam(
            emailFIeldTextController?.text,
            ParamType.String,
            link:
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=MyProfileCopy',
            name: 'String',
            nullable: true,
          )
        },
        actionOutputs: {
          'getProfileRes': debugSerializeParam(
            getProfileRes,
            ParamType.ApiResponse,
            link:
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=MyProfileCopy',
            name: 'ApiCallResponse',
            nullable: true,
          ),
          'apiResultz40': debugSerializeParam(
            apiResultz40,
            ParamType.ApiResponse,
            link:
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=MyProfileCopy',
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
            'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r/tab=uiBuilder&page=MyProfileCopy',
        searchReference:
            'reference=Og1NeVByb2ZpbGVDb3B5UAFaDU15UHJvZmlsZUNvcHk=',
        widgetClassName: 'MyProfileCopy',
      );
}
