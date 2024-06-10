import 'package:flutter/material.dart';

enum Themes {
  light,
  dark;

  String getThemeName() {
    switch (this) {
      case Themes.dark:
        return 'Dark';
      case Themes.light:
        return 'Light';
    }
  }

  ThemeData getTheme() {
    switch (this) {
      case Themes.light:
        return ThemeData.light().copyWith(
            colorScheme: ThemeData.light().colorScheme.copyWith(
                  surface: Colors.white,
                  primary: Colors.black,
                ));
      case Themes.dark:
        return ThemeData.dark().copyWith(
            colorScheme: ThemeData.dark().colorScheme.copyWith(
                  surface: Colors.black,
                ));
    }
  }
}
