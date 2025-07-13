import 'dart:developer';

import 'package:drips_water/resources/appColors/colors.dart';
import 'package:drips_water/resources/assetpaths/addresses.dart';
import 'package:drips_water/screens/checkpoint/check_point.dart';
import 'package:drips_water/screens/login/login.dart';
import 'package:drips_water/screens/onboarding/on_boarding_veiw.dart';
// import 'package:drips_water/screens/onboarding/on_boarding_veiw.dart';
// import 'package:drips_water/screens/onboarding/on_boarding_veiw.dart';
// import 'package:drips_water/screens/welcome/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {
  // Preserving Splash
  FlutterNativeSplash.preserve(widgetsBinding: WidgetsFlutterBinding.ensureInitialized());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: TextTheme(
          displayLarge: TextStyle(
            fontFamily: "OpenSans",
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
          titleLarge: TextStyle(
            fontFamily: Addresses.appFontFamily,
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          titleMedium: TextStyle(
            fontFamily: Addresses.appFontFamily,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.bgColor,
          ),
          bodyLarge: TextStyle(
            fontSize: 15,
            fontFamily: Addresses.appFontFamily,
            // color: Colors.white
          ),
          bodyMedium: TextStyle(
            fontSize: 14,
            fontFamily: Addresses.appFontFamily,
            // color: Colors
          ),
          bodySmall: TextStyle(
            fontSize: 13,
            fontFamily: Addresses.appFontFamily,
          ),
          labelLarge: TextStyle(
            fontSize: 15,
            fontFamily: Addresses.appFontFamily,
            color: Colors.white,
          ),
          labelMedium: TextStyle(
            fontSize: 13,
            fontFamily: Addresses.appFontFamily,
            color: Colors.white,
          ),
        ),
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: AppColors.bgColor,
          selectionColor: AppColors.bgColor,
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            backgroundColor: AppColors.bgColor,
            minimumSize: Size(318, 60),
            // overlayColor: Colors.teal[400],
            shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            backgroundColor: AppColors.whitetxtColor,
            overlayColor: AppColors.lightgrey,
            shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.circular(3),
              side: BorderSide(color: Colors.black, width: 0.5),
            ),
            minimumSize: Size((318 / 2), 70),
          ),
        ),
      ),
      home: OnboardingScreen(),
    );
  }
}
