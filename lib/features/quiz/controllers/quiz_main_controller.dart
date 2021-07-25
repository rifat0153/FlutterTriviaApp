import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final quizMainControllerProvider = Provider<QuizMainController>((ref) {
  return QuizMainController(ref.read);
});

class QuizMainController extends ChangeNotifier {
  QuizMainController(this._read);

  final Reader _read;

  String _currentQuizCategory = '';

  String getCurrentQuizCategory() => _currentQuizCategory;

  void setCurrentQuizCategory(String category) {
    _currentQuizCategory = category;
  }
}
