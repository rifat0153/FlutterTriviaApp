// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Quiz _$_$_QuizFromJson(Map<String, dynamic> json) {
  return _$_Quiz(
    id: json['id'] as String?,
    selectedAnswer: json['selectedAnswer'] as String? ?? '',
    category: json['category'] as String,
    type: json['type'] as String,
    difficulty: json['difficulty'] as String,
    question: json['question'] as String,
    correct_answer: json['correct_answer'] as String,
    incorrect_answers: (json['incorrect_answers'] as List<dynamic>)
        .map((e) => e as String)
        .toList(),
  );
}

Map<String, dynamic> _$_$_QuizToJson(_$_Quiz instance) => <String, dynamic>{
      'id': instance.id,
      'selectedAnswer': instance.selectedAnswer,
      'category': instance.category,
      'type': instance.type,
      'difficulty': instance.difficulty,
      'question': instance.question,
      'correct_answer': instance.correct_answer,
      'incorrect_answers': instance.incorrect_answers,
    };
