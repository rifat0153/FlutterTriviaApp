import 'package:flutter/material.dart';
import 'package:trivia/models/quiz/quiz.dart';

class GameView extends StatelessWidget {
  const GameView({Key? key, required this.quizList}) : super(key: key);

  final List<Quiz> quizList;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Game View'),
    );
  }
}
