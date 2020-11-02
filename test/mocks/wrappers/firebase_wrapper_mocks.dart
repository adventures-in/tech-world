import 'dart:async';

import 'package:adventures_in_tech_world/utils/wrappers/firebase_wrapper.dart';
import 'package:firebase_core/firebase_core.dart';

class FakeFirebaseWrapper implements FirebaseWrapper {
  final Completer<FirebaseApp> _completer;

  FakeFirebaseWrapper({Completer<FirebaseApp> completer})
      : _completer = completer ?? Completer<FirebaseApp>();

  /// Returns a [Future] that completes when the supplied [Completer] says so
  @override
  Future<FirebaseApp> init() {
    return _completer.future;
  }
}
