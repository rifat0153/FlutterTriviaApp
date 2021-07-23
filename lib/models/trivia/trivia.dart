import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'trivia.freezed.dart';
part 'trivia.g.dart';

@freezed
class Trivia with _$Trivia {
  const factory Trivia({
    String? id,
    required String text,
  }) = _Trivia;

  factory Trivia.fromJson(Map<String, dynamic> json) => _$TriviaFromJson(json);
}
