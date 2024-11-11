import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeManager with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;

  ThemeMode get themeMode => _themeMode;

  void toggleTheme(bool isDark) {
    _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    writePref(isDark);
    notifyListeners();
  }

  Future<void> loadTheme() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isDark = prefs.getBool('ofTheme');
    print(
        'Loaded theme from SharedPreferences: ${isDark == null ? "Light (default)" : (isDark ? "Dark" : "Light")}');

    // If value not stored, than show the light mode
    _themeMode = (isDark == null || !isDark) ? ThemeMode.light : ThemeMode.dark;
    notifyListeners();
  }

  // Save the preference
  static Future<void> writePref(bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('ofTheme', value);
    print(
        'Saved theme preference to SharedPreferences: ${value ? "Dark" : "Light"}');
  }
}
