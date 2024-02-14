import 'package:flutter/material.dart';

import 'custom_text.dart';

class InfoTile2 extends StatelessWidget {
  InfoTile2({
    super.key,
    required this.icon,
    required this.time,
    required this.degre,
  });
  String icon, degre, time;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      CustomText(
        text: time,
        style: TextStyle(
            color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: Image.asset(icon, width: 30),
      ),
      CustomText(
        text: degre,
        style: TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
      ),
    ]);
  }
}

class VerticalDiv extends StatelessWidget {
  const VerticalDiv({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 0.5,
      height: 35,
      color: Color(0xFF9eb1c5),
    );
  }
}

class InfoTile extends StatelessWidget {
  InfoTile(
      {super.key,
      required this.title,
      required this.icon,
      required this.value,
      required this.isColor,
      required this.color});
  IconData icon;
  Color color;
  bool isColor;
  String value, title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Icon(icon, color: color, size: 18),
            SizedBox(
              width: 5,
            ),
            CustomText(
              text: title,
              style: TextStyle(
                  color:isColor==true?Colors.white: Color(0xFFb9d1e9),
                  fontSize: 14,
                  fontWeight: FontWeight.w400),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        CustomText(
          text: value,
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
