import 'package:drips_water/resources/appColors/colors.dart';
import 'package:drips_water/resources/assetpaths/addresses.dart';
import 'package:flutter/material.dart';

Widget buildPage({required String imagePath, required String title, double fontsize = 25,}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Image.asset(
        imagePath, 
        fit: BoxFit.cover
        ),
      SizedBox(height: 20),
      Text(
        title, 
        style: TextStyle(
          fontSize: fontsize, 
          fontFamily: Addresses.appFontFamily,
          fontWeight: FontWeight.bold,
          color: AppColors.blktxtCcolor
        ),
        textAlign: TextAlign.center,),
      SizedBox(height: 20),
    ],
  );
}
