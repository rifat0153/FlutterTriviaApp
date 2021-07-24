import 'package:flutter/material.dart';
import 'package:trivia/features/quiz/config.dart';
import 'package:trivia/shared/theme_switch.dart';

class QuizView extends StatelessWidget {
  const QuizView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Quizera'),
          actions: [const ThemeSwitch()],
        ),
        body: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 4,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: QuizConfig.profileContainerRadius,
                  bottomRight: QuizConfig.profileContainerRadius,
                ),
                color: QuizConfig.userProfileColor,
              ),
              child: Column(
                children: [
                  const SizedBox(height: kPadding),
                  Row(
                    children: [
                      const SizedBox(width: kPadding),
                      const CircleAvatar(
                        radius: 30,
                      ),
                      const SizedBox(width: 2 * kPadding),
                      const Expanded(
                        child: Text(
                          'Mahbubur Rahman ',
                          maxLines: 1,
                          overflow: TextOverflow.clip,
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w700, fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
