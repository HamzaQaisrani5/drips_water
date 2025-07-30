import 'package:drips_water/resources/appColors/colors.dart';
import 'package:drips_water/resources/assetpaths/addresses.dart';
import 'package:drips_water/resources/components/cstmwidgets/button.dart';
import 'package:drips_water/resources/components/cstmwidgets/widget.dart';
import 'package:drips_water/screens/checkpoint/check_point.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _FirstOnboardingScreenState();
}

class _FirstOnboardingScreenState extends State<OnboardingScreen> {
  final controller = PageController();
  int currentPage = 0;
  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {
        currentPage = controller.page?.round() ?? 0;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  void nextPage() {
    if (currentPage < 2) {
      controller.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.bounceIn,
      );
    } else {
      if (kDebugMode) {
        print("Onboarding finished");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final sizeOfDevice = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller,
            onPageChanged: (index) {
              setState(() {
                // Here the value of currentPage variable is updated
                currentPage = index;
              });
            },
            children: [
              // At 0 index
              buildPage(
                imagePath: Addresses.firstImage,
                title: "We provide best quality water",
              ),
              // At 1 index
              buildPage(
                imagePath: Addresses.secondImage,
                title: "Schedule when you want your water deliver",
              ),
              // At 2 index
              buildPage(
                imagePath: Addresses.thirdImage,
                title: "Fast and responsibily delivery",
                fontsize: 30,
              ),
            ],
          ),
          Positioned(
            left: sizeOfDevice.width * 0.4,
            bottom: sizeOfDevice.height * 0.2,
            child: SmoothPageIndicator(
              controller: controller,
              count: 3,
              effect: WormEffect(
                activeDotColor: AppColors.bgColor,
                dotColor: AppColors.lightgrey,
                dotWidth: 30,
                dotHeight: 10,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: customButton(
              data: currentPage == 2 ? "GET STARTED" : "NEXT",
              onPress: () {
                if (currentPage == 2) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => CheckPoint()),
                  );
                } else {
                  controller.nextPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.bounceInOut,
                  );
                }
              },
            ),
          ),
          currentPage != 0
              ? Positioned(
                bottom: sizeOfDevice.height * 0.9,
                left: sizeOfDevice.width * 0.9,
                child: GestureDetector(
                  onTap: () {
                    controller.previousPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.bounceInOut,
                    );
                  },
                  child: Image(
                    width: 30,
                    height: 30,
                    image: AssetImage(Addresses.arrowIcon),
                    color: Colors.black45,
                  ),
                ),
              )
              : SizedBox(),
        ],
      ),
    );
  }
}
