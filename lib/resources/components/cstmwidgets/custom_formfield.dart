import 'package:drips_water/resources/appColors/colors.dart';
import 'package:flutter/material.dart ';
import 'package:flutter/services.dart';

// ignore: must_be_immutable
class CustomFormField extends StatelessWidget {
  bool obscureText;
  bool readOnly;
  String? hintText;
  String? Function(String?)? validator;
  TextEditingController controller;
  TextInputType keyboardType;
  CustomFormField({
    super.key,
    this.obscureText = false,
    this.readOnly = false,
    this.keyboardType = TextInputType.streetAddress,
    this.hintText,
    this.validator,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // inputFormatters:
      //     emojidisable
      //         ? [
      //           FilteringTextInputFormatter.deny(
      //             RegExp(
      //               r'[\u{1F600}-\u{1F6FF}]|[\u{1F300}-\u{1F5FF}]|[\u{1F900}-\u{1F9FF}]',
      //               unicode: true,
      //             ),
      //           ),
      //         ]
      //         : null,
      controller: controller,
      obscureText: obscureText,
      readOnly: readOnly,
      validator: validator,
      keyboardType: keyboardType,
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
    );
  }
}
