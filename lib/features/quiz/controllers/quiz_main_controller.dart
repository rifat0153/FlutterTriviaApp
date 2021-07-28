import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia/features/quiz/controllers/quiz_list_controller.dart';
import 'package:trivia/features/quiz/services/quiz_service.dart';
import 'package:trivia/models/quiz/quiz.dart';

final quizMainControllerProvider = ChangeNotifierProvider<QuizMainController>((ref) {
  return QuizMainController(ref.read);
});

class QuizMainController extends ChangeNotifier {
  QuizMainController(this._read);

  final Reader _read;

  bool gameEnds = false;

  List<String> options = [];
  Map<String, bool> chekcedMap = {};

  Quiz? currentQuiz;

  Quiz? getCurrentQuiz() => currentQuiz;
  void setCurrentQuiz(Quiz quiz) {
    currentQuiz = quiz;
    notifyListeners();
  }

  String currentSelectedAnswer = '';
  int currentQuestionIndex = 0;
  int totalQuestions = 2;
  int correctAnswers = 0;
  int incorrectAnswers = 0;
  int score = 0;

  String _currentQuizCategory = '';

  String _difficulty = 'easy';

  // methods
  void reset() {
    options = [];
    chekcedMap = {};
    gameEnds = false;
    correctAnswers = incorrectAnswers = score = currentQuestionIndex = 0;
    currentSelectedAnswer = '';
    notifyListeners();
  }

  void uncheckOtherOptions(String selectedKey) {
    for (var key in chekcedMap.keys) {
      if (key != selectedKey) {
        chekcedMap[key] = false;
      }
    }
    notifyListeners();
  }

  void buildOptions() {
    options = [];

    final asyncQuizList = _read(quizListControllerProvider);
    List<Quiz> quizList = asyncQuizList.maybeWhen(data: (quizList) => quizList, orElse: () => []);

    var quiz = quizList[currentQuestionIndex];

    options.add(quiz.correct_answer);
    for (var item in quiz.incorrect_answers) {
      options.add(item);
    }
    options.shuffle();

    for (var option in options) {
      chekcedMap[option] = false;
    }

    // notifyListeners();
  }

  void calculateScore() {
    score = totalQuestions - incorrectAnswers;
    notifyListeners();
  }

  void nextQuestion() {
    if (totalQuestions == currentQuestionIndex) {
      if (!gameEnds) {
        evaluateResults(currentQuestionIndex);
      }
      gameEnds = true;
      notifyListeners();
      return;
    }

    evaluateResults(currentQuestionIndex);
    currentQuestionIndex++;
    buildOptions();
    notifyListeners();
  }

  void evaluateResults(int currentQuestionIndex) {
    final asyncQuizList = _read(quizListControllerProvider);
    List<Quiz> quizList = asyncQuizList.maybeWhen(data: (quizList) => quizList, orElse: () => []);

    if (quizList[currentQuestionIndex].correct_answer == currentSelectedAnswer) {
      correctAnswers++;
      score = correctAnswers;
      print('correct');
    } else {
      incorrectAnswers++;
      score = correctAnswers;
      print('incorrect');
    }
    notifyListeners();
  }

// getters and setters
  String getCurrentSelectedAnswer() => currentSelectedAnswer;
  void setCurrentSelectedAnswer(String newValue) {
    currentSelectedAnswer = newValue;
    print(currentSelectedAnswer);
    // evaluateResults(currentQuestionIndex);
  }

  int getCurrentQuestionIndex() => currentQuestionIndex;

  bool getGameEnds() => gameEnds;
  void setGameEnds(bool value) {
    gameEnds = value;
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
