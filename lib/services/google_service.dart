import 'package:googleapis/docs/v1.dart';
import 'package:googleapis_auth/googleapis_auth.dart';
import 'package:tech_world/extensions/document_docs_extensions.dart';
import 'package:tech_world/models/google/google_doc.dart';

class GoogleService {
  AuthClient _client;
  DocsApi _docsApi;

  set token(String token) {
    // _client = AuthClient(token, http.Client());
    _docsApi = DocsApi(_client);
  }

  Future<GoogleDoc> createGoogleDoc() async {
    // _driveApi.files.create()
    final doc = await _docsApi.documents.create(Document());
    return doc.toGoogleDoc();
  }
}
