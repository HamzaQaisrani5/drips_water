import 'package:drips_water/resources/appColors/colors.dart';
import 'package:drips_water/resources/assetpaths/addresses.dart';
import 'package:drips_water/screens/onboarding/on_boarding_veiw.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(AssetImage(Addresses.bowlWater), context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(),
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
        tooltipTheme: TooltipThemeData(
          textStyle: TextStyle(
            fontSize: 13,
            fontFamily: Addresses.appFontFamily,
            color: Colors.white,
          ),
        ),
      ),
      home: OnboardingScreen(),
    );
  }
}
// Registered emails
//1) email: alinajoli65@gmail.com
//pswrd: Alina@789
// 2) email: waterfall@gmail.com
// pswrd: Waterfall@1
// 3) email:abc@gmail.com
// pswrd: hamza
// 4) email: game@gmail.com
// pserd: Game!123
// 5) email: qaisranitrader789@gmail.com
// pswrd:Qaisrani78@