import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';

part 'git_hub_label.freezed.dart';
part 'git_hub_label.g.dart';

@freezed
class GitHubLabel with _$GitHubLabel, ReduxModel {
  factory GitHubLabel({required String name, required String color}) =
      _GitHubLabel;

  factory GitHubLabel.fromJson(Map<String, Object?> json) =>
      _$GitHubLabelFromJson(json);
}
