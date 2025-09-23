import 'package:flutter/material.dart';
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

  Future initializePersistedState() async {
    secureStorage = FlutterSecureStorage();
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
      _isRememberMe =
          await secureStorage.getBool('ff_isRememberMe') ?? _isRememberMe;
    });
    await _safeInitAsync(() async {
      _isCreated = await secureStorage.getBool('ff_isCreated') ?? _isCreated;
    });
    await _safeInitAsync(() async {
      _currentUserId =
          await secureStorage.getString('ff_currentUserId') ?? _currentUserId;
    });
    await _safeInitAsync(() async {
      _isRead = await secureStorage.getBool('ff_isRead') ?? _isRead;
    });
  }

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
  }

  String _authToken = '';
  String get authToken => _authToken;
  set authToken(String value) {
    _authToken = value;
    secureStorage.setString('ff_authToken', value);
  }

  void deleteAuthToken() {
    secureStorage.delete(key: 'ff_authToken');
  }

  bool _isLoggedIn = true;
  bool get isLoggedIn => _isLoggedIn;
  set isLoggedIn(bool value) {
    _isLoggedIn = value;
    secureStorage.setBool('ff_isLoggedIn', value);
  }

  void deleteIsLoggedIn() {
    secureStorage.delete(key: 'ff_isLoggedIn');
  }

  String _userName = '';
  String get userName => _userName;
  set userName(String value) {
    _userName = value;
    secureStorage.setString('ff_userName', value);
  }

  void deleteUserName() {
    secureStorage.delete(key: 'ff_userName');
  }

  bool _isRememberMe = false;
  bool get isRememberMe => _isRememberMe;
  set isRememberMe(bool value) {
    _isRememberMe = value;
    secureStorage.setBool('ff_isRememberMe', value);
  }

  void deleteIsRememberMe() {
    secureStorage.delete(key: 'ff_isRememberMe');
  }

  bool _isCreated = false;
  bool get isCreated => _isCreated;
  set isCreated(bool value) {
    _isCreated = value;
    secureStorage.setBool('ff_isCreated', value);
  }

  void deleteIsCreated() {
    secureStorage.delete(key: 'ff_isCreated');
  }

  String _currentUserId = '';
  String get currentUserId => _currentUserId;
  set currentUserId(String value) {
    _currentUserId = value;
    secureStorage.setString('ff_currentUserId', value);
  }

  void deleteCurrentUserId() {
    secureStorage.delete(key: 'ff_currentUserId');
  }

  bool _isRead = false;
  bool get isRead => _isRead;
  set isRead(bool value) {
    _isRead = value;
    secureStorage.setBool('ff_isRead', value);
  }

  void deleteIsRead() {
    secureStorage.delete(key: 'ff_isRead');
  }
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
        return CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: ListToCsvConverter().convert([value]));
}
