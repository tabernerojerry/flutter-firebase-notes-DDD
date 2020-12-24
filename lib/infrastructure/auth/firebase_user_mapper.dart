import 'package:firebase_auth/firebase_auth.dart';
import 'package:notes_firebase_ddd/domain/auth/users.dart';
import 'package:notes_firebase_ddd/domain/core/value_objects.dart';

extension FirebaseUserDomainX on User {
  Users toDomain() {
    return Users(
      id: UniqueId.formUniqueString(uid),
    );
  }
}
