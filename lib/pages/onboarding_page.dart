import 'package:flutter/material.dart';
import 'settings_page.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              "assets/onboard.png",
              height: 180,
            ),
            const SizedBox(height: 32),
            const Text(
              'You need to add "App Script URL" to get started',
              textAlign: TextAlign.center,
            ),
            TextButton(
              child: const Text("Go to Settings"),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SettingsPage(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
