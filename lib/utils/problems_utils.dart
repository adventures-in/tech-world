// create a function to be called on finding an error
import 'package:adventures_in_tech_world/actions/problems/add_problem.dart';
import 'package:adventures_in_tech_world/actions/redux_action.dart';
import 'package:adventures_in_tech_world/enums/problem_type.dart';

Function(dynamic error, StackTrace trace) generateProblemHandler(
        ProblemType type, Function(ReduxAction) actionHandler) =>
    (dynamic error, StackTrace trace) => (actionHandler(AddProblem(
          type: type,
          errorString: error.toString(),
          traceString: trace.toString(),
        )));
