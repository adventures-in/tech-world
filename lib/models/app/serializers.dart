import 'package:adventures_in/actions/navigation/store_nav_bar_selection.dart';
import 'package:adventures_in/enums/nav_bar_selection.dart';
import 'package:built_value/iso_8601_date_time_serializer.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';

part 'serializers.g.dart';

/// Once per app, define a top level "Serializer" to gather together
/// all the generated serializers.
///
/// Collection of generated serializers for the AdventuresIn app
@SerializersFor([
  StoreNavBarSelection,
  // AddProblem,
  // RemoveProblem,
  // AppState,
  // ObserveAuthState,
])
final Serializers serializers = (_$serializers.toBuilder()
      ..addPlugin(StandardJsonPlugin())
      ..add(Iso8601DateTimeSerializer()))
    .build();
