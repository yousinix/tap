import 'package:flutter/material.dart';

final theme = ThemeData(
  primaryColor: Colors.deepPurple,
  primarySwatch: Colors.deepPurple,
  inputDecorationTheme: const InputDecorationTheme(
    floatingLabelBehavior: FloatingLabelBehavior.always,
    border: OutlineInputBorder(),
    hintStyle: TextStyle(
      color: Colors.black38,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      padding: const EdgeInsets.symmetric(
        horizontal: 64,
        vertical: 18,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  ),
  appBarTheme: const AppBarTheme(
    elevation: 0,
    centerTitle: true,
    foregroundColor: Colors.deepPurple,
    backgroundColor: Colors.transparent,
  ),
  dialogTheme: DialogTheme(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
    ),
  ),
);
