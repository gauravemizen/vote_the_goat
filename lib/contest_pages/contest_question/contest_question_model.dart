import '/backend/api_requests/api_calls.dart';
import '/components/gradient_button_custom/gradient_button_custom_widget.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'contest_question_widget.dart' show ContestQuestionWidget;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';

class ContestQuestionModel extends FlutterFlowModel<ContestQuestionWidget> {
  ///  Local state fields for this page.

  late LoggableList<dynamic> _quizData = LoggableList([]);
  set quizData(List<dynamic> value) {
    _quizData = LoggableList(value);
  
    debugLogWidgetClass(this);
  }

  List<dynamic> get quizData =>
      _quizData..logger = () => debugLogWidgetClass(this);
  void addToQuizData(dynamic item) => quizData.add(item);
  void removeFromQuizData(dynamic item) => quizData.remove(item);
  void removeAtIndexFromQuizData(int index) => quizData.removeAt(index);
  void insertAtIndexInQuizData(int index, dynamic item) =>
      quizData.insert(index, item);
  void updateQuizDataAtIndex(int index, Function(dynamic) updateFn) =>
      quizData[index] = updateFn(quizData[index]);

  int? _questionIndex = 0;
  set questionIndex(int? value) {
    _questionIndex = value;
    debugLogWidgetClass(this);
  }

  int? get questionIndex => _questionIndex;

  int _questionNo = 1;
  set questionNo(int value) {
    _questionNo = value;
    debugLogWidgetClass(this);
  }

  int get questionNo => _questionNo;

  int _selectedOption = -1;
  set selectedOption(int value) {
    _selectedOption = value;
    debugLogWidgetClass(this);
  }

  int get selectedOption => _selectedOption;

  int _questionType = 2;
  set questionType(int value) {
    _questionType = value;
    debugLogWidgetClass(this);
  }

  int get questionType => _questionType;

  bool _isLoading = false;
  set isLoading(bool value) {
    _isLoading = value;
    debugLogWidgetClass(this);
  }

  bool get isLoading => _isLoading;

  int? _selectedIndex = -1;
  set selectedIndex(int? value) {
    _selectedIndex = value;
    debugLogWidgetClass(this);
  }

  int? get selectedIndex => _selectedIndex;

  int? _selectedId;
  set selectedId(int? value) {
    _selectedId = value;
    debugLogWidgetClass(this);
  }

  int? get selectedId => _selectedId;


// Add this new property
  int? _questionStartTimeMs;
  set questionStartTimeMs(int? value) {
    _questionStartTimeMs = value;
    debugLogWidgetClass(this);
  }

