// create a function to be called on finding an error
import 'package:adventures_in_tech_world/actions/problems/add_problem.dart';
import 'package:adventures_in_tech_world/actions/redux_action.dart';
import 'package:adventures_in_tech_world/enums/problem_location.dart';

Function(dynamic error, StackTrace trace) generateProblemHandler(
        ProblemLocation location, Function(ReduxAction) actionHandler) =>
    (dynamic error, StackTrace trace) => (actionHandler(AddProblem(
          location: location,
          errorString: error.toString(),
          traceString: trace.toString(),
        )));
