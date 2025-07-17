import 'package:drips_water/resources/appColors/colors.dart';
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
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
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
                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(1),
                        ),
                        hintStyle: Theme.of(
                          context,
                        ).textTheme.bodySmall!.copyWith(color: Colors.black54),
                        hintText: 'Production Experience',
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(1),
                          borderSide: BorderSide(color: AppColors.bgColor),
                        ),
                      ),
                      cursorColor: AppColors.bgColor,
                      controller: emailController,
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
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "productionexperience@gmail.com",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(1),
                        ),
                        hintStyle: Theme.of(
                          context,
                        ).textTheme.bodySmall!.copyWith(color: Colors.black54),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(1),
                          borderSide: BorderSide(color: AppColors.bgColor),
                        ),
                      ),
                      cursorColor: AppColors.bgColor,
                      validator: (value) {
                        final emailValidation = RegExp(
                          r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
                          r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
                          r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
                          r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
                          r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
                          r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
                          r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])',
                        );
                        value!.isEmpty && !emailValidation.hasMatch(value)
                            ? "Invalid Format"
                            : null;
                        return null;
                      },
                      controller: emailController,
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
                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(1),
                        ),
                        hintStyle: Theme.of(
                          context,
                        ).textTheme.bodySmall!.copyWith(color: Colors.black54),
                        hintText: '**************',
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(1),
                          borderSide: BorderSide(color: AppColors.bgColor),
                        ),
                      ),
                      cursorColor: AppColors.bgColor,

                      validator: (value) {
                        value!.isEmpty ? "Invalid Format" : null;
                        return null;
                      },
                      controller: paswordController,
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
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "***************",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(1),
                        ),
                        hintStyle: Theme.of(
                          context,
                        ).textTheme.bodySmall!.copyWith(color: Colors.black54),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(1),
                          borderSide: BorderSide(color: AppColors.bgColor),
                        ),
                      ),
                      controller: confirmPasswordController,
                      cursorColor: AppColors.bgColor,
                      validator: (value) {
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: TextButton(
                        onPressed: () {},
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Login()),
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
    );
  }
}
