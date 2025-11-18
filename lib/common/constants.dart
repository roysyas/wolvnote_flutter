import 'package:flutter/material.dart';

class Constants {
  static const int CATEGORY_NOTE = 1;
  static const int CATEGORY_SALARY = 2;
  static const int CATEGORY_CHECKLIST = 3;
  static const int CATEGORY_DRAW = 4;
  static const String NOTE_ID = "note_id";
  static const String REFRESH = "refresh";

  static const List<Color> allColors = [
    Colors.black,
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Color(0xFFFF00FF),
    Colors.cyan,
  ];

  static const List<double> allWeight = [
    1.0,
    2.0,
    3.0,
    4.0,
    5.0,
    6.0,
    7.0,
  ];

  static const String PROVIDER = "AndroidKeyStore";
  static const String KEY_ALIAS = "PrivateSecretKey";
}
