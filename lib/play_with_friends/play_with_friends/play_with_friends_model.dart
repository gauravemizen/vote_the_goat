import '/backend/api_requests/api_calls.dart';
import '/components/drawer_menu/drawer_menu_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'play_with_friends_widget.dart' show PlayWithFriendsWidget;
import 'package:flutter/material.dart';

class PlayWithFriendsModel extends FlutterFlowModel<PlayWithFriendsWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // State field(s) for teamName widget.
  FocusNode? teamNameFocusNode1;
  TextEditingController? teamNameTextController1;
  String? Function(BuildContext, String?)? teamNameTextController1Validator;
  String? _teamNameTextController1Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Enter Team Name is required';
    }

    if (!RegExp('').hasMatch(val)) {
      return 'Invalid text';
    }
    return null;
  }

  bool isDataUploading_uploadDataEzy = false;
  FFUploadedFile uploadedLocalFile_uploadDataEzy =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Validate Form] action in Button widget.
  bool? isValid;
  // Stores action output result for [Backend Call - API (createTeam)] action in Button widget.
  ApiCallResponse? apiResultoud;
  // State field(s) for teamName widget.
  FocusNode? teamNameFocusNode2;
  TextEditingController? teamNameTextController2;
  String? Function(BuildContext, String?)? teamNameTextController2Validator;
  // Model for DrawerMenu component.
  late DrawerMenuModel drawerMenuModel;

  @override
  void initState(BuildContext context) {
    teamNameTextController1Validator = _teamNameTextController1Validator;
    drawerMenuModel = createModel(context, () => DrawerMenuModel());
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    teamNameFocusNode1?.dispose();
    teamNameTextController1?.dispose();

    teamNameFocusNode2?.dispose();
    teamNameTextController2?.dispose();

    drawerMenuModel.dispose();
  }
}
