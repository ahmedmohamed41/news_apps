import 'package:flutter/material.dart';

class ConfigProvider extends ChangeNotifier {
  bool isDark = true;
  String isEn = 'en';

  void toggleTheme(value) {
    isDark = value;

    notifyListeners();
  }

  void chanegLanguage(lan) {
    isEn = lan;
    notifyListeners();
  }

  ThemeMode get currentTheme => isDark ? ThemeMode.dark : ThemeMode.light;
  String get currentlanguage => isEn == 'en' ? 'en' : 'ar';
}
