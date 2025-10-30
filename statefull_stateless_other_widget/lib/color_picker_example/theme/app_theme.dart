import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData theme = ThemeData(
    primarySwatch: Colors.teal,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.grey[50],
      elevation: 10,
      iconTheme: IconThemeData(color: Colors.black),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.black
      )
    )
  );
}
