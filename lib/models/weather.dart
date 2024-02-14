import 'package:flutter/material.dart';
import 'package:skycaster/models/weatile.dart';

class Weather {
  static Weatile rainy = Weatile(
      degree: '13°',
      icon: 'assets/images/sunrain.png',
      borderColor: Color(0xFFbfd0de),
      gradient: [
        Color(0xFF738a9d),
        Color(0xFF4a607d),
      ],
      location: 'My Location',
      weather: 'Rainy');

  static Weatile partlyCloudly = Weatile(
    degree: '17°',
    icon: 'assets/images/mooncloud.png',
    gradient: [
      Color(0xFF8b69ae),
      Color(0xFF353077),
    ],
    location: 'Toronto',
    weather: 'Partly Cloudly',
    borderColor: Color(0xFFe6d8fc),
  );

  static Weatile sunny = Weatile(
    degree: '24°',
    icon: 'assets/images/sun.png',
    gradient: [
      Color(0xFFf8ca21),
      Color(0xFFff9e31),
    ],
    location: 'Istanbul',
    weather: 'Sunny',
    borderColor: Color(0xFFfff3af),
  );

  static Weatile snowy = Weatile(
    degree: '-6°',
    icon: 'assets/images/tornado.png',
    gradient: [
      Color(0xFF7bc6ff),
      Color(0xFF3983ea),
    ],
    location: 'Nuuk',
    weather: 'Snowy',
    borderColor: Color(0xFF91d6ff),
  );
}
