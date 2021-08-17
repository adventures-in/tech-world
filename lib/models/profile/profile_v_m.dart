import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';

part 'profile_v_m.freezed.dart';
part 'profile_v_m.g.dart';

@freezed
class ProfileVM with _$ProfileVM, ReduxModel {
  factory ProfileVM(IMap<ProvidersEnum, AuthorizationEnum> stateOf) =
      _ProfileVM;

  factory ProfileVM.init() {
    return ProfileVM(IMap({
      ProvidersEnum.google: AuthorizationEnum.unknown,
      ProvidersEnum.gitHub: AuthorizationEnum.unknown,
      ProvidersEnum.asana: AuthorizationEnum.unknown,
    }));
  }
  factory ProfileVM.fromJson(Map<String, Object?> json) =>
      _$ProfileVMFromJson(json);
}
