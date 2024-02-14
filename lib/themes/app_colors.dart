import 'package:flutter/material.dart';

class AppColors {
  static const Color main = Color(0xFF6A5AE0);
  static const Color mainPure = Color(0xFF5b4dc3);

  static const Color main3 = Color(0xFFefeefc);
  static const Color pink = Color(0xFFffccd5);
  static const Color pinkPure = Color(0xFFff8fa2);

  
  static const Color pink2 = Color(0xFFb26673);
  static const Color pink3 = Color(0xFF660012);



  static const Color red = Color(0xFFFF6666);
  static const Color black = Colors.black;

  static const Color green = Color(0xFF53df83);
  static const Color main2 = Color(0xFFe1def9);
  static const Color grey2 = Color(0xFF8d8b9b);
  static const Color facebook = Color(0xFF3b5998);
  static const Color white = Colors.white;
  static const Color greyPure = Color(0xFFcccccc);

  static const Color grey = Color(0xFFE6E6E6);
  static MaterialColor createMaterialColor(Color color) {
    List strengths = <double>[.05];
    final swatch = <int, Color>{};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    for (var strength in strengths) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }
    return MaterialColor(color.value, swatch);
  }
}
