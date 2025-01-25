import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_imtihon/constants/custom_widgets/custom_banner.dart';
import 'package:flutter_application_imtihon/constants/custom_widgets/custom_card.dart';
import 'package:flutter_application_imtihon/constants/custom_widgets/custom_text.dart';
import 'package:flutter_application_imtihon/constants/utils/app_images.dart';
import 'package:flutter_application_imtihon/constants/utils/appcolors.dart';
import 'package:flutter_application_imtihon/viewmodels/providers/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final PageController pageController = PageController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(
            icon: SvgPicture.asset(AppImages.homeIcon), label: "Home"),
        BottomNavigationBarItem(
            icon: SvgPicture.asset(AppImages.cartIcon), label: "My card"),
        BottomNavigationBarItem(
            icon: SvgPicture.asset(AppImages.userIcon), label: "My account"),
      ]),
      body: SingleChildScrollView(
        child: Consumer<ProviderEd>(
          builder: (context, provider, child) => provider.isLoading ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(child: CircularProgressIndicator(),),
            ],
          ) :  Column(
            children: [
              SizedBox(height: 32.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(AppImages.searchIcon),
                  SvgPicture.asset(AppImages.notificationIcon),
                ],
              ),
              SizedBox(
                height: 5.h,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(AppImages.locationIcon),
                    CustomText2(
                      name:  "Deliver to",
                      align: true,
                      size: 12,
                    ),
                    CustomText2(
                      name: "3517 W. Gray St. Utica, Pennsylvania",
                      align: true,
                      size: 14,
                    ),
                    SvgPicture.asset(AppImages.downIcon),
                  ],
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              SizedBox(
                width: double.infinity,
                height: 200.h,
                child: PageView(
                  controller: pageController,
                  children: [
                    CustomBanner(),
                    CustomBanner(),
                    CustomBanner(),
                  ],
                ),
              ),
              SizedBox(height: 10.h,),
              SmoothPageIndicator(controller: pageController, count: 3,
              effect: SwapEffect(dotColor: Appcolors.textColor, activeDotColor: Appcolors.mainColor, dotHeight: 8.sp, dotWidth: 16.sp),
              ),
              SizedBox(
                height: 24.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText2(
                    name: "Special Offers",
                    rang: Color(0xff404040),
                    size: 24,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: CustomText2(
                      name: "See more",
                      rang: Appcolors.mainColor,
                      size: 14,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 16.h,
              ),
              // log(provider.products[0].data.)
              SizedBox(
                  height: 300.h,
                  width: double.infinity,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,

                    itemCount: provider.products[0].data.length,
                    itemBuilder: (context, index) => CustomCard(productId: index),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
