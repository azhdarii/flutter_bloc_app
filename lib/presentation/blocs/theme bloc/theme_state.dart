import 'package:flutter/material.dart';

abstract class ThemeState {
  final ThemeData themeData;

  ThemeState(this.themeData);
}

class LightThemeState extends ThemeState {
  LightThemeState()
      : super(ThemeData(
            brightness: Brightness.light,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.red)));
}

class DarkThemeState extends ThemeState {
  DarkThemeState()
      : super(ThemeData(
            brightness: Brightness.dark,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyanAccent,brightness: Brightness.dark))
  );
}
