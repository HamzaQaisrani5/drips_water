import 'package:drips_water/resources/appColors/colors.dart';
import 'package:flutter/material.dart';

Widget buildPage({required String imagePath, required String title, double fontsize = 27,}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Image.asset(imagePath, fit: BoxFit.cover),
      SizedBox(height: 20),
      Text(title, style: TextStyle(fontSize: fontsize, fontWeight: FontWeight.bold,color: AppColors.blktxtCcolor),textAlign: TextAlign.center,),
      SizedBox(height: 20),
    ],
  );
}
