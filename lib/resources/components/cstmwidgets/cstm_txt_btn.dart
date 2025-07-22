import 'package:drips_water/resources/appColors/colors.dart';
import 'package:flutter/cupertino.dart';

Widget customTextButton({
  required void Function()? onPress,
  required String title,
}) {
  return GestureDetector(
    onTap: onPress,
    child: Center(
      child: Text(
        title,
        style: TextStyle(
          color: AppColors.blktxtCcolor,
          fontSize: 16,
          fontWeight: FontWeight.bold,
          decoration: TextDecoration.underline,
        ),
      ),
    ),
  );
}
