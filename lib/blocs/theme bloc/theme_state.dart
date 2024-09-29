

import 'package:flutter/material.dart';
abstract class ThemeState {
  final ThemeData themeData;
  ThemeState(this.themeData);
}

class LightThemeState extends ThemeState {
  LightThemeState() : super(ThemeData(brightness: Brightness.light));
}

class DarkThemeState extends ThemeState {
  DarkThemeState() : super(ThemeData(brightness: Brightness.dark));
}