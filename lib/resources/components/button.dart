import 'package:drips_water/resources/appColors/colors.dart';
import 'package:flutter/material.dart';

Widget customButton({required String data, required void Function()? onPress}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 50.0),
    child: Material(
      color: AppColors.bgColor,
      child: InkWell(
        splashColor: Colors.transparent,
        onTap:onPress,
        child: Container(
          decoration: BoxDecoration(),
          height: 60,
          width: 318,
          child: Center(
            child: Text(
              data,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 27,
                color: AppColors.whitetxtColor,
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
