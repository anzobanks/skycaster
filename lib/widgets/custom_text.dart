import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText(
      {super.key,
      required this.text,
      required this.style,
      this.color,
      this.fontSize,
      this.fontWeight,
      this.textAlign});
  final TextStyle style;
  final String text;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  @override
  Widget build(BuildContext context) {
    return Text(text,
        textAlign: textAlign,
        softWrap: true,
        style: 
      style);
  }
}
