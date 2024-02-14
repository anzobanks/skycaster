import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../models/weatile.dart';
import '../pages/weather_details_page.dart';

class GetAnimatedController extends GetxController
    with GetSingleTickerProviderStateMixin {
  AnimationController? animationController;
  Rx<Animation<double>>? animation;

  @override
  void onInit() {
    super.onInit();

    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );

    animation = Tween<double>(
      begin: -0.1,
      end: 0.0,
    )
        .animate(
          CurvedAnimation(
              parent: animationController!,
              curve: Curves.elasticInOut,
              reverseCurve: Curves
                  .elasticInOut // Utilisez une courbe d'élasticité pour simuler le rebondissement
              ),
        )
        .obs;
    animationController!.addListener(() {
      update();
    });
  }

  Future startAnimation() async {
    await animationController!.forward(from: 0.0);
  }

  @override
  void onClose() {
    animationController!.dispose();
    super.onClose();
  }
}
