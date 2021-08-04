import 'package:flutter_riverpod/flutter_riverpod.dart';

final categoryNameProvider = StateProvider<String>((ref) {
  return 'Sports';
});

final categoryApiProvider = Provider<int>((ref) {
  final categoryName = ref.watch(categoryNameProvider).state;

  const Map<String, int> categoryMap = {
    'Sports': 21,
    'Science': 18,
    'Gaming': 15,
  };

  var category = categoryMap[categoryName];

  return category ?? 21;
});
