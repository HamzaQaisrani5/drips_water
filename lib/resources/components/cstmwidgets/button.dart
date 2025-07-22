import 'package:drips_water/resources/appColors/colors.dart';
import 'package:drips_water/resources/assetpaths/addresses.dart';
import 'package:flutter/material.dart';

Widget customButton({required String data, required void Function()? onPress}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 50.0),
    child: Material(
      color: AppColors.bgColor,
      child: InkWell(
        splashColor: Colors.transparent,
        onTap:onPress,
        child: SizedBox(
          height: 60,
          width: 318,
          child: Center(
            child: Text(
              data,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                fontFamily: Addresses.appFontFamily,
                color: AppColors.whitetxtColor,
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
