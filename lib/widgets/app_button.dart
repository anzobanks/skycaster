import 'package:flutter/material.dart';

import '../themes/app_colors.dart';
import 'custom_text.dart';

class AppButton extends StatelessWidget {
  AppButton(
      {super.key,
      required this.child,
      this.backgroundColor,
      required this.onPress,
      this.radius});

  final Color? backgroundColor;
  final double? radius;
  Widget child;
  Function() onPress;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 13),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius ?? 20)),
        backgroundColor: backgroundColor ?? AppColors.main,
        surfaceTintColor: AppColors.main,
        shadowColor: Colors.transparent,
      ),
      child: child,
    );
  }
}

class AppButtonOutlined extends StatelessWidget {
  AppButtonOutlined({
    super.key,
    required this.customText,
    this.backgroundColor,
    required this.height,
    required this.width,
    required this.onPress,
  });
  final double height, width;
  final Color? backgroundColor;
  CustomText customText;
  Function() onPress;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.main,
          ),
          borderRadius: BorderRadius.circular(25)),
      child: OutlinedButton(
        onPressed: onPress,
        style: ButtonStyle(
            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25))),
            backgroundColor: MaterialStatePropertyAll(backgroundColor)),
        child: customText,
      ),
    );
  }
}
