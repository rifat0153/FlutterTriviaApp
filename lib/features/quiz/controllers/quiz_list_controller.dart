import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia/features/quiz/controllers/quiz_main_controller.dart';
import 'package:trivia/features/quiz/services/quiz_service.dart';
import 'package:trivia/models/quiz/quiz.dart';

final quizListControllerProvider =
    StateNotifierProvider.autoDispose<QuizListController, AsyncValue<List<Quiz>>>((ref) {
  return QuizListController(ref.read);
});

class QuizListController extends StateNotifier<AsyncValue<List<Quiz>>> {
  QuizListController(this._read) : super(const AsyncValue.loading());

  Reader _read;

  Future<void> retrieveQuizList() async {
    state = const AsyncValue.loading();

    var difficulty = _read(quizMainControllerProvider).getCurrentQuizDifficulty();

    try {
      var res = await _read(quizServiceProvider).fetchQuizList();

      state = AsyncValue.data(res);
    } catch (e) {
      state = AsyncValue.error(e);
    }
  }
}