  int? get questionStartTimeMs => _questionStartTimeMs;


  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (contestQuestion)] action in ContestQuestion widget.
  ApiCallResponse? _apiResultglp;
  set apiResultglp(ApiCallResponse? value) {
    _apiResultglp = value;
    debugLogWidgetClass(this);
  }

  ApiCallResponse? get apiResultglp => _apiResultglp;

  // State field(s) for Timer widget.
  final timerInitialTimeMs = 0;
  int timerMilliseconds = 0;
  String timerValue = StopWatchTimer.getDisplayTime(
    0,
    hours: false,
    milliSecond: false,
  );
  FlutterFlowTimerController timerController =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countUp));

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Model for gradientButtonCustom component.
  late GradientButtonCustomModel gradientButtonCustomModel;
  // Stores action output result for [Backend Call - API (contestSubmitAnswers)] action in gradientButtonCustom widget.
  ApiCallResponse? _submitAnsRes;
  set submitAnsRes(ApiCallResponse? value) {
    _submitAnsRes = value;
    debugLogWidgetClass(this);
  }

  ApiCallResponse? get submitAnsRes => _submitAnsRes;

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
    timerController.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    gradientButtonCustomModel.dispose();
  }

  @override
  WidgetClassDebugData toWidgetClassDebugData() => WidgetClassDebugData(
        widgetParameters: {
          'contestId': debugSerializeParam(
            widget?.contestId,
            ParamType.int,
            link:
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=ContestQuestion',
            searchReference:
                'reference=ShsKEwoJY29udGVzdElkEgYwbWNjanlyBAgBIAFQAVoJY29udGVzdElk',
            name: 'int',
            nullable: true,
          )
        }.withoutNulls,
        localStates: {
          'quizData': debugSerializeParam(
            quizData,
            ParamType.JSON,
            isList: true,
            link:
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=ContestQuestion',
            searchReference:
                'reference=QhkKEQoIcXVpekRhdGESBTZpem5rcgQSAggJUAFaCHF1aXpEYXRhYg9Db250ZXN0UXVlc3Rpb24=',
            name: 'dynamic',
            nullable: false,
          ),
          'questionIndex': debugSerializeParam(
            questionIndex,
            ParamType.int,
            link:
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=ContestQuestion',
            searchReference:
                'reference=QhwKFgoNcXVlc3Rpb25JbmRleBIFeXJuMmJyAggBUAFaDXF1ZXN0aW9uSW5kZXhiD0NvbnRlc3RRdWVzdGlvbg==',
            name: 'int',
            nullable: true,
          ),
          'questionNo': debugSerializeParam(
            questionNo,
            ParamType.int,
            link:
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=ContestQuestion',
            searchReference:
                'reference=QhsKEwoKcXVlc3Rpb25ObxIFZ3VlajJyBAgBIAFQAVoKcXVlc3Rpb25Ob2IPQ29udGVzdFF1ZXN0aW9u',
            name: 'int',
            nullable: false,
          ),
          'selectedOption': debugSerializeParam(
            selectedOption,
            ParamType.int,
            link:
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=ContestQuestion',
            searchReference:
                'reference=Qh8KFwoOc2VsZWN0ZWRPcHRpb24SBTloY2Y2cgQIASABUAFaDnNlbGVjdGVkT3B0aW9uYg9Db250ZXN0UXVlc3Rpb24=',
            name: 'int',
            nullable: false,
          ),
          'questionType': debugSerializeParam(
            questionType,
            ParamType.int,
            link:
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=ContestQuestion',
            searchReference:
                'reference=Qh0KFQoMcXVlc3Rpb25UeXBlEgVxZGRtd3IECAEgAVABWgxxdWVzdGlvblR5cGViD0NvbnRlc3RRdWVzdGlvbg==',
            name: 'int',
            nullable: false,
          ),
          'isLoading': debugSerializeParam(
            isLoading,
            ParamType.bool,
            link:
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=ContestQuestion',
            searchReference:
                'reference=QiMKEgoJaXNMb2FkaW5nEgVpYjhweCoHEgVmYWxzZXIECAUgAVABWglpc0xvYWRpbmdiD0NvbnRlc3RRdWVzdGlvbg==',
            name: 'bool',
            nullable: false,
          ),
          'selectedIndex': debugSerializeParam(
            selectedIndex,
            ParamType.int,
            link:
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=ContestQuestion',
            searchReference:
                'reference=QhwKFgoNc2VsZWN0ZWRJbmRleBIFZHZyZ2JyAggBUAFaDXNlbGVjdGVkSW5kZXhiD0NvbnRlc3RRdWVzdGlvbg==',
            name: 'int',
            nullable: true,
          ),
          'selectedId': debugSerializeParam(
            selectedId,
            ParamType.int,
            link:
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=ContestQuestion',
            searchReference:
                'reference=QhsKEwoKc2VsZWN0ZWRJZBIFanNnZmpyBAgBIABQAVoKc2VsZWN0ZWRJZGIPQ29udGVzdFF1ZXN0aW9u',
            name: 'int',
            nullable: true,
          )
        },
        widgetStates: {
          'textFieldText': debugSerializeParam(
            textController?.text,
            ParamType.String,
            link:
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=ContestQuestion',
            name: 'String',
            nullable: true,
          )
        },
        actionOutputs: {
          'apiResultglp': debugSerializeParam(
            apiResultglp,
            ParamType.ApiResponse,
            link:
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=ContestQuestion',
            name: 'ApiCallResponse',
            nullable: true,
          ),
          'submitAnsRes': debugSerializeParam(
            submitAnsRes,
            ParamType.ApiResponse,
            link:
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=ContestQuestion',
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
            'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r/tab=uiBuilder&page=ContestQuestion',
        searchReference:
            'reference=Og9Db250ZXN0UXVlc3Rpb25QAVoPQ29udGVzdFF1ZXN0aW9u',
        widgetClassName: 'ContestQuestion',
      );
}
