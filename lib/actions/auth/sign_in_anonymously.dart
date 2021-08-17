import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';

part 'sign_in_anonymously.freezed.dart';
part 'sign_in_anonymously.g.dart';

@freezed
class SignInAnonymously with _$SignInAnonymously, ReduxAction {
  factory SignInAnonymously() = _SignInAnonymously;

  factory SignInAnonymously.fromJson(Map<String, Object?> json) =>
      _$SignInAnonymouslyFromJson(json);
}
