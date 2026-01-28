import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vote_for_goat/subscription/ad_service.dart';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }



  ///


  bool _isFirstInstall = true;
  bool get isFirstInstall => _isFirstInstall;

  set isFirstInstall(bool value) {
    _isFirstInstall = value;
    secureStorage.setBool('ff_isFirstInstall', value);
  }




  // In your app_state.dart file
  bool? notificationsEnabled;

// Add persistence methods
  void setNotificationsEnabled(bool value) {
    notificationsEnabled = value;
    update(() {});
  }

  bool getNotificationsEnabled() {
    return notificationsEnabled ?? true; // default to true
  }


  ///

  String _savedEmail = '';

  String get savedEmail => _savedEmail;

  set savedEmail(String value) {
    _savedEmail = value;
    secureStorage.setString('ff_savedEmail', value);
    debugLogAppState(this);
  }

  String _savedPassword = '';

  String get savedPassword => _savedPassword;

  set savedPassword(String value) {
    _savedPassword = value;
    secureStorage.setString('ff_savedPassword', value);
    debugLogAppState(this);
  }




  int advertisementStatus = 1; // default to enabled

  ///
  bool _isTapped = false;

  bool get isTapped => _isTapped;

  set isTapped(bool value) {
    _isTapped = value;
    secureStorage.setBool('ff_isTapped', value);
    debugLogAppState(this);
  }

  void deleteIsTapped() {
    secureStorage.delete(key: 'ff_isTapped');
  }


  ///





  bool _showAds = true;

  bool get showAds => _showAds;

  set showAds(bool value) {
    _showAds = value;
    notifyListeners();
  }

  bool _isAdFree = false;

  bool get isAdFree => _isAdFree;

  set isAdFree(bool value) {
    _isAdFree = value;
    notifyListeners();
  }

  // Extra Vote Management
  int _extraVotes = 0;

  int get extraVotes => _extraVotes;

  set extraVotes(int value) {
    _extraVotes = value;
    notifyListeners();
  }

  bool _hasUnlimitedVotes = false;




  bool get hasUnlimitedVotes => _hasUnlimitedVotes;

  set hasUnlimitedVotes(bool value) {
    _hasUnlimitedVotes = value;
    notifyListeners();
  }

  String _currentPlan = 'free';

  String get currentPlan => _currentPlan;

  set currentPlan(String value) {
    _currentPlan = value;
    notifyListeners();
  }

  // Method to initialize subscription state on app start
  Future<void> initializeSubscriptionState() async {
    try {
      final prefs = await SharedPreferences.getInstance();

      // Load subscription data
      _currentPlan = prefs.getString('current_plan') ?? 'free';
      _showAds = prefs.getBool('show_ads') ?? true;
      _extraVotes = prefs.getInt('extra_votes') ?? 0;

      // Update ad service with current plan
      await AdService().updateAdSettingsForPlan(_currentPlan);

      debugPrint('[FFAppState] Initialized subscription state: plan=$_currentPlan, showAds=$_showAds, extraVotes=$_extraVotes');
      notifyListeners();
    } catch (e) {
      debugPrint('[FFAppState] Subscription initialization error: $e');
    }
  }
  Future<void> updateSubscriptionState(String plan) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('current_plan', plan);
      await prefs.setBool('show_ads', plan == 'free');

      _currentPlan = plan;
      _showAds = plan == 'free';

      // Update ad service
      await AdService().updateAdSettingsForPlan(plan);

      debugPrint('[FFAppState] Subscription updated: plan=$_currentPlan, showAds=$_showAds');
      notifyListeners();
    } catch (e) {
      debugPrint('[FFAppState] Subscription update error: $e');
    }
  }

