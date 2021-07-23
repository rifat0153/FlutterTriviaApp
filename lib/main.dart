import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'features/theme/theme_controller.dart';
import 'features/trivia/trivia_view.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final myThemeData = watch(themeControllerProvider);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // themeMode: myThemeData,
      title: 'Flutter Demo',
      theme: myThemeData,
      darkTheme: MyThemes.darkTheme,
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool darkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Consumer(builder: (context, watch, child) {
        final themeNotifier = watch(themeControllerProvider.notifier);

        return TriviaView();
      })),
    );
  }
}
