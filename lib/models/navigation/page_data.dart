library page_data;

import 'package:built_value/built_value.dart';

part 'page_data.g.dart';

/// Info on polymorphism with built_value:
/// https://github.com/google/built_value.dart/blob/master/example/lib/polymorphism.dart
@BuiltValue(instantiable: false)
abstract class PageData {
  PageData rebuild(void Function(PageDataBuilder) updates);
  PageDataBuilder toBuilder();
}
