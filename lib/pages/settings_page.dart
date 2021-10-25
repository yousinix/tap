import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lo_form/lo_form.dart';

class SettingsPage extends StatelessWidget {
  static const keySettings = "settings";
  static const keyAppScriptUrl = "APP_SCRIPT_URL";

  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const pattern = "https://script.google.com/macros/s/XXXX/exec";
    final box = Hive.box(keySettings);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: LoForm(
          initialValues: {keyAppScriptUrl: box.get(keyAppScriptUrl)},
          submittableWhen: (state) => state.isValid,
          onSubmit: (fields, _) async {
            final url = fields.get(keyAppScriptUrl);
            await box.put(keyAppScriptUrl, url);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Saved successfully!"),
              ),
            );
            return true;
          },
          builder: (form) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                LoTextField(
                  name: keyAppScriptUrl,
                  validate: (str) {
                    final regex = RegExp(
                      r"^" + pattern.replaceFirst("XXXX", ".*") + r"$",
                    );
                    if (str?.isEmpty ?? true) {
                      return "Required";
                    } else if (!regex.hasMatch(str!)) {
                      return "Must be an App Scirpt URL";
                    } else {
                      return null;
                    }
                  },
                  props: const TextFieldProps(
                    maxLines: 4,
                    decoration: InputDecoration(
                      labelText: "App Scirpt URL",
                      hintText: pattern,
                      errorMaxLines: 2,
                    ),
                  ),
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: form.submit,
                  child: const Text("Save"),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
