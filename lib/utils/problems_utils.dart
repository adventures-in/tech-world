// create a function to be called on finding an error
import 'package:adventures_in_tech_world/actions/problems/add_problem.dart';
import 'package:adventures_in_tech_world/actions/redux_action.dart';
import 'package:built_collection/built_collection.dart';

Function(dynamic error, StackTrace trace) generateProblemHandler(
        Function(ReduxAction) actionHandler, String location) =>
    (dynamic error, StackTrace trace) {
      final info = BuiltMap<String, Object>(
          <String, Object>{'type': error.runtimeType, 'location': location});
      (actionHandler(
        AddProblem(
            errorString: error.toString(),
            traceString: trace.toString(),
            info: info),
      ));
    };
