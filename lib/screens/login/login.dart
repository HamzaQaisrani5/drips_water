import 'dart:developer';

import 'package:drips_water/firebasestuff/auth.dart';
import 'package:drips_water/resources/appColors/colors.dart';
import 'package:drips_water/resources/components/cstmwidgets/customformfield/custom_formfield.dart';
import 'package:drips_water/resources/components/validationmodel/validations.dart';
import 'package:drips_water/screens/signUpScreen/sign_up_view.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController signInEmailController = TextEditingController();
  TextEditingController signInPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 10, left: 15, right: 15),
          child: Form(
            key: formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 10),
                Text(
                  'Welcome Back!',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                SizedBox(height: 5),
                Text(
                  'Please fill in your email password to login to\nyour account.',
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium!.copyWith(color: Colors.black87),
                ),
                SizedBox(height: 20),
                Text(
                  "Email",
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                CustomFormField(
                  controller: signInEmailController,
                  hintText: 'Email',
                  obscureText: false,
                  validator: (value) {
                    if (!value!.isValidEmail) {
                      return "Invalid Email";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                Text(
                  "Password",
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                CustomFormField(
                  controller: signInPasswordController,
                  hintText: '********',

                  // obscureText: true,
                  validator: (value) {
                    if (!value!.isValidPassword) {
                      return 'Wrong password format';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Text(
                        'Forgot Password',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 100),
                Center(
                  child: TextButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {}
                      if (signInEmailController.text.isValidEmail &&
                          signInPasswordController.text.isValidPassword) {
                        Auth.signIn(
                          email: signInEmailController.text,
                          password: signInPasswordController.text,
                          context: context,
                        );
                      }
                    },
                    child: Text(
                      'LOGIN',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => SignUpView()),
                        );
                      },
                      child: Text(
                        'Sign up',
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          color: AppColors.bgColor,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                          decorationColor: AppColors.bgColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
