import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia/features/quiz/controllers/quiz_list_controller.dart';
import 'package:trivia/features/quiz/controllers/quiz_main_controller.dart';
import 'package:trivia/features/quiz/views/counter_view.dart';
import 'package:trivia/models/quiz/quiz.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuizMainView extends ConsumerWidget {
  const QuizMainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
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
          // context.read(quizListControllerProvider.notifier).index;
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
    QuizMainController quizMainController = watch(quizMainControllerProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          '${quizList[quizMainController.currentQuestionIndex].category} Quiz',
          style: _boldTextStyle(),
        ),
      ),
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: Container(
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
            SizedBox(
              height: 100.h,
            ),
            Text(
              quizList[quizMainController.currentQuestionIndex].question,
              textAlign: TextAlign.center,
              style: _boldTextStyle().copyWith().copyWith(color: Colors.white70, fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 50.h,
            ),
            QuizOptions(quiz: quizList[quizMainController.currentQuestionIndex]),
            Text(quizMainController.currentQuestionIndex.toString()),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) => const CounterView()));
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.power_rounded),
                      Text(
                        'Quiz Quiz',
                        style: _boldTextStyle(),
                      ),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () {
                    context.read(quizMainControllerProvider).setCurrentQuestionIndex(
                        context.read(quizMainControllerProvider).currentQuestionIndex + 1);
                  },
                  style: TextButton.styleFrom(
                      backgroundColor: const Color(0xff06D0F3),
                      padding: EdgeInsets.all(
                        16.sp,
                      )),
                  child: const Text('Next Quiz'),
                ),
              ],
            ),
            SizedBox(
              height: 100.h,
            ),
          ],
        ),
      ),
    );
  }

  TextStyle _boldTextStyle() {
    return TextStyle(
      color: Colors.white,
      fontSize: 20.sp,
      fontWeight: FontWeight.w400,
    );
  }
}

class QuizOptions extends StatefulWidget {
  QuizOptions({Key? key, required this.quiz}) : super(key: key);

  Quiz quiz;

  @override
  _QuizOptionsState createState() => _QuizOptionsState();
}

class _QuizOptionsState extends State<QuizOptions> {
  List<String> options = [];
  Map<String, bool> chekcedMap = {};

  @override
  void initState() {
    super.initState();
    _buildOptions(context, widget.quiz);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: options.length,
          itemBuilder: (_, index) {
            return CheckboxListTile(
              key: ValueKey(options[index]),
              value: chekcedMap[options[index]],
              onChanged: (value) {
                chekcedMap[options[index]] = !chekcedMap[options[index]]!;
                uncheckOtherOptions(options[index]);
                setState(() {});
              },
              title: Text(options[index]),
            );
          }),
    );
  }

  void uncheckOtherOptions(String selectedKey) {
    for (var key in chekcedMap.keys) {
      if (key != selectedKey) {
        chekcedMap[key] = false;
      }
    }
  }

  void _buildOptions(BuildContext context, Quiz quiz) {
    options.add(quiz.correct_answer);
    for (var item in quiz.incorrect_answers) {
      options.add(item);
    }
    options.shuffle();

    for (var option in options) {
      chekcedMap[option] = false;
    }
  }
}
