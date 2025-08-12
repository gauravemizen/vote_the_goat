import '/components/button_small/button_small_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'home_onboarding_widget.dart' show HomeOnboardingWidget;
import 'package:flutter/material.dart';

class HomeOnboardingModel extends FlutterFlowModel<HomeOnboardingWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Model for buttonSmall component.
  late ButtonSmallModel buttonSmallModel;

  @override
  void initState(BuildContext context) {
    buttonSmallModel = createModel(context, () => ButtonSmallModel());
  }

  @override
  void dispose() {
    buttonSmallModel.dispose();
  }
}
