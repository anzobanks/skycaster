import 'dart:math';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../widgets/custom_text.dart';

class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
          height: height,
          width: width,
          decoration: const BoxDecoration(
            backgroundBlendMode: BlendMode.color,
              gradient: LinearGradient(
                
                  colors: [Color(0xFFFFFFFF),Color(0xFFFFFFFF), Color(0xFFFEFFDB),
                  ],
                  begin: Alignment.topRight,
                  end: Alignment.bottomCenter
                  )),
          child: FadeIn(
            duration: 3500.milliseconds,
            child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/images/splash.png'),
                        CustomText(text: 'SkyCaster', style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 40
                        )),
                        CustomText(text: 'Forecast', style: TextStyle(
                            fontSize: 24,
                          color:Color(0xFF8B95A2) 
                        )),
                      ],
                    ),
          )
          ),
    );
  }
}
