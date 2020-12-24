import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:notes_firebase_ddd/domain/core/value_objects.dart';

part 'users.freezed.dart';

@freezed
abstract class Users with _$Users {
  const factory Users({
    @required UniqueId id,
  }) = _Users;
}
