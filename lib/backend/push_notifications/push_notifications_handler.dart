import 'dart:async';

import 'serialization_util.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';


final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({Key? key, required this.child})
      : super(key: key);

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    safeSetState(() => _loading = true);
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        if (mounted) {
          context.pushNamed(
            initialPageName,
            pathParameters: parameterData.pathParameters,
            extra: parameterData.extra,
          );
        } else {
          appNavigatorKey.currentContext?.pushNamed(
            initialPageName,
            pathParameters: parameterData.pathParameters,
            extra: parameterData.extra,
          );
        }
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      safeSetState(() => _loading = false);
    }
  }

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      handleOpenedPushNotification();
    });
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Container(
          color: Colors.black,
          child: Image.asset(
            'assets/images/LOGO_VTG_1.png',
            fit: BoxFit.scaleDown,
          ),
        )
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get pathParameters => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'splash': ParameterData.none(),
  'logIn': ParameterData.none(),
  'signUp': ParameterData.none(),
  'forgotPassword': ParameterData.none(),
  'otp': (data) async => ParameterData(
        allParams: {
          'email': getParameter<String>(data, 'email'),
          'user': getParameter<int>(data, 'user'),
        },
      ),
  'changePassword': (data) async => ParameterData(
        allParams: {
          'userId': getParameter<int>(data, 'userId'),
        },
      ),
  'homeOnboarding': ParameterData.none(),
  'privacyPolicy': ParameterData.none(),
  'newPassword': ParameterData.none(),
  'settingPage': ParameterData.none(),
  'playersList': ParameterData.none(),
  'homePage': ParameterData.none(),
  'aboutScreen': ParameterData.none(),
  'eligible_player': ParameterData.none(),
  'rankingPage': ParameterData.none(),
  'filterScreen': ParameterData.none(),
  'ComparePlayers': (data) async => ParameterData(
        allParams: {
          'player1Id': getParameter<int>(data, 'player1Id'),
          'player2Id': getParameter<int>(data, 'player2Id'),
        },
      ),
  'playerBio2': ParameterData.none(),
  'YourFinalRanking': ParameterData.none(),
  'SubscriptionPage': ParameterData.none(),
  'ContactAndSupport': ParameterData.none(),
  'MyProfile': ParameterData.none(),
  'MatchPlayers': ParameterData.none(),
  'ContestPage': ParameterData.none(),
  'ContestDetails': (data) async => ParameterData(
        allParams: {
          'contestId': getParameter<int>(data, 'contestId'),
        },
      ),
  'ActiveContastDetails': (data) async => ParameterData(
        allParams: {
          'contestId': getParameter<int>(data, 'contestId'),
        },
      ),
  'ContestQuestion': (data) async => ParameterData(
        allParams: {
          'contestId': getParameter<int>(data, 'contestId'),
        },
      ),
  'ContestResult': (data) async => ParameterData(
        allParams: {
          'contestId': getParameter<int>(data, 'contestId'),
        },
      ),
  'PlayWithFriends': ParameterData.none(),
  'MatchPlayerss': ParameterData.none(),
  'MyProfileCopy': ParameterData.none(),
  'playerBio': (data) async => ParameterData(
        allParams: {
          'playerId': getParameter<int>(data, 'playerId'),
        },
      ),
  'logInCopy': ParameterData.none(),
  'resetPassword': ParameterData.none(),
  'AllPlayers': ParameterData.none(),
  'YourComparisons': ParameterData.none(),
  'TeamDetails': (data) async => ParameterData(
        allParams: {
          'teamIndex': getParameter<int>(data, 'teamIndex'),
        },
      ),
  'PlayWithFriendRanking': (data) async => ParameterData(
        allParams: {
          'teamId': getParameter<int>(data, 'teamId'),
        },
      ),
  'ChatPage': (data) async => ParameterData(
        allParams: {
          'teamId': getParameter<int>(data, 'teamId'),
        },
      ),
};

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
