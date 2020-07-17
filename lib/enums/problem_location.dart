import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'package:adventures_in_tech_world/models/app/serializers.dart';

part 'problem_location.g.dart';

class ProblemLocation extends EnumClass {
  static Serializer<ProblemLocation> get serializer =>
      _$problemLocationSerializer;

  static const ProblemLocation googleSignIn = _$googleSignIn;
  static const ProblemLocation appleSignIn = _$appleSignIn;
  static const ProblemLocation exchangeGitHubCodeForToken =
      _$exchangeGitHubCodeForToken;
  static const ProblemLocation observeGitHubToken = _$observeGitHubToken;
  static const ProblemLocation connectToAuthToken = _$connectToAuthToken;
  static const ProblemLocation plumbServicesMiddleware =
      _$plumbServicesMiddleware;
  static const ProblemLocation authServiceConnectFirebase =
      _$authServiceConnectFirebase;
  static const ProblemLocation firestoreServiceConnectTokens =
      _$firestoreServiceConnectTokens;
  static const ProblemLocation connectFirebaseAuthExtension =
      _$connectFirebaseAuthExtension;
  static const ProblemLocation storeGitHubTokenMiddleware =
      _$storeGitHubTokenMiddleware;
  static const ProblemLocation signOutMiddleware = _$signOutMiddleware;
  static const ProblemLocation storeUserDataMiddleware =
      _$storeUserDataMiddleware;
  static const ProblemLocation retrieveGitHubRepositories =
      _$retrieveGitHubRepositories;
  static const ProblemLocation retrieveGitHubAssignedIssues =
      _$retrieveGitHubAssignedIssues;
  static const ProblemLocation retrieveGitHubPullRequests =
      _$retrieveGitHubPullRequests;
  // static const ProblemLocation connectAuthState = _$connectAuthState;

  const ProblemLocation._(String name) : super(name);

  static BuiltSet<ProblemLocation> get values => _$values;
  static ProblemLocation valueOf(String name) => _$valueOf(name);

  Object toJson() =>
      serializers.serializeWith(ProblemLocation.serializer, this);
}
