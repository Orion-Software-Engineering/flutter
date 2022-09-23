import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:matchmaking_demo/utils/dark_theme_preference.dart';

class DarkThemeProvider with ChangeNotifier {
  DarkThemePreference darkThemePreference = DarkThemePreference();
  ThemeMode _darkTheme = ThemeMode.system;
  ThemeMode get darkTheme => _darkTheme;

  set darkTheme(ThemeMode value) {
    _darkTheme = value;
    if (value == ThemeMode.dark) {
      darkThemePreference.setDarkTheme('dark');
    } else if (value == ThemeMode.light) {
      darkThemePreference.setDarkTheme('light');
    } else if (value == ThemeMode.system) {
      darkThemePreference.setDarkTheme('system');
    }
    notifyListeners();
  }
}
