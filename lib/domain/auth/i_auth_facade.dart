import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:notes_firebase_ddd/domain/auth/auth_failure.dart';
import 'package:notes_firebase_ddd/domain/auth/users.dart';
import 'package:notes_firebase_ddd/domain/auth/value_objects.dart';

abstract class IAuthFacade {
  // Unit is a tuple which just a regular class (void)
  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword({
    @required EmailAddress emailAddress,
    @required Password password,
  });

  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword({
    @required EmailAddress emailAddress,
    @required Password password,
  });

  Future<Either<AuthFailure, Unit>> signInWithGoogle();

  Future<Option<Users>> getSignedInUser();

  Future<void> signOut();
}
