import 'package:flutter/cupertino.dart';

class LocalProvider extends ChangeNotifier{
  String _lang = 'en';
  String get lang => _lang;
  set lang(String value) {
    _lang = value;
    notifyListeners();
  }
}