import 'package:drips_water/resources/appColors/colors.dart';
import 'package:drips_water/resources/assetpaths/addresses.dart';
import 'package:drips_water/screens/onboarding/on_boarding_veiw.dart';
// import 'package:drips_water/screens/onboarding/on_boarding_veiw.dart';
import 'package:drips_water/screens/welcome/welcome.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {
  // Preserving Splash 
  // FlutterNativeSplash.preserve(widgetsBinding: WidgetsFlutterBinding.ensureInitialized());
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
            color: Colors.white
          ),
          bodyMedium: TextStyle(
            fontSize: 15,
            fontFamily: Addresses.appFontFamily,
            color: Colors.white
          ),
          bodySmall: TextStyle(
            fontSize: 13,
            fontFamily: Addresses.appFontFamily,
            color: Colors.white
          ),
          labelMedium: TextStyle(
            fontSize: 13,
            fontFamily: Addresses.appFontFamily,
            color: Colors.white
          ),
        ),
      ),
      home: OnboardingScreen(),
    );
  }
}
