import 'package:adventures_in_tech_world/models/app/serializers.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'problem_type.g.dart';

class ProblemType extends EnumClass {
  static Serializer<ProblemType> get serializer => _$problemTypeSerializer;

  static const ProblemType googleSignIn = _$googleSignIn;
  static const ProblemType appleSignIn = _$appleSignIn;
  static const ProblemType exchangeGitHubCodeForToken =
      _$exchangeGitHubCodeForToken;
  static const ProblemType observeGitHubToken = _$observeGitHubToken;
  static const ProblemType connectToAuthToken = _$connectToAuthToken;
  static const ProblemType plumbServicesMiddleware = _$plumbServicesMiddleware;
  static const ProblemType authServiceConnectFirebase =
      _$authServiceConnectFirebase;
  static const ProblemType connectFirebaseAuthExtension =
      _$connectFirebaseAuthExtension;
  static const ProblemType storeGitHubTokenMiddleware =
      _$storeGitHubTokenMiddleware;
  static const ProblemType signOutMiddleware = _$signOutMiddleware;
  static const ProblemType storeUserDataMiddleware = _$storeUserDataMiddleware;

  const ProblemType._(String name) : super(name);

  static BuiltSet<ProblemType> get values => _$values;
  static ProblemType valueOf(String name) => _$valueOf(name);

  Object toJson() => serializers.serializeWith(ProblemType.serializer, this);
}
