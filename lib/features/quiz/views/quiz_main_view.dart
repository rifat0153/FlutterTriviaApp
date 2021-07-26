import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia/features/quiz/controllers/quiz_list_controller.dart';
import 'package:trivia/features/quiz/controllers/quiz_main_controller.dart';

class QuizMainView extends ConsumerWidget {
  const QuizMainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    QuizMainController quizMainController = watch(quizMainControllerProvider);
    final quizListController = watch(quizListControllerProvider);

    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () {
            context.read(quizListControllerProvider.notifier).retrieveQuizList();
          },
          child: quizListController.when(
              data: (data) => Text(data.length.toString()),
              loading: () => const CircularProgressIndicator(),
              error: (e, s) => Text(e.toString())),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await context.read(quizListControllerProvider.notifier).retrieveQuizList();
        },
        child: Icon(Icons.get_app),
      ),
    );
  }
}
