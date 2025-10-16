import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/button_small/button_small_widget.dart';
import '/components/drawer_menu/drawer_menu_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:async';
import 'dart:ui';
import '/index.dart';
import 'play_with_friends_widget.dart' show PlayWithFriendsWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class PlayWithFriendsModel extends FlutterFlowModel<PlayWithFriendsWidget> {
  ///  Local state fields for this page.

  bool _isEnabled = false;
  set isEnabled(bool value) {
    _isEnabled = value;
    debugLogWidgetClass(this);
  }

  bool get isEnabled => _isEnabled;

  String? _date;
  set date(String? value) {
    _date = value;
    debugLogWidgetClass(this);
  }

  String? get date => _date;

  String? _time;
  set time(String? value) {
    _time = value;
    debugLogWidgetClass(this);
  }

  String? get time => _time;

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

  DateTime? datePicked1;
  DateTime? datePicked2;
  // Stores action output result for [Validate Form] action in Button widget.
  bool? _isValid;
  set isValid(bool? value) {
    _isValid = value;
    debugLogWidgetClass(this);
  }

  bool? get isValid => _isValid;

  // Stores action output result for [Backend Call - API (createTeam)] action in Button widget.
  ApiCallResponse? _apiResultoud;
  set apiResultoud(ApiCallResponse? value) {
    _apiResultoud = value;
    debugLogWidgetClass(this);
  }

  ApiCallResponse? get apiResultoud => _apiResultoud;

  // Stores action output result for [Backend Call - API (teamMemberforChat)] action in Button widget.
  ApiCallResponse? _chatMember;
  set chatMember(ApiCallResponse? value) {
    _chatMember = value;
    debugLogWidgetClass(this);
  }

  ApiCallResponse? get chatMember => _chatMember;

  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  TeamsRecord? _createRoom;
  set createRoom(TeamsRecord? value) {
    _createRoom = value;
    debugLogWidgetClass(this);
  }

  TeamsRecord? get createRoom => _createRoom;

  // State field(s) for teamName widget.
  FocusNode? teamNameFocusNode2;
  TextEditingController? teamNameTextController2;
  String? Function(BuildContext, String?)? teamNameTextController2Validator;
  // Stores action output result for [Backend Call - API (joinTeam)] action in Button widget.
  ApiCallResponse? _apiResult5di;
  set apiResult5di(ApiCallResponse? value) {
    _apiResult5di = value;
    debugLogWidgetClass(this);
  }

  ApiCallResponse? get apiResult5di => _apiResult5di;

  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<TeamsRecord>? _foundTeam;
  set foundTeam(List<TeamsRecord>? value) {
    _foundTeam = value;
    debugLogWidgetClass(this);
  }

  List<TeamsRecord>? get foundTeam => _foundTeam;

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Model for buttonSmall component.
  late ButtonSmallModel buttonSmallModel;
  // Model for DrawerMenu component.
  late DrawerMenuModel drawerMenuModel;

  final Map<String, DebugDataField> debugGeneratorVariables = {};
  final Map<String, DebugDataField> debugBackendQueries = {};
  final Map<String, FlutterFlowModel> widgetBuilderComponents = {};
  @override
  void initState(BuildContext context) {
    teamNameTextController1Validator = _teamNameTextController1Validator;
    buttonSmallModel = createModel(context, () => ButtonSmallModel());
    drawerMenuModel = createModel(context, () => DrawerMenuModel());

    debugLogWidgetClass(this);
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    teamNameFocusNode1?.dispose();
    teamNameTextController1?.dispose();

    teamNameFocusNode2?.dispose();
    teamNameTextController2?.dispose();

    buttonSmallModel.dispose();
    drawerMenuModel.dispose();
  }

  @override
  WidgetClassDebugData toWidgetClassDebugData() => WidgetClassDebugData(
        localStates: {
          'isEnabled': debugSerializeParam(
            isEnabled,
            ParamType.bool,
            link:
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=PlayWithFriends',
            searchReference:
                'reference=QiMKEgoJaXNFbmFibGVkEgVxeW1tMSoHEgVmYWxzZXIECAUgAVABWglpc0VuYWJsZWRiD1BsYXlXaXRoRnJpZW5kcw==',
            name: 'bool',
            nullable: false,
          ),
          'date': debugSerializeParam(
            date,
            ParamType.String,
            link:
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=PlayWithFriends',
            searchReference:
                'reference=QhkKDQoEZGF0ZRIFcXZ3NmkqAhIAcgQIAyAAUAFaBGRhdGViD1BsYXlXaXRoRnJpZW5kcw==',
            name: 'String',
            nullable: true,
          ),
          'time': debugSerializeParam(
            time,
            ParamType.String,
            link:
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=PlayWithFriends',
            searchReference:
                'reference=QhkKDQoEdGltZRIFbjQwbmMqAhIAcgQIAyAAUAFaBHRpbWViD1BsYXlXaXRoRnJpZW5kcw==',
            name: 'String',
            nullable: true,
          )
        },
        widgetStates: {
          'tabBarCurrentIndex': debugSerializeParam(
            tabBarCurrentIndex,
            ParamType.int,
            link:
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=PlayWithFriends',
            name: 'int',
            nullable: true,
          ),
          'tabBarPreviousIndex': debugSerializeParam(
            tabBarPreviousIndex,
            ParamType.int,
            link:
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=PlayWithFriends',
            name: 'int',
            nullable: true,
          ),
          'teamNameText1': debugSerializeParam(
            teamNameTextController1?.text,
            ParamType.String,
            link:
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=PlayWithFriends',
            name: 'String',
            nullable: true,
          ),
          'teamNameText2': debugSerializeParam(
            teamNameTextController2?.text,
            ParamType.String,
            link:
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=PlayWithFriends',
            name: 'String',
            nullable: true,
          ),
          'pageViewCurrentIndex': debugSerializeParam(
            pageViewCurrentIndex,
            ParamType.int,
            link:
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=PlayWithFriends',
            name: 'int',
            nullable: true,
          )
        },
        actionOutputs: {
          'isValid': debugSerializeParam(
            isValid,
            ParamType.bool,
            link:
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=PlayWithFriends',
            name: 'bool',
            nullable: true,
          ),
          'apiResultoud': debugSerializeParam(
            apiResultoud,
            ParamType.ApiResponse,
            link:
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=PlayWithFriends',
            name: 'ApiCallResponse',
            nullable: true,
          ),
          'chatMember': debugSerializeParam(
            chatMember,
            ParamType.ApiResponse,
            link:
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=PlayWithFriends',
            name: 'ApiCallResponse',
            nullable: true,
          ),
          'createRoom': debugSerializeParam(
            createRoom,
            ParamType.Document,
            link:
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=PlayWithFriends',
            name: 'teams',
            nullable: true,
          ),
          'apiResult5di': debugSerializeParam(
            apiResult5di,
            ParamType.ApiResponse,
            link:
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=PlayWithFriends',
            name: 'ApiCallResponse',
            nullable: true,
          ),
          'foundTeam': debugSerializeParam(
            foundTeam,
            ParamType.Document,
            isList: true,
            link:
                'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=PlayWithFriends',
            name: 'teams',
            nullable: true,
          )
        },
        generatorVariables: debugGeneratorVariables,
        backendQueries: debugBackendQueries,
        componentStates: {
          'buttonSmallModel (buttonSmall)':
              buttonSmallModel?.toWidgetClassDebugData(),
          'drawerMenuModel (DrawerMenu)':
              drawerMenuModel?.toWidgetClassDebugData(),
          ...widgetBuilderComponents.map(
            (key, value) => MapEntry(
              key,
              value.toWidgetClassDebugData(),
            ),
          ),
        }.withoutNulls,
        link:
            'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r/tab=uiBuilder&page=PlayWithFriends',
        searchReference:
            'reference=Og9QbGF5V2l0aEZyaWVuZHNQAVoPUGxheVdpdGhGcmllbmRz',
        widgetClassName: 'PlayWithFriends',
      );
}
