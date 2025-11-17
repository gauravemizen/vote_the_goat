// Automatic FlutterFlow imports
// Imports other custom actions
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

Future<bool> connect() async {
  // check internet connection
  bool isConnected = await InternetConnection().hasInternetAccess;
  return isConnected;
}
