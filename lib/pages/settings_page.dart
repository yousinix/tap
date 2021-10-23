import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SettingsPage extends StatelessWidget {
  static const keySettings = "settings";
  static const keyAppScriptUrl = "APP_SCRIPT_URL";

  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const pattern = "https://script.google.com/macros/s/XXXX/exec";

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ValueListenableBuilder<Box>(
          valueListenable: Hive.box(keySettings).listenable(),
          builder: (context, box, widget) {
            return TextFormField(
              maxLines: 4,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              initialValue: box.get(keyAppScriptUrl),
              onChanged: (str) => box.put(keyAppScriptUrl, str),
              validator: (str) {
                final regex = RegExp(pattern.replaceFirst("XXXX", ".*"));
                if (str?.isEmpty ?? true) {
                  return "Required";
                } else if (!regex.hasMatch(str!)) {
                  return "Must be an App Scirpt URL";
                } else {
                  return null;
                }
              },
              decoration: const InputDecoration(
                labelText: "App Scirpt URL",
                hintText: pattern,
                errorMaxLines: 2,
              ),
            );
          },
        ),
      ),
    );
  }
}