//   Future initializePersistedState() async {
//     secureStorage = const FlutterSecureStorage();
//
//
//
//
//
//     await _safeInitAsync(() async {
//       _isTapped = await secureStorage.getBool('ff_isTapped') ?? _isTapped;
//     });
//
// ///
//     await _safeInitAsync(() async {
//       _isFirstInstall =
//           await secureStorage.getBool('ff_isFirstInstall') ?? true;
//     });
//
//     ///
//
//     await _safeInitAsync(() async {
//       _authToken = await secureStorage.getString('ff_authToken') ?? _authToken;
//     });
//     await _safeInitAsync(() async {
//       _isLoggedIn = await secureStorage.getBool('ff_isLoggedIn') ?? _isLoggedIn;
//     });
//     await _safeInitAsync(() async {
//       _userName = await secureStorage.getString('ff_userName') ?? _userName;
//     });
//     await _safeInitAsync(() async {
//       _isRememberMe =
//           await secureStorage.getBool('ff_isRememberMe') ?? _isRememberMe;
//     });
//     await _safeInitAsync(() async {
//       _isCreated = await secureStorage.getBool('ff_isCreated') ?? _isCreated;
//     });
//     await _safeInitAsync(() async {
//       _currentUserId =
//           await secureStorage.getString('ff_currentUserId') ?? _currentUserId;
//     });
//     await _safeInitAsync(() async {
//       _isRead = await secureStorage.getBool('ff_isRead') ?? _isRead;
//     });
//   }




  ///2  copilot version


  Future initializePersistedState() async {
    secureStorage = const FlutterSecureStorage();

    // Check if this is first install using SharedPreferences (gets cleared on uninstall)
    final prefs = await SharedPreferences.getInstance();
    final hasLaunchedBefore = prefs.getBool('has_launched_before') ?? false;

    if (!hasLaunchedBefore) {
      // First launch after install/reinstall - clear all secure storage
      await secureStorage.deleteAll();
      await prefs.setBool('has_launched_before', true);

      // Reset all values to defaults
      _savedEmail = '';
      _savedPassword = '';

      _authToken = '';

      _isLoggedIn = false;
      _userName = '';
      _userImage = '';
      _isRememberMe = false;
      _isCreated = false;
      _currentUserId = '';
      _isRead = false;
      _isTapped = false;
      _isFirstInstall = true;

      debugPrint('[FFAppState] First install detected - cleared all secure storage');
      return; // Don't load persisted values
    }

    // Load persisted values only if not first install
    await _safeInitAsync(() async {
      _isFirstInstall = await secureStorage.getBool('ff_isFirstInstall') ?? true;
    });

    await _safeInitAsync(() async {
      _isTapped = await secureStorage.getBool('ff_isTapped') ?? _isTapped;
    });

    await _safeInitAsync(() async {
      _authToken = await secureStorage.getString('ff_authToken') ?? _authToken;
    });

    await _safeInitAsync(() async {
      _isLoggedIn = await secureStorage.getBool('ff_isLoggedIn') ?? _isLoggedIn;
    });

    await _safeInitAsync(() async {
      _userName = await secureStorage.getString('ff_userName') ?? _userName;
    });

    await _safeInitAsync(() async {
      _isRememberMe = await secureStorage.getBool('ff_isRememberMe') ?? _isRememberMe;
    });

    await _safeInitAsync(() async {
      _isCreated = await secureStorage.getBool('ff_isCreated') ?? _isCreated;
    });

    await _safeInitAsync(() async {
      _currentUserId = await secureStorage.getString('ff_currentUserId') ?? _currentUserId;
    });


    await _safeInitAsync(() async {
      _savedEmail = await secureStorage.getString('ff_savedEmail') ?? '';
    });

    await _safeInitAsync(() async {
      _savedPassword = await secureStorage.getString('ff_savedPassword') ?? '';
    });





    await _safeInitAsync(() async {
      _isRead = await secureStorage.getBool('ff_isRead') ?? _isRead;
    });

    debugPrint('[FFAppState] Loaded persisted state - isLoggedIn: $_isLoggedIn, authToken exists: ${_authToken.isNotEmpty}');
  }


  ///





  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  /// for managing conditional routing
  int _navigationType = 1;

  int get navigationType => _navigationType;

  set navigationType(int value) {
    _navigationType = value;

    debugLogAppState(this);
  }

  String _authToken = '';

  String get authToken => _authToken;

  set authToken(String value) {
    _authToken = value;
    secureStorage.setString('ff_authToken', value);
    debugLogAppState(this);
  }

  void deleteAuthToken() {
    secureStorage.delete(key: 'ff_authToken');
  }



  ///copilot
  bool _isLoggedIn = false;
  
  /// flutterflow
  // bool _isLoggedIn = true;

  bool get isLoggedIn => _isLoggedIn;

  set isLoggedIn(bool value) {
    _isLoggedIn = value;
    secureStorage.setBool('ff_isLoggedIn', value);
    debugLogAppState(this);
  }

  void deleteIsLoggedIn() {
    secureStorage.delete(key: 'ff_isLoggedIn');
  }

  String _userName = '';

  String get userName => _userName;

  set userName(String value) {
    _userName = value;
    secureStorage.setString('ff_userName', value);
    debugLogAppState(this);
  }



  String _userImage = '';
  String get userImage => _userImage;

  set userImage(String value) {
    _userImage = value;
    secureStorage.setString('ff_userImage', value);
    debugLogAppState(this);
  }

  void deleteUserName() {
    secureStorage.delete(key: 'ff_userName');
  }

  bool _isRememberMe = false;

  bool get isRememberMe => _isRememberMe;

  set isRememberMe(bool value) {
    _isRememberMe = value;
    secureStorage.setBool('ff_isRememberMe', value);
    debugLogAppState(this);
  }

  void deleteIsRememberMe() {
    secureStorage.delete(key: 'ff_isRememberMe');
  }

  bool _isCreated = false;

  bool get isCreated => _isCreated;

  set isCreated(bool value) {
    _isCreated = value;
    secureStorage.setBool('ff_isCreated', value);
    debugLogAppState(this);
  }

  void deleteIsCreated() {
    secureStorage.delete(key: 'ff_isCreated');
  }

  String _currentUserId = '';

  String get currentUserId => _currentUserId;

  set currentUserId(String value) {
    _currentUserId = value;
    secureStorage.setString('ff_currentUserId', value);
    debugLogAppState(this);
  }

  void deleteCurrentUserId() {
    secureStorage.delete(key: 'ff_currentUserId');
  }

  bool _isRead = false;

  bool get isRead => _isRead;

  set isRead(bool value) {
    _isRead = value;
    secureStorage.setBool('ff_isRead', value);
    debugLogAppState(this);
  }

  void deleteIsRead() {
    secureStorage.delete(key: 'ff_isRead');
  }

  String _lastFilterPayloadJson = '';

  String get lastFilterPayloadJson => _lastFilterPayloadJson;

  set lastFilterPayloadJson(String value) {
    _lastFilterPayloadJson = value;
    debugLogAppState(this);
  }

  String _lastFilterType = '';

  String get lastFilterType => _lastFilterType;

  set lastFilterType(String value) {
    _lastFilterType = value;
    debugLogAppState(this);
  }

  Map<String, DebugDataField> toDebugSerializableMap() => {
        'navigationType': debugSerializeParam(
          navigationType,
          ParamType.int,
          link:
              'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=appValues&appValuesTab=state',
          searchReference:
              'reference=CkIKGgoObmF2aWdhdGlvblR5cGUSCGZ1anY2Zm1qcgIIAXogZm9yIG1hbmFnaW5nIGNvbmRpdGlvbmFsIHJvdXRpbmdaDm5hdmlnYXRpb25UeXBl',
          name: 'int',
          nullable: false,
        ),
        'authToken': debugSerializeParam(
          authToken,
          ParamType.String,
          link:
              'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=appValues&appValuesTab=state',
          searchReference:
              'reference=Ch0KFQoJYXV0aFRva2VuEgh2MDhkcjV3bHICCAN6AFoJYXV0aFRva2Vu',
          name: 'String',
          nullable: false,
        ),

    'isTapped': debugSerializeParam(
      isTapped,
      ParamType.bool,
      link:
      'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=appValues&appValuesTab=state',
      searchReference: 'reference=isTapped',
      name: 'bool',
      nullable: false,
    ),




        'isLoggedIn': debugSerializeParam(
          isLoggedIn,
          ParamType.bool,
          link:
              'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=appValues&appValuesTab=state',
          searchReference:
              'reference=Ch4KFgoKaXNMb2dnZWRJbhIIZHdkMDF2Mm5yAggFegBaCmlzTG9nZ2VkSW4=',
          name: 'bool',
          nullable: false,
        ),
        'userName': debugSerializeParam(
          userName,
          ParamType.String,
          link:
              'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=appValues&appValuesTab=state',
          searchReference:
              'reference=ChwKFAoIdXNlck5hbWUSCGhzYzgzZWpicgIIA3oAWgh1c2VyTmFtZQ==',
          name: 'String',
          nullable: false,
        ),
        'isRememberMe': debugSerializeParam(
          isRememberMe,
          ParamType.bool,
          link:
              'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=appValues&appValuesTab=state',
          searchReference:
              'reference=CiAKGAoMaXNSZW1lbWJlck1lEgh0YzM1dmlxZnICCAV6AFoMaXNSZW1lbWJlck1l',
          name: 'bool',
          nullable: false,
        ),
        'isCreated': debugSerializeParam(
          isCreated,
          ParamType.bool,
          link:
              'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=appValues&appValuesTab=state',
          searchReference:
              'reference=Ch0KFQoJaXNDcmVhdGVkEggwYjV0ZzNraXICCAV6AFoJaXNDcmVhdGVk',
          name: 'bool',
          nullable: false,
        ),
        'currentUserId': debugSerializeParam(
          currentUserId,
          ParamType.String,
          link:
              'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=appValues&appValuesTab=state',
          searchReference:
              'reference=CiEKGQoNY3VycmVudFVzZXJJZBIIeDdibmdibm9yAggDegBaDWN1cnJlbnRVc2VySWQ=',
          name: 'String',
          nullable: false,
        ),
        'isRead': debugSerializeParam(
          isRead,
          ParamType.bool,
          link:
              'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=appValues&appValuesTab=state',
          searchReference:
              'reference=ChoKEgoGaXNSZWFkEgg0bWpxZno1MnICCAV6AFoGaXNSZWFk',
          name: 'bool',
          nullable: false,
        ),
        'lastFilterPayloadJson': debugSerializeParam(
          lastFilterPayloadJson,
          ParamType.String,
          link:
              'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=appValues&appValuesTab=state',
          searchReference: 'reference=lastFilterPayloadJson',
          name: 'String',
          nullable: false,
        ),
        'lastFilterType': debugSerializeParam(
          lastFilterType,
          ParamType.String,
          link:
              'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=appValues&appValuesTab=state',
          searchReference: 'reference=lastFilterType',
          name: 'String',
          nullable: false,
        )
      };
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);

  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';

  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');

  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');

  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return const CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });

  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: const ListToCsvConverter().convert([value]));
}
