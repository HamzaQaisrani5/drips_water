import 'package:drips_water/resources/appColors/colors.dart';
import 'package:drips_water/resources/assetpaths/addresses.dart';
import 'package:drips_water/ui/screens/login.dart';
import 'package:drips_water/ui/screens/sign_up_view.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final sizeWidth = MediaQuery.of(context).size.width;
    final sizeheight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(right: 0, left: 0, child: Image.asset(Addresses.person)),
          Positioned(top: 100, child: Image.asset(Addresses.tint)),
          Positioned(
            height: 350,
            width: sizeWidth,
            top: sizeheight * 0.585,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Welcome to Drips Water",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(height: 8),
                Text(
                  "Water Delivery App",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: AppColors.whitetxtColor,
                  ),
                ),
                SizedBox(height: 30),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUpView()),
                    );
                  },
                  style: Theme.of(context).textButtonTheme.style!.copyWith(
                    backgroundColor: WidgetStatePropertyAll(
                      AppColors.whitetxtColor,
                    ),
                    overlayColor: WidgetStatePropertyAll(AppColors.lightgrey),
                  ),
                  child: Text(
                    "CREATE AN ACCOUNT",
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return Login();
                        },
                      ),
                    );
                  },
                  style: Theme.of(context).textButtonTheme.style!.copyWith(
                    side: WidgetStatePropertyAll(
                      BorderSide(color: AppColors.whitetxtColor, width: 1),
                    ),
                    backgroundColor: WidgetStatePropertyAll(Colors.transparent),
                    overlayColor: WidgetStatePropertyAll(Colors.transparent),
                  ),
                  child: Text(
                    "LOG IN",
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextButton(
                  onPressed: () {},
                  style: Theme.of(context).textButtonTheme.style?.copyWith(
                    minimumSize: WidgetStatePropertyAll(Size.square(10)),
                    backgroundColor: WidgetStatePropertyAll(Colors.transparent),
                    overlayColor: WidgetStatePropertyAll(Colors.transparent),
                  ),
                  child: Text(
                    'Continnue as Guest',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
