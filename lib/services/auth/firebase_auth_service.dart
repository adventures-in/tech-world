import 'dart:async';

import 'package:adventures_in_tech_world/actions/redux_action.dart';
import 'package:adventures_in_tech_world/extensions/firebase_auth_extensions.dart';
import 'package:adventures_in_tech_world/extensions/firebase_user_extensions.dart';
import 'package:adventures_in_tech_world/extensions/google_sign_in_extensions.dart';
import 'package:adventures_in_tech_world/extensions/sign_in_with_apple_extensions.dart';
import 'package:adventures_in_tech_world/models/auth/apple_id_credential.dart';
import 'package:adventures_in_tech_world/models/auth/auth_user_data.dart';
import 'package:adventures_in_tech_world/models/auth/google_sign_in_credential.dart';
import 'package:adventures_in_tech_world/services/auth/auth_service.dart';
import 'package:adventures_in_tech_world/utils/problems_utils.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meta/meta.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class FirebaseAuthService implements AuthService {
  final auth.FirebaseAuth _firebaseAuth;

  /// [StreamController] for adding auth state actions
  final StreamController<ReduxAction> _storeStreamController;

  /// The [Stream] is used just once on app load, to
  /// connect the [Database] to the redux [Store]
  @override
  Stream<ReduxAction> get storeStream => _storeStreamController.stream;

  /// We keep a subscription to the firebase auth state stream so we can
  /// disconnect at a later time.
  StreamSubscription<auth.User> _firebaseAuthStateSubscription;

  FirebaseAuthService(auth.FirebaseAuth firebaseAuth,
      StreamController<ReduxAction> _storeStreamController)
      : _firebaseAuth = firebaseAuth,
        _storeStreamController = _storeStreamController;

  @override
  void connectAuthStateToStore() {
    // create a function to be called on finding an error
    final handleProblem = generateProblemHandler(_storeStreamController.add,
        'FirebaseAuthService -> connectAuthStateToStore');

    try {
      // connect the firebase auth state to the store and keep the subscription
      _firebaseAuthStateSubscription?.cancel();
      _firebaseAuthStateSubscription =
          _firebaseAuth.connectAuthStateToStore(_storeStreamController);
    } catch (error, trace) {
      handleProblem(error, trace);
    }
  }

  @override
  Future<String> getCurrentUserId() async {
    final user = await _firebaseAuth.currentUser;
    return user.uid;
  }

  @override
  void disconnectAuthState() {
    _firebaseAuthStateSubscription?.cancel();
  }

  // The sign in updates the app state as the services have been plumbed so
  // the stream of auth state is connected to the store.
  @override
  Future<AuthUserData> signInAnonymously() async {
    final authResult = await _firebaseAuth.signInAnonymously();
    return authResult.user.toData();
  }

  // We don't do anything with the result as we are connected to the auth state
  @override
  Future<AuthUserData> linkGithub(String token) async {
    final credential = auth.GithubAuthProvider.credential(token);
    final firebaseUser = await _firebaseAuth.currentUser;
    final authResult = await firebaseUser.linkWithCredential(credential);
    return authResult.user.toData();
  }

  // We don't do anything with the result as we are connected to the auth state
  @override
  Future<AuthUserData> signInWithGithub(String token) async {
    final credential = auth.GithubAuthProvider.credential(token);
    final authResult = await _firebaseAuth.signInWithCredential(credential);
    return authResult.user.toData();
  }

  @override
  Future<GoogleSignInCredential> getGoogleCredential() async {
    final _googleSignIn = GoogleSignIn(scopes: ['email']);

    final googleSignInAccount = await _googleSignIn.signIn();
    final googleSignInAuthentication = await googleSignInAccount.authentication;

    return googleSignInAuthentication.toBuiltValue();
  }

  @override
  Future<AuthUserData> signInWithGoogle(
      {@required GoogleSignInCredential credential}) async {
    final AuthCredential authCredential = GoogleAuthProvider.credential(
      accessToken: credential.accessToken,
      idToken: credential.idToken,
    );

    final userCredential =
        await FirebaseAuth.instance.signInWithCredential(authCredential);
    final user = userCredential.user;
    return user.toData();
  }

  @override
  Future<String> getTokenFromGoogle() async {
    final _googleSignIn = GoogleSignIn(
      scopes: ['email', 'https://www.googleapis.com/auth/drive.file'],
    );

    final googleSignInAccount = await _googleSignIn.signIn();

    final googleSignInAuthentication = await googleSignInAccount.authentication;

    return googleSignInAuthentication.accessToken;
  }

  @override
  Future<AuthUserData> linkGoogle(
      {@required GoogleSignInCredential credential}) async {
    final AuthCredential authCredential = GoogleAuthProvider.credential(
      accessToken: credential.accessToken,
      idToken: credential.idToken,
    );

    final userCredential = await FirebaseAuth.instance.currentUser
        .linkWithCredential(authCredential);
    final user = userCredential.user;
    return user.toData();
  }

  @override
  Future<AppleIdCredential> getAppleCredential() async {
    final appleIdCredential =
        await SignInWithApple.getAppleIDCredential(scopes: [
      AppleIDAuthorizationScopes.email,
      AppleIDAuthorizationScopes.fullName,
    ]);

    return appleIdCredential.toBuiltValue();
  }

  @override
  Future<AuthUserData> signInWithApple(
      {@required AppleIdCredential credential}) async {
    // convert to OAuthCredential
    final oAuthCredential = OAuthProvider('apple.com').credential(
      idToken: credential.identityToken,
      accessToken: credential.authorizationCode,
    );

    // use the credential to sign in to firebase
    final userCredential =
        await FirebaseAuth.instance.signInWithCredential(oAuthCredential);
    final user = userCredential.user;
    return user.toData();
  }

  /// The stream of auth state is connected to the store so the app state will
  /// be automatically updated
  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
