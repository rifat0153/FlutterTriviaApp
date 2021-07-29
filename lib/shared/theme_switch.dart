import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia/features/theme/theme_controller.dart';

class ThemeSwitch extends ConsumerStatefulWidget {
  const ThemeSwitch({Key? key}) : super(key: key);

  @override
  _ThemeSwitchState createState() => _ThemeSwitchState();
}

class _ThemeSwitchState extends ConsumerState<ThemeSwitch> {
  bool darkMode = false;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, watch, _) {
        final Brightness brightnessValue = MediaQuery.of(context).platformBrightness;

        return brightnessValue == Brightness.light
            ? Switch(
                value: darkMode,
                onChanged: (value) {
                  if (value) {
                    setState(() {
                      darkMode = value;
                    });
                    ref.read(themeControllerProvider.notifier).setDarkTheme();
                  } else {
                    setState(() {
                      darkMode = value;
                    });
                    ref.read(themeControllerProvider.notifier).setLightTheme();
                  }
                },
              )
            : const SizedBox();
      },
    );
  }
}
