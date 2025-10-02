import 'dart:async';
import 'dart:developer';
import 'package:drips_water/ui/screens/check_point.dart';
import 'package:drips_water/ui/screens/dashboard.dart';
import 'package:drips_water/ui/widgets/auth_snckbr.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Auth {
  // Check if user is already log in then open the dashboard screen other onboarding screen.

  // void checkUser(BuildContext context) {
  //   FirebaseAuth auth = FirebaseAuth.instance;
  //   final user = auth.currentUser;
  //   if (!context.mounted) {
  //     return;
  //   }
  //   if (user != null) {
  //     Timer(Duration(seconds: 3), () {
  //       Navigator.of(
  //         context,
  //       ).push(MaterialPageRoute(builder: (context) => Dashboard()));
  //     });
  //   } else {
  //     Timer(Duration(seconds: 3), () {
  //       Navigator.of(
  //         context,
  //       ).push(MaterialPageRoute(builder: (context) => OnboardingScreen()));
  //     });
  //   }
  // }

  // signUp/Register method
  static Future<void> signUp({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    log('creating user on firebase');
    try {
      log(email.toString());
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Dashboard()),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == "email-already-in-use") {
        log('condition readed');
        AuthSnackbar().customSnackbar(
          context: context,
          message:
              'Provided email already in use, Login instead or change email to register',
        );
      } else if (e.code == 'network-request-failed') {
        AuthSnackbar().customSnackbar(
          context: context,
          message: 'Restore internet connection',
        );
      } else {
        AuthSnackbar().customSnackbar(
          context: context,
          message: 'Something went wrong, Please try again\nerror: ${e.code}',
        );
      }
    }
  }

  // SignIn User
  static Future<void> signIn({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      log('signing In call');
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Dashboard()),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-credential') {
        AuthSnackbar().customSnackbar(
          context: context,
          message: 'Incorrect password or email',
        );
      } else if (e.code == 'network-request-failed') {
        AuthSnackbar().customSnackbar(
          context: context,
          message: 'Restore internet connection',
        );
      } else {
        AuthSnackbar().customSnackbar(
          context: context,
          message: 'Something went wrong, Please try Again!\nerror: ${e.code}',
        );
      }
    }
  }

  // signOut
  static void signOut({required BuildContext context}) async {
    try {
      log('trying signing out');
      await FirebaseAuth.instance.signOut();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => CheckPoint()),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'network-request-failed') {
        AuthSnackbar().customSnackbar(
          context: context,
          message: 'Restore internet connection',
        );
      } else {
        AuthSnackbar().customSnackbar(
          context: context,
          message: 'Something went wrong, Please try Again!',
        );
      }
    }
  }

  // custom snackbar for popup
//   static void customSnackbar({
//     required BuildContext context,
//     required String message,
//   }) {
//     log('calling snackbar');
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         elevation: 8.0,
//         behavior: SnackBarBehavior.floating,
//         shape: ContinuousRectangleBorder(
//           borderRadius: BorderRadius.circular(20),
//         ),
//         duration: Duration(seconds: 3),
//         content: Text(
//           textAlign: TextAlign.center,
//           message,
//           style: Theme.of(
//             context,
//           ).textTheme.labelMedium!.copyWith(color: Colors.white),
//         ),
//       ),
//       snackBarAnimationStyle: AnimationStyle(
//         duration: Duration(milliseconds: 1000),
//         reverseDuration: Duration(milliseconds: 5000),
//       ),
//     );
//   }
}