import 'dart:async';
import 'package:adventures_in_tech_world/actions/problems/remove_problem.dart';
import 'package:adventures_in_tech_world/actions/redux_action.dart';
import 'package:adventures_in_tech_world/models/problems/problem.dart';
import 'package:adventures_in_tech_world/widgets/alerts/confirmation_alert.dart';
import 'package:adventures_in_tech_world/widgets/alerts/problem_alert.dart';
import 'package:flutter/material.dart';

class NavigationService {
  NavigationService(this._navKey);

  final GlobalKey<NavigatorState> _navKey;

  /// Use [NavigatorState.pushNamed] to push a named route onto the navigator.
  void navigateTo(String location) => _navKey.currentState.pushNamed(location);

  void popHome() {
    /// The [popHome] method calls [NavigatorState.popUntil], passing a
    /// [RoutePredicate] created with [ModalRoute.withName]('/')
    ///
    /// The [RoutePredicate] is used to pop until the condition is met
    _navKey.currentState.popUntil(ModalRoute.withName('/'));
  }

  void replaceCurrentWith(String newRouteName) {
    _navKey.currentState.pushReplacementNamed(newRouteName);
  }

  /// Display the problem and return a future that will complete with an action
  /// to be dispatched.
  ///
  /// Adds a call to the post-frame callbacks to avoid calling setState during
  /// a build.
  Future<ReduxAction> display(Problem problem) {
    // create a completer whose future is returned and is passed in to
    // addPostFrameCallback and completed when showDialog completes
    final completer = Completer<ReduxAction>();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final returnedProblem = await showDialog<Problem>(
          context: _navKey.currentState.overlay.context,
          builder: (context) => ProblemAlert(problem: problem));

      completer.complete(RemoveProblem(problem: returnedProblem));
    });

    // Ensure a frame is scheduled so the post frame callback definitely happens
    WidgetsBinding.instance.ensureVisualUpdate();

    return completer.future;
  }

  Future<bool> displayConfirmation(String question) async {
    // create a completer whose future is returned and is passed in to
    // addPostFrameCallback and completed when showDialog completes
    final completer = Completer<bool>();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final response = await showDialog<bool>(
          context: _navKey.currentState.overlay.context,
          builder: (context) => ConfirmationAlert(question: question));
      completer.complete(response);
    });

    // Ensure a frame is scheduled so the post frame callback definitely happens
    WidgetsBinding.instance.ensureVisualUpdate();

    return completer.future;
  }
}
