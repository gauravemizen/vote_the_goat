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

  List<dynamic> quizData = [];
  void addToQuizData(dynamic item) => quizData.add(item);
  void removeFromQuizData(dynamic item) => quizData.remove(item);
  void removeAtIndexFromQuizData(int index) => quizData.removeAt(index);
  void insertAtIndexInQuizData(int index, dynamic item) =>
      quizData.insert(index, item);
  void updateQuizDataAtIndex(int index, Function(dynamic) updateFn) =>
      quizData[index] = updateFn(quizData[index]);

  int? questionIndex = 0;

  int questionNo = 1;

  int selectedOption = -1;

  int questionType = 2;

  bool isLoading = false;

  int? selectedIndex = -1;

  int? selectedId;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (contestQuestion)] action in ContestQuestion widget.
  ApiCallResponse? apiResultglp;
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
  ApiCallResponse? submitAnsRes;

  @override
  void initState(BuildContext context) {
    gradientButtonCustomModel =
        createModel(context, () => GradientButtonCustomModel());
  }

  @override
  void dispose() {
    timerController.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    gradientButtonCustomModel.dispose();
  }
}
