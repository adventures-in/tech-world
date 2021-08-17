import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';

part 'request_authorization.freezed.dart';
part 'request_authorization.g.dart';

@freezed
class RequestAuthorization with _$RequestAuthorization, ReduxAction {
  factory RequestAuthorization({required ProvidersEnum provider}) =
      _RequestAuthorization;

  factory RequestAuthorization.fromJson(Map<String, Object?> json) =>
      _$RequestAuthorizationFromJson(json);
}
