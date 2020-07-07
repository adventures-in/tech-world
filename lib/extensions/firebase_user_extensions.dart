import 'package:adventures_in_tech_world/models/adventurers/adventurer.dart';
import 'package:adventures_in_tech_world/models/adventurers/anonymous.dart';
import 'package:firebase_auth/firebase_auth.dart';

extension FirebaseUserExt on FirebaseUser {
  Adventurer toAdventurer() =>
      Adventurer(id: uid, displayName: displayName, photoURL: photoUrl);
  Anonymous toAnonymous() => Anonymous(id: uid);
}
