// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'quiz.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Quiz _$QuizFromJson(Map<String, dynamic> json) {
  return _Quiz.fromJson(json);
}

/// @nodoc
class _$QuizTearOff {
  const _$QuizTearOff();

  _Quiz call(
      {String? id,
      String selectedAnswer = '',
      required String category,
      required String type,
      required String difficulty,
      required String question,
      required String correct_answer,
      required List<String> incorrect_answers}) {
    return _Quiz(
      id: id,
      selectedAnswer: selectedAnswer,
      category: category,
      type: type,
      difficulty: difficulty,
      question: question,
      correct_answer: correct_answer,
      incorrect_answers: incorrect_answers,
    );
  }

  Quiz fromJson(Map<String, Object> json) {
    return Quiz.fromJson(json);
  }
}

/// @nodoc
const $Quiz = _$QuizTearOff();

/// @nodoc
mixin _$Quiz {
  String? get id => throw _privateConstructorUsedError;
  String get selectedAnswer => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get difficulty => throw _privateConstructorUsedError;
  String get question => throw _privateConstructorUsedError;
  String get correct_answer => throw _privateConstructorUsedError;
  List<String> get incorrect_answers => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuizCopyWith<Quiz> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizCopyWith<$Res> {
  factory $QuizCopyWith(Quiz value, $Res Function(Quiz) then) =
      _$QuizCopyWithImpl<$Res>;
  $Res call(
      {String? id,
      String selectedAnswer,
      String category,
      String type,
      String difficulty,
      String question,
      String correct_answer,
      List<String> incorrect_answers});
}

/// @nodoc
class _$QuizCopyWithImpl<$Res> implements $QuizCopyWith<$Res> {
  _$QuizCopyWithImpl(this._value, this._then);

  final Quiz _value;
  // ignore: unused_field
  final $Res Function(Quiz) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? selectedAnswer = freezed,
    Object? category = freezed,
    Object? type = freezed,
    Object? difficulty = freezed,
    Object? question = freezed,
    Object? correct_answer = freezed,
    Object? incorrect_answers = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedAnswer: selectedAnswer == freezed
          ? _value.selectedAnswer
          : selectedAnswer // ignore: cast_nullable_to_non_nullable
              as String,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      difficulty: difficulty == freezed
          ? _value.difficulty
          : difficulty // ignore: cast_nullable_to_non_nullable
              as String,
      question: question == freezed
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      correct_answer: correct_answer == freezed
          ? _value.correct_answer
          : correct_answer // ignore: cast_nullable_to_non_nullable
              as String,
      incorrect_answers: incorrect_answers == freezed
          ? _value.incorrect_answers
          : incorrect_answers // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
abstract class _$QuizCopyWith<$Res> implements $QuizCopyWith<$Res> {
  factory _$QuizCopyWith(_Quiz value, $Res Function(_Quiz) then) =
      __$QuizCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? id,
      String selectedAnswer,
      String category,
      String type,
      String difficulty,
      String question,
      String correct_answer,
      List<String> incorrect_answers});
}

/// @nodoc
class __$QuizCopyWithImpl<$Res> extends _$QuizCopyWithImpl<$Res>
    implements _$QuizCopyWith<$Res> {
  __$QuizCopyWithImpl(_Quiz _value, $Res Function(_Quiz) _then)
      : super(_value, (v) => _then(v as _Quiz));

  @override
  _Quiz get _value => super._value as _Quiz;

  @override
  $Res call({
    Object? id = freezed,
    Object? selectedAnswer = freezed,
    Object? category = freezed,
    Object? type = freezed,
    Object? difficulty = freezed,
    Object? question = freezed,
    Object? correct_answer = freezed,
    Object? incorrect_answers = freezed,
  }) {
    return _then(_Quiz(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedAnswer: selectedAnswer == freezed
          ? _value.selectedAnswer
          : selectedAnswer // ignore: cast_nullable_to_non_nullable
              as String,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      difficulty: difficulty == freezed
          ? _value.difficulty
          : difficulty // ignore: cast_nullable_to_non_nullable
              as String,
      question: question == freezed
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      correct_answer: correct_answer == freezed
          ? _value.correct_answer
          : correct_answer // ignore: cast_nullable_to_non_nullable
              as String,
      incorrect_answers: incorrect_answers == freezed
          ? _value.incorrect_answers
          : incorrect_answers // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Quiz implements _Quiz {
  const _$_Quiz(
      {this.id,
      this.selectedAnswer = '',
      required this.category,
      required this.type,
      required this.difficulty,
      required this.question,
      required this.correct_answer,
      required this.incorrect_answers});

  factory _$_Quiz.fromJson(Map<String, dynamic> json) =>
      _$_$_QuizFromJson(json);

  @override
  final String? id;
  @JsonKey(defaultValue: '')
  @override
  final String selectedAnswer;
  @override
  final String category;
  @override
  final String type;
  @override
  final String difficulty;
  @override
  final String question;
  @override
  final String correct_answer;
  @override
  final List<String> incorrect_answers;

  @override
  String toString() {
    return 'Quiz(id: $id, selectedAnswer: $selectedAnswer, category: $category, type: $type, difficulty: $difficulty, question: $question, correct_answer: $correct_answer, incorrect_answers: $incorrect_answers)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Quiz &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.selectedAnswer, selectedAnswer) ||
                const DeepCollectionEquality()
                    .equals(other.selectedAnswer, selectedAnswer)) &&
            (identical(other.category, category) ||
                const DeepCollectionEquality()
                    .equals(other.category, category)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.difficulty, difficulty) ||
                const DeepCollectionEquality()
                    .equals(other.difficulty, difficulty)) &&
            (identical(other.question, question) ||
                const DeepCollectionEquality()
                    .equals(other.question, question)) &&
            (identical(other.correct_answer, correct_answer) ||
                const DeepCollectionEquality()
                    .equals(other.correct_answer, correct_answer)) &&
            (identical(other.incorrect_answers, incorrect_answers) ||
                const DeepCollectionEquality()
                    .equals(other.incorrect_answers, incorrect_answers)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(selectedAnswer) ^
      const DeepCollectionEquality().hash(category) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(difficulty) ^
      const DeepCollectionEquality().hash(question) ^
      const DeepCollectionEquality().hash(correct_answer) ^
      const DeepCollectionEquality().hash(incorrect_answers);

  @JsonKey(ignore: true)
  @override
  _$QuizCopyWith<_Quiz> get copyWith =>
      __$QuizCopyWithImpl<_Quiz>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_QuizToJson(this);
  }
}

abstract class _Quiz implements Quiz {
  const factory _Quiz(
      {String? id,
      String selectedAnswer,
      required String category,
      required String type,
      required String difficulty,
      required String question,
      required String correct_answer,
      required List<String> incorrect_answers}) = _$_Quiz;

  factory _Quiz.fromJson(Map<String, dynamic> json) = _$_Quiz.fromJson;

  @override
  String? get id => throw _privateConstructorUsedError;
  @override
  String get selectedAnswer => throw _privateConstructorUsedError;
  @override
  String get category => throw _privateConstructorUsedError;
  @override
  String get type => throw _privateConstructorUsedError;
  @override
  String get difficulty => throw _privateConstructorUsedError;
  @override
  String get question => throw _privateConstructorUsedError;
  @override
  String get correct_answer => throw _privateConstructorUsedError;
  @override
  List<String> get incorrect_answers => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$QuizCopyWith<_Quiz> get copyWith => throw _privateConstructorUsedError;
}
