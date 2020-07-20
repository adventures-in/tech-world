import 'dart:async';

import 'package:adventures_in_tech_world/actions/redux_action.dart';
import 'package:adventures_in_tech_world/enums/problem_location.dart';
import 'package:adventures_in_tech_world/models/auth/user_data.dart';
import 'package:adventures_in_tech_world/services/auth/auth_service.dart';
import 'package:adventures_in_tech_world/utils/problems_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:adventures_in_tech_world/extensions/firebase_auth_extensions.dart';
import 'package:adventures_in_tech_world/extensions/firebase_user_extensions.dart';

class FirebaseAuthService implements AuthService {
  final FirebaseAuth _firebaseAuth;

  /// [StreamController] for adding auth state actions
  final _storeStreamController = StreamController<ReduxAction>();

  /// The [Stream] is used just once on app load, to
  /// connect the [Database] to the redux [Store]
  @override
  Stream<ReduxAction> get storeStream => _storeStreamController.stream;

  /// We keep a subscription to the firebase auth state stream so we can
  /// disconnect at a later time.
  StreamSubscription<FirebaseUser> _firebaseAuthStateSubscription;

  FirebaseAuthService(FirebaseAuth firebaseAuth) : _firebaseAuth = firebaseAuth;

  @override
  void connectAuthStateToStore() {
    // create a function to be called on finding an error
    final handleProblem = generateProblemHandler(
        ProblemLocation.authServiceConnectFirebase, _storeStreamController.add);

    try {
      // connect the firebase auth state to the store and keep the subscription
      _firebaseAuthStateSubscription =
          _firebaseAuth.connectAuthStateToStore(_storeStreamController);
    } catch (error, trace) {
      handleProblem(error, trace);
    }
  }

  @override
  Future<String> getCurrentUserId() async {
    final user = await _firebaseAuth.currentUser();
    return user.uid;
  }

  @override
  void disconnectAuthState() {
    _firebaseAuthStateSubscription?.cancel();
  }

  // The sign in updates the app state as the services have been plumbed so
  // the stream of auth state is connected to the store.
  @override
  Future<UserData> signInAnonymously() async {
    final authResult = await _firebaseAuth.signInAnonymously();
    return authResult.user.toData();
  }

  // We don't do anything with the result as we are connected to the auth state
  @override
  Future<UserData> linkGithub(String token) async {
    final credential = GithubAuthProvider.getCredential(token: token);
    final firebaseUser = await _firebaseAuth.currentUser();
    final authResult = await firebaseUser.linkWithCredential(credential);
    return authResult.user.toData();
  }

  // We don't do anything with the result as we are connected to the auth state
  @override
  Future<UserData> signInWithGithub(String token) async {
    final credential = GithubAuthProvider.getCredential(token: token);
    final authResult = await _firebaseAuth.signInWithCredential(credential);
    return authResult.user.toData();
  }

  /// The stream of auth state is connected to the store so the app state will
  /// be automatically updated
  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
