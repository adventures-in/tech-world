import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';
import 'package:tech_world/enums/linking_step_enum.dart';

part 'update_profile_action.freezed.dart';
part 'update_profile_action.g.dart';

@freezed
class UpdateProfileAction with _$UpdateProfileAction, ReduxAction {
  factory UpdateProfileAction({
    required ProvidersEnum provider,
    LinkingStepEnum? linkingStep,
    AuthorizationEnum? authorizingStep,
  }) = _UpdateProfileAction;

  factory UpdateProfileAction.fromJson(Map<String, Object?> json) =>
      _$UpdateProfileActionFromJson(json);
}
