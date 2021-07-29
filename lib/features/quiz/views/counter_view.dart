import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia/features/quiz/controllers/quiz_main_controller.dart';

class CounterView extends ConsumerWidget {
  const CounterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizMainController = ref.watch(quizMainControllerProvider);

    return Container(
      child: Center(
        child: Text(quizMainController.currentQuestionIndex.toString()),
      ),
    );
  }
}
