import 'dart:convert';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import 'package:trivia/models/quiz/quiz.dart';

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
      'amount': '2',
      'category': '21',
      'difficulty': 'medium',
      'type': 'multiple',
    });

    try {
      final response = await http.get(url);
      var json = jsonDecode(response.body) as Map<String, dynamic>;
      var quizListJson = json['results'] as List<dynamic>;

      print('Quiz List Json:\n' + quizListJson.toString());

      for (var quizJson in quizListJson) {
        // print('Quiz Class:\n' + quiz.toString());
        Quiz quiz = Quiz.fromJson(quizJson as Map<String, dynamic>);

        quizList.add(quiz);
      }

      return quizList;
    } catch (e) {
      print(e);
      throw Exception(e);
    }
    // on SocketException catch (e) {
    //   print(e);
    //   throw HttpException('Something went wrong : ${e.message}');
    // } on HttpException catch (e) {
    //   print(e);
    //   throw HttpException('Something went wrong : ${e.message}');
    // }
    // final response = await http
    //     .get(Uri.parse('https://opentdb.com/api.php?amount=10&category=21&difficulty=medium&type=multiple'));

    // print(response.statusCode);

    // if (response.statusCode == 200) {
    //   var json = jsonDecode(response.body) as Map<String, dynamic>;
    //   List<dynamic> quizJsonList = json['results'] as List<dynamic>;

    //   print(quizJsonList);

    //   List<Quiz> quizList = [];

    //   quizJsonList.forEach((quizJson) {
    //     Quiz quiz = Quiz.fromJson(quizJson as Map<String, dynamic>);
    //     quizList.add(quiz);
    //   });

    //   return quizList;
    // } else {
    //   // If the server did not return a 200 OK response,
    //   // then throw an exception.
    //   throw Exception('Failed to load quizes');
    // }
  }
}
