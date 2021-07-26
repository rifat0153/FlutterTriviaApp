import 'dart:convert';

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

    final response = await http
        .get(Uri.parse('https://opentdb.com/api.php?amount=10&category=21&difficulty=medium&type=multiple'));

    if (response.statusCode == 200) {
      var quizJsonLists = jsonDecode(response.body);

      return quizList;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load quizes');
    }
  }

  Future<Album> fetchAlbum() async {
    // var url = Uri.https('www.jsonplaceholder.typicode.com', '/albums/1');
    // var url = "https://jsonplaceholder.typicode.com/albums/3";
    // var parsedUrl = Uri.parse(url);
    var url = Uri.https('jsonplaceholder.typicode.com', '/albums/3');
    final response = await http.get(url);
    // final response = await http.get(parsedUrl);

    print(jsonDecode(response.body));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      var parsed = Album.fromJson(jsonDecode(response.body) as Map<String, dynamic>);

      print(parsed);

      return parsed;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}

class Album {
  final int userId;
  final int id;
  final String title;

  Album({
    required this.userId,
    required this.id,
    required this.title,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      userId: json['userId'] as int,
      id: json['id'] as int,
      title: json['title'] as String,
    );
  }
}
