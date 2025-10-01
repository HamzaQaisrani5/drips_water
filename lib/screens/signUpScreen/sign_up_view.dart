import 'package:drips_water/firebasestuff/auth.dart';
import 'package:drips_water/resources/appColors/colors.dart';
import 'package:drips_water/resources/components/cstmwidgets/custom_formfield.dart';
import 'package:drips_water/resources/components/validationmodel/validations.dart';
import 'package:drips_water/screens/login/login.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController paswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(backgroundColor: Colors.transparent),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 10, left: 15, right: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Text(
                'Create your account',
                style: Theme.of(context).textTheme.titleMedium,
              ),

              SizedBox(height: 5),
              Text(
                'Please fill in your details to create your\naccount',
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium!.copyWith(color: Colors.black87),
              ),
              SizedBox(height: 20),

              Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Name",
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    // Name
                    CustomFormField(
                      controller: nameController,
                      hintText: 'Name',
                      validator: (value) {
                        if (nameController.text.isEmpty ||
                            nameController.text.length < 5) {
                          return 'Name cannot be Empty or less then 5 chars';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Email",
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    // Email
                    CustomFormField(
                      controller: emailController,
                      hintText: 'productionexperience@gmail.com',
                      validator: (value) {
                        if (!value!.isValidEmail) {
                          return 'Invalid Email';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Password",
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    // password
                    CustomFormField(
                      controller: paswordController,
                      hintText: '*******',
                      validator: (value) {
                        if (!value!.isValidPassword) {
                          return "Contain 8 chars\nupperCase/lowerCase Letters\nDigits\nspecial characters";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Confirm Password",
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    // confirm password
                    CustomFormField(
                      controller: confirmPasswordController,
                      hintText: '*******',
                      // obscureText: true,
                      validator: (_) {
                        if (confirmPasswordController.text.isEmpty ||
                            confirmPasswordController.text !=
                                paswordController.text) {
                          return 'Cannot match to your password or Empty';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 55),
                    Center(
                      child: TextButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            Auth.signUp(
                              context: context,
                              email: emailController.text.trim(),
                              password: paswordController.text.trim(),
                            );
                          }
                        },
                        child: Text(
                          'CREATE AN ACCOUNT',
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => Login()),
                      );
                    },
                    child: Text(
                      'Sign in',
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
    );
  }
}
