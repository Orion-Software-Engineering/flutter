import 'package:flutter/foundation.dart';
import 'package:matchmaking_demo/utils/dark_theme_preference.dart';

class DarkThemeProvider with ChangeNotifier {
  DarkThemePreference darkThemePreference = new DarkThemePreference();
  bool darkTheme = false;
  bool get darkThemeSet => darkTheme;

  set darkThemeSet(bool value) {
    darkTheme = value;
    darkThemePreference.setDarkThemePreferences(value);
    notifyListeners();
  }
}
