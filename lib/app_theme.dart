import 'package:flutter/material.dart';

abstract class AppTheme {
  static ThemeData get lightTheme => ThemeData(
        scaffoldBackgroundColor: Colors.white,
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: const TextStyle(
                fontSize: 18,
                color: Colors.black87,
              ),
              caption: const TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 14,
                color: Colors.black87,
              ),
            ),
      );

  static ThemeData get darkTheme => ThemeData(
        scaffoldBackgroundColor: Colors.blueGrey.shade800,
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: const TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
              caption: const TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 14,
                color: Colors.white,
              ),
            ),
      );
}
