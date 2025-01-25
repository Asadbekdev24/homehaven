import 'package:flutter/material.dart';
import 'package:flutter_application_imtihon/constants/custom_widgets/custom_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomOnboard extends StatelessWidget {
  final String imagePath;
  final String text1;
  final String text2;

  const CustomOnboard(
      {super.key,
      required this.imagePath,
      required this.text1,
      required this.text2});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(60.r),
                bottomRight: Radius.circular(60.r)),
            child: Image.asset(
              imagePath,
              width: double.infinity,
              height: 0.5.sh,
              fit: BoxFit.cover,
            )),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: CustomText(name: text1),
          ),
        ),
        CustomText2(name: text2)
      ],
    );
  }
}
