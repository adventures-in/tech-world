import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';

/// Taken from https://github.com/google/built_collection.dart/issues/83
/// They use 'buildAt' and 'rebuildAt' but given the extension funcitons act on
/// a builder, I think a better name is updateAt
extension BuiltValueListBuilderExtension<V extends Built<V, B>,
    B extends Builder<V, B>> on ListBuilder<Built<V, B>> {
  void updateAt(int index, void Function(B) updates) =>
      this[index] = this[index].rebuild(updates);

  void updateWhere(bool Function(V) test, void Function(B) updates) {
    for (var i = 0; i != length; ++i) {
      if (test(this[i] as V)) this[i] = this[i].rebuild(updates);
    }
  }
}

extension BuiltValueMapBuilderExtension<K, V extends Built<V, B>,
    B extends Builder<V, B>> on MapBuilder<K, Built<V, B>> {
  void updateAt(K key, void Function(B) updates) =>
      this[key] = this[key].rebuild(updates);
}
