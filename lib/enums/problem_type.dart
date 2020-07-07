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
  static const ProblemType signInAnonymously = _$signInAnonymously;
  static const ProblemType observeAuthToken = _$observeAuthToken;
  static const ProblemType connectToAuthToken = _$connectToAuthToken;
  static const ProblemType plumbDatabaseStreamMiddleware =
      _$plumbDatabaseStreamMiddleware;

  const ProblemType._(String name) : super(name);

  static BuiltSet<ProblemType> get values => _$values;
  static ProblemType valueOf(String name) => _$valueOf(name);

  Object toJson() => serializers.serializeWith(ProblemType.serializer, this);
}
