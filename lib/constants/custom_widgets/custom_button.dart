// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_application_imtihon/views/screens/home.dart';
import 'package:flutter_application_imtihon/views/screens/log_in.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_application_imtihon/constants/utils/appcolors.dart';

class CustomButton extends StatelessWidget {
  final PageController? pageController;
  final String name;
  final bool? goHome;
  final bool? validatsiya;

  const CustomButton({
    super.key,
    this.pageController,
    required this.name, this.goHome, this.validatsiya,
  });

  @override
  Widget build(BuildContext context) {

    return ElevatedButton(onPressed: () {
      pageController?.nextPage(duration: Duration(milliseconds: 200), curve: Curves.linear);

      pageController?.page==2 ? Navigator.push(context, MaterialPageRoute(builder: (context) => LogIn(),)):null;

      goHome==true ? Navigator.push(context, MaterialPageRoute(builder: (context) => Home(),)):null;

      

    }, style: ElevatedButton.styleFrom(backgroundColor: Appcolors.mainColor,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0),),


    ), child: Text(name, style: TextStyle(color: Colors.white, fontSize: 16.sp),));
  }
}
