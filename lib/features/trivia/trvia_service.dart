import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia/models/trivia/trivia.dart';

final triviaServiceProvider = Provider<TriviaService>((ref) {
  return TriviaService(ref.read);
});

class TriviaService {
  TriviaService(this._read);

  final Reader _read;

  Future<Trivia> getTrivia() async {
    await Future.delayed(Duration(seconds: 1), () {});
    return await Future.value(Trivia(text: 'test'));
  }
}
