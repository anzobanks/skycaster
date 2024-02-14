import 'dart:math';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../controllers/getanimed_controller.dart';
import '../widgets/custom_text.dart';
import 'home_page..dart';
import 'weather_details_page.dart';

class OnBoardingPage extends StatelessWidget {
  OnBoardingPage({super.key});
  var pageController = PageController();
  RxInt indexed = 0.obs;
  List gradientColors = [
    [
      Color(0xFFFEFFDB),
      Color(0xFFeefcf9),
    ],
    [
      Color(0xFFFEFFDB),
      Color(0xFFf2fefc),
    ],
    [
      Color(0xFF000000),
      Color(0xFF484B5B),
      Color(0xFFF2FEFC),
    ],
    [
      Color(0xFF000000),
      Color(0xFF484B5B),
      Color(0xFFF2FEFC),
    ],
  ];
  List colors = [
    LinearGradient(colors: [
      Color(0xFFf9e179),
      Color(0xFFeefcf9),
    ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
    LinearGradient(colors: [
      Color(0xFFf9d456),
      Color(0xFFf4bf78),
    ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
    LinearGradient(colors: [
      Color(0xFF000000),
      Color(0xFF484B5B),
      Color(0xFFF2FEFC),
    ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
    RadialGradient(
      colors: [
        Color(0xFF2C2D35),
        Color(0xFF484B5B),
      ],
    ),
  ];
  List<String> texts = [
    'Detailed Hourly Forecast',
    'Real-Time Weather Map',
    'Weather Around the World',
    'Welcome to SkyCaster'
  ];
  List<String> descriptions = [
    'Get in - depth weather information.',
    'Watch the progress of the precipitation to stay informed',
    'Add any location you want and swipe easily to change.',
    'Discover the weather in your city and plan your day correctly'
  ];

  List<String> images = [
    'assets/images/onboard1.png',
    'assets/images/onboard2.png',
    'assets/images/onboard3.png',
    'assets/images/onboard4.png'
  ];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Obx(() {
          return Container(
            height: height,
            width: width,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                AnimatedContainer(
                  duration: 1000.milliseconds,
                  decoration: BoxDecoration(gradient: colors[indexed.value]),
                  height: height,
                  width: width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: TextButton(
                          onPressed: () {
                            pageController.jumpToPage(4);
                          },
                          child: CustomText(
                              text: 'Skip',
                              style: TextStyle(
                                  color:
                                      indexed.value == 2 || indexed.value == 3
                                          ? Color(0xFFF2FEFC)
                                          : Color(0xFF25306b),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16)),
                        ),
                      ),
                      Container(
                        height: 300,
                        child: PageView.builder(
                            controller: pageController,
                            itemCount: 4,
                            onPageChanged: (value) {
                              print(value);
                              indexed.value = value;
                            },
                            itemBuilder: (context, index) {
                              return FadeIn(
                                duration: 3500.milliseconds,
                                child: Image.asset(
                                  images[index],
                                  height: 150,
                                ),
                              );
                            }),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    width: width,
                    height: height / 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AnimatedSmoothIndicator(
                          activeIndex: indexed.value,
                          count: 4,
                          effect: WormEffect(dotHeight: 12, dotWidth: 12),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 80),
                          child: CustomText(
                              textAlign: TextAlign.center,
                              text: texts[indexed.value],
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 25)),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              right: 30, left: 30, top: 10, bottom: 50),
                          child: CustomText(
                              textAlign: TextAlign.center,
                              text: descriptions[indexed.value],
                              style: TextStyle(
                                  color: Color(0xFF8B95A2),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20)),
                        ),
                      GetBuilder<GetAnimatedController>(
                            init: GetAnimatedController(),
                            builder: (getanimatedController) {
                              return Transform.scale(
                                scale: 1.0 +
                                    getanimatedController
                                        .animation!.value.value,
                                child: AnimatedContainer(
                                  duration: 1000.milliseconds,
                                  child: CircularStepProgressIndicator(
                                    totalSteps: 4,
                                    currentStep: 0,
                                    padding: 0,
                                    selectedColor: Colors.redAccent,
                                    unselectedColor: Colors.grey[200],
                                    // selectedStepSize: 10.0,
                                    width: 100,
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: IconButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Color(0xFF25306b),
                                          ),
                                          onPressed: () {
                                            getanimatedController.startAnimation().then((value) {
                                                if (indexed.value == 3) {
                                                Get.off(HomePage());
                                              } else {
                                                pageController.nextPage(
                                                    duration: 1000.milliseconds,
                                                    curve: Curves.easeInSine);
                                              }
                                            } );
                                         
                                          },
                                          icon: Icon(
                                              Icons.arrow_forward_rounded,
                                              color: Colors.white)),
                                    ),
                                    arcSize: (indexed.value + 1) * pi * 2 / 4,
                                    gradientColor: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Color(0xFF202461),
                                        Color(0xFF67E1D2),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          )
                      ],
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(45),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(
                              0.2), // Couleur de l'ombre (bleu avec opacité)
                          blurRadius: 10, // Flou de l'ombre
                          spreadRadius: 5, // Étalement de l'ombre
                          offset: Offset(0, 0), // Décalage de l'ombre
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}
