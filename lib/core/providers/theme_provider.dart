import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier{
  ThemeMode _themeMode = ThemeMode.light;
  ThemeMode get themeMode => _themeMode;

  set themeMode(ThemeMode themeMode){
    _themeMode = themeMode;
    notifyListeners();
  }

  bool isDarkMode(){
   return _themeMode == ThemeMode.dark;
  }

}