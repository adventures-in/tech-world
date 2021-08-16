import 'package:adventures_in_tech_world/models/adventurers/adventurer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

extension ConvertDocumentSnapshot on DocumentSnapshot {
  Adventurer toAdventurer() => Adventurer(
      id: id,
      displayName: ['displayName'] as String,
      photoURL: ['photoURL'] as String ??
          'https://www.gravatar.com/avatar/00000000000000000000000000000000?d=mp&f=y',
      firstName: ['firstName'] as String ?? '_',
      lastName: ['lastName'] as String ?? '_',
      gitHubToken: ['gitHubToken'] as String,
      googleToken: ['googleToken'] as String,
      asanaToken: ['asanaToken'] as String);
}
