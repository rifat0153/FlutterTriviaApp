import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:trivia/models/quiz/quiz.dart';
import 'package:uuid/uuid.dart';



final quizServiceProvider = Provider<QuizService>((ref) {
  return QuizService(ref.read);
});

abstract class BaseQuizService {
  Future<List<Quiz>> fetchQuizList();
}

class QuizService implements BaseQuizService {
  QuizService(
    this._read,
  );

  Reader _read;

  @override
  Future<List<Quiz>> fetchQuizList() async {
    print('Service: Fetch Quiz Called');

    List<Quiz> quizList = [];

    final url = Uri.https('www.opentdb.com', '/api.php', {
      'amount': '3',
      'category': '21',
      'difficulty': 'medium',
      'type': 'multiple',
    });

    const uuid = Uuid();

    try {
      final response = await Dio().getUri(url);

      var quizListJson = response.data['results'];
      // print('Dio data: ' + quizListJson.toString());
      for (var quizJson in quizListJson) {
        Quiz quiz = Quiz.fromJson(quizJson as Map<String, dynamic>);
        var newQuiz = quiz.copyWith(id: uuid.v4());

        print(newQuiz.toJson());

        quizList.add(newQuiz);
      }
      return quizList;
    } on SocketException catch (_) {
      throw Exception('No Interner');
    } catch (e) {
      throw Exception(e);
    }
  }
}
