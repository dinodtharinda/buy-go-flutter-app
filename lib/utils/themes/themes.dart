import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'colors.dart';

class AppThemes with ChangeNotifier {
  bool _isDarkMode = false;
  AppThemes() {
    _loadThemeFromPreferences();
  }
  ThemeData get currentTheme => _isDarkMode ? darkTheme : lightTheme;
  bool get isDarkMode => _isDarkMode;
  void toggleTheme() async{
    _isDarkMode = !_isDarkMode;
    notifyListeners();
      final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkMode', _isDarkMode);
  }
  Future<void> _loadThemeFromPreferences() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    _isDarkMode = prefs.getBool('isDarkMode') ?? false;
    notifyListeners();
  }
  static ThemeData lightTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: CustomColor.lightColor,
    primaryColor: CustomColor.primaryColor,
    appBarTheme: const AppBarTheme(color: CustomColor.lightColor),
    cardColor: CustomColor.lightColor,

    //dark mode
    primaryColorLight: CustomColor.lightColor,
    primaryColorDark: CustomColor.backColor,
  );

  static ThemeData darkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: CustomColor.darkColor,
    primaryColor: CustomColor.primaryColor,
    appBarTheme: AppBarTheme(color: CustomColor.darkColor),
    cardColor: CustomColor.secondDarkColor,

    //dark mode
    primaryColorLight: CustomColor.backColor,
    primaryColorDark: CustomColor.lightColor,
    bottomAppBarTheme: BottomAppBarTheme(color: CustomColor.secondDarkColor),
  );
}
