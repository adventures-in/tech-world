/// A Google Docs document.
class GoogleDoc {
  /// Output only. The main body of the document.
  // Body body;

  /// Output only. The ID of the document.
  String documentId;

  /// Output only. The style of the document.
  // DocumentStyle documentStyle;

  /// Output only. The footers in the document, keyed by footer ID.
  // core.Map<core.String, Footer> footers;

  /// Output only. The footnotes in the document, keyed by footnote ID.
  // core.Map<core.String, Footnote> footnotes;

  /// Output only. The headers in the document, keyed by header ID.
  // core.Map<core.String, Header> headers;

  /// Output only. The inline objects in the document, keyed by object ID.
  // core.Map<core.String, InlineObject> inlineObjects;

  /// Output only. The lists in the document, keyed by list ID.
  // core.Map<core.String, List> lists;

  /// Output only. The named ranges in the document, keyed by name.
  // core.Map<core.String, NamedRanges> namedRanges;

  /// Output only. The named styles of the document.
  // NamedStyles namedStyles;

  /// Output only. The positioned objects in the document, keyed by object ID.
  // core.Map<core.String, PositionedObject> positionedObjects;

  /// Output only. The revision ID of the document. Can be used in update
  /// requests to specify which revision of a document to apply updates to and
  /// how the request should behave if the document has been edited since that
  /// revision. Only populated if the user has edit access to the document. The
  /// format of the revision ID may change over time, so it should be treated
  /// opaquely. A returned revision ID is only guaranteed to be valid for 24
  /// hours after it has been returned and cannot be shared across users. If the
  /// revision ID is unchanged between calls, then the document has not changed.
  /// Conversely, a changed ID (for the same document and user) usually means
  /// the document has been updated; however, a changed ID can also be due to
  /// internal factors such as ID format changes.
  String revisionId;

  /// Output only. The suggested changes to the style of the document, keyed by
  /// suggestion ID.
  // core.Map<core.String, SuggestedDocumentStyle> suggestedDocumentStyleChanges;

  /// Output only. The suggested changes to the named styles of the document,
  /// keyed by suggestion ID.
  // core.Map<core.String, SuggestedNamedStyles> suggestedNamedStylesChanges;

  /// Output only. The suggestions view mode applied to the document. Note: When
  /// editing a document, changes must be based on a document with
  /// SUGGESTIONS_INLINE.
  /// Possible string values are:
  /// - "DEFAULT_FOR_CURRENT_ACCESS" : The SuggestionsViewMode applied to the
  /// returned document depends on the user's current access level. If the user
  /// only has view access, PREVIEW_WITHOUT_SUGGESTIONS is applied. Otherwise,
  /// SUGGESTIONS_INLINE is applied. This is the default suggestions view mode.
  /// - "SUGGESTIONS_INLINE" : The returned document has suggestions inline.
  /// Suggested changes will be differentiated from base content within the
  /// document. Requests to retrieve a document using this mode will return a
  /// 403 error if the user does not have permission to view suggested changes.
  /// - "PREVIEW_SUGGESTIONS_ACCEPTED" : The returned document is a preview with
  /// all suggested changes accepted. Requests to retrieve a document using this
  /// mode will return a 403 error if the user does not have permission to view
  /// suggested changes.
  /// - "PREVIEW_WITHOUT_SUGGESTIONS" : The returned document is a preview with
  /// all suggested changes rejected if there are any suggestions in the
  /// document.
  String suggestionsViewMode;

  /// The title of the document.
  String title;

  GoogleDoc(
      {this.documentId, this.revisionId, this.suggestionsViewMode, this.title});
}
