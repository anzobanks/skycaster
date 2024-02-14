import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_colors.dart';
import 'app_fonts.dart';

class AppThemes {
  static ThemeData mainTheme = ThemeData(
    fontFamily: 'Rubik',
    useMaterial3: false,
    brightness: Brightness.light,
    primarySwatch: AppColors.createMaterialColor(AppColors.main),
    scaffoldBackgroundColor: Colors.white,
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(AppColors.main),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20))),
            elevation: MaterialStateProperty.all(1))),
    navigationBarTheme: NavigationBarThemeData(
        backgroundColor: const Color.fromARGB(255, 248, 244, 244),
        indicatorShape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        iconTheme: const MaterialStatePropertyAll(
            IconThemeData(color: AppColors.main))),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(elevation: 5),
    appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarBrightness: Brightness.light,
            statusBarColor: AppColors.main),
        elevation: 0,
        titleTextStyle: TextStyle(
            color: AppColors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold),
        centerTitle: false,
        backgroundColor: AppColors.main),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: AppColors.white .withOpacity(0.4),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.main),
        borderRadius: BorderRadius.circular(15),
      ),
      errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(15)),
      focusColor: const Color.fromARGB(255, 244, 67, 54),
      hintStyle: const TextStyle(fontSize: 16, color: AppColors.grey),
      border: OutlineInputBorder(
          borderSide: BorderSide.none, borderRadius: BorderRadius.circular(15)),
    ),
    textTheme:  TextTheme(bodyMedium: AppFonts.bodyMedium,bodySmall: AppFonts.bodySmall,bodyLarge: AppFonts.bodyLarge)
    );


}