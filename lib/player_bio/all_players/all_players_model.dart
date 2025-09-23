import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'all_players_widget.dart' show AllPlayersWidget;
import 'package:flutter/material.dart';

class AllPlayersModel extends FlutterFlowModel<AllPlayersWidget> {
  ///  Local state fields for this page.

  bool isLoading = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (getAllPlayers)] action in AllPlayers widget.
  ApiCallResponse? getAllPlayerRes;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
