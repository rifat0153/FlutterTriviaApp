import 'package:freezed_annotation/freezed_annotation.dart';

part 'quiz.freezed.dart';
part 'quiz.g.dart';

@freezed
class Quiz with _$Quiz {
  const factory Quiz({
    String? id,
    @Default('') String selectedAnswer,
    required String category,
    required String type,
    required String difficulty,
    required String question,
    required String correct_answer,
    required List<String> incorrect_answers,
  }) = _Quiz;

  factory Quiz.fromJson(Map<String, dynamic> json) => _$QuizFromJson(json);
}
