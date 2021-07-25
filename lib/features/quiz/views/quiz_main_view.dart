import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia/features/quiz/controllers/quiz_main_controller.dart';

class QuizMainView extends ConsumerWidget {
  const QuizMainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    QuizMainController quizMainController = watch(quizMainControllerProvider);

    return Container(
      child: Text(quizMainController.getCurrentQuizCategory()),
    );
  }
}
