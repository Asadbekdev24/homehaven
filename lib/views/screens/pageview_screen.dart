import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_imtihon/constants/custom_widgets/custom_button.dart';
import 'package:flutter_application_imtihon/constants/custom_widgets/custom_onboard.dart';
import 'package:flutter_application_imtihon/constants/utils/app_images.dart';
import 'package:flutter_application_imtihon/constants/utils/appcolors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PageViewClass extends StatefulWidget {
  const PageViewClass({super.key});

  @override
  State<PageViewClass> createState() => _PageViewClassState();
}

class _PageViewClassState extends State<PageViewClass> {
  final PageController pageController = PageController();
  int currentIndex=0;
  @override
  void initState() {
    pageController.initialPage;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              onPageChanged: (value) {
                setState(() {
                  currentIndex = value;
                  print("niamdior $currentIndex");
                });
              },
              controller: pageController,
              children: [
                CustomOnboard(
                    imagePath: AppImages.onboard1Img,
                    text1: "Online Home Store and Furniture",
                    text2:
                        "Discover all style and budgets of furniture, appliances, kitchen, and more from 500+ brands in your hand."),
                CustomOnboard(
                    imagePath: AppImages.onboard2Img,
                    text1: "Delivery Right to Your Doorstep",
                    text2:
                        "Sit back, and enjoy the convenience of our drivers delivering your order to your doorstep."),
                CustomOnboard(
                    imagePath: AppImages.onboard3Img,
                    text1: "Get Support From Our Skilled Team",
                    text2:
                        "If our products don't meet your expectations, we're available 24/7 to assist you."),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: SmoothPageIndicator(controller: pageController, count: 3, effect: SwapEffect(dotColor: Appcolors.textColor, activeDotColor: Appcolors.mainColor, dotHeight: 8.sp), ),
          ),
          SizedBox(
            width: double.infinity,
            child: currentIndex != 0
                ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 100,
                        child: TextButton(

                            onPressed: () {
                              pageController.previousPage(duration: Duration(milliseconds: 300), curve: Curves.linear);
                            },
                            child: Text(
                              "Back",
                              style: TextStyle(
                                  color: Appcolors.mainColor, fontSize: 16, fontWeight: FontWeight.w700),
                            )),
                      ),
                      SizedBox(
                        width: 250,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 16),
                          child: CustomButton(name: "Next", pageController: pageController,),
                        )),
                    ],
                  )
                : Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
                  child: CustomButton(name: "Next", pageController: pageController,),
                ),
          ),
        ],
      ),
    );
  }
}
