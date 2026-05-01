// import 'dart:async';
//
// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:page_transition/page_transition.dart';
// import 'package:provider/provider.dart';
// import '../../filter/filter_result/filter_result_widget.dart';
// import '/backend/backend.dart';
// import '/backend/schema/structs/index.dart';
//
// import '/auth/base_auth_user_provider.dart';
//
// import '/backend/push_notifications/push_notifications_handler.dart'
//     show PushNotificationsHandler;
// import '/main.dart';
// import '/flutter_flow/flutter_flow_util.dart';
// import 'serialization_util.dart';
//
// import '/index.dart';
//
// export 'package:go_router/go_router.dart';
// export 'serialization_util.dart';
//
// const kTransitionInfoKey = '__transition_info__';
//
// GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();
//
// const debugRouteLinkMap = {
//   '/splash':
//       'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=splash',
//   '/logIn':
//       'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=logIn',
//   '/signUp':
//       'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=signUp',
//   '/forgotPassword':
//       'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=forgotPassword',
//   '/otp':
//       'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=otp',
//   '/changePassword':
//       'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=changePassword',
//   '/homeOnboarding':
//       'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=homeOnboarding',
//   '/privacyPolicy':
//       'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=privacyPolicy',
//   '/newPassword':
//       'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=newPassword',
//   '/settingPage':
//       'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=settingPage',
//   '/playersList':
//       'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=playersList',
//   '/homePage':
//       'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=homePage',
//   '/aboutScreen':
//       'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=aboutScreen',
//   '/eligiblePlayer':
//       'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=eligible_player',
//   '/rankingPage':
//       'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=rankingPage',
//   '/filterScreen':
//       'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=filterScreen',
//   '/comparePlayers':
//       'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=ComparePlayers',
//   '/playerBio2':
//       'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=playerBio2',
//   '/yourFinalRanking':
//       'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=YourFinalRanking',
//   '/subscriptionPage':
//       'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=SubscriptionPage',
//   '/contactAndSupport':
//       'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=ContactAndSupport',
//   '/myProfile':
//       'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=MyProfile',
//   '/matchPlayers':
//       'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=MatchPlayers',
//   '/contestPage':
//       'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=ContestPage',
//   '/contestDetails':
//       'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=ContestDetails',
//   '/activeContastDetails':
//       'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=ActiveContastDetails',
//   '/contestQuestion':
//       'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=ContestQuestion',
//   '/contestResult':
//       'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=ContestResult',
//   '/playWithFriends':
//       'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=PlayWithFriends',
//   '/matchPlayerss':
//       'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=MatchPlayerss',
//   '/myProfileCopy':
//       'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=MyProfileCopy',
//   '/playerBio':
//       'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=playerBio',
//   '/logInCopy':
//       'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=logInCopy',
//   '/resetPassword':
//       'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=resetPassword',
//   '/allPlayers':
//       'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=AllPlayers',
//   '/yourComparisons':
//       'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=YourComparisons',
//   '/teamDetails':
//       'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=TeamDetails',
//   '/playWithFriendRanking':
//       'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=PlayWithFriendRanking',
//   '/chatPage':
//       'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=ChatPage',
//   '/filterResult':
//       'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=FilterResult'
// };
//
// class AppStateNotifier extends ChangeNotifier {
//   AppStateNotifier._();
//
//   static AppStateNotifier? _instance;
//   static AppStateNotifier get instance => _instance ??= AppStateNotifier._();
//
//   BaseAuthUser? initialUser;
//   BaseAuthUser? user;
//   bool showSplashImage = true;
//   String? _redirectLocation;
//
//   /// Determines whether the app will refresh and build again when a sign
//   /// in or sign out happens. This is useful when the app is launched or
//   /// on an unexpected logout. However, this must be turned off when we
//   /// intend to sign in/out and then navigate or perform any actions after.
//   /// Otherwise, this will trigger a refresh and interrupt the action(s).
//   bool notifyOnAuthChange = true;
//
//   bool get loading => user == null || showSplashImage;
//   bool get loggedIn => user?.loggedIn ?? false;
//   bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
//   bool get shouldRedirect => loggedIn && _redirectLocation != null;
//
//   String getRedirectLocation() => _redirectLocation!;
//   bool hasRedirect() => _redirectLocation != null;
//   void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
//   void clearRedirectLocation() => _redirectLocation = null;
//
//   /// Mark as not needing to notify on a sign in / out when we intend
//   /// to perform subsequent actions (such as navigation) afterwards.
//   void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;
//
//   void update(BaseAuthUser newUser) {
//     final shouldUpdate =
//         user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
//     initialUser ??= newUser;
//     user = newUser;
//     // Refresh the app on auth change unless explicitly marked otherwise.
//     // No need to update unless the user has changed.
//     if (notifyOnAuthChange && shouldUpdate) {
//       notifyListeners();
//     }
//     // Once again mark the notifier as needing to update on auth change
//     // (in order to catch sign in / out events).
//     updateNotifyOnAuthChange(true);
//   }
//
//   void stopShowingSplashImage() {
//     showSplashImage = false;
//     notifyListeners();
//   }
// }
//
// GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
//       initialLocation: '/',
//       debugLogDiagnostics: true,
//       refreshListenable: appStateNotifier,
//       navigatorKey: appNavigatorKey,
//       errorBuilder: (context, state) =>
//           appStateNotifier.loggedIn ? NavBarPage() : SplashWidget(),
//       routes: [
//         FFRoute(
//           name: '_initialize',
//           path: '/',
//           builder: (context, _) =>
//               appStateNotifier.loggedIn ? NavBarPage() : SplashWidget(),
//         ),
//         FFRoute(
//           name: SplashWidget.routeName,
//           path: SplashWidget.routePath,
//           builder: (context, params) => SplashWidget(),
//         ),
//         FFRoute(
//           name: LogInWidget.routeName,
//           path: LogInWidget.routePath,
//           builder: (context, params) => LogInWidget(),
//         ),
//         FFRoute(
//           name: SignUpWidget.routeName,
//           path: SignUpWidget.routePath,
//           builder: (context, params) => SignUpWidget(),
//         ),
//         FFRoute(
//           name: ForgotPasswordWidget.routeName,
//           path: ForgotPasswordWidget.routePath,
//           builder: (context, params) => ForgotPasswordWidget(),
//         ),
//         FFRoute(
//           name: OtpWidget.routeName,
//           path: OtpWidget.routePath,
//           builder: (context, params) => OtpWidget(
//             email: params.getParam(
//               'email',
//               ParamType.String,
//             ),
//             user: params.getParam(
//               'user',
//               ParamType.int,
//             ),
//           ),
//         ),
//         FFRoute(
//           name: ChangePasswordWidget.routeName,
//           path: ChangePasswordWidget.routePath,
//           builder: (context, params) => ChangePasswordWidget(
//             userId: params.getParam(
//               'userId',
//               ParamType.int,
//             ),
//           ),
//         ),
//         FFRoute(
//           name: HomeOnboardingWidget.routeName,
//           path: HomeOnboardingWidget.routePath,
//           builder: (context, params) => HomeOnboardingWidget(),
//         ),
//         FFRoute(
//           name: PrivacyPolicyWidget.routeName,
//           path: PrivacyPolicyWidget.routePath,
//           builder: (context, params) => PrivacyPolicyWidget(),
//         ),
//         FFRoute(
//           name: NewPasswordWidget.routeName,
//           path: NewPasswordWidget.routePath,
//           builder: (context, params) => NewPasswordWidget(),
//         ),
//         FFRoute(
//           name: SettingPageWidget.routeName,
//           path: SettingPageWidget.routePath,
//           builder: (context, params) => SettingPageWidget(),
//         ),
//         FFRoute(
//           name: PlayersListWidget.routeName,
//           path: PlayersListWidget.routePath,
//           builder: (context, params) => PlayersListWidget(),
//         ),
//         FFRoute(
//           name: HomePageWidget.routeName,
//           path: HomePageWidget.routePath,
//           builder: (context, params) => params.isEmpty
//               ? NavBarPage(initialPage: 'homePage')
//               : HomePageWidget(),
//         ),
//         FFRoute(
//           name: AboutScreenWidget.routeName,
//           path: AboutScreenWidget.routePath,
//           builder: (context, params) => AboutScreenWidget(),
//         ),
//         FFRoute(
//           name: EligiblePlayerWidget.routeName,
//           path: EligiblePlayerWidget.routePath,
//           builder: (context, params) => params.isEmpty
//               ? NavBarPage(initialPage: 'eligible_player')
//               : EligiblePlayerWidget(),
//         ),
//         FFRoute(
//           name: RankingPageWidget.routeName,
//           path: RankingPageWidget.routePath,
//           builder: (context, params) => params.isEmpty
//               ? NavBarPage(initialPage: 'rankingPage')
//               : RankingPageWidget(),
//         ),
//         FFRoute(
//           name: FilterScreenWidget.routeName,
//           path: FilterScreenWidget.routePath,
//           builder: (context, params) => FilterScreenWidget(),
//         ),
//         FFRoute(
//           name: ComparePlayersWidget.routeName,
//           path: ComparePlayersWidget.routePath,
//           builder: (context, params) => ComparePlayersWidget(
//             player1Id: params.getParam(
//               'player1Id',
//               ParamType.int,
//             ),
//             player2Id: params.getParam(
//               'player2Id',
//               ParamType.int,
//             ),
//           ),
//         ),
//         FFRoute(
//           name: PlayerBio2Widget.routeName,
//           path: PlayerBio2Widget.routePath,
//           builder: (context, params) => PlayerBio2Widget(),
//         ),
//         FFRoute(
//           name: YourFinalRankingWidget.routeName,
//           path: YourFinalRankingWidget.routePath,
//           builder: (context, params) => params.isEmpty
//               ? NavBarPage(initialPage: 'YourFinalRanking')
//               : YourFinalRankingWidget(),
//         ),
//         FFRoute(
//           name: SubscriptionPageWidget.routeName,
//           path: SubscriptionPageWidget.routePath,
//           builder: (context, params) => SubscriptionPageWidget(),
//         ),
//         FFRoute(
//           name: ContactAndSupportWidget.routeName,
//           path: ContactAndSupportWidget.routePath,
//           builder: (context, params) => ContactAndSupportWidget(),
//         ),
//         FFRoute(
//           name: MyProfileWidget.routeName,
//           path: MyProfileWidget.routePath,
//           builder: (context, params) => MyProfileWidget(),
//         ),
//         FFRoute(
//           name: MatchPlayersWidget.routeName,
//           path: MatchPlayersWidget.routePath,
//           builder: (context, params) => MatchPlayersWidget(),
//         ),
//         FFRoute(
//           name: ContestPageWidget.routeName,
//           path: ContestPageWidget.routePath,
//           builder: (context, params) => ContestPageWidget(),
//         ),
//         FFRoute(
//           name: ContestDetailsWidget.routeName,
//           path: ContestDetailsWidget.routePath,
//           builder: (context, params) => ContestDetailsWidget(
//             contestId: params.getParam(
//               'contestId',
//               ParamType.int,
//             ),
//           ),
//         ),
//         FFRoute(
//           name: ActiveContastDetailsWidget.routeName,
//           path: ActiveContastDetailsWidget.routePath,
//           builder: (context, params) => ActiveContastDetailsWidget(
//             contestId: params.getParam(
//               'contestId',
//               ParamType.int,
//             ),
//           ),
//         ),
//         FFRoute(
//           name: ContestQuestionWidget.routeName,
//           path: ContestQuestionWidget.routePath,
//           builder: (context, params) => ContestQuestionWidget(
//             contestId: params.getParam(
//               'contestId',
//               ParamType.int,
//             ),
//           ),
//         ),
//         FFRoute(
//           name: ContestResultWidget.routeName,
//           path: ContestResultWidget.routePath,
//           builder: (context, params) => ContestResultWidget(
//             contestId: params.getParam(
//               'contestId',
//               ParamType.int,
//             ),
//           ),
//         ),
//         FFRoute(
//           name: PlayWithFriendsWidget.routeName,
//           path: PlayWithFriendsWidget.routePath,
//           builder: (context, params) => params.isEmpty
//               ? NavBarPage(initialPage: 'PlayWithFriends')
//               : PlayWithFriendsWidget(),
//         ),
//         FFRoute(
//           name: MatchPlayerssWidget.routeName,
//           path: MatchPlayerssWidget.routePath,
//           builder: (context, params) => MatchPlayerssWidget(),
//         ),
//         FFRoute(
//           name: MyProfileCopyWidget.routeName,
//           path: MyProfileCopyWidget.routePath,
//           builder: (context, params) => MyProfileCopyWidget(),
//         ),
//         FFRoute(
//           name: PlayerBioWidget.routeName,
//           path: PlayerBioWidget.routePath,
//           builder: (context, params) => PlayerBioWidget(
//             playerId: params.getParam(
//               'playerId',
//               ParamType.int,
//             ),
//           ),
//         ),
//         FFRoute(
//           name: LogInCopyWidget.routeName,
//           path: LogInCopyWidget.routePath,
//           builder: (context, params) => LogInCopyWidget(),
//         ),
//         FFRoute(
//           name: ResetPasswordWidget.routeName,
//           path: ResetPasswordWidget.routePath,
//           builder: (context, params) => ResetPasswordWidget(),
//         ),
//         FFRoute(
//           name: AllPlayersWidget.routeName,
//           path: AllPlayersWidget.routePath,
//           builder: (context, params) => AllPlayersWidget(),
//         ),
//         FFRoute(
//           name: YourComparisonsWidget.routeName,
//           path: YourComparisonsWidget.routePath,
//           builder: (context, params) => YourComparisonsWidget(),
//         ),
//         FFRoute(
//           name: TeamDetailsWidget.routeName,
//           path: TeamDetailsWidget.routePath,
//           builder: (context, params) => TeamDetailsWidget(
//             teamIndex: params.getParam(
//               'teamIndex',
//               ParamType.int,
//             ),
//           ),
//         ),
//         FFRoute(
//           name: PlayWithFriendRankingWidget.routeName,
//           path: PlayWithFriendRankingWidget.routePath,
//           builder: (context, params) => PlayWithFriendRankingWidget(
//             teamId: params.getParam(
//               'teamId',
//               ParamType.int,
//             ),
//           ),
//         ),
//         FFRoute(
//           name: ChatPageWidget.routeName,
//           path: ChatPageWidget.routePath,
//           builder: (context, params) => ChatPageWidget(
//             teamId: params.getParam(
//               'teamId',
//               ParamType.int,
//             ),
//           ),
//         ),
//         FFRoute(
//           name: FilteredResultsWidget.routeName,
//           path: FilteredResultsWidget.routePath,
//           builder: (context, params) {
//             final extraMap = params.state.extraMap;
//             return FilteredResultsWidget(
//               initialFilteredPlayers:
//                   (extraMap['filteredPlayers'] as List?)?.toList() ?? const [],
//               filterType: extraMap['filterType'] as String?,
//             );
//           },
//         )
//       ].map((r) => r.toRoute(appStateNotifier)).toList(),
//       observers: [routeObserver],
//     );
//
// extension NavParamExtensions on Map<String, String?> {
//   Map<String, String> get withoutNulls => Map.fromEntries(
//         entries
//             .where((e) => e.value != null)
//             .map((e) => MapEntry(e.key, e.value!)),
//       );
// }
//
// extension NavigationExtensions on BuildContext {
//   void goNamedAuth(
//     String name,
//     bool mounted, {
//     Map<String, String> pathParameters = const <String, String>{},
//     Map<String, String> queryParameters = const <String, String>{},
//     Object? extra,
//     bool ignoreRedirect = false,
//   }) =>
//       !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
//           ? null
//           : goNamed(
//               name,
//               pathParameters: pathParameters,
//               queryParameters: queryParameters,
//               extra: extra,
//             );
//
//   void pushNamedAuth(
//     String name,
//     bool mounted, {
//     Map<String, String> pathParameters = const <String, String>{},
//     Map<String, String> queryParameters = const <String, String>{},
//     Object? extra,
//     bool ignoreRedirect = false,
//   }) =>
//       !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
//           ? null
//           : pushNamed(
//               name,
//               pathParameters: pathParameters,
//               queryParameters: queryParameters,
//               extra: extra,
//             );
//
//   void safePop() {
//     // If there is only one route on the stack, navigate to the initial
//     // page instead of popping.
//     if (canPop()) {
//       pop();
//     } else {
//       go('/');
//     }
//   }
// }
//
// extension GoRouterExtensions on GoRouter {
//   AppStateNotifier get appState => AppStateNotifier.instance;
//   void prepareAuthEvent([bool ignoreRedirect = false]) =>
//       appState.hasRedirect() && !ignoreRedirect
//           ? null
//           : appState.updateNotifyOnAuthChange(false);
//   bool shouldRedirect(bool ignoreRedirect) =>
//       !ignoreRedirect && appState.hasRedirect();
//   void clearRedirectLocation() => appState.clearRedirectLocation();
//   void setRedirectLocationIfUnset(String location) =>
//       appState.updateNotifyOnAuthChange(false);
// }
//
// extension _GoRouterStateExtensions on GoRouterState {
//   Map<String, dynamic> get extraMap =>
//       extra != null ? extra as Map<String, dynamic> : {};
//   Map<String, dynamic> get allParams => <String, dynamic>{}
//     ..addAll(pathParameters)
//     ..addAll(uri.queryParameters)
//     ..addAll(extraMap);
//   TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
//       ? extraMap[kTransitionInfoKey] as TransitionInfo
//       : TransitionInfo.appDefault();
// }
//
// class FFParameters {
//   FFParameters(this.state, [this.asyncParams = const {}]);
//
//   final GoRouterState state;
//   final Map<String, Future<dynamic> Function(String)> asyncParams;
//
//   Map<String, dynamic> futureParamValues = {};
//
//   // Parameters are empty if the params map is empty or if the only parameter
//   // present is the special extra parameter reserved for the transition info.
//   bool get isEmpty =>
//       state.allParams.isEmpty ||
//       (state.allParams.length == 1 &&
//           state.extraMap.containsKey(kTransitionInfoKey));
//   bool isAsyncParam(MapEntry<String, dynamic> param) =>
//       asyncParams.containsKey(param.key) && param.value is String;
//   bool get hasFutures => state.allParams.entries.any(isAsyncParam);
//   Future<bool> completeFutures() => Future.wait(
//         state.allParams.entries.where(isAsyncParam).map(
//           (param) async {
//             final doc = await asyncParams[param.key]!(param.value)
//                 .onError((_, __) => null);
//             if (doc != null) {
//               futureParamValues[param.key] = doc;
//               return true;
//             }
//             return false;
//           },
//         ),
//       ).onError((_, __) => [false]).then((v) => v.every((e) => e));
//
//   dynamic getParam<T>(
//     String paramName,
//     ParamType type, {
//     bool isList = false,
//     List<String>? collectionNamePath,
//     StructBuilder<T>? structBuilder,
//   }) {
//     if (futureParamValues.containsKey(paramName)) {
//       return futureParamValues[paramName];
//     }
//     if (!state.allParams.containsKey(paramName)) {
//       return null;
//     }
//     final param = state.allParams[paramName];
//     // Got parameter from `extras`, so just directly return it.
//     if (param is! String) {
//       return param;
//     }
//     // Return serialized value.
//     return deserializeParam<T>(
//       param,
//       type,
//       isList,
//       collectionNamePath: collectionNamePath,
//       structBuilder: structBuilder,
//     );
//   }
// }
//
// class FFRoute {
//   const FFRoute({
//     required this.name,
//     required this.path,
//     required this.builder,
//     this.requireAuth = false,
//     this.asyncParams = const {},
//     this.routes = const [],
//   });
//
//   final String name;
//   final String path;
//   final bool requireAuth;
//   final Map<String, Future<dynamic> Function(String)> asyncParams;
//   final Widget Function(BuildContext, FFParameters) builder;
//   final List<GoRoute> routes;
//
//   GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
//         name: name,
//         path: path,
//         redirect: (context, state) {
//           if (appStateNotifier.shouldRedirect) {
//             final redirectLocation = appStateNotifier.getRedirectLocation();
//             appStateNotifier.clearRedirectLocation();
//             return redirectLocation;
//           }
//
//           if (requireAuth && !appStateNotifier.loggedIn) {
//             appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
//             return '/splash';
//           }
//           return null;
//         },
//         pageBuilder: (context, state) {
//           fixStatusBarOniOS16AndBelow(context);
//           final ffParams = FFParameters(state, asyncParams);
//           final page = ffParams.hasFutures
//               ? FutureBuilder(
//                   future: ffParams.completeFutures(),
//                   builder: (context, _) => builder(context, ffParams),
//                 )
//               : builder(context, ffParams);
//           final child = appStateNotifier.loading
//               ? Container(
//                   color: Colors.black,
//                   child: Image.asset(
//                     'assets/images/LOGO_VTG_1.png',
//                     fit: BoxFit.scaleDown,
//                   ),
//                 )
//               : PushNotificationsHandler(child: page);
//
//           final transitionInfo = state.transitionInfo;
//           return transitionInfo.hasTransition
//               ? CustomTransitionPage(
//                   key: state.pageKey,
//                   child: child,
//                   transitionDuration: transitionInfo.duration,
//                   transitionsBuilder:
//                       (context, animation, secondaryAnimation, child) =>
//                           PageTransition(
//                     type: transitionInfo.transitionType,
//                     duration: transitionInfo.duration,
//                     reverseDuration: transitionInfo.duration,
//                     alignment: transitionInfo.alignment,
//                     child: child,
//                   ).buildTransitions(
//                     context,
//                     animation,
//                     secondaryAnimation,
//                     child,
//                   ),
//                 )
//               : MaterialPage(key: state.pageKey, child: child);
//         },
//         routes: routes,
//       );
// }
//
// class TransitionInfo {
//   const TransitionInfo({
//     required this.hasTransition,
//     this.transitionType = PageTransitionType.fade,
//     this.duration = const Duration(milliseconds: 300),
//     this.alignment,
//   });
//
//   final bool hasTransition;
//   final PageTransitionType transitionType;
//   final Duration duration;
//   final Alignment? alignment;
//
//   static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
// }
//
// class RootPageContext {
//   const RootPageContext(this.isRootPage, [this.errorRoute]);
//   final bool isRootPage;
//   final String? errorRoute;
//
//   static bool isInactiveRootPage(BuildContext context) {
//     final rootPageContext = context.read<RootPageContext?>();
//     final isRootPage = rootPageContext?.isRootPage ?? false;
//     final location = GoRouterState.of(context).uri.toString();
//     return isRootPage &&
//         location != '/' &&
//         location != rootPageContext?.errorRoute;
//   }
//
//   static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
//         value: RootPageContext(true, errorRoute),
//         child: child,
//       );
// }
//
// extension GoRouterLocationExtension on GoRouter {
//   String getCurrentLocation() {
//     final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
//     final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
//         ? lastMatch.matches
//         : routerDelegate.currentConfiguration;
//     return matchList.uri.toString();
//   }
// }







