import 'package:googleapis/docs/v1.dart' as docs;
import 'package:tech_world/models/google/google_doc.dart';

extension DocumentExt on docs.Document {
  GoogleDoc toGoogleDoc() => GoogleDoc(
      documentId: documentId,
      revisionId: revisionId,
      suggestionsViewMode: suggestionsViewMode,
      title: title);
}
