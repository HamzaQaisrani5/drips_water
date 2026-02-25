import 'dart:developer';
import 'package:flutter/material.dart';

class AuthSnackbar {
   void customSnackbar({
    required BuildContext context,
    required String message,
  }) {
    log('calling snackbar');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        elevation: 8.0,
        behavior: SnackBarBehavior.floating,
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        duration: Duration(seconds: 3),
        content: Text(
          textAlign: TextAlign.center,
          message,
          style: Theme.of(
            context,
          ).textTheme.labelMedium!.copyWith(color: Colors.white),
        ),
      ),
      snackBarAnimationStyle: AnimationStyle(
        duration: Duration(milliseconds: 1000),
        reverseDuration: Duration(milliseconds: 5000),
      ),
    );
  }
} 