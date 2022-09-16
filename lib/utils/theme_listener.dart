import 'package:flutter/foundation.dart';
import 'package:matchmaking_demo/home/settings_page.dart';

class DarkThemeProvider with ChangeNotifier {
  bool darkTheme = false;
  bool get darkThemeSet => darkTheme;
  set darkThemeSet(bool value) {
    darkTheme = value;
    setDarkThemePreferences(value);
    notifyListeners();
  }
}
