import 'dart:async';

import 'package:drips_water/resources/appColors/colors.dart';
import 'package:drips_water/resources/assetImages/image_address.dart';
import 'package:drips_water/screens/onboardingScreen/onBoardingVeiw.dart';
import 'package:flutter/material.dart';

class Splashview extends StatefulWidget {
  const Splashview({super.key});

  @override
  State<Splashview> createState() => _SplashviewState();
}

class _SplashviewState extends State<Splashview> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 6), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => OnboardingScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final sizeOfScreen = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Center(
        child: Image.asset(
          AssetImageAddress.logo,
          fit: BoxFit.cover,
          height: sizeOfScreen.height * 0.3,
        ),
      ),
    );
  }
}
