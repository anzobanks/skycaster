import 'package:flutter/material.dart';

class Weatile {
  String location, degree, weather, icon;
  List<Color> gradient;
  Color borderColor;
  Weatile(
      {required this.degree,
      required this.icon,
      required this.borderColor,
      required this.gradient,
      required this.location,
      required this.weather});
}
