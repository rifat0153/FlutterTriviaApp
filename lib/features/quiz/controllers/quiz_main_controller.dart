import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia/features/quiz/services/quiz_service.dart';

final quizMainControllerProvider = ChangeNotifierProvider<QuizMainController>((ref) {
  return QuizMainController(ref.read);
});

class QuizMainController extends ChangeNotifier {
  QuizMainController(this._read);

  final Reader _read;

  bool gameStarted = false;

  int currentQuestionIndex = 0;
  int totalQuestions = 0;
  int correctAnswers = 0;
  int incorrectAnswers = 0;
  int score = 0;

  String _currentQuizCategory = '';

  String _difficulty = 'easy';

  // methods
  void calculateScore() {
    score = totalQuestions - incorrectAnswers;
    notifyListeners();
  }

// getters and setters
  int getCurrentQuestionIndex() => currentQuestionIndex;
  void setCurrentQuestionIndex(int value) {
    currentQuestionIndex = value;
    notifyListeners();
    print(currentQuestionIndex);
  }

  bool getGameStarted() => gameStarted;
  set gameStated(bool value) {
    gameStarted = value;
    notifyListeners();
  }

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
