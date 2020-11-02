import 'package:firebase_core/firebase_core.dart';

/// Wraps the [Firebase] static function so we can optionally inject a mock in
/// the [CrowdLeagueApp] widget.
class FirebaseWrapper {
  Future<FirebaseApp> init() => Firebase.initializeApp();
}
