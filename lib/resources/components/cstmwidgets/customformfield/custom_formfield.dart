import 'package:drips_water/resources/appColors/colors.dart';
import 'package:flutter/material.dart ';
// ignore: must_be_immutable
class CustomFormField extends StatelessWidget {
  bool obscureText;
  String hintText;
  String? Function(String?)? validator;
  TextEditingController controller;
  CustomFormField({
    super.key,
    this.obscureText = false,
    required this.hintText,
    required this.validator,
    required this.controller
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(1)),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(1),
          borderSide: BorderSide(color: AppColors.bgColor),
        ),
        hintText: hintText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(1)),
        hintStyle: Theme.of(
          context,
        ).textTheme.bodySmall!.copyWith(color: Colors.black26),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(1),
          borderSide: BorderSide(color: AppColors.bgColor),
        ),
      ),
      cursorColor: AppColors.bgColor,
      cursorErrorColor: AppColors.bgColor,

      validator: validator,
    );
  }
}