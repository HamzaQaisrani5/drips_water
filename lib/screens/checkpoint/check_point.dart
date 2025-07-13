import 'dart:developer';

import 'package:drips_water/resources/appColors/colors.dart';
import 'package:drips_water/resources/assetpaths/addresses.dart';
import 'package:drips_water/screens/welcome/welcome.dart';
import 'package:flutter/material.dart';

class CheckPoint extends StatefulWidget {
  const CheckPoint({super.key});

  @override
  State<CheckPoint> createState() => _CheckPointState();
}

class _CheckPointState extends State<CheckPoint> {
  @override
  void initState() {
    super.initState();
  }
 
  @override
  Widget build(BuildContext context) {
    final sizeHeight = MediaQuery.of(context).size.height;
    final sizeWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
            height: sizeHeight,
            width: sizeWidth,
            child:Image.asset(
              Addresses.glassWater,
                fit: BoxFit.cover,
                gaplessPlayback: true
            )
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Who You Are?",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(height: 40),

                FilledButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return WelcomeScreen();
                        },
                      ),
                    );
                  },
                  style: Theme.of(context).filledButtonTheme.style!.copyWith(),
                  child: Text(
                    "SHOP OWNER",
                    style: Theme.of(
                      context,
                    ).textTheme.labelMedium!.copyWith(color: Colors.black),
                  ),
                ),
                SizedBox(height: 10),
                FilledButton(
                  onPressed: () {},
                  style: Theme.of(context).filledButtonTheme.style!.copyWith(),
                  child: Text(
                    "CUSTOMER",
                    style: Theme.of(
                      context,
                    ).textTheme.labelMedium!.copyWith(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
