import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';
import 'package:tech_world/enums/linking_step_enum.dart';

part 'update_profile.freezed.dart';
part 'update_profile.g.dart';

@freezed
class UpdateProfile with _$UpdateProfile, ReduxAction {
  factory UpdateProfile({
    required ProvidersEnum provider,
    LinkingStepEnum? linkingStep,
    AuthorizationEnum? authorizingStep,
  }) = _UpdateProfile;

  factory UpdateProfile.fromJson(Map<String, Object?> json) =>
      _$UpdateProfileFromJson(json);
}
