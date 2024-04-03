import 'package:flutter/material.dart';

class AppColorConfig {
  AppColorConfig._();

  static MaterialColor primary = const MaterialColor(
    _primary,
    <int, Color>{
      50: Color(0xFFe6effe),
      100: Color(0xFFBBDEFB),
      200: Color(0xFF90CAF9),
      300: Color(0xFF58b1ea),
      400: Color(0xFF42A5F5),
      500: Color(0xFF2f26ff),
      600: Color(0xFF0022ff),
      700: Color(0xFF001af7),
      800: Color(0xFF0015f3),
      900: Color(0xFF0003ef),
    },
  );
  static MaterialColor secondary = const MaterialColor(
    _secondary,
    <int, Color>{
      50: Color(0xFFfff7e0),
      100: Color(0xFFffe9b1),
      200: Color(0xFFffda7e),
      300: Color(0xFFfecd4a),
      400: Color(0xFFfec122),
      500: Color(0xFFfdb700),
      600: Color(0xFFfda900),
      700: Color(0xFFfc9600),
      800: Color(0xFFfc8501),
      900: Color(0xFFfb6406),
    },
  );

  static const int _primary = 0XFF1a70fa;
  // static const int _primaryColorValue = 0xFF00A2E9;
  static const int _secondary = 0xFFfb6206;

  static Color maroon = const Color(0xFF7f0001);
  static Color darkCandyAppleRed = const Color(0xFFA10000);
  static Color white = const Color(0xFFffffff);
  static Color lightGrey = const Color(0xFFD8D8D8);
  static Color green = const Color(0xFF01A857);
  static Color aureolin = const Color(0xFFFCEE10);
  static Color deepCarminePink = const Color(0xFFE63235);
  static Color princetonOrange = const Color(0xFFFB842A);
  static Color fuzzyWuzzy = const Color(0xFFce6e6f);
  static const Color subtitle = Color.fromARGB(255, 86, 86, 86);
  static Color black = const Color(0xFF000000);
  static Color bondiBlue = const Color(0xFF0093ba);
  static Color grey = Colors.grey;
  static Color greyblur = const Color(0xFFe7f9fd);
  static Color tes = const Color.fromARGB(167, 148, 216, 255);
}
