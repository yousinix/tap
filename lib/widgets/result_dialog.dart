import 'package:flutter/material.dart';

class ResultDialog extends StatelessWidget {
  final Color backgroundColor;
  final IconData icon;
  final String title;
  final String description;

  const ResultDialog({
    Key? key,
    required this.backgroundColor,
    required this.icon,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      clipBehavior: Clip.hardEdge,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 100,
            color: backgroundColor,
            child: Center(
              child: Icon(
                icon,
                color: Colors.white,
                size: 48,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.headline6,
                ),
                const SizedBox(height: 6),
                Text(
                  description,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Future showSuccess({
    required BuildContext context,
    String title = "Success",
    required String description,
  }) {
    return showDialog(
      context: context,
      builder: (context) {
        return ResultDialog(
          backgroundColor: Colors.green,
          icon: Icons.check_circle,
          title: title,
          description: description,
        );
      },
    );
  }

  static Future showError({
    required BuildContext context,
    String title = "Error",
    required String description,
  }) {
    return showDialog(
      context: context,
      builder: (context) {
        return ResultDialog(
          backgroundColor: Colors.red,
          icon: Icons.error,
          title: title,
          description: description,
        );
      },
    );
  }
}
