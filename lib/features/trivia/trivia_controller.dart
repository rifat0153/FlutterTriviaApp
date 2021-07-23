import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia/features/trivia/trvia_service.dart';
import 'package:trivia/models/trivia/trivia.dart';

final triviaControllerProvider = StateNotifierProvider<TriviaController, AsyncValue<Trivia>>((ref) {
  return TriviaController(ref.read)..retriveTrivia();
});

class TriviaController extends StateNotifier<AsyncValue<Trivia>> {
  TriviaController(this._read) : super(const AsyncValue.loading());

  final Reader _read;

  Future<void> retriveTrivia({bool isRefreshing = false}) async {
    if (isRefreshing) {
      state = const AsyncValue.loading();
    }
    try {
      final trivia = await _read(triviaServiceProvider).getTrivia();

      state = AsyncValue.data(trivia);
    } on Exception catch (e, s) {
      state = AsyncValue.error(e, s);
    }
  }
}
