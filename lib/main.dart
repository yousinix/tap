import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'pages/onboarding_page.dart';
import 'pages/settings_page.dart';
import 'pages/home_page.dart';
import 'theme.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox(SettingsPage.keySettings);
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TAP',
      theme: theme,
      home: ValueListenableBuilder<Box>(
        valueListenable: Hive.box(SettingsPage.keySettings).listenable(),
        builder: (context, box, widget) {
          final url = box.get(SettingsPage.keyAppScriptUrl) as String?;
          return url == null || url.isEmpty
              ? const OnboardingPage()
              : HomePage(url: url);
        },
      ),
    );
  }
}
