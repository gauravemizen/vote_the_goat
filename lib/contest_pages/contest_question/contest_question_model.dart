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

  ///  State fields for stateful widgets in this page.

  // State field(s) for Timer widget.
  final timerInitialTimeMs = 60000;
  int timerMilliseconds = 60000;
  String timerValue = StopWatchTimer.getDisplayTime(
    60000,
    hours: false,
    milliSecond: false,
  );
  FlutterFlowTimerController timerController =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countDown));

  // Model for gradientButtonCustom component.
  late GradientButtonCustomModel gradientButtonCustomModel;

  @override
  void initState(BuildContext context) {
    gradientButtonCustomModel =
        createModel(context, () => GradientButtonCustomModel());
  }

  @override
  void dispose() {
    timerController.dispose();
    gradientButtonCustomModel.dispose();
  }
}
