import 'package:drips_water/resources/appColors/colors.dart';
import 'package:drips_water/screens/onboardingScreen/onBoardingVeiw.dart';
import 'package:drips_water/screens/splashScreen/splashView.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: TextTheme(
          displayLarge: TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.blktxtCcolor,
            fontSize: 27,
          ),
        ),
      ),
      home: Splashview(),
    );
  }
}
