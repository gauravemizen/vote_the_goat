import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'otp_widget.dart' show OtpWidget;
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OtpModel extends FlutterFlowModel<OtpWidget> {
  ///  Local state fields for this page.

  String _deviceToken = '00';
  set deviceToken(String value) {
    _deviceToken = value;
    debugLogWidgetClass(this);
  }

  String get deviceToken => _deviceToken;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Custom Action - getFcmToken] action in otp widget.
  String? _fcmToken;
  set fcmToken(String? value) {
    _fcmToken = value;
    debugLogWidgetClass(this);
  }

  String? get fcmToken => _fcmToken;

  // State field(s) for PinCode widget.
  TextEditingController? pinCodeController;
  FocusNode? pinCodeFocusNode;
  String? Function(BuildContext, String?)? pinCodeControllerValidator;
  String? _pinCodeControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'OTP  field is required';
    }
    if (val.length < 6) {
      return 'Requires 6 characters.';
    }
    return null;
  }

  // Stores action output result for [Validate Form] action in Button widget.
  bool? _validate;
  set validate(bool? value) {
    _validate = value;
    debugLogWidgetClass(this);
  }

  bool? get validate => _validate;

  // Stores action output result for [Backend Call - API (forgotOtpVerify)] action in Button widget.
  ApiCallResponse? _forgotRes;
  set forgotRes(ApiCallResponse? value) {
    _forgotRes = value;
    debugLogWidgetClass(this);
  }

  ApiCallResponse? get forgotRes => _forgotRes;

  // Stores action output result for [Backend Call - API (otpVerify)] action in Button widget.
  ApiCallResponse? _verifyResponse;
  set verifyResponse(ApiCallResponse? value) {
    _verifyResponse = value;
    debugLogWidgetClass(this);
  }

  ApiCallResponse? get verifyResponse => _verifyResponse;

  // State field(s) for Timer widget.
  final timerInitialTimeMs = 30000;
  int timerMilliseconds = 30000;
  String timerValue = StopWatchTimer.getDisplayTime(
    30000,
    hours: false,
    milliSecond: false,
  );
  FlutterFlowTimerController timerController =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countDown));

  final Map<String, DebugDataField> debugGeneratorVariables = {};
  final Map<String, DebugDataField> debugBackendQueries = {};
  final Map<String, FlutterFlowModel> widgetBuilderComponents = {};
  @override
  void initState(BuildContext context) {
    pinCodeController = TextEditingController()
      ..addListener(() {
        debugLogWidgetClass(this);
      });
    pinCodeControllerValidator = _pinCodeControllerValidator;

    debugLogWidgetClass(this);
  }

  @override
  void dispose() {
    pinCodeFocusNode?.dispose();
    pinCodeController?.dispose();

    timerController.dispose();
  }

  @override
  WidgetClassDebugData toWidgetClassDebugData() => WidgetClassDebugData(
        widgetParameters: {
          'email': debugSerializeParam(
            widget?.email,
            ParamType.String,
            link:
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=otp',
            searchReference:
                'reference=ShcKDwoFZW1haWwSBnB3cDRva3IECAMgAVABWgVlbWFpbA==',
            name: 'String',
            nullable: true,
          ),
          'user': debugSerializeParam(
            widget?.user,
            ParamType.int,
            link:
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=otp',
            searchReference:
                'reference=ShYKDgoEdXNlchIGcHdueGI1cgQIASAAUAFaBHVzZXI=',
            name: 'int',
            nullable: true,
          )
        }.withoutNulls,
        localStates: {
          'deviceToken': debugSerializeParam(
            deviceToken,
            ParamType.String,
            link:
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=otp',
            searchReference:
                'reference=QiAKFAoLZGV2aWNlVG9rZW4SBW94ZWVnKgISAHIECAMgAVABWgtkZXZpY2VUb2tlbmIDb3Rw',
            name: 'String',
            nullable: false,
          )
        },
        widgetStates: {
          'pinCodeText': debugSerializeParam(
            pinCodeController?.text,
            ParamType.String,
            link:
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=otp',
            name: 'String',
            nullable: true,
          )
        },
        actionOutputs: {
          'fcmToken': debugSerializeParam(
            fcmToken,
            ParamType.String,
            link:
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=otp',
            name: 'String',
            nullable: true,
          ),
          'validate': debugSerializeParam(
            validate,
            ParamType.bool,
            link:
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=otp',
            name: 'bool',
            nullable: true,
          ),
          'forgotRes': debugSerializeParam(
            forgotRes,
            ParamType.ApiResponse,
            link:
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=otp',
            name: 'ApiCallResponse',
            nullable: true,
          ),
          'verifyResponse': debugSerializeParam(
            verifyResponse,
            ParamType.ApiResponse,
            link:
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=otp',
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
            'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r/tab=uiBuilder&page=otp',
        searchReference: 'reference=OgNvdHBQAVoDb3Rw',
        widgetClassName: 'otp',
      );
}
