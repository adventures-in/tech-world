import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'package:adventures_in_tech_world/models/app/serializers.dart';

part 'pull_request_state.g.dart';

class PullRequestState extends EnumClass {
  static Serializer<PullRequestState> get serializer =>
      _$pullRequestStateSerializer;
  static const PullRequestState closed = _$closed;
  static const PullRequestState merged = _$merged;
  static const PullRequestState open = _$open;
  static const Map<PullRequestState, int> _$indexMap = {
    closed: 0,
    merged: 1,
    open: 2
  };

  const PullRequestState._(String name) : super(name);

  int get index => _$indexMap[this];
  static BuiltSet<PullRequestState> get values => _$values;
  static PullRequestState valueOf(String name) => _$valueOf(name);
  static PullRequestState valueOfToLowerCase(String name) =>
      _$valueOf(name.toLowerCase());

  Object toJson() =>
      serializers.serializeWith(PullRequestState.serializer, this);
}
