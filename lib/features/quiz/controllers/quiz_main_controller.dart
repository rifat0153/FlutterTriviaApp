import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia/features/quiz/services/quiz_service.dart';

final quizMainControllerProvider = Provider<QuizMainController>((ref) {
  return QuizMainController(ref.read);
});

class QuizMainController extends ChangeNotifier {
  QuizMainController(this._read);

  final Reader _read;

  String _currentQuizCategory = '';
  String _difficulty = 'easy';

  // getters and setters
  String getCurrentQuizCategory() => _currentQuizCategory;
  void setCurrentQuizCategory(String category) {
    _currentQuizCategory = category;
    notifyListeners();
  }

  String getCurrentQuizDifficulty() => _difficulty;
  void setCurrentQuizDifficulty(String difficulty) {
    _difficulty = difficulty;
    notifyListeners();
  }
}
