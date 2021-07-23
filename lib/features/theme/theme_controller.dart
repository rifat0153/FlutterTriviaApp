import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyThemes {
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.grey.shade900,
   colorScheme: ColorScheme.dark()
  );

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
  );
}

final themeControllerProvider = StateNotifierProvider<ThemeController, ThemeData>((ref) {
  return ThemeController(ref.read);
});

class ThemeController extends StateNotifier<ThemeData> {
  ThemeController(this._read) : super(MyThemes.lightTheme);

  final Reader _read;

  void setDarkTheme() {
    state = MyThemes.darkTheme;
  }

  void setLightTheme() {
    state = MyThemes.lightTheme;
  }
}
