import 'package:firebase_auth/firebase_auth.dart';
import 'package:notes_firebase_ddd/domain/auth/auth_user.dart';
import 'package:notes_firebase_ddd/domain/core/value_objects.dart';

extension FirebaseUserDomainX on User {
  AuthUser toDomain() {
    return AuthUser(
      id: UniqueId.formUniqueString(uid),
    );
  }
}
