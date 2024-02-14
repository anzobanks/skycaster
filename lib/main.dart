import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skycaster/pages/splashcreen_page.dart';
import 'package:skycaster/pages/weather_details_page.dart';

import 'controllers/app_controller.dart';
import 'pages/onboarding_page.dart';
import 'pages/home_page..dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'SkyCaster',
      initialBinding: BindingsBuilder.put(() => AppController()),
      debugShowCheckedModeBanner: false,
      
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SplashScreenPage(),
    );
  }
}

