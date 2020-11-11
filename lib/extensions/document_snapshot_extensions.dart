import 'package:adventures_in_tech_world/models/adventurers/adventurer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

extension ConvertDocumentSnapshot on DocumentSnapshot {
  Adventurer toAdventurer() => Adventurer(
      id: id,
      displayName: data()['displayName'] as String,
      photoURL: data()['photoURL'] as String ??
          'https://www.gravatar.com/avatar/00000000000000000000000000000000?d=mp&f=y',
      firstName: data()['firstName'] as String ?? '_',
      lastName: data()['lastName'] as String ?? '_',
      gitHubToken: data()['gitHubToken'] as String,
      googleToken: data()['googleToken'] as String,
      asanaToken: data()['asanaToken'] as String);
}
