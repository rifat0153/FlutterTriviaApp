import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia/features/trivia/trivia_controller.dart';
import 'package:trivia/shared/theme_switch.dart';

class TriviaView extends ConsumerWidget {
  const TriviaView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final trivia = ref.watch(triviaControllerProvider);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Trivia'),
          actions: [const ThemeSwitch()],
        ),
        body: trivia.when(
          data: (data) => Center(
            child: Text(data.text),
          ),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (e, s) => const Text('Something Went Wrong'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            ref.read(triviaControllerProvider.notifier).retriveTrivia();
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
