import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trivia/features/quiz/views/home_view.dart';
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

    return ScreenUtilInit(
      designSize: const Size(392, 781),
      builder: () => MaterialApp(
        debugShowCheckedModeBanner: false,
        // themeMode: myThemeData,
        title: 'Flutter Demo',
        theme: myThemeData,
        darkTheme: MyThemes.darkTheme,
        home: const InitialView(),
      ),
    );
  }
}

class InitialView extends StatefulWidget {
  const InitialView({Key? key}) : super(key: key);

  @override
  _InitialViewState createState() => _InitialViewState();
}

class _InitialViewState extends State<InitialView> {
  bool darkMode = false;

  static const List<Widget> _widgetOptions = <Widget>[
    HomeView(),
    TriviaView(),
  ];

  int _selectedIndex = 0;

  List<BottomNavigationBarItem> bottomNavBarItems = [
    const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
    const BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Star'),
  ];

  void _onTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: bottomNavBarItems,
        currentIndex: _selectedIndex,
        onTap: _onTapped,
        showUnselectedLabels: false,
        selectedItemColor: Colors.cyan,
        // type: BottomNavigationBarType.shifting,
        // backgroundColor: Colors.grey,
        unselectedItemColor: Colors.amber,
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
    );
  }
}
