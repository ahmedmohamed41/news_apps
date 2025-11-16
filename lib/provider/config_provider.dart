import 'package:flutter/material.dart';

class ConfigProvider extends ChangeNotifier {
  bool isDark = true;
  String isEnglish = 'en';

  void toggleTheme(value) {
    isDark = value;

    notifyListeners();
  }

  void chanegLanguage(language) {
    isEnglish = language;
    notifyListeners();
  }

  ThemeMode get currentTheme => isDark ? ThemeMode.dark : ThemeMode.light;
  String get currentlanguage => isEnglish == 'en' ? 'en' : 'ar';
}
