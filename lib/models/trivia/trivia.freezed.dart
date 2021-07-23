// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'trivia.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Trivia _$TriviaFromJson(Map<String, dynamic> json) {
  return _Trivia.fromJson(json);
}

/// @nodoc
class _$TriviaTearOff {
  const _$TriviaTearOff();

  _Trivia call({String? id, required String text}) {
    return _Trivia(
      id: id,
      text: text,
    );
  }

  Trivia fromJson(Map<String, Object> json) {
    return Trivia.fromJson(json);
  }
}

/// @nodoc
const $Trivia = _$TriviaTearOff();

/// @nodoc
mixin _$Trivia {
  String? get id => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TriviaCopyWith<Trivia> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TriviaCopyWith<$Res> {
  factory $TriviaCopyWith(Trivia value, $Res Function(Trivia) then) =
      _$TriviaCopyWithImpl<$Res>;
  $Res call({String? id, String text});
}

/// @nodoc
class _$TriviaCopyWithImpl<$Res> implements $TriviaCopyWith<$Res> {
  _$TriviaCopyWithImpl(this._value, this._then);

  final Trivia _value;
  // ignore: unused_field
  final $Res Function(Trivia) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? text = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$TriviaCopyWith<$Res> implements $TriviaCopyWith<$Res> {
  factory _$TriviaCopyWith(_Trivia value, $Res Function(_Trivia) then) =
      __$TriviaCopyWithImpl<$Res>;
  @override
  $Res call({String? id, String text});
}

/// @nodoc
class __$TriviaCopyWithImpl<$Res> extends _$TriviaCopyWithImpl<$Res>
    implements _$TriviaCopyWith<$Res> {
  __$TriviaCopyWithImpl(_Trivia _value, $Res Function(_Trivia) _then)
      : super(_value, (v) => _then(v as _Trivia));

  @override
  _Trivia get _value => super._value as _Trivia;

  @override
  $Res call({
    Object? id = freezed,
    Object? text = freezed,
  }) {
    return _then(_Trivia(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Trivia implements _Trivia {
  const _$_Trivia({this.id, required this.text});

  factory _$_Trivia.fromJson(Map<String, dynamic> json) =>
      _$_$_TriviaFromJson(json);

  @override
  final String? id;
  @override
  final String text;

  @override
  String toString() {
    return 'Trivia(id: $id, text: $text)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Trivia &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.text, text) ||
                const DeepCollectionEquality().equals(other.text, text)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(text);

  @JsonKey(ignore: true)
  @override
  _$TriviaCopyWith<_Trivia> get copyWith =>
      __$TriviaCopyWithImpl<_Trivia>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_TriviaToJson(this);
  }
}

abstract class _Trivia implements Trivia {
  const factory _Trivia({String? id, required String text}) = _$_Trivia;

  factory _Trivia.fromJson(Map<String, dynamic> json) = _$_Trivia.fromJson;

  @override
  String? get id => throw _privateConstructorUsedError;
  @override
  String get text => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$TriviaCopyWith<_Trivia> get copyWith => throw _privateConstructorUsedError;
}
