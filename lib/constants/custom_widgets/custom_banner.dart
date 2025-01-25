import 'package:flutter/material.dart';
import 'package:flutter_application_imtihon/constants/custom_widgets/custom_button.dart';
import 'package:flutter_application_imtihon/constants/custom_widgets/custom_text.dart';
import 'package:flutter_application_imtihon/constants/utils/app_images.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBanner extends StatelessWidget {
  const CustomBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(AppImages.banner1Img,), fit: BoxFit.cover),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomText2(
              name: "Celebrate The Season With Us!",
              size: 21,
              rang: Colors.white,
            ),
            CustomText2(
                name: "Get discounts up to 75% for furniture &  decoration",
                size: 12, rang: Colors.white,),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                "Shop Now",
                style: TextStyle(
                    fontSize: 12.sp,
                    color: Color(0xff156651),
                    fontWeight: FontWeight.w700),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
