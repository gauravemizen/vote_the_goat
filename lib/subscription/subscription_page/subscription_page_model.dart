import '/components/gradient_button_custom/gradient_button_custom_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'subscription_page_widget.dart' show SubscriptionPageWidget;
import 'package:flutter/material.dart';

class SubscriptionPageModel extends FlutterFlowModel<SubscriptionPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for gradientButtonCustom component.
  late GradientButtonCustomModel gradientButtonCustomModel;

  @override
  void initState(BuildContext context) {
    gradientButtonCustomModel =
        createModel(context, () => GradientButtonCustomModel());
  }

  @override
  void dispose() {
    gradientButtonCustomModel.dispose();
  }
}
