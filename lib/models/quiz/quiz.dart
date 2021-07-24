import 'package:meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'quiz.freezed.dart';
part 'quiz.g.dart';

Quiz quizFromJson(String str) => Quiz.fromJson(json.decode(str) as Map<String, dynamic>);

String quizToJson(Quiz data) => json.encode(data.toJson());

@freezed
abstract class Quiz with _$Quiz {
  const factory Quiz({
    required String category,
    required String type,
    required String difficulty,
    required String question,
    required String correctAnswer,
    required List<String> incorrectAnswers,
  }) = _Quiz;

  factory Quiz.fromJson(Map<String, dynamic> json) => _$QuizFromJson(json);
}



