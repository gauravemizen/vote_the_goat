import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'drawer_menu_widget.dart' show DrawerMenuWidget;
import 'package:flutter/material.dart';

class DrawerMenuModel extends FlutterFlowModel<DrawerMenuWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (getProfile)] action in DrawerMenu widget.
  ApiCallResponse? getProfileRes;
  // State field(s) for Switch widget.
  bool? switchValue1;
  // State field(s) for Switch widget.
  bool? switchValue2;
  // Stores action output result for [Backend Call - API (contactSupport)] action in Row widget.
  ApiCallResponse? cmsRes;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
