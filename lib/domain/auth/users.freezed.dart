// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'users.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$UsersTearOff {
  const _$UsersTearOff();

// ignore: unused_element
  _Users call({@required UniqueId id}) {
    return _Users(
      id: id,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $Users = _$UsersTearOff();

/// @nodoc
mixin _$Users {
  UniqueId get id;

  $UsersCopyWith<Users> get copyWith;
}

/// @nodoc
abstract class $UsersCopyWith<$Res> {
  factory $UsersCopyWith(Users value, $Res Function(Users) then) =
      _$UsersCopyWithImpl<$Res>;
  $Res call({UniqueId id});
}

/// @nodoc
class _$UsersCopyWithImpl<$Res> implements $UsersCopyWith<$Res> {
  _$UsersCopyWithImpl(this._value, this._then);

  final Users _value;
  // ignore: unused_field
  final $Res Function(Users) _then;

  @override
  $Res call({
    Object id = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as UniqueId,
    ));
  }
}

/// @nodoc
abstract class _$UsersCopyWith<$Res> implements $UsersCopyWith<$Res> {
  factory _$UsersCopyWith(_Users value, $Res Function(_Users) then) =
      __$UsersCopyWithImpl<$Res>;
  @override
  $Res call({UniqueId id});
}

/// @nodoc
class __$UsersCopyWithImpl<$Res> extends _$UsersCopyWithImpl<$Res>
    implements _$UsersCopyWith<$Res> {
  __$UsersCopyWithImpl(_Users _value, $Res Function(_Users) _then)
      : super(_value, (v) => _then(v as _Users));

  @override
  _Users get _value => super._value as _Users;

  @override
  $Res call({
    Object id = freezed,
  }) {
    return _then(_Users(
      id: id == freezed ? _value.id : id as UniqueId,
    ));
  }
}

/// @nodoc
class _$_Users implements _Users {
  const _$_Users({@required this.id}) : assert(id != null);

  @override
  final UniqueId id;

  @override
  String toString() {
    return 'Users(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Users &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(id);

  @override
  _$UsersCopyWith<_Users> get copyWith =>
      __$UsersCopyWithImpl<_Users>(this, _$identity);
}

abstract class _Users implements Users {
  const factory _Users({@required UniqueId id}) = _$_Users;

  @override
  UniqueId get id;
  @override
  _$UsersCopyWith<_Users> get copyWith;
}
