import 'package:rxdart/rxdart.dart';

import 'custom_auth_manager.dart';

class VoteForGoatAuthUser {
  VoteForGoatAuthUser({required this.loggedIn, this.uid});

  bool loggedIn;
  String? uid;
}

/// Generates a stream of the authenticated user.
BehaviorSubject<VoteForGoatAuthUser> voteForGoatAuthUserSubject =
    BehaviorSubject.seeded(VoteForGoatAuthUser(loggedIn: false));
Stream<VoteForGoatAuthUser> voteForGoatAuthUserStream() =>
    voteForGoatAuthUserSubject
        .asBroadcastStream()
        .map((user) => currentUser = user);
