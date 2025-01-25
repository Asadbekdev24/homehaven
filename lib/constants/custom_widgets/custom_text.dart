// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomText extends StatelessWidget {
  final String name;
  final bool? align;
   const CustomText({
    super.key,
    required this.name,
    this.align,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
       textAlign: align==true ? TextAlign.left: TextAlign.center,
      name,
      style: TextStyle(
          fontSize: 32.sp,
          color: Color(0xFF404040),
          fontWeight: FontWeight.w800),
    );
  }
}


class CustomText2 extends StatelessWidget {
  final String name;
  final bool? align;
  final Color? rang;
  final double? size;
  const CustomText2({
    super.key,
    required this.name,
    this.align,
    this.rang, this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      textAlign: align == true ? TextAlign.left : TextAlign.center,
      style: TextStyle(
          fontSize: size?.sp ?? 18.sp,
          color:  rang ?? Color(0xFF757575),
          fontWeight: FontWeight.w400),
    );
  }
}
