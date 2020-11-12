import 'package:adventures_in_tech_world/extensions/document_docs_extensions.dart';
import 'package:adventures_in_tech_world/models/google/google_doc.dart';
import 'package:googleapis/docs/v1.dart';
import 'package:googleapis/drive/v3.dart';
import 'package:googleapis_auth/auth.dart';

class GoogleService {
  AuthClient _client;
  DriveApi _driveApi;
  DocsApi _docsApi;

  set token(String token) {
    // _client = AuthClient(token, http.Client());
    _driveApi = DriveApi(_client);
    _docsApi = DocsApi(_client);
  }

  Future<GoogleDoc> createGoogleDoc() async {
    // _driveApi.files.create()
    final doc = await _docsApi.documents.create(Document());
    return doc.toGoogleDoc();
  }
}
