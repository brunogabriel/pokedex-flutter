import 'package:flutter/material.dart';

abstract class PokedexThemeData {
  static ThemeData get themeData => ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
      );
}
