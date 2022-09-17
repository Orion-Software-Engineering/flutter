import 'package:shared_preferences/shared_preferences.dart';

class DarkThemePreference {
  setDarkThemePreferences(bool value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool("themeStatus", value);
  }

  Future<bool> getTheme() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getBool("themeStatus") ?? false;
  }
}
