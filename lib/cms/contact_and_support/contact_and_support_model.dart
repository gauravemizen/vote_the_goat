import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'contact_and_support_widget.dart' show ContactAndSupportWidget;
import 'package:flutter/material.dart';

class ContactAndSupportModel extends FlutterFlowModel<ContactAndSupportWidget> {
  ///  Local state fields for this page.

  bool isLoading = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (contactSupport)] action in ContactAndSupport widget.
  ApiCallResponse? cmsRes;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
