import 'package:adventures_in_tech_world/actions/google/create_google_doc.dart';
import 'package:adventures_in_tech_world/models/app/app_state.dart';
import 'package:adventures_in_tech_world/services/google_service.dart';
import 'package:redux/redux.dart';

class CreateGoogleDocMiddleware
    extends TypedMiddleware<AppState, CreateGoogleDoc> {
  CreateGoogleDocMiddleware(GoogleService googleService)
      : super((store, action, next) async {
          next(action);

          await googleService.createGoogleDoc();
        });
}
