import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';

part 'link_provider.freezed.dart';
part 'link_provider.g.dart';

@freezed
class LinkProvider with _$LinkProvider, ReduxAction {
  factory LinkProvider(ProvidersEnum provider) = _LinkProvider;

  factory LinkProvider.fromJson(Map<String, Object?> json) =>
      _$LinkProviderFromJson(json);
}
