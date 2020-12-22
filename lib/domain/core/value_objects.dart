import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:notes_firebase_ddd/domain/core/errors.dart';
import 'package:notes_firebase_ddd/domain/core/failures.dart';

@immutable
abstract class ValueObject<T> {
  const ValueObject();
  Either<ValueFailure<T>, T> get value;

  // Throws [UnExpectedValueError] container the [ValueFailure]
  T getOrCrash() {
    // id = identity - same as writing (right) => right
    return value.fold((fail) => throw UnExpectedValueError(fail), id);
  }

  bool isValid() => value.isRight();

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is ValueObject<T> && o.value == value;
  }

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => 'Value($value)';
}
