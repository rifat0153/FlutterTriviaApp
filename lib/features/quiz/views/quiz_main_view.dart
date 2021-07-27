import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia/features/quiz/controllers/quiz_list_controller.dart';
import 'package:trivia/features/quiz/controllers/quiz_main_controller.dart';
import 'package:trivia/models/quiz/quiz.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuizMainView extends ConsumerWidget {
  const QuizMainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    QuizMainController quizMainController = watch(quizMainControllerProvider);
    final quizListController = watch(quizListControllerProvider);

    return Scaffold(
      body: SafeArea(
        child: quizListController.when(
            data: (data) => _GameView(quizList: data),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, s) => Text(e.toString())),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await context.read(quizListControllerProvider.notifier).retrieveQuizList();
          context.read(quizListControllerProvider.notifier).index;
        },
        child: const Icon(Icons.get_app),
      ),
    );
  }
}

class _GameView extends ConsumerWidget {
  _GameView({Key? key, required this.quizList}) : super(key: key);

  final List<Quiz> quizList;

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final size = MediaQuery.of(context).size;
    final quizMainController = watch(quizMainControllerProvider);

    return Container(
      height: size.height,
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.blueGrey, Colors.blueAccent],
          stops: [0.3, 1],
        ),
      ),
      child: Column(
        children: [
          Text(
            '${quizList[quizMainController.currentQuestionIndex].category} Quiz',
            style: _boldTextStyle(),
          ),
          SizedBox(
            height: 50.h,
          ),
          Text(
            quizList[quizMainController.currentQuestionIndex].question,
            textAlign: TextAlign.center,
            style: _boldTextStyle().copyWith().copyWith(color: Colors.white70, fontWeight: FontWeight.w700),
          ),
          ..._buildOptions(context, quizList[quizMainController.currentQuestionIndex]),
        ],
      ),
    );
  }

  List<Widget> _buildOptions(BuildContext context, Quiz quiz) {
    List<String> options = [];
    List<Widget> widgetList = [];

    options.add(quiz.correct_answer);
    for (var item in quiz.incorrect_answers) {
      options.add(item);
    }

    for (var option in options) {
      widgetList.add(CheckboxListTile(
        value: false,
        onChanged: (value) {},
        title: Text(option),
      ));
    }

    return widgetList;
  }

  TextStyle _boldTextStyle() {
    return TextStyle(
      color: Colors.white,
      fontSize: 20.sp,
      fontWeight: FontWeight.w400,
    );
  }
}