//2
import 'dart:async';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../filter/filter_result/filter_result_widget.dart';
import '../../match_players/match_playerss/resume_to_match_players_widget.dart';
import '../../nav/nav_widget.dart';
import '../../ranking_pages/save_progress/save_progress_ranking_widget.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';

import '/auth/base_auth_user_provider.dart';

import '../../ranking_pages/your_final_ranking/your_final_ranking_v2_widget.dart';


import '/backend/push_notifications/push_notifications_handler.dart'
    show PushNotificationsHandler;
import '/flutter_flow/flutter_flow_util.dart';

import '/index.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

const debugRouteLinkMap = {
  '/splash':
  'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=splash',
  '/logIn':
  'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=logIn',
  '/signUp':
  'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=signUp',
  '/forgotPassword':
  'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=forgotPassword',
  '/otp':
  'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=otp',
  '/changePassword':
  'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=changePassword',
  '/homeOnboarding':
  'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=homeOnboarding',
  '/privacyPolicy':
  'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=privacyPolicy',
  '/newPassword':
  'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=newPassword',
  '/settingPage':
  'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=settingPage',
  '/playersList':
  'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=playersList',
  '/homePage':
  'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=homePage',
  '/aboutScreen':
  'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=aboutScreen',
  '/eligiblePlayer':
  'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=eligible_player',
  '/rankingPage':
  'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=rankingPage',
  '/filterScreen':
  'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=filterScreen',
  '/comparePlayers':
  'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=ComparePlayers',
  '/playerBio2':
  'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=playerBio2',
  '/yourFinalRanking':
  'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=YourFinalRanking',
  '/subscriptionPage':
  'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=SubscriptionPage',
  '/contactAndSupport':
  'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=ContactAndSupport',
  '/myProfile':
  'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=MyProfile',
  '/matchPlayers':
  'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=MatchPlayers',
  '/contestPage':
  'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=ContestPage',
  '/contestDetails':
  'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=ContestDetails',
  '/activeContastDetails':
  'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=ActiveContastDetails',
  '/contestQuestion':
  'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=ContestQuestion',
  '/contestResult':
  'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=ContestResult',
  '/playWithFriends':
  'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=PlayWithFriends',
  '/matchPlayerss':
  'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=MatchPlayerss',
  '/myProfileCopy':
  'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=MyProfileCopy',
  '/playerBio':
  'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=playerBio',
  '/logInCopy':
  'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=logInCopy',
  '/resetPassword':
  'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=resetPassword',
  '/allPlayers':
  'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=AllPlayers',
  '/yourComparisons':
  'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=YourComparisons',
  '/teamDetails':
  'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=TeamDetails',
  '/playWithFriendRanking':
  'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=PlayWithFriendRanking',
  '/chatPage':
  'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=ChatPage',
      '/filterResult':
'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r?tab=uiBuilder&page=FilterResult'
};

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
  // initialLocation: '/',
  // debugLogDiagnostics: true,
  // refreshListenable: appStateNotifier,
  // navigatorKey: appNavigatorKey,
  // errorBuilder: (context, state) =>
  // appStateNotifier.loggedIn ? NavWidget() : SplashWidget(),


  initialLocation: '/splash', // SplashWidget launches first
  debugLogDiagnostics: true,
  refreshListenable: appStateNotifier,
  navigatorKey: appNavigatorKey,
  errorBuilder: (context, state) => const SplashWidget(),
  routes: [
    FFRoute(
      name: '_initialize',
      path: '/',
      builder: (context, _) =>
          appStateNotifier.loggedIn ? const NavWidget() : const SplashWidget(),
    ),
    FFRoute(
      name: SplashWidget.routeName,
      path: SplashWidget.routePath,
      builder: (context, params) => const SplashWidget(),
    ),
    FFRoute(
      name: LogInWidget.routeName,
      path: LogInWidget.routePath,
      builder: (context, params) => const LogInWidget(),
    ),
    FFRoute(
      name: SignUpWidget.routeName,
      path: SignUpWidget.routePath,
      builder: (context, params) => SignUpWidget(
        showBackButton: params.getParam('showBackButton', ParamType.bool) ?? false,
      ),
    ),
    FFRoute(
      name: ForgotPasswordWidget.routeName,
      path: ForgotPasswordWidget.routePath,
      builder: (context, params) => const ForgotPasswordWidget(),
    ),
    FFRoute(
      name: OtpWidget.routeName,
      path: OtpWidget.routePath,
      builder: (context, params) => OtpWidget(
        email: params.getParam(
          'email',
          ParamType.String,
        ),
        user: params.getParam(
          'user',
          ParamType.int,
        ),
      ),
    ),
    FFRoute(
      name: ChangePasswordWidget.routeName,
      path: ChangePasswordWidget.routePath,
      builder: (context, params) => ChangePasswordWidget(
        userId: params.getParam(
          'userId',
          ParamType.int,
        ),
      ),
    ),
    FFRoute(
      name: HomeOnboardingWidget.routeName,
      path: HomeOnboardingWidget.routePath,
      builder: (context, params) => const HomeOnboardingWidget(),
    ),
    FFRoute(
      name: PrivacyPolicyWidget.routeName,
      path: PrivacyPolicyWidget.routePath,
      builder: (context, params) => const PrivacyPolicyWidget(),
    ),
    FFRoute(
      name: NewPasswordWidget.routeName,
      path: NewPasswordWidget.routePath,
      builder: (context, params) => const NewPasswordWidget(),
    ),
    FFRoute(
      name: SettingPageWidget.routeName,
      path: SettingPageWidget.routePath,
      builder: (context, params) => const SettingPageWidget(),
    ),
    FFRoute(
      name: PlayersListWidget.routeName,
      path: PlayersListWidget.routePath,
      builder: (context, params) => const PlayersListWidget(),
    ),
    FFRoute(
      name: HomePageWidget.routeName,
      path: HomePageWidget.routePath,
      builder: (context, params) => const HomePageWidget(),
    ),
    FFRoute(
      name: AboutScreenWidget.routeName,
      path: AboutScreenWidget.routePath,
      builder: (context, params) => const AboutScreenWidget(),
    ),
    FFRoute(
      name: EligiblePlayerWidget.routeName,
      path: EligiblePlayerWidget.routePath,
      builder: (context, params) => const EligiblePlayerWidget(),
    ),
    FFRoute(
      name: RankingPageWidget.routeName,
      path: RankingPageWidget.routePath,
      builder: (context, params) => const RankingPageWidget(),
    ),


    ///

    FFRoute(
      name: SaveProgressRankingWidget.routeName,
      path: SaveProgressRankingWidget.routePath,
      builder: (context, params) => const SaveProgressRankingWidget(),
    ),


    ///


    FFRoute(
      name: FilterScreenWidget.routeName,
      path: FilterScreenWidget.routePath,
      builder: (context, params) => const FilterScreenWidget(),
    ),
    FFRoute(
      name: ComparePlayersWidget.routeName,
      path: ComparePlayersWidget.routePath,
      builder: (context, params) => ComparePlayersWidget(
        player1Id: params.getParam(
          'player1Id',
          ParamType.int,
        ),
        player2Id: params.getParam(
          'player2Id',
          ParamType.int,
        ),
      ),
    ),
    FFRoute(
      name: PlayerBio2Widget.routeName,
      path: PlayerBio2Widget.routePath,
      builder: (context, params) => const PlayerBio2Widget(),
    ),
    FFRoute(
      name: YourFinalRankingWidget.routeName,
      path: YourFinalRankingWidget.routePath,
      builder: (context, params) => const YourFinalRankingWidget(),
    ),


    // ADD THIS BELOW 👇
    FFRoute(
      name: YourFinalRankingV2Widget.routeName,
      path: YourFinalRankingV2Widget.routePath,
      builder: (context, params) => const YourFinalRankingV2Widget(),
    ),


    FFRoute(
      name: SubscriptionPageWidget.routeName,
      path: SubscriptionPageWidget.routePath,
      builder: (context, params) => const SubscriptionPageWidget(),
    ),
    FFRoute(
      name: ContactAndSupportWidget.routeName,
      path: ContactAndSupportWidget.routePath,
      builder: (context, params) => const ContactAndSupportWidget(),
    ),
    FFRoute(
      name: MyProfileWidget.routeName,
      path: MyProfileWidget.routePath,
      builder: (context, params) => const MyProfileWidget(),
    ),
    FFRoute(
      name: MatchPlayersWidget.routeName,
      path: MatchPlayersWidget.routePath,
      builder: (context, params) => const MatchPlayersWidget(),
    ),
    FFRoute(
      name: ContestPageWidget.routeName,
      path: ContestPageWidget.routePath,
      builder: (context, params) => const ContestPageWidget(),
    ),
    FFRoute(
      name: ContestDetailsWidget.routeName,
      path: ContestDetailsWidget.routePath,
      builder: (context, params) => ContestDetailsWidget(
        contestId: params.getParam(
          'contestId',
          ParamType.int,
        ),
      ),
    ),
    FFRoute(
      name: ActiveContastDetailsWidget.routeName,
      path: ActiveContastDetailsWidget.routePath,
      builder: (context, params) => ActiveContastDetailsWidget(
        contestId: params.getParam(
          'contestId',
          ParamType.int,
        ),
      ),
    ),
    FFRoute(
      name: ContestQuestionWidget.routeName,
      path: ContestQuestionWidget.routePath,
      builder: (context, params) => ContestQuestionWidget(
        contestId: params.getParam(
          'contestId',
          ParamType.int,
        ),
      ),
    ),
    FFRoute(
      name: ContestResultWidget.routeName,
      path: ContestResultWidget.routePath,
      builder: (context, params) => ContestResultWidget(
        contestId: params.getParam(
          'contestId',
          ParamType.int,
        ),
      ),
    ),
    FFRoute(
      name: PlayWithFriendsWidget.routeName,
      path: PlayWithFriendsWidget.routePath,
      builder: (context, params) => const PlayWithFriendsWidget(),
    ),
    FFRoute(
      name: MatchPlayerssWidget.routeName,
      path: MatchPlayerssWidget.routePath,
      builder: (context, params) => const MatchPlayerssWidget(),
    ),
    FFRoute(
      name: MyProfileCopyWidget.routeName,
      path: MyProfileCopyWidget.routePath,
      builder: (context, params) => const MyProfileCopyWidget(),
    ),
    FFRoute(
      name: PlayerBioWidget.routeName,
      path: PlayerBioWidget.routePath,
      builder: (context, params) => PlayerBioWidget(
        playerId: params.getParam(
          'playerId',
          ParamType.int,
        ),
      ),
    ),
    FFRoute(
      name: LogInCopyWidget.routeName,
      path: LogInCopyWidget.routePath,
      builder: (context, params) => const LogInCopyWidget(),
    ),
    FFRoute(
      name: ResetPasswordWidget.routeName,
      path: ResetPasswordWidget.routePath,
      builder: (context, params) => const ResetPasswordWidget(),
    ),
    FFRoute(
      name: AllPlayersWidget.routeName,
      path: AllPlayersWidget.routePath,
      builder: (context, params) => const AllPlayersWidget(),
    ),
    FFRoute(
      name: YourComparisonsWidget.routeName,
      path: YourComparisonsWidget.routePath,
      builder: (context, params) => const YourComparisonsWidget(),
    ),
    ///
    FFRoute(
      name: ResumeToMatchPlayersWidget.routeName,
      path: ResumeToMatchPlayersWidget.routePath,
      builder: (context, params) => const ResumeToMatchPlayersWidget(),
    ),

    ///

    FFRoute(
      name: TeamDetailsWidget.routeName,
      path: TeamDetailsWidget.routePath,
      builder: (context, params) => TeamDetailsWidget(
        teamIndex: params.getParam(
          'teamIndex',
          ParamType.int,
        ),
      ),
    ),
    FFRoute(
      name: PlayWithFriendRankingWidget.routeName,
      path: PlayWithFriendRankingWidget.routePath,
      builder: (context, params) => PlayWithFriendRankingWidget(
        teamId: params.getParam(
          'teamId',
          ParamType.int,
        ),
      ),
    ),
    FFRoute(
      name: ChatPageWidget.routeName,
      path: ChatPageWidget.routePath,
      builder: (context, params) => ChatPageWidget(
        teamId: params.getParam(
          'teamId',
          ParamType.int,
        ),
      ),
    ),


    FFRoute(
      name: FilteredResultsWidget.routeName,
      path: FilteredResultsWidget.routePath,
      builder: (context, params) {
        final extraMap = params.state.extraMap;
        return FilteredResultsWidget(
          initialFilteredPlayers:
          (extraMap['filteredPlayers'] as List?)?.toList() ?? const [],
          filterType: extraMap['filterType'] as String?,
        );
      },
    ),

    FFRoute(
      name: NotificationsPageWidget.routeName,
      path: NotificationsPageWidget.routePath,
      builder: (context, params) => const NotificationsPageWidget(),
    ),

    // FFRoute(
    //   name: NavWidget.routeName,
    //   path: NavWidget.routePath,
    //   builder: (context, params) {
    //     final initialTab = params.getParam('initialTab', ParamType.int) ?? 0;
    //     return NavWidget(initialTab: initialTab);
    //   },
    // ),

    FFRoute(
      name: NavWidget.routeName,
      path: NavWidget.routePath,
      builder: (context, params) => const NavWidget(),
    )

  ].map((r) => r.toRoute(appStateNotifier)).toList(),
  observers: [
    routeObserver,
    FirebaseAnalyticsObserver(analytics: FirebaseAnalytics.instance),
  ],
);

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
    entries
        .where((e) => e.value != null)
        .map((e) => MapEntry(e.key, e.value!)),
  );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
      String name,
      bool mounted, {
        Map<String, String> pathParameters = const <String, String>{},
        Map<String, String> queryParameters = const <String, String>{},
        Object? extra,
        bool ignoreRedirect = false,
      }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
        name,
        pathParameters: pathParameters,
        queryParameters: queryParameters,
        extra: extra,
      );

  void pushNamedAuth(
      String name,
      bool mounted, {
        Map<String, String> pathParameters = const <String, String>{},
        Map<String, String> queryParameters = const <String, String>{},
        Object? extra,
        bool ignoreRedirect = false,
      }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
        name,
        pathParameters: pathParameters,
        queryParameters: queryParameters,
        extra: extra,
      );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
          (state.allParams.length == 1 &&
              state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
    state.allParams.entries.where(isAsyncParam).map(
          (param) async {
        final doc = await asyncParams[param.key]!(param.value)
            .onError((_, __) => null);
        if (doc != null) {
          futureParamValues[param.key] = doc;
          return true;
        }
        return false;
      },
    ),
  ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
      String paramName,
      ParamType type, {
        bool isList = false,
        List<String>? collectionNamePath,
        StructBuilder<T>? structBuilder,
      }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      collectionNamePath: collectionNamePath,
      structBuilder: structBuilder,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
    name: name,
    path: path,
    redirect: (context, state) {
      if (appStateNotifier.shouldRedirect) {
        final redirectLocation = appStateNotifier.getRedirectLocation();
        appStateNotifier.clearRedirectLocation();
        return redirectLocation;
      }

      if (requireAuth && !appStateNotifier.loggedIn) {
        appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
        return '/splash';
      }
      return null;
    },
    pageBuilder: (context, state) {
      fixStatusBarOniOS16AndBelow(context);
      final ffParams = FFParameters(state, asyncParams);
      final page = ffParams.hasFutures
          ? FutureBuilder(
        future: ffParams.completeFutures(),
        builder: (context, _) => builder(context, ffParams),
      )
          : builder(context, ffParams);
      final child = appStateNotifier.loading
          ? Container(
        color: Colors.black,
        child: Image.asset(
          'assets/images/LOGO_VTG_1.png',
          fit: BoxFit.scaleDown,
        ),
      )
          : PushNotificationsHandler(child: page);

      final transitionInfo = state.transitionInfo;
      return transitionInfo.hasTransition
          ? CustomTransitionPage(
        key: state.pageKey,
        child: child,
        transitionDuration: transitionInfo.duration,
        transitionsBuilder:
            (context, animation, secondaryAnimation, child) =>
            PageTransition(
              type: transitionInfo.transitionType,
              duration: transitionInfo.duration,
              reverseDuration: transitionInfo.duration,
              alignment: transitionInfo.alignment,
              child: child,
            ).buildTransitions(
              context,
              animation,
              secondaryAnimation,
              child,
            ),
      )
          : MaterialPage(key: state.pageKey, child: child);
    },
    routes: routes,
  );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => const TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
    value: RootPageContext(true, errorRoute),
    child: child,
  );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final configuration = routerDelegate.currentConfiguration;
    if (configuration.matches.isEmpty) {
      return '/';
    }
    final RouteMatch lastMatch = configuration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : configuration;
    return matchList.uri.toString();
  }
}
