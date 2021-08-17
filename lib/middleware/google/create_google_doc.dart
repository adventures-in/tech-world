import 'package:redux/redux.dart';
import 'package:tech_world/actions/google/create_google_doc.dart';
import 'package:tech_world/models/app/app_state.dart';
import 'package:tech_world/services/google_service.dart';

class CreateGoogleDocMiddleware
    extends TypedMiddleware<AppState, CreateGoogleDoc> {
  CreateGoogleDocMiddleware(GoogleService googleService)
      : super((store, action, next) async {
          next(action);

          await googleService.createGoogleDoc();
        });
}
