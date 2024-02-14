import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skycaster/controllers/getanimed_controller.dart';

import '../models/weatile.dart';
import '../pages/weather_details_page.dart';
import 'custom_text.dart';

class WeatherTile extends StatelessWidget {
  WeatherTile(
      {super.key,
      required this.weathers,
      required this.width,
      required this.index});
  final int index;
  final List<Weatile> weathers;
  final double width;
  final RxInt selectedIndex = RxInt(-1);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<GetAnimatedController>(
      init: GetAnimatedController(),
      builder: (getanimatedController) {
        return Obx(() {
          return Transform.scale(
              scale: (index == selectedIndex.value)
                  ? 1.0 + getanimatedController.animation!.value.value
                  : 1.0,
              child: ZoomIn(
                from: 1,
                duration: 1000.milliseconds,
                delay: ((index + 1) * (300)).milliseconds,
                child: Container(
                  padding: const EdgeInsets.all(1.5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      gradient: LinearGradient(
                          colors: [
                            weathers[index].borderColor,
                            weathers[index].gradient.last,
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight)),
                  child: InkWell(
                      onTap: () {
                        selectedIndex.value = index;
                        print(selectedIndex.value);
                        print(index);
                        getanimatedController.startAnimation().then((value) =>                         selectedIndex.value = -1
).then((value) => Get.to(
                                () => WeatherDetailsPage(
                                      weathers: weathers,
                                    ),
                                transition: Transition.cupertino,
                                duration: 2000.milliseconds));
                      },
                      child: AnimatedContainer(
                        height: 160,
                        width: width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            gradient: LinearGradient(
                                colors: weathers[index].gradient,
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight)),
                        duration: 1000.milliseconds,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 20, left: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                    text: weathers[index].location,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  CustomText(
                                    text: weathers[index].weather,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 22,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  CustomText(
                                    text: weathers[index].degree,
                                    style: const TextStyle(
                                        color: Color(0xFFf0f4f6),
                                        fontSize: 55,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            SlideInRight(
                                curve: Curves.bounceOut,
                                duration: 2000.milliseconds,
                                delay: ((index + 1) * (100)).milliseconds,
                                from: 300,
                                child: Container(
                                    child: Image.asset(weathers[index].icon,
                                        height: 300))),
                          ],
                        ),
                      )),
                ),
              ));
        });
      },
    );
  }
}
