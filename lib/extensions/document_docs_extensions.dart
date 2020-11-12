import 'package:adventures_in_tech_world/models/google/google_doc.dart';
import 'package:googleapis/docs/v1.dart' as docs;

extension DocumentExt on docs.Document {
  GoogleDoc toGoogleDoc() => GoogleDoc(
      documentId: documentId,
      revisionId: revisionId,
      suggestionsViewMode: suggestionsViewMode,
      title: title);
}
