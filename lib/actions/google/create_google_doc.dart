import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';

part 'create_google_doc.freezed.dart';
part 'create_google_doc.g.dart';

@freezed
class CreateGoogleDoc with _$CreateGoogleDoc, ReduxAction {
  factory CreateGoogleDoc({required String name}) = _CreateGoogleDoc;

  factory CreateGoogleDoc.fromJson(Map<String, Object?> json) =>
      _$CreateGoogleDocFromJson(json);
}
